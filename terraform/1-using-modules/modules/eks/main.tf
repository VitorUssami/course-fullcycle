resource "aws_security_group" "sg" {
    vpc_id =  var.vpc_id
    tags = {
        Name = "${var.prefix}-sg"
    }

    #access anything on internet
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        prefix_list_ids = []
    }
}

resource "aws_iam_role" "cluster" {
    name = "${var.prefix}-${var.cluster_name}-role"
    assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    }   
    POLICY
}

resource "aws_iam_role_policy_attachment" "full-cycle-cluster-AmazonEksVpcResourceController" {

    role = aws_iam_role.cluster.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"  
}

resource "aws_iam_role_policy_attachment" "full-cycle-cluster-AmazonEksClusterPolicy" {

    role = aws_iam_role.cluster.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"  
}

resource "aws_cloudwatch_log_group" "log" {
    name = "/aws/eks/${var.prefix}-${var.cluster_name}/cluster"
    retention_in_days = var.retention_days
}

resource "aws_eks_cluster" "cluster" {
    name = "${var.prefix}-${var.cluster_name}"
    role_arn = aws_iam_role.cluster.arn
    enabled_cluster_log_types = ["api", "audit"]

    vpc_config {
      subnet_ids = var.subnet_ids
      security_group_ids = [aws_security_group.sg.id]
    }

    depends_on = [
      aws_cloudwatch_log_group.log,
      aws_iam_role_policy_attachment.full-cycle-cluster-AmazonEksClusterPolicy,
      aws_iam_role_policy_attachment.full-cycle-cluster-AmazonEksVpcResourceController
    ]
}


resource "aws_iam_role" "node" {

    name = "${var.prefix}-${var.cluster_name}-node-role"
    assume_role_policy = <<POLICY
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
            }
        ]
    }
    POLICY    
}

resource "aws_iam_role_policy_attachment" "full-cycle-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "full-cycle-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node.name
}

resource "aws_iam_role_policy_attachment" "full-cycle-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node.name
}

resource "aws_eks_node_group" "node-1" {
    cluster_name = aws_eks_cluster.cluster.name
    node_group_name = "node-1"
    node_role_arn = aws_iam_role.node.arn
    subnet_ids = var.subnet_ids
    instance_types = ["t3.micro"] #default t3.medium
    scaling_config {
      desired_size = var.desired_size
      max_size = var.max_size
      min_size = var.min_size
    }

    depends_on = [
      aws_iam_role_policy_attachment.full-cycle-node-AmazonEKSWorkerNodePolicy,
      aws_iam_role_policy_attachment.full-cycle-node-AmazonEKS_CNI_Policy,
      aws_iam_role_policy_attachment.full-cycle-node-AmazonEC2ContainerRegistryReadOnly
    ]
}