import { Component, OnInit, Input, Output, EventEmitter, SimpleChange } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA, throwMatDialogContentAlreadyAttachedError} from '@angular/material/dialog';
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

	ret_value	: cRetValue;

	@Input() width:				number = 200;
	@Input() label_width:		number = 200;
	@Input() col_display:		string = ''; // column for display data in label
	@Input() col_value:			string = ''; // column for display data in code
	@Input() table_name:		string = ''; // Table for select data
	@Input() order_by:			string = ''; // Order data
	@Input() where_condition:	string = ''; // SP where condition
	@Input() code:				string = '';
	@Input() value:				string = '';
	@Input() show_text:			string = '';

	@Output() return_code = new EventEmitter<cRetValue>();


  	constructor(public dialog: MatDialog,private http:HttpClient) { }

	ngOnInit() {
		//this.onLostFocus();
	}

	ngOnChanges(changes: SimpleChange) {
		//this.onLostFocus();
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
			this.ret_value	= new cRetValue();
			
			this.ret_value.id	= -1;
			this.ret_value.code	= '';
			this.ret_value.name	= '';

			this.value		= '';

			if (data['status'] == 'success'){
				if (data['data']){
					this.ret_value.name	= data['data'][this.col_display];
					this.ret_value.code	= data['data'][this.col_value];
					this.ret_value.id	= data['data']['id'];

					this.value = this.ret_value.name;
				}

			}

			this.return_code.emit(this.ret_value);
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
	
		this.ret_value	= new cRetValue();
			
		this.ret_value.id	= -1;
		this.ret_value.code	= '';
		this.ret_value.name	= '';

		this.value		= '';

		dialogRef.afterClosed().subscribe(result => {
			
			if (result){
				this.ret_value.name	= result.display;
				this.ret_value.code	= result.code;
				this.ret_value.id	= result.id;

				this.value	= result.display;
				this.return_code.emit(this.ret_value);
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

export class cRetValue{
	id		: number;
	code	: string;
	name	: string;
}