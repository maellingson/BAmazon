var mysql = require("mysql");
var inquirer = require("inquirer");


var connection = mysql.createConnection({
    host: "localhost",

    port: 3306,
    user: "root",
    password: "root",
    database: "bamazon_db",
});

connection.connect(function (err) {
    if (err) throw err;

    listObjects();
});

function listObjects() {
    connection.query("Select * from products", function (err, results) {
        if (err) throw err;
        inquirer
            .prompt([
                {
                    name: "selectProduct",
                    type: "rawlist",
                    message: "What would you like to buy? Select the item.",
                    choices: function () {
                        var choiceArray = [];
                        for (var i = 0; i < results.length; i++) {
                            choiceArray.push(results[i].product_name);
                        }
                        return choiceArray;
                    },
                },
                {
                    name: "quantity",
                    type: "input",
                    message: "How many would you like?",
                }
            ]).then(function (answer) {
                var selectedItem;
                for (var i = 0; i < results.length; i++) {
                    if (results[i].product_name === answer.selectProduct) {
                        selectedItem = results[i];
                    }
                }

                if (selectedItem.stock_quantity >= parseInt(answer.quantity)) {
                    connection.query(
                        "UPDATE products SET ? WHERE ?",
                        [
                            {
                                product_name: selectedItem
                            },
                            {
                                stock_quantity: answer.quantity
                            }
                        ],
                        function (error) {
                            if (error) throw err;
                            console.log("You will receive your items!");
                            listObjects();
                        }
                    );
                }
                else {
                    console.log("We don't have anymore in stock.");
                    listObjects();
                }
            })
    })
}
