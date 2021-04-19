<?php
    include_once 'includes/header.php';
?>

<?php
    include_once 'includes/nav.php';

    // check if change password form is submitted
    if(isset($_POST['change_password'])){
    	// get form values
    	$old_password = mysqli_real_escape_string($connection, $_POST['old_password']);
		$new_password = mysqli_real_escape_string($connection, $_POST['new_password']);
		$retype_password = mysqli_real_escape_string($connection, $_POST['retype_password']);

		// create sql
		$sql = "SELECT id, password FROM company WHERE id = ".$_SESSION['company_id'];

		// execute sql
		$result = mysqli_query($connection,$sql);
		$count = mysqli_num_rows($result);

		// if company found -> initiate process for change password
		if($count == '1'){
			// fetch data
			$row = mysqli_fetch_array($result);

			if($old_password != $row['password']){
		      	$_SESSION['alert'] = "Error! Old password didn't matched. Please enter the correct password.";
		    }else{
		    	if($retype_password != $new_password){
	    		 	$_SESSION['alert'] = "Error! New password didn't matched. Please enter the correct passwords.";
		    	}else{
		    		// create sql for update password
	    			$sql = "UPDATE company SET password = '$new_password' WHERE id = ".$_SESSION['company_id'];
					$result = mysqli_query($connection, $sql);
					if($result == true){
						$_SESSION['success'] = "Your password is changed successfully!";
					}
					else{
						$_SESSION['alert'] = "Error! Try some other time";
					}
		    	}
		    }
		}
    }

?>

<div class="container">
	<div class="row">
		<div class="col-sm-12" style="min-height: 80vh">
			
			<!-- page heading -->
			<h1>Change password</h1>

			<hr/>

			<?php
				include 'includes/notifications.php';
			?>

			<br><br>

		    <div class="col-sm-12 well">
		    	<div class="col-sm-6">
		    		<!-- change password form -->
		    		<form method="POST" action="" name="change_password">
		    			<!-- create label and field for password -->
		    			<label>Old Password</label>
		    			<input type="password" name="old_password" class="form-control" required />

		    			<br/>

		    			<!-- create label and field for password -->
		    			<label>Password</label>
		    			<input type="password" name="new_password" class="form-control" required />

		    			<br/>

		    			<!-- create label and field for retype password -->
		    			<label>Retype Password</label>
		    			<input type="password" name="retype_password" class="form-control" required />

		    			<br/>

		    			<!-- create login button -->
		    			<input type="submit" name="change_password" value="Change Password" class="btn btn-primary btn-lg">
		    	</div>
		    </div>

		</div>
	</div>
</div>

<?php
    include_once 'includes/footer.php';
?>
