import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SystemRoutingModule } from './system-routing.module';
import { UnitListComponent } from './unit-list/unit-list.component';
import { UnitEditComponent } from './unit-edit/unit-edit.component';


@NgModule({
  declarations: [UnitListComponent, UnitEditComponent],
  imports: [
    CommonModule,
    SystemRoutingModule
  ]
})
export class SystemModule { }
