import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SupplierListComponent } from './supplier/supplier-list/supplier-list.component';
import { AuthGuard } from '../service/auth.guard';
import { ItemListComponent } from './item-list/item-list.component';
import { ItemEditComponent } from './item-edit/item-edit.component';


const routes: Routes = [
  { path: 'supplier/list',               component:SupplierListComponent,canActivate:[AuthGuard]},
  { path: 'item/list',               component:SupplierListComponent,canActivate:[AuthGuard]},
  { path: 'item/edit/:item_code',               component:SupplierListComponent,canActivate:[AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PurchaseRoutingModule { }
