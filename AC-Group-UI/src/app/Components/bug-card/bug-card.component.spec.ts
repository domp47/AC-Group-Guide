import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BugCardComponent } from './bug-card.component';

describe('BugCardComponent', () => {
  let component: BugCardComponent;
  let fixture: ComponentFixture<BugCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BugCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BugCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
