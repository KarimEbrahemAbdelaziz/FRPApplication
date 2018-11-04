//
//  LoginViewModel.swift
//  FRPApplication
//
//  Created by Karim Ebrahem on 11/4/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var isValid : Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()){              usernameString, passwordString in
            return usernameString.count >= 4 && passwordString.count >= 4
        }
    }
}
