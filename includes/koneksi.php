<?php

	$server_db='localhost:3306'; // Server Database
	$user_db='id6857296_winmerch'; // Username Database
	$pass_db='skripsialabudi'; // Password Database
	$database='id6857296_winmerch'; // Nama Database
	

	mysql_connect($server_db,$user_db,$pass_db) or die ("Koneksi MySQL Gagal!!");
	mysql_select_db($database) or die("Database Tidak Tersedia!");

	$salt_pass=md5("p[T-LvZty/VDUz~/g/(a&?h*Ie@k^mThY23hsc>-! m6#SK,i;&Kt8+L:AxIb"); // Salt Untuk Security Password


?>