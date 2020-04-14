import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';
import { MasterMenuComponent } from './menu/master-menu/master-menu.component';
import { BasicMasterComponent } from './menu/basic-master/basic-master.component';
import { TransactionMasterComponent } from './menu/transaction-master/transaction-master.component';
import { AdminMasterComponent } from './menu/admin-master/admin-master.component';
import { SupplierListComponent } from './master/supplier/supplier-list/supplier-list.component';
import { SupplierEditComponent } from './master/supplier/supplier-edit/supplier-edit.component';
import { CurrencyListComponent } from './master/currency/currency-list/currency-list.component';
import { CurrencyEditComponent } from './master/currency/currency-edit/currency-edit.component';
import { CalendarListComponent } from './master/calendar/calendar-list/calendar-list.component';
import { CalendarEditComponent } from './master/calendar/calendar-edit/calendar-edit.component';
import { CompanyEditComponent } from './master/company/company-edit/company-edit.component';
import { CompanyListComponent } from './master/company/company-list/company-list.component';


const routes: Routes = [
  { path: '' ,                          component: MainMenuComponent ,canActivate:[AuthGuard]},
  { path: 'login',                      component:LoginComponent},
  { path: 'logout',                     component:LogoutComponent},
  { path: 'main-menu',                  component:MainMenuComponent,canActivate:[AuthGuard]},
  { path: 'master-menu',                component:MasterMenuComponent,canActivate:[AuthGuard]},
  { path: 'basic-master-menu',          component:BasicMasterComponent,canActivate:[AuthGuard]},
  { path: 'transaction-master-menu',    component:TransactionMasterComponent,canActivate:[AuthGuard]},
  { path: 'admin-master-menu',          component:AdminMasterComponent,canActivate:[AuthGuard]},
  { path: 'template/list',              component:TemplateListComponent,canActivate:[AuthGuard]},
  { path: 'template/edit/:id',          component:TemplateEditComponent,canActivate:[AuthGuard]},
  { path: 'supplier/list',              component:SupplierListComponent,canActivate:[AuthGuard]},
  { path: 'supplier/edit/:id',          component:SupplierEditComponent,canActivate:[AuthGuard]},
  { path: 'currency/list',              component:CurrencyListComponent,canActivate:[AuthGuard]},
  { path: 'currency/edit/:id',          component:CurrencyEditComponent,canActivate:[AuthGuard]},
  { path: 'calendar/list',              component:CalendarListComponent,canActivate:[AuthGuard]},
  { path: 'calendar/edit/:id',          component:CalendarEditComponent,canActivate:[AuthGuard]},
  { path: 'company/list',               component:CompanyListComponent,canActivate:[AuthGuard]},
  { path: 'company/edit/:id',           component:CompanyEditComponent,canActivate:[AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
