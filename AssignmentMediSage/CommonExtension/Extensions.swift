//
//  Extensions.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import UIKit


extension UITableView {
func setEmptyView(title: String, message: String) {
let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
let titleLabel = UILabel()
let messageLabel = UILabel()
titleLabel.translatesAutoresizingMaskIntoConstraints = false
messageLabel.translatesAutoresizingMaskIntoConstraints = false
titleLabel.textColor = UIColor.black
titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
messageLabel.textColor = UIColor.lightGray
messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
emptyView.addSubview(titleLabel)
emptyView.addSubview(messageLabel)
titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
titleLabel.text = title
messageLabel.text = message
messageLabel.numberOfLines = 0
messageLabel.textAlignment = .center
// The only tricky part is here:
self.backgroundView = emptyView
self.separatorStyle = .none
}
func restore() {
    _ = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
self.backgroundView = nil
self.separatorStyle = .singleLine
}
    
}
var vSpinner : UIView?
var ai = UIActivityIndicatorView.init(style: .large)
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            ai.stopAnimating()
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
     func showInternetAlert(onView : UIView, message: String) {
       let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
          // your code with delay
          alert.dismiss(animated: true, completion: nil)
        }
    }
    
    func displayalert(message: String){
           DispatchQueue.main.async {
               let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
               alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alertAction) -> Void in
               }))
             self.present(alertView, animated: true, completion: nil)
        }
    }
    func getDate(sDate : String) -> Date{
        let dateFormatter = DateFormatter() // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:sDate)!
        return date
    }
    
}
extension String {
    func validateEmailId() -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
           return applyPredicateOnRegex(regexStr: emailRegEx)
       }
       
       func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
           var passRegEx = ""
           if mini >= max{
               passRegEx = "^[A-Za-z\\d]{\(mini),}$"
           }else{
               passRegEx = "^[A-Za-z\\d]{\(mini),\(max)}$"
           }
           return applyPredicateOnRegex(regexStr: passRegEx)
       }
       
       func applyPredicateOnRegex(regexStr: String) -> Bool{
           let trimmedString = self.trimmingCharacters(in: .whitespaces)
           let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
           let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
           return isValidateOtherString
       }
}

