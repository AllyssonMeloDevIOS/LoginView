//
//  RegisterVC.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 08/12/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    var registerScreen:RegisterScreen?
    
    var auth:Auth?
    var alert:Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        
        // Do any additional setup after loading the view.
    }

}


extension RegisterVC:UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC:RegisterScreenProtocol{
    func actionBackButton() {
//        print("Back Button!!")
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else {return}
        
//        let email:String = register.getemail()
//        let password:String = register.getPassowrd()
        
        self.auth?.createUser(withEmail: register.getemail(), password: register.getPassowrd(), completion: { (result, error) in
             
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Error ao cadastrar, verifique os dados e tente novamente!!!!")
//                print("Error ao cadastrar!!")
            }else{
                self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuário cadastrado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
//                print("Sucesso ao cadastrar!!")
            }
        
        })
    }
    
    
    
    
}
