import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MyDropdownDialogComponent } from '../my-dropdown-dialog/my-dropdown-dialog.component';
import { environment } from '../../../environments/environment';
import { HttpClient } from '@angular/common/http';

const BASE_URL	= environment.api_url+'/';

@Component({
  selector: 'my-dropdown',
  templateUrl: './my-dropdown.component.html',
  styleUrls: ['./my-dropdown.component.css']
})
export class MyDropdownComponent implements OnInit {

	name: string;

	@Input() width:				number = 200;
	@Input() label_width:		number = 200;
	@Input() service_display:	string = ''; // service for call to show data from db
	@Input() service_check:		string = ''; // service for check code to display name
	@Input() col_display:		string = ''; // column for display data in label
	@Input() col_value:			string = ''; // column for display data in code
	@Input() code:				string = '';

	@Output() return_code = new EventEmitter<string>();


  	constructor(public dialog: MatDialog,private http:HttpClient) { }

	ngOnInit() {
		this.onLostFocus();
	}

	onLostFocus(){
		let search_data:cGetByCode	= new cGetByCode();
		search_data.token			= localStorage.getItem('token');
		search_data.code			= this.code;
		
		let my_service	= BASE_URL + this.service_check;
		
		let strJSON:string = JSON.stringify(search_data);

		this.http.post(my_service,strJSON).subscribe(data =>{
			let retValue = '';
			if (data['status'] == 'success'){
				if (data['data']){
					this.name = data['data'][this.col_display];
					retValue	= this.code;
				} else {
					this.name = '';
				}

			} else {
				this.name = '';
			}
			this.return_code.emit(retValue);
		});
		
	}

	openDialog(): void {
		const dialogRef = this.dialog.open(MyDropdownDialogComponent, {
			width: '350px',
			data: {name: this.col_display, code: this.col_value,service_name:this.service_display}
		});
	
		dialogRef.afterClosed().subscribe(result => {
			if (result){
				this.code	= result.code;
				this.name	= result.display;
			}
		});
	}

}


export class cGetByCode{
	token:string;
	code:string;
}