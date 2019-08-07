import { Component, OnInit, Inject } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { MyDropdownDialogComponent } from '../my-dropdown-dialog/my-dropdown-dialog.component';
@Component({
  selector: 'my-dropdown',
  templateUrl: './my-dropdown.component.html',
  styleUrls: ['./my-dropdown.component.css']
})
export class MyDropdownComponent implements OnInit {

	code: string;
	name: string;

  	constructor(public dialog: MatDialog) { }

  	ngOnInit() {
	  }
	  
	openDialog(): void {
		const dialogRef = this.dialog.open(MyDropdownDialogComponent, {
		  width: '250px',
		  data: {name: this.name, code: this.code}
		});
	
		dialogRef.afterClosed().subscribe(result => {
		  console.log('The dialog was closed');
		  this.code = result;
		});
	}

}
