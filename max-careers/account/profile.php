<?php
    include_once 'includes/header.php';
?>

<?php
    include_once 'includes/nav.php';

    // check if change password form is submitted
    if(isset($_POST['update_profile'])){
    	// get form values
    	$company_name = mysqli_real_escape_string($connection, $_POST['company_name']);
    	$username = mysqli_real_escape_string($connection, $_POST['username']);
    	$email = mysqli_real_escape_string($connection, $_POST['email']);
    	$city_id = mysqli_real_escape_string($connection, $_POST['city_id']);
    	$phone = mysqli_real_escape_string($connection, $_POST['phone']);

		$profile_picture_old = $_POST['profile_picture_old'];
		$profile_picture_size = $_FILES['profile_picture']['size'];

		if(!empty($profile_picture_size)){
		    $fileType = mysqli_real_escape_string($connection,$_FILES['profile_picture']['type']);
		    $path = 'uploads/';
		    $upFile = date('YmdHis').'-'.$_FILES['profile_picture']['name'];
		    if(is_uploaded_file($_FILES['profile_picture']['tmp_name'])){
		        if(!move_uploaded_file($_FILES['profile_picture']['tmp_name'], $path.$upFile)) {
			        $_SESSION['alert'] = "Permission Denied! File could not upload";
		        }
		    } else {
		        $_SESSION['alert'] = "Possible file upload attack!";
		    }
		    $profile_picture = $upFile;
		}else{
		    $profile_picture = $profile_picture_old;
		}


		// create sql
		$sql = "UPDATE company SET company_name = '$company_name', username = '$username', email = '$email', city_id = '$city_id', phone = '$phone', profile_picture = '$profile_picture' WHERE id = ".$_SESSION['company_id'];
		// execute sql
		$result = mysqli_query($connection, $sql);
		if($result == true){
			$_SESSION['success'] = "Your profile is changed successfully!";
		}
		else{
			$_SESSION['alert'] = "Error! something went wrong";
		}
    }

?>

<div class="container">
	<div class="row">
		<div class="col-sm-12" style="min-height: 80vh">
			
			<!-- page heading -->
			<h1>Profile settings</h1>

			<hr/>

			<?php
				include 'includes/notifications.php';
			?>

			<br><br>

		    <div class="col-sm-12 well">

		    	<?php
		    		// create sql to fetch company info
		    		$sql = "SELECT * FROM company WHERE id = ".$_SESSION['company_id'];

		    		// execute sql
		    		$result = mysqli_query($connection, $sql);
		    		$row = mysqli_fetch_array($result);

		    		// fetch data from database
		    		$company_name = $row['company_name'];
		    		$username = $row['username'];
		    		$email = $row['email'];
		    		$city_id = $row['city_id'];
		    		$phone = $row['phone'];
		    		$profile_picture = $row['profile_picture'];
		    	?>
		    	
	    		<!-- change password form -->
	    		<form method="POST" action="" name="update_profile" enctype="multipart/form-data">
	    			<input type="hidden" name="profile_picture_old" value="<?php echo $profile_picture; ?>">
	    			<div class="col-sm-6">
		    			<label>Company name</label>
			    		<input type="text" name="company_name" value="<?php echo $company_name;?>" class="form-control" required />

			    		<br/>

			    		<!-- create label and field for username -->
			    		<label>Username</label>
			    		<input type="text" name="username" value="<?php echo $username;?>" class="form-control" required />

			    		<br/>

			    		<!-- create label and field for email -->
			    		<label>Email</label>
			    		<input type="email" name="email" value="<?php echo $email;?>" class="form-control" required />

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

		    			<br/>

		    			<!-- create login button -->
		    			<input type="submit" name="update_profile" value="Update Profile" class="btn btn-primary btn-lg">
		    		</div>
		    		<div class="col-sm-6">
		    			<label>Phone</label>
			    		<input type="text" name="phone" value="<?php echo $phone;?>" class="form-control" required />

			    		<br/>

			    		<label>Picture</label>
			    		<input type="file" name="profile_picture" class="form-control" />

			    		<?php
			    			if(!empty($profile_picture)){
			    				echo '<br><img src="'.ACCOUNT_BASEURL.'/uploads/'.$profile_picture.'" class="img-responsive img-thumbnail" style="max-height: 150px; max-width: 200px;">';
			    			}
			    		?>
			    	</div>
	    		</form>
		    </div>

		</div>
	</div>
</div>

<?php
    include_once 'includes/footer.php';
?>
