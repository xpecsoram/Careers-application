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
			
			<!-- page heading -->
			<h1>All Jobs</h1>

			<hr/>

		    <?php
		    	// write sql query to fetch job categories
		    	$sql_categories = "SELECT * FROM job_categories";
		    	
		    	// execute sql query
		    	$result_categories = mysqli_query($connection, $sql_categories);
		    	
		    	// iterate all job categories and fetch information
		    	while($row_categories = mysqli_fetch_array($result_categories)){
		    	
		    		$category_id = $row_categories['id']; // id of job category
		    		$category_title = $row_categories['title']; // title of job category

		    		echo '
		    		<div class="panel panel-info">
						<div class="panel-heading">
					    	<h3 class="panel-title">'.$category_title.'</h3>
					  	</div>
					  	<div class="panel-body">';
							
							// write sql query to fetch jobs
							$sql_jobs = "SELECT j.id As job_id, j.title AS job_title, c.title AS city, com.company_name AS company, com.id AS company_id
										FROM jobs j
											INNER JOIN cities c
												ON c.id = j.city_id
											INNER JOIN company com
												ON com.id = j.company_id
										WHERE j.job_category_id = ".$category_id;
							
							// execute sql query
							$result_jobs = mysqli_query($connection, $sql_jobs);
							
							// iterate all job and fetch information
							while($row_jobs = mysqli_fetch_array($result_jobs)){

								$job_link = 'job-detail.php?id='.$row_jobs['job_id']; // id of job with link
								$job_title = $row_jobs['job_title']; // title of job
								$city = $row_jobs['city']; // city name
								$company = $row_jobs['company']; // company name
								$company_link = 'company-detail.php?id='.$row_jobs['company_id']; // company id with link

								// create and display link
								echo '<p>
										<a href="'.$job_link.'" class="job-link">'.$job_title.'</a> 
											is required at
										<a href="'.$company_link.'">'.$company.'</a> 
											in <em>'.$city.'</em>.
									 </p>';
							}

					echo '
					  	</div>
					</div>';
		    	}
		    ?>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>