<?php

    // configuration
    require("../includes/config.php"); 

    $rows =	CS50::query("SELECT * FROM portfolio WHERE user_id = ?", $_SESSION["id"]);	
	
	$portfolio = [];
	// for each of user's stocks
	foreach ($rows as $row)	
    {   
        // lookup stock info at row
        $stock = lookup($row["symbol"]);
        
        // add shares to the row
        $stock["shares"] = $row["shares"];
        
        // add total price to the row
        $stock["total"] = $row["shares"] * $stock["price"];
        
        // save the row in the new array
        $portfolio[] = $stock;
    }
    
    // query cash for template
    $users = CS50::query("SELECT * FROM users WHERE id = ?", $_SESSION["id"]);
    // render portfolio (pass in new portfolio table and cash)
    render("portfolio.php", ["title" => "Portfolio", "portfolio" => $portfolio, "users" => $users]);

?>