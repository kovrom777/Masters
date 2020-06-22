//
//  ViewViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 21.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import RealmSwift


class ViewViewController: UIViewController {

    let realm = try! Realm()
    
    let scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = Colors.backColor
        return scroll
    }()
    
    let menuButton:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "Menu"), for: .normal)
        btn.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let exitButton:UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(exit), for: .touchUpInside)
        return btn
    }()
    
    let profileImageView:UIImageView = {
          let view = UIImageView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.layer.cornerRadius = 75
          view.layer.borderWidth = 1
          view.clipsToBounds = true
          return view
      }()
    
    let firstNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .black
        return lbl
    }()
    
    let secondNameLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .black
        return lbl
    }()
    
    let telephoneNumberLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .black
        return lbl
    }()
    
    let emailLabel:UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .black
        return lbl
    }()
    
    let tableView:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !realm.isEmpty{
            getUserData()
        }
        
        self.view.backgroundColor = Colors.backColor
        view.addSubview(scrollView)
        setScrollConstraints()
        
        [firstNameLabel, secondNameLabel, telephoneNumberLabel, emailLabel].forEach{$0.addGestureRecognizer(setGesture())}
        
        
        [menuButton, exitButton ,profileImageView ,firstNameLabel, secondNameLabel, emailLabel, telephoneNumberLabel, tableView].forEach{scrollView.addSubview($0)}
        setConstraints()

    }
    
    func setGesture() ->UITapGestureRecognizer{
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(tapHandling))
        return recogniser
    }
    
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 100)
    }
    
    func setScrollConstraints(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setConstraints(){
        
        menuButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 7).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        exitButton.topAnchor.constraint(equalTo: menuButton.topAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        profileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        firstNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 50).isActive = true
        firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 25).isActive = true
        secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        secondNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        secondNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        telephoneNumberLabel.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 25).isActive = true
        telephoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        telephoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        telephoneNumberLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: telephoneNumberLabel.bottomAnchor, constant: 25).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        tableView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc func tapHandling(){
        let editingVC = EditingViewController()
        editingVC.modalPresentationStyle = .fullScreen
        present(editingVC, animated: true, completion: nil)
    }
    
    func getUserData(){
        let person = try! realm.objects(Person.self)
        firstNameLabel.text = person.first?.firstName
        secondNameLabel.text = person.first?.secondName
        telephoneNumberLabel.text = person.first?.telephoneNumber
        emailLabel.text = person.first?.email
        guard let data = person.first?.photo as Data? else {return}
        profileImageView.image = UIImage(data: data)
    }
    
    @objc func exit(){
        signOut(vc: self)
    }
    
    @objc func openMenu(){
        present(MenuViewController(), animated: true, completion: nil)
    }
}
