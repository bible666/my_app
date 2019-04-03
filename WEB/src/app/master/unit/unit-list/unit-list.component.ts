import { Component } from '@angular/core';
import { MatTableDataSource } from '@angular/material';
import { UnitService, cUnitSearch } from '../unit.service';
import {merge, Observable, of as observableOf} from 'rxjs';
import {catchError, map, startWith, switchMap} from 'rxjs/operators';
import {FormControl, FormGroup} from '@angular/forms';
import { OriginalListComponent } from 'src/app/original/original-list/original-list.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-unit-list',
  templateUrl: './unit-list.component.html',
  styleUrls: ['./unit-list.component.css']
})
export class UnitListComponent extends OriginalListComponent {
	//----------------------------------------------------------------
	// set for grid
	//----------------------------------------------------------------
	displayedColumns: string[]		= ['unit_code','unit_name','update','delete'];
	
	//----------------------------------------------------------------
	// set datasort for show in list
	//----------------------------------------------------------------
	dataSource:MatTableDataSource<UnitListElement>;

	//----------------------------------------------------------------
	// Set Valiable for use in form
	//----------------------------------------------------------------
	searchForm:FormGroup;
	unitCode:string;
	unitName:string;

	constructor(private unitS: UnitService, private router: Router) {
		super();
	 }

	//----------------------------------------------------------------
	// Clear Local Store Data
	//----------------------------------------------------------------
	private _clear_data(){
		localStorage.setItem('unit_search.unit_code','');
		localStorage.setItem('unit_search.unit_name','');
	}

	protected _set_search_data(){
		let search_data: cUnitSearch = new cUnitSearch();

		search_data.sort_column		= this.sort.active;
		search_data.sort_direction	= this.sort.direction;
		search_data.page_index		= this.paginator.pageIndex;
		if (this.paginator.pageSize == null){
			search_data.page_size		= this.AR_pages[0];
		}else {
			search_data.page_size		= this.paginator.pageSize;
		}
		search_data.unit_code		= this.unitCode;
		search_data.unit_name		= this.unitName;

		return this.unitS.getListData(search_data);
	}

	protected _set_init(){
		this.unitCode =  localStorage.getItem('unit_search.unit_code');
		this.unitName =  localStorage.getItem('unit_search.unit_name');

		this.searchForm = new FormGroup({
            'unit_code': new FormControl(this.unitCode),
            'unit_name': new FormControl(this.unitName),
        });
	}

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
			});

	}

	onSearchClick(){
		localStorage.setItem('unit_search.unit_code',this.searchForm.controls['unit_code'].value);
		localStorage.setItem('unit_search.unit_name',this.searchForm.controls['unit_name'].value);
		this.ngOnInit();
	}


	onClear(){
		this._clear_data();
		this.ngOnInit();
	}

	onAdd(){
		localStorage.setItem('unit_input.id','-1');
		this.router.navigateByUrl('unit_input');
	}

	onEdit(id:number){
		localStorage.setItem('unit_input.id',String(id));
		this.router.navigateByUrl('unit_input');
	}

	onDelete(id:number){
		alert('delete'+id);
	}

}

export interface UnitListElement {
	id:number;
	unit_code: string;
	unit_name: string;
	remark: string;
}


