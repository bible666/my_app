import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PurchaseRoutingModule } from './purchase-routing.module';
import { SupplierListComponent } from './supplier/supplier-list/supplier-list.component';
import { ItemListComponent } from './item-list/item-list.component';
import { ItemEditComponent } from './item-edit/item-edit.component';


@NgModule({
  declarations: [SupplierListComponent, ItemListComponent, ItemEditComponent],
  imports: [
    CommonModule,
    PurchaseRoutingModule
  ]
})
export class PurchaseModule { }
