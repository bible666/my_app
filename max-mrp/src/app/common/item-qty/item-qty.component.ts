// import { Component, OnInit ,Inject } from '@angular/core';
// import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
// import { FormControl, FormGroup, Validators } from '@angular/forms';
// import { TransferService } from '../../service/transfer.service';
// import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';
// import { LoadingService } from '../../service/loading.service';
// import { Observable } from 'rxjs';

import { Component, OnInit ,Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';

export interface DialogData {
  location_code:      string;
  item_code:          string;
  lot_no:             string;
  first_receive_date: Date;
  quantity:           number;
}

export interface cItem {
  item_code: string;
  item_name: string;
}

@Component({
  selector: 'app-item-qty',
  templateUrl: './item-qty.component.html',
  styleUrls: ['./item-qty.component.css']
})
export class ItemQtyComponent implements OnInit {

  isLoading = false;

  // filteredOptions:  Observable<cItem[]>;
  // filteredItem:     cItem[] = [];

  inputForm = new FormGroup({
    'item_code'            : new FormControl('kkkkk', [ Validators.required ]),
    // 'lot_no'               : new FormControl(this.data.lot_no, [ Validators.required ]),
    // 'first_receive_date'   : new FormControl(this.data.first_receive_date, [ Validators.required ]),
    // 'quantity'             : new FormControl(this.data.quantity, [ Validators.required ]),
  });

  constructor(
    public dialogRef: MatDialogRef<ItemQtyComponent>,
    // private Service: TransferService,
    // private loading: LoadingService,
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

    // this.Service.getItemList(this.data.location_code,'')
    // .pipe(
    //   tap(()         =>{this.loading.show();}),
    //   finalize(()    =>{this.loading.hide();})
    // )
    // .subscribe(data=>{
    //   if (data['status']== 'success'){
    //     this.filteredItem   = data['data'];
    //   } 
    // },
    // error=>{
    //   //this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
    //   //this.message = this.ServiceMessage.getMessage();
    //   //console.log(error.message);
    // });

    // //test auto complete
    // this.inputForm.get("item_code").valueChanges
    // .pipe(
    //   debounceTime(300), //if keypress interval is less then call service
    //   tap(() => {
    //     //before service start
    //     this.isLoading    = true;
    //     this.filteredItem = [];
    //   }),
    //   switchMap(value => this.Service.getItemList(this.data.location_code,value)
    //   .pipe(
    //     finalize(() => {
    //         //after service end
    //         this.isLoading = false
    //       })
    //     )
    //   )
    // )
    // .subscribe(unit =>{
    //   console.log('hi');
    //   this.filteredItem = unit['data'];
    // });
  }

  onNoClick(): void {
    console.log(this.inputForm.value);
    //this.dialogRef.close();
  }

  // displayFn(value:string){
  //   if (value && this.filteredItem.length > 0 ) 
  //   {
  //     return this.filteredItem.find(x => x.item_code == value).item_name;
  //   } else {
  //     return '';
  //   }

   
  // }

  // onBlurItemCode(){
  //   let item_code:      string = '';
  //   let old_item_code:  string = this.inputForm.get("item_code").value;
  //   // this.Service.getItemList(old_item_code)
  //   // .pipe(
  //   //   tap(()=>{this.loading.show();}),
  //   //   finalize(()=>{this.loading.hide();})
  //   // )
  //   // .subscribe(data=>{
  //   //   if (data['status']== 'success'){
  //   //     item_code = data['data'];
  //   //   } 
      
  //   //   if (old_item_code != item_code){
  //   //     this.inputForm.patchValue({
  //   //       'item_code'             : item_code
  //   //     });
  //   //   }
  //   // });
  // }
}

