import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { AuthGuard } from './auth.guard';
import { ShowTableComponent } from './show-table/show-table.component';
import { CompanyComponent } from './master/company/company.component';
import { LoginComponent } from './login/login.component';
import { ItemListComponent } from './master/item/item-list/item-list.component';
import { ItemEntryComponent } from './master/item/item-entry/item-entry.component';
import { UnitListComponent } from './master/unit/unit-list/unit-list.component';
import { UnitInputComponent } from './master/unit/unit-input/unit-input.component';
import { ItemTypeListComponent } from './master/item-type/item-type-list/item-type-list/item-type-list.component'
import { ItemTypeInputComponent } from './master/item-type/item-type-input/item-type-input/item-type-input.component'
import { CustomerListComponent } from './master/customer/customer-list/customer-list.component';
import { CustomerInputComponent } from './master/customer/customer-input/customer-input.component';


const routes: Routes = [
  { path: '' , component: HomeComponent ,canActivate:[AuthGuard]},
  { path: 'about' , component: AboutComponent },
  { path: 'contact' , component: ContactComponent },
  { path: 'table', component: ShowTableComponent},
  { path: 'company', component: CompanyComponent,canActivate:[AuthGuard]},
  { path: 'login', component: LoginComponent},
  { path: 'item_list', component: ItemListComponent, canActivate:[AuthGuard]},
  { path: 'item_input', component: ItemEntryComponent,canActivate:[AuthGuard]},
  { path: 'unit_list', component: UnitListComponent,canActivate:[AuthGuard]},
  { path: 'unit_input/:id', component: UnitInputComponent,canActivate:[AuthGuard]},
  { path: 'item_type_list', component: ItemTypeListComponent,canActivate:[AuthGuard]},
  { path: 'item_type_input', component: ItemTypeInputComponent,canActivate:[AuthGuard]},
  { path: 'customer_list', component: CustomerListComponent,canActivate:[AuthGuard]},
  { path: 'customer_input', component: CustomerInputComponent,canActivate:[AuthGuard]}
  


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
