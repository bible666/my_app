import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import {
  MatDialogModule,
  MatButtonModule,
  MatProgressSpinnerModule,
  MatDatepickerModule,
  MatNativeDateModule
} from '@angular/material';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { LogoutComponent } from './logout/logout.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ShowMessageComponent } from './common/show-message/show-message.component';
import { MainMenuComponent } from './menu/main-menu/main-menu.component';
import { TemplateListComponent } from './template/template-list/template-list.component';
import { PaginatorComponent } from './template/paginator/paginator.component';
import { HeaderComponent } from './common/header/header.component';
import { ConfirmDialogComponent } from './common/confirm-dialog/confirm-dialog.component';
import { TemplateEditComponent } from './template/template-edit/template-edit.component';
import { MasterMenuComponent } from './menu/master-menu/master-menu.component';
import { SupplierListComponent } from './master/supplier/supplier-list/supplier-list.component';
import { SupplierEditComponent } from './master/supplier/supplier-edit/supplier-edit.component';
import { CurrencyEditComponent } from './master/currency/currency-edit/currency-edit.component';
import { CurrencyListComponent } from './master/currency/currency-list/currency-list.component';
import { BasicMasterComponent } from './menu/basic-master/basic-master.component';
import { TransactionMasterComponent } from './menu/transaction-master/transaction-master.component';
import { AdminMasterComponent } from './menu/admin-master/admin-master.component';
import { CalendarEditComponent } from './master/calendar/calendar-edit/calendar-edit.component';
import { CalendarListComponent } from './master/calendar/calendar-list/calendar-list.component';
import { CalendarDialogComponent } from './common/calendar-dialog/calendar-dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    LogoutComponent,
    MainMenuComponent,
    ShowMessageComponent,
    TemplateListComponent,
    PaginatorComponent,
    HeaderComponent,
    ConfirmDialogComponent,
    TemplateEditComponent,
    MasterMenuComponent,
    SupplierListComponent,
    SupplierEditComponent,
    CurrencyEditComponent,
    CurrencyListComponent,
    BasicMasterComponent,
    TransactionMasterComponent,
    AdminMasterComponent,
    CalendarEditComponent,
    CalendarListComponent,
    CalendarDialogComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule, ReactiveFormsModule, BrowserAnimationsModule,
    MatDialogModule, MatButtonModule, MatProgressSpinnerModule,MatDatepickerModule,
    MatNativeDateModule
  ],
  providers: [{provide: LOCALE_ID, useValue: "th-TH"}],
  bootstrap: [AppComponent],
  entryComponents:[ConfirmDialogComponent]
})
export class AppModule { }
