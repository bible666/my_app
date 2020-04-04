import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MessageService, MessageClass } from '../../../service/message.service';
import { CurrencyService, cSearch, cData } from '../../../service/currency.service';
import { MatDialog } from '@angular/material';
import { ConfirmDialogComponent } from '../../../common/confirm-dialog/confirm-dialog.component'

@Component({
  selector: 'app-supplier-list',
  templateUrl: './currency-list.component.html',
  styleUrls: ['./currency-list.component.css']
})
export class CurrencyListComponent implements OnInit {

  public message: MessageClass[] = [];

  public CountData      : number = 20;
  public CurrentPage    : number = 1;
  public AllPage        : number = 13;
  public gridDatas      : cData[] = [];
  public frmSearchData  : cSearch;

  inputForm = new FormGroup({
    'currency_code' : new FormControl(''),
    'description'   : new FormControl(''),
    'rowsPerpage'   : new FormControl('20')
  });

  constructor(
    private service: CurrencyService,
    public dialog: MatDialog,
    private messageService: MessageService
  ) {
    //set inital value when open form
    this.onInitValue();
  }

  ngOnInit() {
    this.message = this.messageService.getMessage();
    this.onSearch();
  }

  onInitValue(){
    this.inputForm.patchValue({
      'txt4'    : 'test4'
    });
  }

  onSearch(){
    //set current page to 1
    this.CurrentPage  = 1;

    //set form value to class search
    this.frmSearchData = new cSearch(this.inputForm.value);

    this.frmSearchData.page_index   = this.CurrentPage;
    this.frmSearchData.rowsPerpage  = this.inputForm.value.rowsPerpage;
    this.getData();
  }

  getData(){
    this.frmSearchData.page_index = this.CurrentPage;
    this.service.getListData(this.frmSearchData).subscribe(data => {
      console.log(data);
      if (data['status'] == 'success'){
        this.CountData    = data['max_rows'];
        this.AllPage      = Math.ceil(this.CountData / this.inputForm.value.rowsPerpage);
        this.gridDatas     = data['data'];
      }
      
    });
  }

  onClear(){
    this.onInitValue();
  }

  onSelectPage(PageNumber:number){
    this.CurrentPage = PageNumber;
    this.getData();
  }

  onDelete(id:number){
    const dialogRef = this.dialog.open(ConfirmDialogComponent,{
			width: '350px',
			height: '200px',
			data: {description: 'ต้องการ',id:id}
		})
		
		dialogRef.afterClosed().subscribe(result=>{
			if (!result){
				//cancel delete data
				//alert('hiii');
			} else {
				//console.log(result);
				//start delete data
				//sessionStorage.setItem( this.localNameInput + '.delete_id',result);
				// this.unitS.deleteById().subscribe(data =>{
				// 	if (data['status'] == 'success'){
				// 		this.snackBar.openFromComponent(MyMessageComponent,{
				// 			data:[this.texts['common.delete_complete']],
				// 			duration:5000,
				// 			panelClass:['mat-snack-bar-container-message']
				// 		})
				// 		this.ngOnInit();
				// 	} else {
				// 		console.log(data['message']);
				// 	}
        // });
        //alert('click ok');
			}
		});
  }

}
