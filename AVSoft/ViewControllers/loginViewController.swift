//
//  loginViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class loginViewController: KeyboardViewController {
    
    //MARK: EmailTextField declaration
    let emailTextField:UITextField = {
        let txt = UITextField()
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Email")
        txt.backgroundColor = Colors.backColor
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textColor = Colors.placeholderColor
        txt.keyboardType = .emailAddress
        txt.addTarget(self, action: #selector(emailTextFieldIsEditing), for: .editingChanged)
        txt.autocapitalizationType = .none
        return txt
    }()
    
    //MARK: emailErrorLabel declaration
    let emailErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Введите корректный Email"
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //MARK: passwordTextField declaration
    let passwordTextField:UITextField = {
        let txt = UITextField()
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Пароль")
        txt.backgroundColor = Colors.backColor
        txt.textColor = Colors.placeholderColor
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isSecureTextEntry = true
        txt.addTarget(self, action: #selector(passwordTextFieldIsEditing), for: .editingChanged)
        txt.autocapitalizationType = .none
        return txt
    }()
    
    //MARK: passwordErrorLabel declaration
    let passwordErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Парольк должен быть длинее 6 символов"
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //MARK: loginButton declaration
    let loginButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Войти", for: .normal)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    //MARK: signUpButton declaration
    let signUpButton:UIButton = {
        let btn = UIButton()
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    //MARK: progressView declaration
    let progressView:UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0
        progress.isHidden = true
        return progress
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.backColor
        
        [emailTextField, emailErrorLabel, passwordTextField, passwordErrorLabel, loginButton, signUpButton, progressView].forEach{self.view.addSubview($0)}
        let textFields = [emailTextField, passwordTextField]
        UITextField.connectAllTxtFieldFields(txtfields: textFields)
        textFields.forEach{$0.addDoneButtonOnKeyboard()}
        setConstraints()
        view.dismissKey()
        registerForKeyboardNotification()
        
    }
    
    //MARK: Constraints
    func setConstraints(){
        
        emailTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 250).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        emailErrorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true
        emailErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        emailErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        emailErrorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailErrorLabel.bottomAnchor, constant: 30).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        passwordErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        passwordErrorLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        passwordErrorLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
        passwordErrorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 50).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //MARK: ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        loginButton.setGradientBackground(colorTop: Colors.firstColorForGradient, colorBottom: Colors.secondColorForGradient)
        signUpButton.setGradientBorder(title: "Зарегистрироваться", startColor: Colors.firstColorForGradient, endColor: Colors.secondColorForGradient)
    }
    
    
    //MARK: Handling changing in email text field
    @objc
    func emailTextFieldIsEditing() {
        guard let text = emailTextField.text else {return}
        if !text.hasValidEmail() {
            emailErrorLabel.isHidden = false
        }else{
            emailErrorLabel.isHidden = true
        }
    }
    
    //MARK: Handling changing in password text field
    @objc
    func passwordTextFieldIsEditing() {
        guard let password = passwordTextField.text else {return}
        if password.count < 6{
            passwordErrorLabel.isHidden = false
        }else{
            passwordErrorLabel.isHidden = true
        }
    }
    
    
    //MARK: Handling login button tap
    @objc
    func loginButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, email != "" else {
            emailTextField.shake()
            return
        }
        
        guard let password = passwordTextField.text, password != "" else {
            passwordTextField.shake()
            return
        }
        
//        progressView.isHidden = false
//        progressView.setProgress(0, animated: true)
        //MARK: Log in
        if email.count > 0 && password.count > 0 {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if let error = error {
                    print(error.localizedDescription, error._code)
                    if (error._code == 17020){
                        let alert = UIAlertController(title: "Ошибка", message: "Нет интернет соединения", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }else if error._code == 17011{
                        let alert = UIAlertController(title: "Ошибка", message: "Неверно введен Email или пароль", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }else{
                    UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                    UserDefaults.standard.synchronize()
                    
                    UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {
                        guard let app = UIApplication.shared.delegate as? AppDelegate else {return}
                        app.reloadApp()
                    })
                    
//                    self.navigationController?.pushViewController(MainViewControllerViewController(), animated: true)
                }
            }
        }
//        progressView.setProgress(1, animated: true)
//        progressView.isHidden = true
        
    }
    
    //MARK: Handling signUp button tap
    @objc
    func signUpButtonTapped(){
        self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
    }
    
}
