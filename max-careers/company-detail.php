<?php
	// include header
    include_once 'includes/header.php';
?>

<?php
	// include menu bar
    include_once 'includes/nav.php';
?>

<div class="container" style="min-height: 80vh">
	<div class="row">
		<div class="col-sm-12">

			<?php
				$company_id = $_GET['id'];

		    	// write sql query to fetch company details
		    	$sql_company = "SELECT com.company_name, com.profile_picture, com.email, com.phone, c.title AS city
		    					FROM company com
		    						INNER JOIN cities c
		    							ON c.id = com.city_id
		    					WHERE com.id = ".$company_id;
		    	
		    	// execute sql query
		    	$result_company = mysqli_query($connection, $sql_company);
		    	
		    	// fetch company information
		    	$row_company = mysqli_fetch_array($result_company);


		    	// name of company
				$company_name = $row_company['company_name'];

				// picture of company
				$profile_picture = $row_company['profile_picture'];

				// logo with path
				$logo = BASEURL.'/account/uploads/'.$profile_picture;

				// category email
				$email = $row_company['email'];
				
				// company phone
				$phone = $row_company['phone'];
				
				// city name
				$city = $row_company['city']; 

		    ?>
			
			<!-- page heading -->
			<h1>Company: <?php echo $company_name;?></h1>

			<hr/>

		   	<div class="col-sm-8">
		   		<div class="well">
		   			<!-- display company city -->
		   			<p><strong>Head Office:</strong> <?php echo $city;?></p>
		   			
		   			<!-- display company email -->
		   			<p><strong>Email:</strong> <?php echo $email;?></p>

		   			<!-- display company phone -->
		   			<strong>Phone:</strong> <?php echo $phone;?>
		   		</div>
		   	</div>

		   	<div class="col-sm-4">
		   		<div class="text-center">
		   			<!-- display company logo -->
		   			<img src="<?php echo $logo;?>" class="img-responsive img-thumbnail company-logo">	
		   		</div>
		   	</div>

		   	<br>

		   	<div class="col-sm-12">
		   		<h2>Jobs listed by <?php echo $company_name;?></h2><br>
		   	</div>

		   	<div class="col-sm-12">
		   		<?php
		   			// write sql query to fetch jobs for particular company
		   			$sql_jobs = "SELECT j.id As job_id, j.title AS job_title, c.title AS city, cat.title AS category
		   						FROM jobs j
		   							INNER JOIN cities c
		   								ON c.id = j.city_id
		   							INNER JOIN job_categories cat
		   								ON cat.id = j.job_category_id
		   						WHERE j.company_id = ".$company_id;
		   			
		   			// execute sql query
		   			$result_jobs = mysqli_query($connection, $sql_jobs);
		   			
		   			// iterate all job and fetch information
		   			while($row_jobs = mysqli_fetch_array($result_jobs)){

		   				$job_link = 'job-detail.php?id='.$row_jobs['job_id']; // id of job with link
		   				$job_title = $row_jobs['job_title']; // title of job
		   				$city = $row_jobs['city']; // city name
		   				
		   				// create and display link
		   				echo '<div class="well">
		   						<a href="'.$job_link.'" class="job-link">'.$job_title.'</a> 
		   							is required in <em>'.$city.'</em>.
		   					 </div>';
		   			}
		   		?>
		   	</div>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>