import { Component } from '@angular/core';
import { MatTableDataSource } from '@angular/material';
import { CustomerService, cSearch } from '../customer.service';
import {merge, Observable, of as observableOf} from 'rxjs';
import {catchError, map, startWith, switchMap} from 'rxjs/operators';
import {FormControl, FormGroup} from '@angular/forms';
import { OriginalListComponent } from 'src/app/original/original-list/original-list.component';
import { Router } from '@angular/router';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';
import { ShowDialogComponent } from '../../../common/show-dialog/show-dialog.component'
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';
import { MyMessageComponent } from '../../../common/my-message/my-message.component'

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent extends OriginalListComponent {

	//----------------------------------------------------------------
	// set for grid
	//----------------------------------------------------------------
	displayedColumns: string[]		= ['item_type_name','update','delete'];
	
	//----------------------------------------------------------------
	// set datasort for show in list
	//----------------------------------------------------------------
	dataSource:MatTableDataSource<ListElement>;

	//----------------------------------------------------------------
	// Set Valiable for use in form
	//----------------------------------------------------------------
	searchForm:FormGroup;
	itemTypeName:string;

	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameList:string	= 'itemTypeList';
	localNameInput:string	= 'itemTypeInput';

	private configError: MatSnackBarConfig = {
		panelClass: ['style-error'],
		duration: 2000,
	};


	//-----------------------------------------------------------------
	// constructor class
	//-----------------------------------------------------------------
	constructor(private unitS: CustomerService, private router: Router, 
		public dialog: MatDialog,private snackBar: MatSnackBar) {
		super();
	 }

	//----------------------------------------------------------------
	// Clear Local Store Data
	//----------------------------------------------------------------
	private _clear_data(){
		localStorage.setItem(this.localNameList + '.itemTypeName','');
	}

	//----------------------------------------------------------------
	// set search data from local store data
	//----------------------------------------------------------------
	protected _set_search_data(){
		let search_data: cSearch = new cSearch();

		search_data.sort_column		= this.sort.active;
		search_data.sort_direction	= this.sort.direction;
		search_data.page_index		= this.paginator.pageIndex;
		if (this.paginator.pageSize == null){
			search_data.page_size		= this.AR_pages[0];
		}else {
			search_data.page_size		= this.paginator.pageSize;
		}
		search_data.itemTypeName		= this.itemTypeName;

		return this.unitS.getListData(search_data);
	}

	//----------------------------------------------------------------
	// set init data from local store
	//----------------------------------------------------------------
	protected _set_init(){
		this.itemTypeName =  localStorage.getItem(this.localNameList + '.itemTypeName');

		this.searchForm = new FormGroup({
            'itemTypeName': new FormControl(this.itemTypeName),
        });
	}

	//----------------------------------------------------------------
	// event on Init
	//----------------------------------------------------------------
	ngOnInit() {

		this._set_init();
		
		// If the user changes the sort order, reset back to the first page.
		this.sort.sortChange.subscribe(() => this.paginator.pageIndex = 0);

		merge(this.sort.sortChange,this.paginator.page)
			.pipe(
				startWith({}),
				switchMap(()=>{
					this.isLoadingResults = true;
					return this._set_search_data();
				}),
				map(data =>{
					this.isLoadingResults	= false;
					this.isRateLimitReached	= false;

					if (data['status'] == 'error'){
						this.snackBar.openFromComponent(MyMessageComponent,{
							data: [data['message']],
							duration:2000,
							panelClass:['mat-snack-bar-container-message']
						})
						
					}
					
					this.resultsLength		= data['data_count'];
					return data['data'];
				}),
				catchError(error => {
					this.isLoadingResults = false;
					console.log(error);
					// Catch if the GitHub API has reached its rate limit. Return empty data.
					this.isRateLimitReached = true;
					return observableOf([]);
				})
			)
			.subscribe(data=>{
				this.dataSource = new MatTableDataSource(data);
			}
		);

	}

	//----------------------------------------------------------------
	// event on search click
	//----------------------------------------------------------------
	onSearchClick(){
		localStorage.setItem(this.localNameList + '.itemTypeName',this.searchForm.controls['itemTypeName'].value);
		this.ngOnInit();
	}


	//----------------------------------------------------------------
	// event on clear click
	//----------------------------------------------------------------
	onClear(){
		this._clear_data();
		this.ngOnInit();
	}

	//----------------------------------------------------------------
	// event on add click
	//----------------------------------------------------------------
	onAdd(){
		localStorage.setItem(this.localNameInput + '.id','-1');
		this.router.navigateByUrl('item_type_input');
	}

	//----------------------------------------------------------------
	// event on edit
	//----------------------------------------------------------------
	onEdit(id:number){
		localStorage.setItem(this.localNameInput + '.id',String(id));
		this.router.navigateByUrl('item_type_input');
	}

	//----------------------------------------------------------------
	// event on delete
	//----------------------------------------------------------------
	onDelete(id:number){
		const dialogRef = this.dialog.open(ShowDialogComponent,{
			width: '350px',
			height: '200px',
			data: {description:'คุณต้องการลบรายการนี้จริิงหรือเปล่า',id:id}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
				//console.log(result);
				//start delete data
				localStorage.setItem( this.localNameInput + '.delete_id',result);
				this.unitS.deleteById().subscribe(data =>{
					if (data['status'] == 'success'){
						this.snackBar.openFromComponent(MyMessageComponent,{
							data:['ทำการลบรายการแล้ว'],
							duration:5000,
							panelClass:['mat-snack-bar-container-message']
						})
						this.ngOnInit();
					} else {
						console.log(data['message']);
					}
				});
			}
		})
	}

}

export interface ListElement {
	id:number;
	item_type_name: string;
	sorted: string;
	remark: string;
}