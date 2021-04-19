<?php
	// include header
    include_once 'includes/header.php';

    // check if login form is submitted
    if(isset($_POST['login'])){
    	// get form values
    	$company_name = mysqli_real_escape_string($connection, $_POST['company_name']);
    	$username = mysqli_real_escape_string($connection, $_POST['username']);
    	$email = mysqli_real_escape_string($connection, $_POST['email']);
    	$city_id = mysqli_real_escape_string($connection, $_POST['city_id']);
    	$password = mysqli_real_escape_string($connection, $_POST['password']);

    	// create SQL for register
    	$sql = "INSERT INTO company (company_name, username, email, city_id, password) VALUES ('$company_name', '$username', '$email', '$city_id', '$password') ";
    	// execute SQL
    	$result = mysqli_query($connection, $sql);

    	// if ture -> push for register
    	if($result){
    		$_SESSION['success'] = 'Success! Your account is registered successfully. Please <a href="'.ACCOUNT_BASEURL.'">login</a> to your account';
    	}else{
    		// display error if account is not found
    		$_SESSION['alert'] = 'Error! Account not found';
    	}
    }
?>

<div class="container">
	<div class="row">
		<div class="col-sm-12" style="min-height: 90vh">
			
			<!-- page heading -->
			<h1>Register</h1>

			<hr/>

			<?php
				include 'includes/notifications.php';
			?>

			<br><br>

		    <div class="col-sm-6 col-sm-offset-3 well">
		    	<!-- login form -->
		    	<form method="POST" action="">
		    		<!-- create label and field for company name -->
		    		<label>Company name</label>
		    		<input type="text" name="company_name" class="form-control" required />

		    		<br/>

		    		<!-- create label and field for username -->
		    		<label>Username</label>
		    		<input type="text" name="username" class="form-control" required />

		    		<br/>

		    		<!-- create label and field for email -->
		    		<label>Email</label>
		    		<input type="email" name="email" class="form-control" required />

		    		<br/>

		    		<!-- city label -->
		    		<label>City</label>
		    		<select name="city_id" class="form-control" required>
		    			<?php
		    				// if city is selected on search, select it in search form
		    				if($_GET['city_id'] != ''){
		    					$city_id = $_GET['city_id'];
		    				}
		    				// write sql query to fetch cities
		    				$sql = "SELECT * FROM cities ORDER BY title ASC";
		    				// execute sql
		    				$result = mysqli_query($connection, $sql);
		    				// fetch and iterate dropdown options
		    				while($row = mysqli_fetch_array($result)){
		    					// display options and select city if it is searched
		    					echo '<option value="'.$row['id'].'" '.(($city_id == $row['id'])?'selected':'').'>'.$row['title'].'</option>';
		    				}
		    			?>
		    		</select>

		    		<br>

		    		<!-- create label and field for password -->
		    		<label>Password</label>
		    		<input type="password" name="password" class="form-control" required />

		    		<br>

		    		<!-- create login button -->
		    		<input type="submit" name="login" value="Sign Up" class="btn btn-primary btn-lg btn-block">

		    		<br>
                    <p>Click here to <a href="<?php echo ACCOUNT_BASEURL;?>/">login</a></p>
		    	</form>
		    </div>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>