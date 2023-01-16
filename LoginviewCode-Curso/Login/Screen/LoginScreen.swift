//
//  LoginScreen.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 02/12/22.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
    func actionForgetPasswordButton()
}

class LoginScreen: UIView {
    
    private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Aqui eu passo que é para seguir minhas constraints e não a do sistema.
        label.textColor = .white // Aqui eu seto a cor da letra em branca.
        label.font = UIFont.boldSystemFont(ofSize: 40) // Aqui eu seto o tamanho da fonte.
        label.text = "Login" // Aqui eu seto o que irá mostrar no texto.
        return label
    }()
    
    lazy var logoAppImageView:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.tintColor = .blue
        image.contentMode = .scaleAspectFit // com o contentmode a gente consegue setar os aspects como no storyboard.
        //image.backgroundColor = .blue
        
        
        return image
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no // Esse cara é responsável por fazer aquelas correções automáticas no teclado, e aqui estou passando para ele que eu não quero que ele corrija nada.
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect // esse método faz paracer bem default.
        tf.keyboardType = .emailAddress // aqui A gente deixa o teclado mais apropriado para questão de e-mail.
        tf.placeholder = "Digite seu E-mail:" // Aqui é quando a gente startar o APP, e dentro do textfield vai aparecer primeiramente essa frase, para quando a gente começar a digitar ela desaparecer.
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true // Quando a gente adcionamos essa propriedade, significa que vai sair aqueles caractéres do estilo senha.
        tf.placeholder = "Digite sua senha:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true // Esse aqui serve para nosso botãozinho se arredondar. Dar acesso as bordas.
        button.layer.cornerRadius = 7.5 // Aqui  a gente determina o quanto a gente vai arredondar.
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
       
        return button
    }()
    
    lazy var forgetPasswordButton:UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueci minha senha", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedForgetPasswordButton), for: .touchUpInside)
       
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Para repartir e deixar um código mais limpo, optamos por criar funções separadas para os elementos que vão ser adcionados a nossa view.
        self.configBackGround()
        self.configSuperView()
        
        //-----------------------
        self.configLoginLabelConstraint()
        self.configLogoAppImageViewConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraint()
        self.configLoginButtonConstraints()
        self.configRegisterButtonConstraints()
        self.configForgetPasswordButtonConstraints()
        //-----------------------
        
        self.setUpConstraints()
        self.configButtonEnable(false)
        
        
        //Sempre que setar as constraints e adcionar imagens ou botões, lembrar de colocar em ordem.
    }
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.forgetPasswordButton)
        
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate) { // Aqui a gente vai deixar público para que na nossa ViewController a gente consiga acessar esse método.
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        
    }
    
    @objc private func tappedLoginButton(){
//        print("Botão de Login!!!!!!")
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton(){
//        print("Botão de REGISTER !!!!!!")
        self.delegate?.actionRegisterButton()
    }
    
    @objc private func tappedForgetPasswordButton(){
//        print("Botão de FORGET PASSWORD!!!!!!")
        self.delegate?.actionForgetPasswordButton()
    }
    
    
    public func validaTextFields(){
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty { // Aqui eu digo que se os dois estiverem vazios.
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable (_ enable:Bool) {
        if enable{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true //Botão habilitado
        }else{
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false //Botão desabilitado
        }
    }
    
    public func getemail()-> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassowrd()-> String {
        return self.passwordTextField.text ?? ""
    }  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            //equal to:
            //basear em um terminadoelemento
            
            //constant:
            //me afastar / aproximar do elemento referente(equalto)
            
            //equalToConstant:
            //setando um valor fixo para um terminado elemento.
            
            //Lembrando que toda vez que a gente vai usar um self. se referencia a nossa view.
            
            // ESSE PASSARÁ A SER O configLoginLabelConstraint()
            
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20), // Aqui eu passo para minha constraints que eu quero que a loginLabel fique setada no topo respeitando a SafeArea com uma margem de 20MP.
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor), // Se caso a  gente não setasse essa CenterXAnchor, o nosso elemento ia ficar grudado no lado esquerdo.
            
            
            
            // ESSE PASSARÁ A SER O configLogoAppImageViewConstraints()
            
//            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20), // Aqui eu estou passando para minha constraint que o topo dela fique 20 pontos abaixo da parte do loginLabel.
//            //self.logoAppImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
//            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
//            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),//altera a altura da imagem.
            
            // ESSE PASSARÁ A SER O configEmailTextFieldConstraints()
            
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor,constant: 20),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            
            // ESSE PASSARÁ A SER O configPassowrdTextFieldConstraints()
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 20),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo:self.emailTextField.heightAnchor),
            
            // ESSE PASSARÁ A SER O configLoginButtonConstraints()
            
            
//            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant: 20),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalTo:self.emailTextField.heightAnchor),
            
            // ESSE PASSARÁ A SER O configRegisterButtonConstraints()
            
//            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor,constant: 20),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo:self.emailTextField.heightAnchor),
            
            // ESSE PASSARÁ A SER O configForgetPasswordButton()
            
            
            
//            self.forgetPasswordButton.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor,constant: 1),
//            self.forgetPasswordButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.forgetPasswordButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.forgetPasswordButton.heightAnchor.constraint(equalTo:self.emailTextField.heightAnchor),
        
        ])
    }

    //Offset = valor positivo
    //inset = valor negativo
    
    func configLoginLabelConstraint(){
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview() // a gente usa equalToSuperview quando está se referenciando a ele mesmo.
        }
    }
    func configLogoAppImageViewConstraints(){
        self.logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }
    func configEmailTextFieldConstraints(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.logoAppImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    func configPasswordTextFieldConstraint(){
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    func configLoginButtonConstraints(){
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    func configRegisterButtonConstraints(){
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    func configForgetPasswordButtonConstraints(){
        self.forgetPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(self.registerButton.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
}
