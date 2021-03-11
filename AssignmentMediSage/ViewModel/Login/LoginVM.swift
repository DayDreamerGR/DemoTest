//
//  LoginVM.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import Alamofire

struct LoginVM{
    func VerifyCredentials(uname: String,pass: String,completionHandler : @escaping (Bool,String) -> ()){
        if Connectivity.isConnectedToInternet(){
            if uname == "" || pass == ""{
                completionHandler(false, "Enter Email/Password!")
            }
            else{
                if !uname.validateEmailId(){
                    completionHandler(false, "Enter Valid Email Id!")
                }
                else if !pass.validatePassword(mini: 8, max: 15){
                    completionHandler(false, "Enter Valid Password! Password should between 8 - 15 Characters!")
                }
                else{
                    completionHandler(true,"Verified")
                }
            }
        }
        else{
            completionHandler(true, "No Internet Connection!")
        }
    }
    
}
