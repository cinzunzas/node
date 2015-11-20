var mysql = require('mysql');
var connection = mysql.createConnection({
   host: 'localhost',
   user: 'root',
   password: '99082000',
   database: 'node_mysql',
   port: 3306
});
connection.connect(function(error){
   if(error){
      throw error;
   }else{
      console.log('Conexion correcta.');
   }
});
// var query = connection.query('INSERT INTO personaje(nombre, apellido, biografia) VALUES(?, ?, ?)', ['Homero', 'Simpson', 'Esposo de Marge y padre de Bart, Lisa y Maggie.'], function(error, result){
//    if(error){
//       throw error;
//    }else{
//       console.log(result);
//    }
//  }
// );
var query = connection.query('SELECT nombre, apellido, biografia FROM personaje WHERE personaje_id = ?', [1], function(error, result){
      if(error){
         throw error;
      }else{
         var resultado = result;
         if(resultado.length > 0){
            console.log(resultado[0].nombre + ' ' + resultado[0].apellido + ' / ' + resultado[0].biografia);
         }else{
            console.log('Registro no encontrado');
         }
      }
   }
);
connection.end();