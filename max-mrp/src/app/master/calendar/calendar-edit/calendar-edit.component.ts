import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators, FormArray } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { cInput, CarlendarService } from '../../../service/carlendar.service';
import { Router, ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material';
import { CalendarDialogComponent } from '../../../common/calendar-dialog/calendar-dialog.component';


@Component({
  selector: 'app-calendar-edit',
  templateUrl: './calendar-edit.component.html',
  styleUrls: ['./calendar-edit.component.css']
})
export class CalendarEditComponent implements OnInit {

  public message: MessageClass[] = [];
  submitted: boolean = false;

  //----------------------------------------------------------------
  // set local Valiable
  //----------------------------------------------------------------
  id      : string;
  
  inputForm = new FormGroup({
    'currency_code'       : new FormControl('', [ Validators.required, Validators.maxLength(10) ]),
    'currency_name'       : new FormControl('', [ Validators.required, Validators.maxLength(50) ]),
    'default_currency'    : new FormControl(false),
    'remark'              : new FormControl('', [ Validators.maxLength(200) ]),
    'holidays'             : new FormArray([])
  });
  
  constructor(private param: ActivatedRoute,
    private Service: CarlendarService,
    private ServiceMessage: MessageService,
    public dialog: MatDialog,
    private router: Router) { }

  ngOnInit() {
    this.id	= this.param.snapshot.params.id;

    if (this.id != '-1') {
      //get data from database
      this.Service.getDataById(this.id)
      .subscribe(data=>{
        
        if (data['status']== 'success'){
          console.log(data);
          let isDefault = true;
          if (data['data'].default_currency == 0){
            isDefault = false;
          }
          this.inputForm.patchValue({
            'currency_code'    : data['data'].currency_code,
            'currency_name'    : data['data'].currency_name,
            'default_currency' : isDefault,
            'remark'           : data['data'].remark
          });
        } else {
          this.ServiceMessage.setError(data['message']);
          this.message = this.ServiceMessage.getMessage();
        }
        
      },
        error=>{
          this.ServiceMessage.setError('เกิดข้อผิดพลาดไม่สามารถดึงข้อมูลได้');
          this.message = this.ServiceMessage.getMessage();
        });
      }
  }

  get holidayForms(){
    return this.inputForm.get('holidays') as FormArray
  }

  onAddHoliday(){
    const dialogRef = this.dialog.open(CalendarDialogComponent,{
			width: '500px',
			height: '300px',
			data: {description: 'คุณต้องการลบรายการนี้หรือเปล่ารหัส '}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
        console.log(result);
        let holiday = new FormGroup({
          'holiday_date'        : new FormControl(result.holiday_date, [ Validators.required, Validators.maxLength(10) ]),
          'holiday_name'        : new FormControl(result.holiday_text, [ Validators.required, Validators.maxLength(50) ]),
          'show_date'           : new FormControl(result.show_date)
        });

        this.holidayForms.push(holiday);
				
			}
		});
    

    
  }

  onDeleteHoliday(i){
    this.holidayForms.removeAt(i);
  }

  onEditHoliday(i){
    const dialogRef = this.dialog.open(CalendarDialogComponent,{
			width: '500px',
			height: '300px',
			data: {
        holiday_date:this.holidayForms.at(i).value.holiday_date,
        holiday_text:this.holidayForms.at(i).value.holiday_name
      }
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {

        this.holidayForms.at(i).patchValue({
          'holiday_date'        : result.holiday_date,
          'holiday_name'        : result.holiday_text,
          'show_date'           : result.show_date
        });
        
				
			}
		});
  }

  onSubmit(){
    this.submitted = true;
    if (this.inputForm.invalid){
      return;
    }

    let input_data	: cInput = new cInput(this.inputForm.value);
    input_data.id	= this.id;
    this.Service.updateById(input_data)
    .subscribe(data=>{

      if (data['status']== 'success'){
        this.ServiceMessage.setSuccess('บันทึกสำเร็จ');
        this.router.navigateByUrl('/currency/list');
			} else {
        this.ServiceMessage.setError(data['message']);
        this.message = this.ServiceMessage.getMessage();
      }
			
    },
    error=>{
      this.ServiceMessage.setError('บันทึกผิดพลาด');
      this.message = this.ServiceMessage.getMessage();
    });
  }

}

