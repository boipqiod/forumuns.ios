//
//  SignUp.swift
//  board.ios
//
//  Created by 공상헌 on 2022/07/08.
//

import Foundation

class SignUpImlp: SignUpContract.Presenter{
    
    var view: SignUpContract.View?
    
    func requestSignUp(email: String, password: String, name: String, nickName: String, _ completion: @escaping (Bool) -> Void) {
        
        API.share.requestSignUp(email: email, password: password, name: name, nickName: nickName) { (response: SignUpResponse) in
        completion(response.responseCode == 200)
        }
    }
    
    func checkEmail(email: String, _ completion: @escaping (Bool) -> Void) {
        API.share.checkEamil(email: email) { (response:BaseResponse) in
            completion(response.responseCode == 200)
        }
    }
    
    func checkNickName(nickName: String, _ completion: @escaping (Bool) -> Void) {
        API.share.checkNickName(nickName: nickName) { (response:BaseResponse) in
            completion(response.responseCode == 200)
        }
    }
    
}

extension SignUpImlp{
    static func setView(_ view: BaseView) {
        let presenter = SignUpImlp()
        presenter.view = view as? SignUpContract.View
        view.setPresenter(presenter)
    }
}
