<?php

// FT = Folder Template //

	echo '
	
<link href="'.ft.'css/style.css" rel="stylesheet" type="text/css" />
<link href="'.ft.'css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="'.ft.'css/fancybox/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
<script src="'.ft.'js/craftyslide/jquery.js"></script>
<script src="'.ft.'js/jquery.min.js"></script>
<link rel="stylesheet" href="'.ft.'css/craftyslide.css" />
<script src="'.ft.'js/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="'.ft.'js/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<link href="'.ft.'js/SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css">
<script src="'.ft.'js/SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script src="'.ft.'js/newsticker.js" type="text/javascript"></script>
<script type="text/javascript" src="'.ft.'css/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script type="text/javascript" src="'.ft.'js/js.js"></script>

	'
?>

</head>

<body>
<div class="konten-isi">

<div class="menu-header">
	<ul>
		<li><a href="index.php?module=home">Home</a></li>
		<li><a href="index.php?module=panduan">Panduan Belanja</a></li>
		<li><a href="index.php?module=tentang">Tentang Kami</a></li>
	<ul>
		<li><?php echo "".$hari." ".$tgl." ".$bulan." ".$thn." "; // Menampilkan Tanggal // ?></li>
	</ul>
</ul>
</div>

<div class="header">
	<img src="<?php echo "".$banner_web.""; ?>" width="250px" height="50px" title="<?php echo $judul_web ?>" alt="">
</div>

<div class="menu-user">
	<span>Selamat Datang di <?php echo "".ubah_huruf_awal(" ",$judul_web)."" ?></span>

	<ul>
		<?php
			require "".ft."menu.php";
			
		?>
	
	</ul>
</div>
<div class="left-bar">
	<div class="kategori">
		<div class="judul-kategori">Kategori</div>
			<ul><?php 
			  $sql_kategori=mysql_query("select *from t_kategori");
			  while($row_kategori=mysql_fetch_assoc($sql_kategori))
				{
					echo "<li><a href='index.php?module=produk&kategori=".$row_kategori['id_kategori']."'>".$row_kategori['nama_kategori']."</a><br></li>";
				}?> 
			</ul>
		</div>
	</div>
<div class="cari">
	<form id="form1" name="form1" method="post" action="index.php?module=cari">
		<input name="search" type="text" id="search" size="71px" placeholder="Cari Produk"/>
		<input type="submit" name="btn-search" id="btn-search" class="button blue" style="height:30px;padding-top:5px;width:50px" value="Cari" />
	</form>
</div>

<div class="tempat-konten">
	<?php
		include "".folder_inc."tengah.php";
	?>
</div>
<div class="kanan-bar">
<!-- Kontak -->
	<div class="informasi">
		<div class="judul-kanan">Kontak</div>
		<b><i class="fa fa-phone"></i> No. Telepon :</b><br>
			<span><?php echo $telp; ?></span><br>
		<b><i class="fa fa-envelope-o"></i> SMS / Whatsapp :</b><br>
			<span><?php echo $sms; ?></span><br>
		<b><i class="fa fa-comments"></i> Instagram :</b><br>
			<span><?php echo $instagram; ?></span><br>
		<b><i class="fa fa-envelope"></i> E-mail :</b><br>
			<span><?php echo $email_kontak; ?></span><br>
	</div>
<!-- -->

<!-- Visitor -->
<div class="visitor">
	<div class="judul-kanan">Statistik Pengunjung</div>
<?php echo "
		<b>Online :</b> ".$pengunjungonline." visit <br>
		<b>Hari ini :</b> ".$pengunjung." visit <br>
		<b>Kemarin : </b> ".$kemarin." visit<br>
		<b>Total :</b> ".$totalpengunjung." visit <br>
";
?>
	</div>
</div>
<!-- -->

<hr style="color:#DDDDDD; border-color:#DDDDDD; border-style:solid">

<center>
	<img src="<?php echo "".$lokasi_template."./images/shipping.png" ?>">
</center>

<div class="footer">

		
<!-- Testimoni -->
	<div class="testimoni">
		<div class="judul-footer">Testimoni Pelanggan</div><hr>
		<ul id="listticker">
	<?php 

	// Widget Testimoni //

		$sql_testimoni=mysql_query("select *from t_testimonial INNER JOIN t_member on t_testimonial.id_member=t_member.id_member Limit 0,5"); 
		while($row_testimonial=mysql_fetch_assoc($sql_testimoni)){
		if($row_testimonial['tampil']==1){
			echo "<li><span class='news-text'><font>".TanggalIndo($row_testimonial['tgl_testimonial'])."</font><br><b>".$row_testimonial['username']."</b> :<br><span>".$row_testimonial['isi_testimonial']."</span></span><br><hr></li>
			";}};
	?>
	</ul>

	</div>
<!-- -->



<!-- Polling -->
	<?php 

		if($set_polling=="aktif"){ // Jika Polling Aktif, Maka Tampilkan //
			echo "<div class='polling'>
				 <div class='judul-footer'>Polling</div><hr><span>";
				 tampil_polling();
			echo "</span></div>";
		}

	?>
<!-- -->

<!-- Fanspage -->
<?php
		echo "<div class='fanspage'>
			<div class='judul-footer'>Hubungi Kami:</div><hr>
			<a href='https://api.whatsapp.com/send?phone=6287872229360&text=Nama%20%3A%0ASaya ingin bertanya%20%3A' title='Whatsapp'><img src='template/winmerch/images/whatsapp.png'><span>: Via Whatsapp</span></a><br><br>
			<a href='//www.instagram.com/win.merch.id' title='Instagram'><img src='template/winmerch/images/instagram.png'><span>: Via Instagram</span></a><br><br>
			</div>
		";
		

?>
		
</div>

<div class="copyright">
<center>
	© Copyright 2018 - <?php echo "".ubah_huruf_awal(" ",$judul_web).""; ?> - All Rights reserved.
</center>
</div>

</div>

</body>
</html>

<script src="<?php echo "".ft.""?>js/craftyslide/craftyslide.min.js"></script>

<script>
       $("#slideshow").craftyslide({
		'pagination': false,
		'fadetime': 500,
		'delay': 2500
});
</script> 
	  
<script>	  
$(document).ready(function() {
    $("#single_1").fancybox({
          helpers: {
              title : {
                  type : 'float'
              }
          }
      });

});
 </script> 