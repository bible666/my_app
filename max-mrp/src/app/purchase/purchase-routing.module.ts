import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SupplierListComponent } from './supplier/supplier-list/supplier-list.component';
import { AuthGuard } from '../service/auth.guard';

const routes: Routes = [
  { path: 'supplier/list',               component:SupplierListComponent,canActivate:[AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PurchaseRoutingModule { }
