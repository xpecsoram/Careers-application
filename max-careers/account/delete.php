<?php
	include '../includes/settings.php';
	
	// get job id from URL
	$job_id = mysqli_real_escape_string($connection, $_GET['id']);

	// prepare delete SQL
	$sql = "DELETE FROM jobs WHERE id = ".$job_id;

	// execute sql query
	if(mysqli_query($connection, $sql)){
		$_SESSION['success'] = 'Success! Job has been removed successfully';
	}else{
		$_SESSION['alert'] = 'Error! Job is not deleted. Something went wrong';
	}

	header("location:".ACCOUNT_BASEURL.'/jobs.php?page=view');
	exit();
?>