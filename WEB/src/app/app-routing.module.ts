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
import { StaffListComponent } from './master/staff/staff-list/staff-list.component';
import { StaffInputComponent } from './master/staff/staff-input/staff-input.component';
import { SupplierListComponent } from './master/supplier/supplier-list/supplier-list.component';
import { SupplierInputComponent } from './master/supplier/supplier-input/supplier-input.component';
import { PoListComponent } from './po/po-management/po-list/po-list.component';
import { PoInputComponent } from './po/po-management/po-input/po-input.component';
import { LogoutComponent } from './logout/logout.component';


const routes: Routes = [
	{ path: '' ,					component: HomeComponent ,canActivate:[AuthGuard]},
	{ path: 'about' , 				component: AboutComponent },
	{ path: 'contact' , 			component: ContactComponent },
	{ path: 'table', 				component: ShowTableComponent},
	{ path: 'company',				component: CompanyComponent,canActivate:[AuthGuard]},
	{ path: 'login',				component: LoginComponent},
	{ path: 'item_list',			component: ItemListComponent, canActivate:[AuthGuard]},
	{ path: 'item_input/:id',		component: ItemEntryComponent,canActivate:[AuthGuard]},
	{ path: 'unit_list',			component: UnitListComponent,canActivate:[AuthGuard]},
	{ path: 'unit_input/:id',		component: UnitInputComponent,canActivate:[AuthGuard]},
	{ path: 'item_type_list',		component: ItemTypeListComponent,canActivate:[AuthGuard]},
	{ path: 'item_type_input/:id',	component: ItemTypeInputComponent,canActivate:[AuthGuard]},
	{ path: 'customer_list',		component: CustomerListComponent,canActivate:[AuthGuard]},
	{ path: 'customer_input/:id',	component: CustomerInputComponent,canActivate:[AuthGuard]},
	{ path: 'staff_list',			component: StaffListComponent,canActivate:[AuthGuard]},
	{ path: 'staff_input/:id',		component: StaffInputComponent,canActivate:[AuthGuard]},
	{ path: 'supplier_list',		component: SupplierListComponent,canActivate:[AuthGuard]},
	{ path: 'supplier_input/:id',	component: SupplierInputComponent,canActivate:[AuthGuard]},
	{ path: 'po_list',				component: PoListComponent,canActivate:[AuthGuard]},
	{ path: 'po_input/:id',			component: PoInputComponent,canActivate:[AuthGuard]},
	{ path: 'logout',				component: LogoutComponent}

];

@NgModule({
	imports: [RouterModule.forRoot(routes)],
	exports: [RouterModule]
})
export class AppRoutingModule { }
