resource "aws_security_group" "sg" {
    vpc_id =  aws_vpc.new-vpc.id
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