import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FossilCardComponent } from './fossil-card.component';

describe('FossilCardComponent', () => {
  let component: FossilCardComponent;
  let fixture: ComponentFixture<FossilCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FossilCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FossilCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
