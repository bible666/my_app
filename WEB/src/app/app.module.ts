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
import { HttpClientModule } from '@angular/common/http';

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
  ],
  providers: [AuthGuard,LoadingService,UserService],
  bootstrap: [AppComponent],
  entryComponents:[MyMessageComponent, ShowDialogComponent]
})
export class AppModule { }
