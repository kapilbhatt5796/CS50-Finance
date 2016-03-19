<?php

    
    require("../includes/config.php");
    
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        render("quote_form.php", ["title" => "Register"]);
    }
    
    else if ($_SERVER["REQUEST_METHOD"] == "POST"){
        if(!empty($_POST["cmpny_name"])){
            $a_s = lookup($_POST["cmpny_name"]);
            if($a_s === false){
                apologize("Invalid stock symbol");
            }
            
            else{
                //print("A share of {$a_s['name']} ({$a_s['symbol']}) costs $ {$a_s['price']}");
                render("quote_display.php", ["title" => "Quote", "symbol" => $a_s["symbol"], "name" => $a_s["name"], "price" => $a_s["price"]]);
            }
        }
        else{
            apologize("The company's name can't be empty.");
        }
    }
?>