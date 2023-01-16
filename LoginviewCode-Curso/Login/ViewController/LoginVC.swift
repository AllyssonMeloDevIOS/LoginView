//
//  ViewController.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 01/12/22.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var auth:Auth?
    var loginScreen:LoginScreen?
    var alert:Alert?
    
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen // Aqui a gente está criando uma tela e referenciando ela a LoginScreen.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        //self.view.backgroundColor = .red Geralmente a gente pode usar esse código primeiramente para ver se as nossas configs passadas em SceneDelegate estão OK.
        self.loginScreen?.configTextFieldDelegate(delegate: self) // Aqui a gente passa que a viewcontroller vai mexer nela agora.
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false) // Método usado para esconder a barra de navegação
    }


}

extension LoginVC:LoginScreenProtocol{
    
    func actionLoginButton() {
       
        let vc:HomeVC = HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        guard let login = self.loginScreen else {return}
//
//        self.auth?.signIn(withEmail: login.getemail(), password: login.getPassowrd(), completion: {(usuario,error) in
//
//        if error != nil{
//            self.alert?.getAlert(titulo: "Atenção", mensagem: "Atenção Dados Incorretos, verifique e tente novamente!!")
////            print("Atenção Dados Incorretos, verifique e tente novamente!!")
//        }else{
//
//            if usuario == nil{
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
////                print("Tivemos um problema inesperado, tente novamente mais tarde")
//            }else{
//                self.alert?.getAlert(titulo: "Atenção", mensagem: "Parabéns, usuario logado com sucesso!!!!")
////                print("Parabéns, usuario logado com sucesso!!!!")
//            }
//        }
//
//        })
        
    }
    
    func actionRegisterButton() {
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionForgetPasswordButton() {
        print("Deu Certo ForgetPassowrd Button!!")
    }
    
}

extension LoginVC:UITextFieldDelegate { // Extensão do meu código. para fácil manuntenção e organização do código.
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    
}
