//
//  BaseViewController.swift
//  board.ios
//
//  Created by DETION on 2022/06/18.
//

import UIKit

class BaseViewController: UIViewController{
    func setIndicator(){
        
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height-100, width: self.view.frame.size.width/2, height: 35))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont.systemFont(ofSize: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 15;
        toastLabel.clipsToBounds  =  true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.6, delay: 1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
    
    func showIndicator(_ time:Int = 0){
        
        let indicatorView = UIView(frame: self.view.frame)
        
        indicatorView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        indicatorView.alpha = 1.0

        self.view.addSubview(indicatorView)
        
    }
    
    func showAlert(_ title:String="", message: String, completion: @escaping ()-> Void){
        let sheet = UIAlertController(title: title, message: message, preferredStyle: .alert)

        sheet.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in completion() }))

        present(sheet, animated: true)
    }
}


extension BaseViewController{
    
    var signIn: SignInViewController{
        get{
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "signIn") as? SignInViewController)!
            return vc
        }
    }
    var signUp: SignUpViewController{
        get{
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "signUp") as? SignUpViewController)!
            return vc
        }
    }
    
    
}
