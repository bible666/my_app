import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MyDropdownComponent } from '../my-dropdown/my-dropdown.component';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Router, ActivatedRoute } from '@angular/router';

const BASE_URL	= environment.api_url+'/';

export interface DialogData {
	code: 			string;
	name: 			string;
	table:			string;
	whereCondition:	string;
	orderBy:		string;
}

@Component({
	selector: 'app-my-dropdown-dialog',
	templateUrl: './my-dropdown-dialog.component.html',
	styleUrls: ['./my-dropdown-dialog.component.css']
})
export class MyDropdownDialogComponent implements OnInit {

	grdData:		any;
	search_code:	string	= '';
	search_name:	string	= '';
	returnData:		any;

	constructor(private router: Router,
		public dialogRef: MatDialogRef<MyDropdownComponent>,
		@Inject(MAT_DIALOG_DATA) public data: DialogData,private http:HttpClient) {
		
		//Code for constructor
		let search_data:cGetByCode	= new cGetByCode();
		search_data.token			= localStorage.getItem('token');
		search_data.colVal			= this.data.code;
		search_data.colDisplay		= this.data.name;
		search_data.tableName		= this.data.table;
		search_data.whereCondition	= this.data.whereCondition;
		search_data.orderBy			= this.data.orderBy;

		search_data.searchCode		= '';
		search_data.searchName		= '';
		
		let my_service	= BASE_URL + 'DropdownController/get_data_combo';

		let strJSON:string = JSON.stringify(search_data);
		
		this.http.post(my_service,strJSON).subscribe(data =>{
			if (data['status'] == 'success'){
				if (data['data']){
					this.grdData	= data['data'];
				} else {
					
				}

			} else {
				this.router.navigateByUrl('login');
			}
			
		});
	}

	ngOnInit() {
		//Code for init
		
	}

  	onNoClick(): void {
		this.dialogRef.close();
	}
	
	onSearch() {
		//set Search condition
		let search_data:cGetByCode	= new cGetByCode();
		search_data.token			= localStorage.getItem('token');
		search_data.colVal			= this.data.code;
		search_data.colDisplay		= this.data.name;
		search_data.tableName		= this.data.table;
		search_data.whereCondition	= this.data.whereCondition;
		search_data.orderBy			= this.data.orderBy;

		search_data.searchCode		= this.search_code;
		search_data.searchName		= this.search_name;
		
		let my_service	= BASE_URL + 'DropdownController/get_data_combo';

		let strJSON:string = JSON.stringify(search_data);
		
		this.http.post(my_service,strJSON).subscribe(data =>{
			if (data['status'] == 'success'){
				if (data['data']){
					this.grdData	= data['data'];
				} else {
					
				}

			} else {
				this.router.navigateByUrl('login');
			}
			
		});
	}

	onRowSelected(row_data:any) {
		this.returnData	= row_data;
		//this.dialogRef.close(row_data);

	}

}

export class cGetByCode{
	token:			string;
	colVal:			string;
	colDisplay:		string;
	tableName:		string;
	orderBy:		string;
	whereCondition:	string;

	searchCode:		string;
	searchName:		string;
	row_count:		number;
}

