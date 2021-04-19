<?php
	// hide php errors
	error_reporting(1);
	// start server side session
	session_start();

	// -- define site URL
	const BASEURL = 'http://localhost/max-careers';
	const ACCOUNT_BASEURL = 'http://localhost/max-careers/account';

	// -- DB credentials
	const DB_HOST = 'localhost';
	const DB_NAME = 'max-careers';
	const DB_USER = 'root';
	const DB_PASSWORD = '';
	
	// create DB connection 
	$connection = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
?>