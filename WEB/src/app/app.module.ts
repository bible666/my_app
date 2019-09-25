import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavComponent } from './nav/nav.component';
import { MynavComponent } from './test/mynav/mynav.component';
import { AboutComponent } from './about/about.component';
import { HomeComponent } from './home/home.component';
import { ContactComponent } from './contact/contact.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule, HttpClient } from '@angular/common/http';

// import ngx-translate
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';

import { AuthGuard } from './auth.guard';

import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {
  MatAutocompleteModule,
  MatBadgeModule,
  MatBottomSheetModule,
  MatButtonModule,
  MatButtonToggleModule,
  MatCardModule,
  MatCheckboxModule,
  MatChipsModule,
  MatDatepickerModule,
  MatDialogModule,
  MatDividerModule,
  MatExpansionModule,
  MatGridListModule,
  MatIconModule,
  MatInputModule,
  MatListModule,
  MatMenuModule,
  MatNativeDateModule,
  MatPaginatorModule,
  MatProgressBarModule,
  MatProgressSpinnerModule,
  MatRadioModule,
  MatRippleModule,
  MatSelectModule,
  MatSidenavModule,
  MatSliderModule,
  MatSlideToggleModule,
  MatSnackBarModule,
  MatSortModule,
  MatStepperModule,
  MatTableModule,
  MatTabsModule,
  MatToolbarModule,
  MatTooltipModule,
  MatTreeModule,
} from '@angular/material';
import { LoadingService } from './loading.service';
import { ShowTableComponent } from './show-table/show-table.component';
import { UserService } from './service/user.service';
import { CompanyComponent } from './master/company/company.component';
import { MainNavComponent } from './main-nav/main-nav.component';
import { LayoutModule } from '@angular/cdk/layout';
import { LoginComponent } from './login/login.component';
import { ItemListComponent } from './master/item/item-list/item-list.component';
import { ItemEntryComponent } from './master/item/item-entry/item-entry.component';
import { UnitListComponent } from './master/unit/unit-list/unit-list.component';
import { UnitInputComponent } from './master/unit/unit-input/unit-input.component';
import { OriginalListComponent } from './original/original-list/original-list.component';
import { MyMessageComponent } from './common/my-message/my-message.component';
import { ShowDialogComponent } from './common/show-dialog/show-dialog.component';
import { ItemTypeListComponent } from './master/item-type/item-type-list/item-type-list/item-type-list.component';
import { ItemTypeInputComponent } from './master/item-type/item-type-input/item-type-input/item-type-input.component';
import { CustomerListComponent } from './master/customer/customer-list/customer-list.component';
import { CustomerInputComponent } from './master/customer/customer-input/customer-input.component';
import { MyDropdownComponent } from './common/my-dropdown/my-dropdown.component';
import { MyDropdownDialogComponent } from './common/my-dropdown-dialog/my-dropdown-dialog.component';
import { StaffListComponent } from './master/staff/staff-list/staff-list.component';
import { StaffInputComponent } from './master/staff/staff-input/staff-input.component';
import { SupplierListComponent } from './master/supplier/supplier-list/supplier-list.component';
import { SupplierInputComponent } from './master/supplier/supplier-input/supplier-input.component';
import { PoListComponent } from './po/po-management/po-list/po-list.component';
import { PoInputComponent } from './po/po-management/po-input/po-input.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    MynavComponent,
    AboutComponent,
    HomeComponent,
    ContactComponent,
    ShowTableComponent,
    CompanyComponent,
    MainNavComponent,
    LoginComponent,
    ItemListComponent,
    ItemEntryComponent,
    UnitListComponent,
    UnitInputComponent,
    OriginalListComponent,
    MyMessageComponent,
    ShowDialogComponent,
    ItemTypeListComponent,
    ItemTypeInputComponent,
    CustomerListComponent,
    CustomerInputComponent,
    MyDropdownComponent,
    MyDropdownDialogComponent,
    StaffListComponent,
    StaffInputComponent,
    SupplierListComponent,
    SupplierInputComponent,
    PoListComponent,
    PoInputComponent,
],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    FormsModule, ReactiveFormsModule,
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatStepperModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
	LayoutModule,
	// ngx-translate and loader module
	TranslateModule.forRoot({
		loader: {
			provide: TranslateLoader,
			useFactory: HttpLoaderFactory,
			deps: [HttpClient]
		}
	})
  ],
  providers: [AuthGuard,LoadingService,UserService],
  bootstrap: [AppComponent],
  entryComponents:[MyMessageComponent, ShowDialogComponent, MyDropdownDialogComponent]
})
export class AppModule { }

// required for AOT compilation
export function HttpLoaderFactory(http: HttpClient) {
    return new TranslateHttpLoader(http);
}