import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import {
  MatDialogModule,
  MatButtonModule,
  MatProgressSpinnerModule
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
    TemplateEditComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule, ReactiveFormsModule, BrowserAnimationsModule,
    MatDialogModule, MatButtonModule, MatProgressSpinnerModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  entryComponents:[ConfirmDialogComponent]
})
export class AppModule { }
