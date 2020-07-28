import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MessageService, MessageClass } from '../../service/message.service';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmDialogComponent } from '../../common/confirm-dialog/confirm-dialog.component'
import { LoadingService } from '../../service/loading.service';
import { ItemQtyComponent } from '../../common/item-qty/item-qty.component';
import {switchMap,debounceTime, tap, finalize,map} from 'rxjs/operators';

import { TransferService } from '../../service/transfer.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-transfer',
  templateUrl: './transfer.component.html',
  styleUrls: ['./transfer.component.css']
})
export class TransferComponent implements OnInit {

  public message:       MessageClass[]  = [];
  public ar_location:   any[]           = [];
  

  inputForm = new FormGroup({
    'location_from'     : new FormControl(''),
    'location_to'     : new FormControl(''),
  });

  constructor(
    public dialog: MatDialog,
    private messageService: MessageService,
    private service: TransferService,
    private loading: LoadingService
  ) { }

  ngOnInit(): void {
    window.scroll(0,0);
    this.service.getLocation()
    .pipe(
      tap(()         =>{this.loading.show();}),
      finalize(()    =>{this.loading.hide();})
    )
    .subscribe(data=>{
      
      if (data['status']== 'success'){
        this.ar_location = data['data'];
      } 
    },
    error=>{
      //this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
      //this.message = this.ServiceMessage.getMessage();
      console.log(error.message);
    });
  }

  onAdd() {

    const dialogRef = this.dialog.open(ItemQtyComponent,{
      width: '500px',
      height: '300px',
      data: {location_code:this.inputForm.value['location_from']}
    })
    
    dialogRef.afterClosed().subscribe(result=>{
      if (!result){
        //cancel delete data
        //alert('hiii');
      } else {
        //let holiday = new FormGroup({
        //  'holiday_date'        : new FormControl(result.holiday_date, [ Validators.required, Validators.maxLength(10) ]),
        //  'holiday_name'        : new FormControl(result.holiday_text, [ Validators.required, Validators.maxLength(50) ]),
        //  'show_date'           : new FormControl(result.show_date)
        //});

        //this.holidayForms.push(holiday);
        
      }
    });
    
    
  }

}

export class cLocation{
  public user_id:           number;
  public user_group_id:     number;
  public department_code:   string;
  public factory_code:      string;
  public location_code:     string;
}
