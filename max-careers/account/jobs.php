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
			<h1>My Jobs</h1>

			<hr/>

			<?php
				include 'includes/notifications.php';
			?>

			<br>
		    	
		    <div class="col-sm-12">
		    	<?php
		    		// is page is view -> display all jobs
		    		if($_GET['page'] == 'view'){

		    			// write sql query to fetch jobs for particular company
		    			$sql_jobs = "SELECT j.id As job_id, j.title AS job_title, c.title AS city, cat.title AS category
		    						FROM jobs j
		    							INNER JOIN cities c
		    								ON c.id = j.city_id
		    							INNER JOIN job_categories cat
		    								ON cat.id = j.job_category_id
		    						WHERE j.company_id = ".$_SESSION['company_id'];
		    			
		    			// execute sql query
		    			$result_jobs = mysqli_query($connection, $sql_jobs);
		    			
		    			// create table
		    			echo '
		    				<p class="text-right">
		    					<a href="'.ACCOUNT_BASEURL.'/jobs.php?page=add" class="btn btn-success btn-lg">Create new job</a>
		    				</p>
		    				<p>The following table shows list your all active jobs:</p>
		    				<table class="table table-bordered">
		    					<tr>
			    					<th>#</th>
			    					<th>Title</th>
			    					<th>Job category</th>
			    					<th>City</th>
			    					<th>Actions</th>
			    				</tr>';

			    			// create counter to display serial
			    			$counter = 1;
			    			// iterate all job and fetch information
			    			while($row_jobs = mysqli_fetch_array($result_jobs)){

			    				$job_id = $row_jobs['job_id']; // get job id
			    				$job_link = BASEURL.'/job-detail.php?id='.$job_id; // id of job with link
			    				$job_title = $row_jobs['job_title']; // title of job
			    				$city = $row_jobs['city']; // city name
			    				$category = $row_jobs['category']; // category name
			    				
			    				// create and display table rows with actions (edit & delete)
			    				echo '<tr>
			    						<td>'.$counter.'</td>
			    						<td><a href="'.$job_link.'" target="_blank">'.$job_title.'</a></td>
			    						<td>'.$category.'</td>
			    						<td>'.$city.'</td>
			    						<td>
			    							<a href="'.ACCOUNT_BASEURL.'/jobs.php?page=edit&id='.$job_id.'" class="btn btn-info btn-xs">Edit</a> &nbsp;
			    							<a class="btn btn-danger btn-xs" 
			    								onClick="javascript:deleteJob($(this));return false;"
			    								href="delete.php?id='.$job_id.'"
			    							>Delete</a>
			    						</td>
			    					 </tr>';

			    				$counter++;
			    			}
		    			echo '</table>';
		    		}






		    		// is page is add -> display form to add a new job
		    		else if($_GET['page'] == 'add'){

		    			// logic for create job form submission
		    			if(isset($_POST['add_job'])){
		    				// get submitted data
		    				$title = mysqli_real_escape_string($connection, $_POST['title']);
    						$job_category_id = mysqli_real_escape_string($connection, $_POST['category_id']);
    						$city_id = mysqli_real_escape_string($connection, $_POST['city_id']);
    						$description = mysqli_real_escape_string($connection, $_POST['description']);
    						$company_id = $_SESSION['company_id'];

    						// create sql
    						$sql = "INSERT INTO jobs (title, description, job_category_id, city_id, company_id) VALUES ('$title', '$description', '$job_category_id', '$city_id', '$company_id')";
    						// execute sql
    						$result = mysqli_query($connection, $sql);
    						if($result == true){
    							$_SESSION['success'] = "Success! job is created successfully!";
    						}
    						else{
    							$_SESSION['alert'] = "Error! something went wrong";
    						}
		    			}

		    			include 'includes/notifications.php';

		    			?>
		    			<p class="text-right">
	    					<a href="<?php echo ACCOUNT_BASEURL; ?>/jobs.php?page=view" class="btn btn-success btn-lg">View all jobs</a>
	    				</p>
	    				<p>The following form will let you create a new job:</p>
			    		<!-- change password form -->
			    		<form method="POST" action="" name="add_job" class="well" style="overflow: hidden;">
			    			<div class="col-sm-6">
			    				<!-- job title -->
				    			<label>Job title</label>
					    		<input type="text" name="title" class="form-control" required />

					    		<br/>

					    		<!-- job category label -->
								<label>Job Category</label>
								<!-- create dropdown -->
								<select name="category_id" class="form-control">
									<?php
										// write sql query to fetch categories
										$sql = "SELECT * FROM job_categories ORDER BY title ASC";
										// execute sql
										$result = mysqli_query($connection, $sql);
										// fetch and iterate dropdown options
										while($row = mysqli_fetch_array($result)){
											// display options and select category if it is searched
											echo '<option value="'.$row['id'].'">'.$row['title'].'</option>';
										}
									?>
								</select>

								<br/>

					    		<!-- city label -->
					    		<label>City</label>
					    		<select name="city_id" class="form-control" required>
					    			<?php
					    				// write sql query to fetch cities
					    				$sql = "SELECT * FROM cities ORDER BY title ASC";
					    				// execute sql
					    				$result = mysqli_query($connection, $sql);
					    				// fetch and iterate dropdown options
					    				while($row = mysqli_fetch_array($result)){
					    					// display options and select city if it is searched
					    					echo '<option value="'.$row['id'].'">'.$row['title'].'</option>';
					    				}
					    			?>
					    		</select>

				    			<br/>

				    			<!-- create submit button -->
				    			<input type="submit" name="add_job" value="Create job" class="btn btn-primary btn-lg">
				    		</div>
				    		<div class="col-sm-6">
				    			<!-- job description -->
				    			<label>Job description</label>
					    		<textarea name="description" class="form-control" rows="10" required></textarea>
					    	</div>
			    		</form>
			    		<?php
		    		}




		    		// is page is edit -> display form to edit an existing job
		    		else if($_GET['page'] == 'edit'){

		    			// get job id from URL
						$job_id = mysqli_real_escape_string($connection, $_GET['id']);

						// get company id from session
						$company_id = $_SESSION['company_id'];

		    			// logic for create job form submission
		    			if(isset($_POST['edit_job'])){
		    				// get submitted data
		    				$title = mysqli_real_escape_string($connection, $_POST['title']);
    						$job_category_id = mysqli_real_escape_string($connection, $_POST['category_id']);
    						$city_id = mysqli_real_escape_string($connection, $_POST['city_id']);
    						$description = mysqli_real_escape_string($connection, $_POST['description']);

    						// create sql
    						$sql = "UPDATE jobs SET title = '$title', description = '$description', job_category_id = '$job_category_id', city_id = '$city_id' WHERE id = '$job_id' AND company_id = '$company_id' ";
    						// execute sql
    						$result = mysqli_query($connection, $sql);
    						if($result == true){
    							$_SESSION['success'] = "Success! job is updated successfully!";
    						}
    						else{
    							$_SESSION['alert'] = "Error! something went wrong";
    						}
		    			}

		    			include 'includes/notifications.php';

		    			// create sql
    						$sql = "SELECT * FROM jobs WHERE id = '$job_id' AND company_id = '$company_id' ";
    						// execute sql
    						$result = mysqli_query($connection, $sql);
    						$row = mysqli_fetch_array($result);

    						// fetch data
    						$job_title = $row['title'];
    						$category_id = $row['job_category_id'];
    						$city_id = $row['city_id'];
    						$description = $row['description'];
		    			?>
		    			<p class="text-right">
	    					<a href="<?php echo ACCOUNT_BASEURL; ?>/jobs.php?page=view" class="btn btn-success btn-lg">View all jobs</a>
	    				</p>
	    				<p>The following form will let you update a job:</p>
			    		<!-- change password form -->
			    		<form method="POST" action="" name="edit_job" class="well" style="overflow: hidden;">
			    			<div class="col-sm-6">
			    				<!-- job title -->
				    			<label>Job title</label>
					    		<input type="text" name="title" value="<?php echo $job_title;?>" class="form-control" required />

					    		<br/>

					    		<!-- job category label -->
								<label>Job Category</label>
								<!-- create dropdown -->
								<select name="category_id" class="form-control">
									<?php
										// write sql query to fetch categories
										$sql = "SELECT * FROM job_categories ORDER BY title ASC";
										// execute sql
										$result = mysqli_query($connection, $sql);
										// fetch and iterate dropdown options
										while($row = mysqli_fetch_array($result)){
											// display options and select category if it is searched
											echo '<option value="'.$row['id'].'" '.(($category_id == $row['id'])?'selected':'').'>'.$row['title'].'</option>';
										}
									?>
								</select>

								<br/>

					    		<!-- city label -->
					    		<label>City</label>
					    		<select name="city_id" class="form-control" required>
					    			<?php
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

				    			<!-- create submit button -->
				    			<input type="submit" name="edit_job" value="Update job" class="btn btn-primary btn-lg">
				    		</div>
				    		<div class="col-sm-6">
				    			<!-- job description -->
				    			<label>Job description</label>
					    		<textarea name="description" class="form-control" rows="10" required><?php echo $description;?></textarea>
					    	</div>
			    		</form>
			    		<?php
		    		}
		    	?>
		    </div>

		</div>
	</div>
</div>

<?php
    include_once 'includes/footer.php';
?>

<script type="text/javascript">
	// create delete job function
	function deleteJob(anchor) {
	   var conf = confirm('Are you sure want to delete this job?');
	   // if confirmed -> proceed for delete
	   if(conf){
	   		window.location=anchor.attr("href");
	   }
	}
</script>
