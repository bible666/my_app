import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MyDropdownComponent } from '../my-dropdown/my-dropdown.component';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

const BASE_URL	= environment.api_url+'/';

export interface DialogData {
	code: 			string;
	name: 			string;
	service_name:	string;
}

@Component({
  selector: 'app-my-dropdown-dialog',
  templateUrl: './my-dropdown-dialog.component.html',
  styleUrls: ['./my-dropdown-dialog.component.css']
})
export class MyDropdownDialogComponent implements OnInit {

	grdData:	any;

	constructor(
		public dialogRef: MatDialogRef<MyDropdownComponent>,
		@Inject(MAT_DIALOG_DATA) public data: DialogData,private http:HttpClient) {
		
		//Code for constructor
		let search_data:cGetByCode	= new cGetByCode();
		search_data.token			= localStorage.getItem('token');
		search_data.colVal			= this.data.code;
		search_data.colDisplay		= this.data.name;
		
		let my_service	= BASE_URL + this.data.service_name;

		let strJSON:string = JSON.stringify(search_data);
		
		this.http.post(my_service,strJSON).subscribe(data =>{
			if (data['status'] == 'success'){
				if (data['data']){
					this.grdData	= data['data'];
				} else {
					
				}

			} else {
				
			}
			
		});
	}

	ngOnInit() {
		//Code for init
		
	}

  	onNoClick(): void {
		console.log('no click');
		this.dialogRef.close();
	  }
	  
	onRowSelected(row_data:any){
		this.dialogRef.close(row_data);

	}

}

export class cGetByCode{
	token:		string;
	colVal:		string;
	colDisplay:	string;
	row_count:	number;
}

