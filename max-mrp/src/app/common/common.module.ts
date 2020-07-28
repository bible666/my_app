import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HeaderComponent } from './header/header.component';
import { ShowMessageComponent } from './show-message/show-message.component';
import { ItemQtyComponent } from './item-qty/item-qty.component';


@NgModule({
  declarations: [
    HeaderComponent,
    ShowMessageComponent,
    ItemQtyComponent
  ],
  imports: [
    CommonModule ,
    MatAutocompleteModule,
    FormsModule, ReactiveFormsModule,
  ],
  exports: [
    HeaderComponent,
    ShowMessageComponent
  ],
  providers: [
  
  ],

})
export class SharedCommonModule { }
