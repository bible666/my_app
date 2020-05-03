import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from '../service/auth.guard';

import { UnitListComponent } from './unit-list/unit-list.component';
import { UnitEditComponent } from './unit-edit/unit-edit.component';
import { ItemListComponent } from './item-list/item-list.component';
import { ItemEditComponent } from './item-edit/item-edit.component';

const routes: Routes = [
  { path: 'unit/list',                  component:UnitListComponent,canActivate:[AuthGuard]},
  { path: 'unit/edit/:unit_code',       component:UnitEditComponent,canActivate:[AuthGuard]},
  { path: 'item/list',                  component:ItemListComponent,canActivate:[AuthGuard]},
  { path: 'item/edit/:unit_code',       component:ItemEditComponent,canActivate:[AuthGuard]},
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SystemRoutingModule { }
