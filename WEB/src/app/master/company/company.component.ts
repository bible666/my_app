import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-company',
  templateUrl: './company.component.html',
  styleUrls: ['./company.component.css']
})
export class CompanyComponent implements OnInit {

  companyForm:FormGroup;

  constructor() { }

  ngOnInit() {
    this.companyForm = new FormGroup({
      'company_code': new FormControl('10220'),
      'company_name': new FormControl(null),
      'company_add1': new FormControl(null),
      'company_add2': new FormControl(null),
      'company_add3': new FormControl(null),
      'company_zip': new FormControl(null),
      'company_tel': new FormControl(null),
      'company_fax': new FormControl(null),
      'company_email': new FormControl(null),
      'company_remark': new FormControl(null),
      'tax_no': new FormControl(null)
    });
  }

  getFontSize() {
    return Math.max(10, 18);
  }

}
