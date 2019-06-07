import { Component, OnInit, ViewChild } from '@angular/core';
import { MatSort,MatPaginator } from '@angular/material';
import {merge, of as observableOf, ObservableInput} from 'rxjs';
import {catchError, map, startWith, switchMap} from 'rxjs/operators';
import { MatTableDataSource } from '@angular/material';

@Component({
  selector: 'app-original-list',
  templateUrl: './original-list.component.html',
  styleUrls: ['./original-list.component.css']
})
export class OriginalListComponent implements OnInit {

	//setup show item in page
	AR_pages:number[]	= [10,20,15];

	//Original setting
	resultsLength		= 0;
	isLoadingResults	= true;
	isRateLimitReached	= false;

	@ViewChild(MatPaginator, /* TODO: add static flag */ {}) paginator: MatPaginator;
	@ViewChild(MatSort, /* TODO: add static flag */ {}) sort:MatSort;

	constructor() { }

	protected _set_search_data(){

	}

	protected _set_init(){

	}

	ngOnInit() {}

}
