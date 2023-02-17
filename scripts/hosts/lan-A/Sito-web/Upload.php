<?php

$target_dir = '/var/www/html/uploads/';
$target_file = $target_dir . 'binary';
move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $target_file);
$output = shell_exec('./Send_file.sh');
$report = fopen('report.html', 'r') or die ('Unable to show report');
echo fread($report, filesize('report.html'));
fclose($report);

?>