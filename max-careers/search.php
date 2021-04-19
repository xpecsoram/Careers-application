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
			<h1>Search</h1>

			<hr/>
			<!-- description text -->
			<p>Select the job category or city (or both) to narrow down the job search results:</p> <br>

			<div class="row">
				<!-- create search form -->
				<form method="GET" action="" class="searchForm">
					<div class="col-sm-5">
						<!-- job category label -->
						<label>Job Category</label>
						<!-- create dropdown -->
						<select name="category_id" class="form-control">
							<option value="">- Select job category -</option>
							<?php
								// if category is selected on search, select it in search form
								if($_GET['category_id'] != ''){
									$category_id = $_GET['category_id'];
								}
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
					</div>
					<div class="col-sm-5">
						<!-- city label -->
						<label>City</label>
						<select name="city_id" class="form-control">
							<option value="">- Select city -</option>
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
					</div>
					<div class="col-sm-2">
						<label>&nbsp;</label>
						<!-- create form submission button -->
						<input type="submit" name="search" value="SEARCH" class="btn btn-success btn-block" />
					</div>
				</form>
			</div>

			<hr/> <br/>

		    <?php
		    	// check if search form is submitted
		    	if($_GET['search']){

		    		// check if category is selected
		    		if($_GET['category_id'] != ''){
		    			$category_id = $_GET['category_id']; // get category id
		    			$search_category = " WHERE id = ".$category_id; // alter SQL for category id
		    		}

		    		// check if city is selected
		    		if($_GET['city_id'] != ''){
		    			$city_id = $_GET['city_id']; // get category id
		    			$search_city = " AND j.city_id = ".$city_id; // alter SQL for city id
		    		}

    		    	// write sql query to fetch job categories
    		    	$sql_categories = "SELECT * FROM job_categories ".$search_category;
    		    	
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
    										WHERE j.job_category_id = ".$category_id.$search_city;
    							
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
		    	}
		    ?>

		</div>
	</div>
</div>

<?php
	// include footer
    include_once 'includes/footer.php';
?>