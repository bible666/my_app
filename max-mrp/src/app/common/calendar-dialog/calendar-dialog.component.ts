import { Component, OnInit ,Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';
import { FormControl, FormGroup, Validators } from '@angular/forms';

export interface DialogData {
  id: number;
  holiday_date: string;
  holiday_text: string;
}


@Component({
  selector: 'app-calendar-dialog',
  templateUrl: './calendar-dialog.component.html',
  styleUrls: ['./calendar-dialog.component.css']
})
export class CalendarDialogComponent implements OnInit {

  inputForm = new FormGroup({
    'holiday_date'       : new FormControl('2020-05-14', [ Validators.required, Validators.maxLength(10) ]),
    'holiday_text'       : new FormControl('', [ Validators.required, Validators.maxLength(50) ])
  });

  constructor(
    public dialogRef: MatDialogRef<CalendarDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData)
  {

  }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

