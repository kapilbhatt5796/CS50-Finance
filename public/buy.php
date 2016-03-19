<?php

    // configuration
    require("../includes/config.php"); 

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("buy_form.php", ["title" => "Buy Form"]);
    }

    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (empty($_POST["symbol"]))
        {
        
            apologize("You must enter a stock symbol.");
        }
        if(empty($_POST["shares"])){
            apologize("The field share's cannot be blank.");
        }
        
        if (lookup($_POST["symbol"]) === false)
        {
            apologize("Invalid stock symbol.");
        }
        
        if (preg_match("/^\d+$/", $_POST["shares"]) == false)
        {
            apologize("You must enter a whole, positive integer.");
        }
        
        $stock = lookup($_POST["symbol"]);
        $cash =	CS50::query("SELECT cash FROM users WHERE id = ?", $_SESSION["id"]);	
        $cost = $stock["price"] * $_POST["shares"];
        if ($cash[0]["cash"] < $cost)
        {
            apologize("You can't afford this purchase.");
        }         
        else
        {
            $date = date('Y-m-d H:i:s');
            
            $_POST["symbol"] = strtoupper($_POST["symbol"]);
                         
            CS50::query("INSERT INTO portfolio (user_id, symbol, shares) VALUES(?, ?, ?) ON DUPLICATE KEY UPDATE shares = shares + VALUES(shares)", $_SESSION["id"], $_POST["symbol"], $_POST["shares"]);
            
            CS50::query("UPDATE users SET cash = cash - ? WHERE id = ?", $cost, $_SESSION["id"]);
            
            CS50::query("INSERT INTO history (id, transaction, symbol, shares, price, date_time) VALUES (?, ?, ?, ?, ?, ?)", $_SESSION["id"], "Bought", $_POST["symbol"], $_POST["shares"], $stock["price"], $date);
            //redirect to portfolio
            redirect("/");    
        }
    }
    
    else
    {
        render("buy_form.php", ["title" => "Buy Form"]);
    }
    
?>