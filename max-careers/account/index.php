<?php
	// include header
    include_once 'includes/header.php';

    // check if login form is submitted
    if(isset($_POST['login'])){
        // get form values
    	$email = mysqli_real_escape_string($connection, $_POST['email']);
    	$password = mysqli_real_escape_string($connection, $_POST['password']);

    	// check for username or email
    	$is_email = strpos($email, '@');
    	if ($is_email === false) {
    	    $cond = " username = '".$email."' "; // if username
    	    $type = 'username';
    	} else {
    	    $cond = " email = '".$email."' "; // if email
    	    $type = 'email';
    	}

    	// create conditional SQL
    	$sql = "SELECT * FROM company WHERE ".$cond;
    	// execute SQL
    	$result = mysqli_query($connection, $sql);
    	// check if login exists
    	$count = mysqli_num_rows($result);

    	// if ture -> push for login
    	if($count == '1'){
    		$row = mysqli_fetch_array($result);

    		// check password
    		if($password == $row['password']){

    			$_SESSION['access'] = 'true'; // save session to check if user is login
    			$_SESSION['company_id'] = $row['id']; // save logged in company id in session

    			// redirect to jobs page
    			header('Location:'.ACCOUNT_BASEURL.'/jobs.php?page=view');
    			exit();
    		}else{
    			// display error if email/username or password
    			$_SESSION['alert'] = 'Error! Incorrect '.$type.' or password';
    		}
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
			<h1>Login</h1>

			<hr/>

			<?php
				include 'includes/notifications.php';
			?>

			<br><br>

		    <div class="col-sm-6 col-sm-offset-3 well">
		    	<!-- login form -->
		    	<form method="POST" action="" name="login">
		    		<!-- create label and field for email -->
		    		<label>Username or Email</label>
		    		<input type="text" name="email" class="form-control input-lg" required />

		    		<br/>

		    		<!-- create label and field for password -->
		    		<label>Password</label>
		    		<input type="password" name="password" class="form-control input-lg" required />

		    		<br>

		    		<!-- create login button -->
		    		<input type="submit" name="login" value="Log In" class="btn btn-primary btn-lg btn-block">
                    <br>
                    <p>Click here to <a href="<?php echo ACCOUNT_BASEURL;?>/register.php">register</a></p>
		    	</form>
		    </div>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>