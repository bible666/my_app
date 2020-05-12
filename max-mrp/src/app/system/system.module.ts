import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedCommonModule } from '../common/common.module'
import { SharedTemplateModule } from '../template/template.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatFormFieldModule } from '@angular/material';
import { MatInputModule } from '@angular/material/input';

import { SystemRoutingModule } from './system-routing.module';
import { UnitListComponent } from './unit-list/unit-list.component';
import { UnitEditComponent } from './unit-edit/unit-edit.component';
import { ItemListComponent } from './item-list/item-list.component';
import { ItemEditComponent } from './item-edit/item-edit.component';
import { SupplierListComponent } from './supplier-list/supplier-list.component';
import { SupplierEditComponent } from './supplier-edit/supplier-edit.component';


@NgModule({
  declarations: [
    UnitListComponent, UnitEditComponent, 
    ItemListComponent, ItemEditComponent, 
    SupplierListComponent, SupplierEditComponent
  ],
  imports: [
    CommonModule,
    SystemRoutingModule,
    SharedCommonModule,
    SharedTemplateModule,
    FormsModule, ReactiveFormsModule,
    MatCheckboxModule,
    MatFormFieldModule, 
    MatInputModule
  ]
})
export class SystemModule { }
