<?php
    if($_SESSION['access'] != 'true'){
        $_SESSION['alert'] = 'Error! You must login to access';
        header('location:'.ACCOUNT_BASEURL);
        exit();
    }
?>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">My Careers Portal</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="<?php echo BASEURL;?>" target="_blank">Visit Website</a></li>
        <li><a href="#">|</a></li>
        <li><a href="<?php echo ACCOUNT_BASEURL;?>/jobs.php?page=view">My jobs</a></li>
        <li><a href="<?php echo ACCOUNT_BASEURL;?>/profile.php">My profile</a></li>
        <li><a href="<?php echo ACCOUNT_BASEURL;?>/change-password.php">Change password</a></li>
        <li><a href="<?php echo ACCOUNT_BASEURL;?>/logout.php" class="btn btn-danger text-white btn-md">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>