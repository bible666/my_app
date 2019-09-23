import { Component, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material';
import { SupplierService, cSearch } from '../../supplier/supplier.service';
import { merge, Observable, of as observableOf } from 'rxjs';
import { catchError, map, startWith, switchMap } from 'rxjs/operators';
import { FormControl, FormGroup } from '@angular/forms';
import { OriginalListComponent } from 'src/app/original/original-list/original-list.component';
import { Router } from '@angular/router';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';
import { ShowDialogComponent } from '../../../common/show-dialog/show-dialog.component';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material';
import { MyMessageComponent } from '../../../common/my-message/my-message.component';
import { TranslateService } from '@ngx-translate/core';
import { MatPaginator } from '@angular/material/paginator';


@Component({
	selector: 'app-supplier-list',
	templateUrl: './supplier-list.component.html',
	styleUrls: ['./supplier-list.component.css']
})
export class SupplierListComponent extends OriginalListComponent {

	//----------------------------------------------------------------
	// set for grid
	//----------------------------------------------------------------
	displayedColumns: string[]		= ['supplier_cd', 'supplier_name', 'update', 'delete'];
	
	@ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;

	//----------------------------------------------------------------
	// set datasort for show in list
	//----------------------------------------------------------------
	dataSource:MatTableDataSource<ListElement>;

	//----------------------------------------------------------------
	// Set Valiable for use in form
	//----------------------------------------------------------------
	searchForm = new FormGroup({
		'supplier_cd'	: new FormControl(''),
		'supplier_name'	: new FormControl('')
	});

	//----------------------------------------------------------------
	// set local store object
	//----------------------------------------------------------------
	localNameList:string	= 'supplierList';

	//----------------------------------------------------------------
	// set local valiable
	//----------------------------------------------------------------
	texts:any;	//Language for translate

	//-----------------------------------------------------------------
	// constructor class
	//-----------------------------------------------------------------
	constructor(private unitS: SupplierService, private router: Router, 
		public dialog: MatDialog, private snackBar: MatSnackBar, private translate: TranslateService ) {
		
		//Constructior code
		super();
		this.translate.setDefaultLang('th');
	}

	//----------------------------------------------------------------
	// Clear Local Store Data
	//----------------------------------------------------------------
	private _clear_data(){
		localStorage.setItem(this.localNameList + '.supplier_cd','');
		localStorage.setItem(this.localNameList + '.supplier_name','');

		this.searchForm.patchValue({
			supplier_cd		: '',
			supplier_name	: ''
		});
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

		//recheck when test run
		//search_data.supplier_cd		= this.item_name;

		return this.unitS.getListData(search_data);
	}

	//----------------------------------------------------------------
	// set init data from local store
	//----------------------------------------------------------------
	protected _set_init(){
		// when init set value to search form
		//this.item_name =  localStorage.getItem(this.localNameList + '.item_name');

	}

	//----------------------------------------------------------------
	// event on Init
	//----------------------------------------------------------------
	ngOnInit() {
		//Load Text
		this.translate.get([
			'common.delete_question',
			'common.delete_complete'
		])
		.subscribe(texts => {
			this.texts = texts;
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
							if (data['message'] == 'token not found') {
								this.router.navigateByUrl('login');
							} else {
								this.snackBar.openFromComponent(MyMessageComponent,{
									data: [data['message']],
									duration:2000,
									panelClass:['mat-snack-bar-container-message']
								});
							}
							
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
		});
	}

	//----------------------------------------------------------------
	// event on search click
	//----------------------------------------------------------------
	onSearchClick(){
		//send data to local storage
		localStorage.setItem(this.localNameList + '.supplier_cd',this.searchForm.controls['supplier_cd'].value);
		localStorage.setItem(this.localNameList + '.supplier_name',this.searchForm.controls['supplier_name'].value);
		
		//call ngOnInit for refresh data
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
	// event on delete
	//----------------------------------------------------------------
	onDelete(id:number){

		const dialogRef = this.dialog.open(ShowDialogComponent,{
			width: '350px',
			height: '200px',
			data: {description: this.texts['common.delete_question'],id:id}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
				//console.log(result);
				//start delete data
				
				this.unitS.deleteById(id).subscribe(data =>{
					if (data['status'] == 'success'){
						this.snackBar.openFromComponent(MyMessageComponent,{
							data:[this.texts['common.delete_complete']],
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
	id				:number;
	sorted			: string;

	//Manual set for display list
	supplier_cd		: string;
	supplier_name	: string;
}