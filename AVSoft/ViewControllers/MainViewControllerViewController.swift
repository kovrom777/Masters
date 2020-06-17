//
//  MainViewControllerViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 16.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class MainViewControllerViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.backColor
        let leftButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain, target: self, action: #selector(openMenu))
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    
    @objc
    func openMenu(){
        
    }

}
