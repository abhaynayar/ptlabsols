<?php

class UploadFile {
  public $filename;
  function __destruct() {
    // check filename
    assert(trim("'".$this->filename."'"));
  }
}
?>

