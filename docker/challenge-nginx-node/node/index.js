const express = require('express')
const app = express()
const port = 3000
const config = {
    host: 'db',
    user: 'root',
    password: 'root',
    database: 'nodedb'
}

const mysql = require('mysql')

function insertRandomPeople(){

    const name = 'RandomPeople: '+ new Date().toString();
    const sql = `INSERT INTO people(name) VALUES ('${name}')`

    const connection = mysql.createConnection(config);
    connection.query(sql)
    connection.end() 
}

async function retrieveAllPeople (dbConnection) {
  return new Promise((resolve, reject) => {
      dbConnection.query('SELECT * FROM people', function (error, results, fields) {
          if (error) {
              console.log(error)              
          }
          dbConnection.end()
          return  resolve(results)
      })
  })
}

app.get('/', async  (req, res) => {

    insertRandomPeople();

    const connection = mysql.createConnection(config);
    const results = await  retrieveAllPeople(connection)
    const listOfNames = results.map((entry) => `<li>${entry.name}</li>`).join('')
    res.send(`
            <h1>Full Cycle Rocks!</h1>            
            <ul>${listOfNames}</ul>
            `)

})

app.listen(port, () => {
    console.log('Rodando na porta '+ port)
})