//
//  SceneDelegate.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 01/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    // O appDelegate é responsável pelo ciclo de vida e configuração do aplicativo.
    
    // O SceneDelegate é responsável pelo que é mostrada na tela, e com ele nos podemos manipular e gerenciar a forma como o aplicativo é exibido.
    
    //Este método irá criar uma nova UiWindow, e definir o controlador de visualização raiz(root) e tornar a window a janela principal a ser exibida.
    
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene) // Aqui estou criando nossa View.
        let vc:LoginVC = LoginVC() //Aqui estou criando nossa ViewController
        let navVC = UINavigationController(rootViewController: vc) // Aqui eu estou passando para nossa window que quem será nossa janela raiz será nossa propría VC.
        window.rootViewController = navVC
        window.makeKeyAndVisible() // Usado para avisar para o sistema que essa Window é para ser exibida.
        self.window = window // aqui eu referencio a windo a window lá em cima.
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

