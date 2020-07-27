import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StockRoutingModule } from './stock-routing.module';
import { TransferComponent } from './transfer/transfer.component';


@NgModule({
  declarations: [TransferComponent],
  imports: [
    CommonModule,
    StockRoutingModule
  ]
})
export class StockModule { }
