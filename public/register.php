<?php

    // configuration
    require("../includes/config.php");

    // if user reached page via GET (as by clicking a link or via redirect)
    if ($_SERVER["REQUEST_METHOD"] == "GET")
    {
        // else render form
        render("register_form.php", ["title" => "Register"]);
    }

    // else if user reached page via POST (as by submitting a form via POST)
    else if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(empty($_POST["username"])){
            apologize("The field Username cannot be left blank");
        }
        elseif(empty($_POST["password"])){
            apologize("The field Password cannot be left blank");
        }
        elseif($_POST["password"] != $_POST["password_confirmation"]){
            apologize("The Password's doesn't match");
        }
        else{
            $result = CS50::query("INSERT IGNORE INTO users (username, hash, cash) VALUES(?, ?, 10000.0000)", $_POST["username"], password_hash($_POST["password"], PASSWORD_DEFAULT));
            if($result == 0){
                apologize("A user with same username already exist!!!");
            }
            else
            {
                // Remember the session and redirect
                $rows = CS50::query("SELECT LAST_INSERT_ID() AS id");
                
                if (count($rows) == 1)
                {
                    $id = $rows[0]["id"];
                    
                    $_SESSION["id"] = $id;
                    redirect("/");
                }
            }
        }
    }

?>