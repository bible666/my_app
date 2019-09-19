import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SupplierInputComponent } from './supplier-input.component';

describe('SupplierInputComponent', () => {
  let component: SupplierInputComponent;
  let fixture: ComponentFixture<SupplierInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SupplierInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SupplierInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
