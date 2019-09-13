import { Component, OnInit, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
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
	@Input() col_display:		string = ''; // column for display data in label
	@Input() col_value:			string = ''; // column for display data in code
	@Input() table_name:		string = ''; // Table for select data
	@Input() order_by:			string = ''; // Order data
	@Input() where_condition:	string = ''; // SP where condition
	@Input() code:				string = '';
	@Input() show_text:			string = '';

	@Output() return_code = new EventEmitter<string>();


  	constructor(public dialog: MatDialog,private http:HttpClient) { }

	ngOnInit() {
		this.onLostFocus();
	}

	ngOnChanges(changes: SimpleChange) {
		this.onLostFocus();
	}

	onLostFocus(){
		let search_data:cGetByCode	= new cGetByCode();
		search_data.token			= localStorage.getItem('token');
		search_data.code			= this.code;
		search_data.col_display		= this.col_display;
		search_data.col_value		= this.col_value;
		search_data.table_name		= this.table_name;
		search_data.where_condition	= this.where_condition;
		search_data.order_by		= this.order_by;
		
		let my_service	= BASE_URL + 'DropdownController/get_data_by_code';
		
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
			width: '550px',
			data: {
				name: 				this.col_display, 
				code: 				this.col_value,
				table:				this.table_name,
				whereCondition:		this.where_condition,
				orderBy:			this.order_by
			}
		});
	
		dialogRef.afterClosed().subscribe(result => {
			if (result){
				this.code	= result.code;
				this.name	= result.display;
				this.return_code.emit(result.code);
			}
		});
	}

}


export class cGetByCode{
	token:				string;
	code:				string;
	col_display:		string; // column for display data in label
	col_value:			string; // column for display data in code
	table_name:			string; // Table for select data
	order_by:			string; // Order data
	where_condition:	string; // SP where condition
}