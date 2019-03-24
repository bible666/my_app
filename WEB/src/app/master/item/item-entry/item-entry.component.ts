import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';

@Component({
  selector: 'app-item-entry',
  templateUrl: './item-entry.component.html',
  styleUrls: ['./item-entry.component.css']
})
export class ItemEntryComponent implements OnInit {

    itemForm:FormGroup;

    itemCode:string;
    itemName:string;

    constructor() { }

    ngOnInit() {
        this.itemForm = new FormGroup({
            'item_code': new FormControl(this.itemCode),
            'item_name': new FormControl(this.itemName),
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

}
