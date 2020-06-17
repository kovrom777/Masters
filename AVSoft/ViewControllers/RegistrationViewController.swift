//
//  RegistrationViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: KeyboardViewController {
    
    
    //MARK: EmailTextField decloration
    let emailTextField:UITextField = {
        let txt = UITextField()
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Email")
        txt.backgroundColor = Colors.backColor
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.keyboardType = .emailAddress
        txt.textColor = Colors.placeholderColor
        txt.addTarget(self, action: #selector(emailTextFieldIsEditing), for: .editingChanged)
        txt.autocapitalizationType = .none
        return txt
    }()
    
    //MARK: EmailErrorLabel decloration
    let emailErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Введите корректный Email"
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //MARK: passwordTextField decloration
    let passwordTextField:UITextField = {
        let txt = UITextField()
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Пароль")
        txt.backgroundColor = Colors.backColor
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isSecureTextEntry = true
        txt.textColor = Colors.placeholderColor
        txt.addTarget(self, action: #selector(passwordTextFieldIsEditing), for: .editingChanged)
        txt.autocapitalizationType = .none
        return txt
    }()
    
    //MARK: passwordErrorLabel decloration
    let passwordErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Пароль должен быть длиннее 6 символов"
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //MARK: confirmPasswordTextField decloration
    let confirmPasswordTextField:UITextField = {
        let txt = UITextField()
        txt.setBottomBorder(color: Colors.bottomBorderColor)
        txt.setPlaceholderFont(color: Colors.placeholderColor, text: "Подтвердите пароль")
        txt.backgroundColor = Colors.backColor
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.textColor = Colors.placeholderColor
        txt.isSecureTextEntry = true
        txt.addTarget(self, action: #selector(confirmPasswordTextFieldIsEditing), for: .editingChanged)
        txt.autocapitalizationType = .none
        return txt
    }()
    
    //MARK: confirmPasswordErrorLabel decloration
    let confirmPasswordErrorLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Пароли не совпадают"
        lbl.textColor = .red
        lbl.isHidden = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    //MARK: signUpButton decloration
    let signUpButton:UIButton = {
        let btn = UIButton()
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 16
        btn.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.backColor
        [emailTextField, emailErrorLabel, passwordTextField, passwordErrorLabel, confirmPasswordTextField, confirmPasswordErrorLabel, signUpButton].forEach{self.view.addSubview($0)}
        
        let textFields = [emailTextField, passwordTextField, confirmPasswordTextField]
        UITextField.connectAllTxtFieldFields(txtfields: textFields)
        confirmPasswordTextField.addDoneButtonOnKeyboard()
        view.dismissKey()
        setConstraints()
        
        registerForKeyboardNotification()
    }
    
    
    //MARK: Constraints
    func setConstraints(){
        
        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
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
        passwordErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordErrorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 30).isActive = true
        confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        confirmPasswordErrorLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 8).isActive = true
        confirmPasswordErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        confirmPasswordErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        confirmPasswordErrorLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: confirmPasswordErrorLabel.bottomAnchor, constant: 50).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    //MARK: ViewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        signUpButton.setGradientBorder(title: "Зарегистрироваться", startColor: Colors.firstColorForGradient, endColor: Colors.secondColorForGradient)
    }
    
    
    //MARK: Handling emailTextField editing
    @objc
    func emailTextFieldIsEditing() {
        guard let email = emailTextField.text else {return}
        if !email.hasValidEmail(){
            emailErrorLabel.isHidden = false
        }else{
            emailErrorLabel.isHidden = true
        }
    }
    
    //MARK: Handling passwordTextFieldEditing
    @objc
    func passwordTextFieldIsEditing() {
        guard let password = passwordTextField.text else {return}
        if password.count < 6{
            passwordErrorLabel.isHidden = false
        }else{
            passwordErrorLabel.isHidden = true
        }
    }
    
    //MARK: Handling confirmPasswordTextField editing
    @objc
    func confirmPasswordTextFieldIsEditing() {
        guard let password = passwordTextField.text else {return}
        guard let confirmPassword = confirmPasswordTextField.text else {return}
        if password != confirmPassword{
            confirmPasswordErrorLabel.text = "Пароли не совпадают"
            confirmPasswordErrorLabel.isHidden = false
        }else{
            confirmPasswordErrorLabel.isHidden = true
        }
    }
    
    
    //MARK: Handling signUpButton Tap
    @objc
    func signUpButtonTapped() {
        guard let email = emailTextField.text, email.hasValidEmail() else {
            emailTextField.shake()
            return
        }
        guard let password = passwordTextField.text, password != "" else{
            passwordTextField.shake()
            return
        }
        
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword == password else{
            confirmPasswordTextField.shake()
            return
        }
        
        //MARK: Registration Method
        if email.count != 0 && password.count != 0 && password == confirmPassword{
            Auth.auth().signIn(withEmail: email, password: " ") { (user, error) in
                if error != nil {
                    //check if email already exist
                    if (error?._code == 17009) {
                        let alert = UIAlertController(title: "Email уже зарегистрирован", message: "", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "Войти", style: .default, handler: { (_) in
                            self.navigationController?.popToRootViewController(animated: true)
                        }) )
                        alert.addAction(UIAlertAction(title: "Продолжить", style: .default, handler: { (_) in
                            self.emailTextField.text = ""
                        }))
                        self.present(alert, animated: true, completion: nil)
                        return
                    } else if(error?._code == 17011) { 
                        // All good we can move on
                        self.emailErrorLabel.isHidden = true
                        if createUser(email: email, password: password){
                            let alert = UIAlertController(title: "Вы успешно зарегистрировались", message: nil, preferredStyle: .actionSheet)
                            alert.addAction(UIAlertAction(title: "ОК", style: .default , handler: { (_) in
                                self.navigationController?.popToRootViewController(animated: true)
                            }))
                            self.present(alert, animated: true, completion: nil)
                        }
                        
                    }
                }
            }
        }
    }
}
