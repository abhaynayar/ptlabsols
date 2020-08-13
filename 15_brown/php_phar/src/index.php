<?php
  session_start();
  
  $site = "PentesterLab &rarrow; Phar";
  require "header.php";
  
  if (isset($_POST["file"])) {
    $file = file_get_contents($_POST["file"]);
    $filename= uniqid(rand(), true) ;

    if (isset($_SESSION['files'])) {
      array_push($_SESSION['files'],$filename);
    } else {
      $_SESSION['files']=array($filename);
    }
    $save = file_put_contents('uploads/'.$filename, $file);
  }
?>

<div class="row">
  <div class="col-lg-12">
    <h1>PHP phar://</h1>
      <p>Welcome to the <a href="https://pentesterlab.com/">PentesterLab</a>'s exercise on PHP phar://.</p>
      <p>The objective of this exercise is to find a way to get code execution.</p>
  </div>
</div>

<h3>Fetch a file</h3>
<form action="/index.php" method="POST">
  URL: <input type="text" name="file" placeholder="https://pentesterlab.com/logo_s.png" size=100 />
  <input type="submit" name="fetch" />

</form>

<?php if (isset($_SESSION['files'])) { ?>
<h3>Your files</h3>
<ul>
<?php

foreach($_SESSION['files'] as $file) {
  echo "<li><a href=\"/uploads/".$file."\">".$file."</a></li>" ;
}
?>
</ul>
<?php
  }
  require "footer.php";
?>

