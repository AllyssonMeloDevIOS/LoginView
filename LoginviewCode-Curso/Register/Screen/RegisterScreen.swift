//
//  RegisterScreen.swift
//  LoginviewCode-Curso
//
//  Created by Allysson Melo on 08/12/22.
//

import UIKit

protocol RegisterScreenProtocol:AnyObject{
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate:RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    
    
    lazy var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var imageAddUser:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu E-mail"
        tf.font = UIFont.systemFont(ofSize: 14)
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
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        
        return tf
    }()
    
    lazy var registerButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackGround()
        self.configSuperView()
        
        //----------------------------------
        self.configImageAddUserConstraints()
        self.configBackButtonConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraints()
        self.configRegisterButtonConstraints()
        //----------------------------------
        
        self.setUpConstraints()
        self.configButtonEnable(false)
    }
    
    private func configSuperView() {
        self.addSubview(self.backButton)
        self.addSubview(self.imageAddUser)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func configBackGround(){
    self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        
    }
    
    @objc private func tappedBackButton(){
//        print("Botão Voltar")
        self.delegate?.actionBackButton()
    }
    
    @objc private func tappedRegisterButton(){
//        print("Botão Register")
        self.delegate?.actionRegisterButton()
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
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true //Botão habilitado
        }else{
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false //Botão desabilitado
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
        
            // ESSE PASSARÁ A SER O configImageAddUserConstraints()
            
//            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
//            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150), //Largura e altura fixa para ela ficar quadrada.
//            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            //ESSE PASSARÁ A SER O configBackButtonConstraints()
            
//            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
//            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
//            self.backButton.heightAnchor.constraint(equalToConstant: 20),
            
            //ESSE PASSARÁ A SER O configEmailTextFieldConstraints()
            
//            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor,constant: 10),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            // ESSE PASSARÁ A SER O configPasswordTextFieldConstraints()
            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            
            //ESSE PASSARÁ A SER O configRegisterButtonConstraints()
            
//            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
            
        
        
        
        ])
    }
    

    func configImageAddUserConstraints(){
        self.imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
    }
    
    func configBackButtonConstraints(){
        self.backButton.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(20)
        }
    }
    
    func configEmailTextFieldConstraints(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.imageAddUser.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraints(){
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }

    func configRegisterButtonConstraints(){
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    
}
