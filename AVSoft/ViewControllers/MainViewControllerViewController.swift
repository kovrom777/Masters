//
//  MainViewControllerViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import Firebase

class EditingViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.backColor
        let leftButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(openMenu))
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
        let rightBarButton = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(exit))
        self.navigationItem.setRightBarButton(rightBarButton, animated: true)
    }
    
    
    //MARK: Exit Button action
    @objc
    func exit(){
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize()
            UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {
                guard let app = UIApplication.shared.delegate as? AppDelegate else {return}
                app.reloadApp()
            })
        } catch {
            let alert = UIAlertController(title: "Ошибка", message: "ошибка при выходе", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Хорошо", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @objc
    func openMenu(){
      present(MenuViewController(), animated: true, completion: nil)
    }

}
