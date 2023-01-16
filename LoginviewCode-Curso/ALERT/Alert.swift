//
//  Alert.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 20/12/22.
//

import Foundation
import UIKit

class Alert:NSObject {
    
    var controller:UIViewController
    
     init(controller:UIViewController) {
        self.controller = controller
    }
    
    func getAlert(titulo:String,mensagem:String,completion:(() -> Void)?  = nil) {
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert) //.actionSheet seria o alerta embaixo da tela e o alert seria o CENTRALIZADO
        let cancelar = UIAlertAction(title: "Ok", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
    
    
    
    
}
