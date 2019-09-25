import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PoInputComponent } from './po-input.component';

describe('PoInputComponent', () => {
  let component: PoInputComponent;
  let fixture: ComponentFixture<PoInputComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PoInputComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PoInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
