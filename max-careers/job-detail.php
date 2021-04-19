<?php
	// include header
    include_once 'includes/header.php';
?>

<?php
	// include menu bar
    include_once 'includes/nav.php';
?>

<div class="container">
	<div class="row">
		<div class="col-sm-12">

			<?php
				$job_id = $_GET['id'];

		    	// write sql query to fetch job details
		    	$sql_job = "SELECT j.id As job_id, j.title AS job_title, j.description, c.title AS city, com.company_name AS company, com.id AS company_id, cat.title AS category
										FROM jobs j
											INNER JOIN cities c
												ON c.id = j.city_id
											INNER JOIN company com
												ON com.id = j.company_id
											INNER JOIN job_categories cat
												ON cat.id = j.job_category_id
										WHERE j.id = ".$job_id;
		    	
		    	// execute sql query
		    	$result_job = mysqli_query($connection, $sql_job);
		    	
		    	// fetch job information
		    	$row_job = mysqli_fetch_array($result_job);


		    	// title of job
				$job_title = $row_job['job_title'];

				// title of description
				$description = $row_job['description'];
				
				// city name
				$city = $row_job['city']; 

				// category name
				$category = $row_job['category'];
				
				// company name
				$company = $row_job['company'];
				
				// company id with link
				$company_link = 'company-detail.php?id='.$row_job['company_id']; 

		    ?>
			
			<!-- page heading -->
			<h1><a href="<?php echo BASEURL;?>">All Jobs</a> > <?php echo $job_title;?></h1>

			<hr/>

		   	<div class="col-sm-4">
		   		<div class="well">
		   			<!-- display job category -->
		   			<strong>Job Category: </strong> <?php echo $category;?>
		   		</div>
		   	</div>

		   	<div class="col-sm-4">
		   		<div class="well">
		   			<!-- display company with link -->
		   			<strong>Company: </strong> <a href="<?php echo $company_link;?>"><?php echo $company;?></a>
		   		</div>
		   	</div>

		   	<div class="col-sm-4">
		   		<div class="well">
		   			<!-- display city -->
		   			<strong>Location: </strong> <?php echo $city;?>
		   		</div>
		   	</div>

		   	<div class="col-sm-12">
		   		<h2>Job Description</h2>
		   		<hr/>
		   		<!-- display job description -->
		   		<?php echo $description;?>

		   		<br><hr/><br>

		   		<p>
		   			<a class="btn btn-info btn-lg" href="<?php echo BASEURL;?>">View all Jobs</a>
		   		</p>
		   	</div>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>