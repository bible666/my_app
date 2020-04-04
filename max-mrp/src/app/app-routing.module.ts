import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from './service/auth.guard';

import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';
import { MasterMenuComponent } from './menu/master-menu/master-menu.component';
import { SupplierListComponent } from './master/supplier/supplier-list/supplier-list.component';
import { SupplierEditComponent } from './master/supplier/supplier-edit/supplier-edit.component';
import { CurrencyListComponent } from './master/currency/currency-list/currency-list.component';
import { CurrencyEditComponent } from './master/currency/currency-edit/currency-edit.component';


const routes: Routes = [
  { path: '' ,                  component: MainMenuComponent ,canActivate:[AuthGuard]},
  { path: 'login',              component:LoginComponent},
  { path: 'logout',             component:LogoutComponent},
  { path: 'main-menu',          component:MainMenuComponent,canActivate:[AuthGuard]},
  { path: 'master-menu',        component:MasterMenuComponent,canActivate:[AuthGuard]},
  { path: 'template/list',      component:TemplateListComponent,canActivate:[AuthGuard]},
  { path: 'template/edit/:id',  component:TemplateEditComponent,canActivate:[AuthGuard]},
  { path: 'supplier/list',      component:SupplierListComponent},
  { path: 'supplier/edit/:id',  component:SupplierEditComponent},
  { path: 'currency/list',      component:CurrencyListComponent},
  { path: 'currency/edit/:id',  component:CurrencyEditComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
