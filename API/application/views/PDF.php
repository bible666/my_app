
<html><body>
				<!-- <img src="./PDFBooking/new_reservation.jpg" alt="" width="750" height="850">  -->
				<img src="./PDFBooking/new_reservation.jpg" alt="" width="750" height="850">
				<div style=" position: absolute; top: 75px; left: 100px; margin-bottom: 0px;  width: 120px; height: 120px;">
				    <img  src="./uploads_golf_course/<?php echo $logo_GC;?>" width="105" height="105">
				</div>
				<div style=" position: absolute; top: 200px; left: 610px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Date;?></div>
				<div style=" position: absolute; top: 235px; left: 220px; margin-bottom: 0px;  width: 290px; height: 20px;"><?php echo $Golf_Course;?></div>
				<div style=" position: absolute; top: 235px; left: 610px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Id_No;?></div>
				<div style=" position: absolute; top: 278px; left: 220px; margin-bottom: 0px;  width: 290px; height: 20px;"><?php echo $Person_Name;?></div>
				<div style=" position: absolute; top: 278px; left: 610px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Booking_No;?></div>
				<div style=" position: absolute; top: 315px; left: 220px; margin-bottom: 0px;  width: 180px; height: 20px;"><?php echo $Date_Of_Reser;?></div>
				<div style=" position: absolute; top: 315px; left: 550px; margin-bottom: 0px;  width: 180px; height: 20px;"><?php echo $Time_Of_Reser;?></div>
				<div style=" position: absolute; top: 350px; left: 220px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Number_of_group;?></div>
				<div style=" position: absolute; top: 350px; left: 550px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Numder_of_person;?></div>
				<div style=" position: absolute; top: 383px; left: 220px; margin-bottom: 0px;  width: 180px; height: 20px;"><?php echo $Comfirm_by;?></div>
				<div style=" position: absolute; top: 383px; left: 610px; margin-bottom: 0px;  width: 105px; height: 20px;"><?php echo $Person_in_charge_for_ATAP;?></div>
				<div style=" position: absolute; top: 445px; right: 430px; margin-bottom: 0px; text-align: right; width: 120px; height: 20px;"><?php echo $Green_fee_vistor;?> Baht</div>
				<div style=" position: absolute; top: 473px; right: 430px; margin-bottom: 0px; text-align: right; width: 120px; height: 20px;"><?php echo $Green_fee_club_thai;?> Baht</div>
				<div style=" position: absolute; top: 498px; right: 430px; margin-bottom: 0px; text-align: right; width: 120px; height: 20px;"><?php echo $Caddy_fee;?> Baht</div>
				<div style=" position: absolute; top: 525px; right: 430px; margin-bottom: 0px; text-align: right; width: 120px; height: 20px;"><?php echo $Cart_fee;?> Baht</div>
				<div style=" position: absolute; top: 600px; left: 80px; margin-bottom: 0px;  width: 310px; height: 140px;">
					<?php if($Time_of_Reser2){?>
						Time of Reservation :&nbsp;
							<?php echo $Time_of_Reser2;?>
						<br>
					<?php }?>
					<?php echo $Remark;?>
				</div>
				<div style=" position: absolute; top: 580px; right: 80px; margin-bottom: 0px;  width: 310px; height: 140px; text-align: center;">
					<br>
					BOOKING FROM CLUB THAILAND<br>
					<?php echo $branch_name;?><br>
					<br>
					TEL : <?php echo $branch_phone;?><br>
					OPEN : <?php echo $branch_open_detail;?>
				</div>
		</body></html>