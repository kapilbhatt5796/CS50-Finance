<form action="sell.php" method="post">
    <fieldset>
        <div class="form-group">
            <select class = "form-control" name="symbol">
                <option value=''></option>
                <?php               
	                foreach ($stocks as $symbol)	
                    {   
                        echo("<option value='$symbol'>" . $symbol . "</option>");
                    }
                ?>
            </select>
        </div>
            <div class="form-group">
            <button type="submit" class="btn">Sell</button>
        </div>
    </fieldset>
</form>