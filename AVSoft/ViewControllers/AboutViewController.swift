//
//  AboutViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 22.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    var delegate: ViewControllerDelegate!
    
    let textView:UITextView = {
        let tv = UITextView()
        tv.isUserInteractionEnabled = false
        tv.text = "Начну, пожалуй, по порядку. В данном приложения для авторизации и регистрации я использовал FireBase. В функциях входа и регистрации есть обработка разных ошибок (например, неверные логин или пароль, и, если Email уже зарегистрирован), а также добавлены методы для валидации разных полей . После успешного входа в приложение, у меня заменяется экран входа на личный кабинет (после перезагрузки приложения данное состояние сохраняется и, следовательно, не нужно будет перезаходить). При первом входе в поля с данным будет показываться только Email, поскольку только это поле нам предоставил пользователь (поле загружается с FireBase только в 1 раз, далее оно записывается в локальную БД). Впоследствие, можно отредактировать все доступные поля путем нажатия на любое (откроется экран с редактированием). В качестве локальной базы данных я использовал Realm. В ней есть 2 модели - пользователь и дополнительные атрибуты, которые пользователь захочет добавить впоследствие. На экране редактирования можно изменить все доступные поля, добавить или удалить дополнительные атрибуты."
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textColor = .black
        tv.textAlignment = .center
        tv.backgroundColor = Colors.backColor
        tv.font = tv.font?.withSize(16)
        tv.sizeToFit()
        tv.isScrollEnabled = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        view.backgroundColor = Colors.backColor
        
        view.addSubview(textView)
        setconstraints()
        configureNavUI()
    }
    
    
    //MARK: Constraints
    func setconstraints(){
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: objc function
    @objc func exit(){
        signOut(vc: self)
    }
    
    @objc func close(){
        dismiss(animated: true, completion: nil)
    }

    
    //MARK: Nav configure
    func configureNavUI(){
        navigationController?.navigationBar.tintColor = .lightGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "close").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "logout").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(exit))
    }
}
