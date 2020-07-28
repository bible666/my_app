import { Component, OnInit ,Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { TransferService } from '../../service/transfer.service';
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';
import { LoadingService } from '../../service/loading.service';

export interface DialogData {
  factory_code:       string;
  location_code:      string;
  item_code:          string;
  lot_no:             string;
  first_receive_date: Date;
  quantity:           number;
}

@Component({
  selector: 'app-item-qty',
  templateUrl: './item-qty.component.html',
  styleUrls: ['./item-qty.component.css']
})
export class ItemQtyComponent implements OnInit {

  inputForm = new FormGroup({
    'item_code'            : new FormControl(this.data.item_code, [ Validators.required ]),
    'lot_no'               : new FormControl(this.data.lot_no, [ Validators.required ]),
    'first_receive_date'   : new FormControl(this.data.first_receive_date, [ Validators.required ]),
    'quantity'             : new FormControl(this.data.quantity, [ Validators.required ]),
  });

  constructor(
    public dialogRef: MatDialogRef<ItemQtyComponent>,
    private Service: TransferService,
    private loading: LoadingService,
    @Inject(MAT_DIALOG_DATA) public data: DialogData)
  {

  }

  onSave(){
    if (this.inputForm.valid){
      // let holiday: Date = new Date(this.inputForm.controls['holiday_date'].value);
      // this.inputForm.patchValue({

      //   'show_date'    : holiday.getDate() + '/' + (holiday.getMonth()+1) + '/' + holiday.getFullYear()

      // });

      // this.dialogRef.close(this.inputForm.value);
    }
    
  }

  ngOnInit() {

    this.Service.getItemList(this.data.factory_code,this.data.location_code)
    .pipe(
      tap(()         =>{this.loading.show();}),
      finalize(()    =>{this.loading.hide();})
    )
    .subscribe(data=>{
      console.log(data);
      //if (data['status']== 'success'){
        
      //} 
    },
    error=>{
      //this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
      //this.message = this.ServiceMessage.getMessage();
      console.log(error.message);
    });
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}

