import { HttpRequest,
    HttpHandler,
    HttpEvent,
    HttpInterceptor,
    HttpHeaders,
    } from "@angular/common/http";
import { throwError as observableThrowError, Observable } from 'rxjs';
import { map, catchError, mergeMap } from "rxjs/operators";
import { environment } from 'src/environments/environment';
import { AuthService } from '../Services/auth.service';

export class HttpClientInterceptor implements HttpInterceptor {

    jwt: String;

    constructor(private authService: AuthService) { }

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        return this.authService.getJWT().pipe(
            mergeMap((jwt: String) => {
                if( jwt == null )
                    return observableThrowError("User is not Authenticated.");

                request = request.clone({
                    url: this.updateUrl(request.url),
                    headers: new HttpHeaders({
                        'Authorization': `${jwt}`,
                        'Content-Type': 'application/json; charset=utf-8',
                    })
                });
        
                return next.handle(request).pipe(
                    map((event: HttpEvent<any>) => {
                        return event;
                    }),
                    catchError(error => {
                        return observableThrowError(error);
                    })
                );       
            })
        );
    }

    private updateUrl(req: string): string { // update the url to the proper URL
        return environment.ApiBaseURL + req;
    }
}