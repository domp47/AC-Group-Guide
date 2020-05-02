import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MissingCardComponent } from './missing-card.component';

describe('MissingCardComponent', () => {
  let component: MissingCardComponent;
  let fixture: ComponentFixture<MissingCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MissingCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MissingCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
