//
//  Utility.swift
//  Authentications
//
//  Created by Akash Belekar on 02/05/23.

import Foundation
import UIKit

public class Utility {
    
    //MARK: Singletone
    static public let shared = Utility()
    
    
     public func showAlter(title:String,msg:String,action:String,viewController:UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: action, style: .default,handler:{ _ in
            
        })
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
    
    public func showAltersActions(title:String, msg:String, firstAction:String, secondAction:String, firstComplition:@escaping () -> Void,secondComplition:@escaping () -> Void, viewController: UIViewController){
        
        let alter = UIAlertController(title: title, message: msg, preferredStyle: .alert)
       
        let ok = UIAlertAction(title: firstAction, style: .default, handler: { _ in
            print("Ok")
            
            firstComplition()
        })
        
        let cancle = UIAlertAction(title: secondAction, style: .cancel,handler: { _ in
            print("Cancle")
            secondComplition()
        })
       
        alter.addAction(ok)
        alter.addAction(cancle)
       
        DispatchQueue.main.async(execute: {
            viewController.present(alter, animated: true)
        })
    }
    
    //MARK: EmailValidations
    public func isValideEmail(email EnterEmail:String) -> Bool{
        let emailReg = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: EnterEmail)
    }
    
    //MARK: PasswordValidations
    public func isPasswordValide(password EnterPassword:String) -> Bool {
        let passwordReg = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordReg)
        return passwordTest.evaluate(with: EnterPassword)
    }
    
    //MARK: UsernameValidations
    public  func isValidateUsername(username EnterUsername: String) -> Bool {
        let usernameRegex = "^[a-zA-Z0-9._-]{4,}$"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernameTest.evaluate(with: EnterUsername)
    }
    
    //MARK: PhoneValidations
    public func isPhoneValide(phone EnterPhone:String) -> Bool{
        let phoneNumber = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumber)
        return phoneTest.evaluate(with: EnterPhone)
    }
}



