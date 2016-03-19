<?php
    
    require("../includes/config.php");  
    
    if ($_SERVER["REQUEST_METHOD"] == "POST"){
        $date = date('Y-m-d H:i:s');
        $stock = lookup($_POST["symbol"]);
        $shares = CS50::query("SELECT shares FROM portfolio WHERE user_id = ? AND symbol = ?", $_SESSION["id"], $_POST["symbol"]);
        $value = $stock["price"] * $shares[0]["shares"];
        CS50::query("UPDATE users SET cash = cash + ? WHERE id = ?", $value, $_SESSION["id"]);
        CS50::query("DELETE FROM portfolio WHERE user_id = ? AND symbol = ? LIMIT 1", $_SESSION["id"], $_POST["symbol"]);        
        CS50::query("INSERT INTO history (id, transaction, symbol, shares, price, date_time) VALUES (?, ?, ?, ?, ?, ?)", $_SESSION["id"], "Sold", $_POST["symbol"], $shares[0]["shares"], $stock["price"], $date);

        redirect("/");
    }
    
    
    else
    {
        $rows =	CS50::query("SELECT * FROM portfolio WHERE user_id = ?", $_SESSION["id"]);	
        $stocks = [];
        foreach ($rows as $row){   
            $stock = $row["symbol"];
            $stocks[] = $stock;       
        }    
        render("sell_form.php", ["title" => "Sell Form", "stocks" => $stocks]);
    }
      
?>