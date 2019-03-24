import { Component, OnInit , ViewChild} from '@angular/core';
import {MatSort,MatPaginator, MatTableDataSource} from '@angular/material';

@Component({
  selector: 'app-show-table',
  templateUrl: './show-table.component.html',
  styleUrls: ['./show-table.component.css']
})
export class ShowTableComponent implements OnInit {
  displayedColumns: string[] = ['position', 'name', 'weight', 'symbol','code'];
  dataSource = new MatTableDataSource<PeriodicElement>(ELEMENT_DATA);

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort:MatSort;

  constructor() { }

  ngOnInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

}

export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
  code:string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H',code: 'XH'},
  {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He',code: 'XH'},
  {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li',code: 'XH'},
  {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be',code: 'XH'},
  {position: 5, name: 'Boron', weight: 10.811, symbol: 'B',code: 'XH'},
  {position: 6, name: 'Carbon', weight: 12.0107, symbol: 'C',code: 'XH'},
  {position: 7, name: 'Nitrogen', weight: 14.0067, symbol: 'N',code: 'XH'},
  {position: 8, name: 'Oxygen', weight: 15.9994, symbol: 'O',code: 'XH'},
  {position: 9, name: 'Fluorine', weight: 18.9984, symbol: 'F',code: 'XH'},
  {position: 10, name: 'Neon', weight: 20.1797, symbol: 'Ne',code: 'XH'},
  {position: 11, name: 'Sodium', weight: 22.9897, symbol: 'Na',code: 'XH'},
  {position: 12, name: 'Magnesium', weight: 24.305, symbol: 'Mg',code: 'XH'},
  {position: 13, name: 'Aluminum', weight: 26.9815, symbol: 'Al',code: 'XH'},
  {position: 14, name: 'Silicon', weight: 28.0855, symbol: 'Si',code: 'XH'},
  {position: 15, name: 'Phosphorus', weight: 30.9738, symbol: 'P',code: 'XH'},
  {position: 16, name: 'Sulfur', weight: 32.065, symbol: 'S',code: 'XH'},
  {position: 17, name: 'Chlorine', weight: 35.453, symbol: 'Cl',code: 'XH'},
  {position: 18, name: 'Argon', weight: 39.948, symbol: 'Ar',code: 'XH'},
  {position: 19, name: 'Potassium', weight: 39.0983, symbol: 'K',code: 'XH'},
  {position: 20, name: 'Calcium', weight: 40.078, symbol: 'Ca',code: 'XH'},
];
