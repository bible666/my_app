<?php

header("Access-Control-Allow-Origin: *");

$path = './';

if (isset($_FILES['file'])) {
	$originalName = $_FILES['file']['name'];
	$generatedName = $_FILES['file']['name'];
	// $ext = '.' . pathinfo($originalName, PATHINFO_EXTENSION);
	// $generatedName = md5($_FILES['file']['tmp_name']) . $ext;
	$filePath = $path . $generatedName;
	if (move_uploaded_file($_FILES['file']['tmp_name'], $filePath)) {
		echo json_encode(array(
			'status' => 'success',
			'originalName' => $originalName,
			'generatedName' => $generatedName,
			'_FILES' => $_FILES
		));
	} else {
		echo json_encode(array(
			'status' => 'error',
			'msg' => 'can not file uploaded.',
			'_FILES' => $_FILES
		));
	}
}

/*
$fp = fopen('log.txt', 'w');
fputs($fp, $_FILES['file']['name']);
fputs($fp, $_FILES['file']['tmp_name']);
fputs($fp, $filePath);
$fp = fclose($fp);
*/

?>
