//
//  EditingViewModel.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 18.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

let realm = try! Realm()
var attributes = realm.objects(otherAttributes.self)

func signOut(vc :UIViewController){
    do {
        try Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: {
            guard let app = UIApplication.shared.delegate as? AppDelegate else {return}
            app.reloadApp()
        })
    } catch {
        AlertService.addAlertWithActions(in: vc, title: "Ошибка", message: "Ошибка при выходе", actions: [UIAlertAction(title: "Хорошо", style: .cancel, handler: nil)])
    }
}


