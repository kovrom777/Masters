//
//  ContainerViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var menuController:MenuViewController!
    var centerController: UIViewController!
    var isExpanding = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    func configureHomeController(){
        let viewController = ViewViewController()
        viewController.delegate = self
        centerController = UINavigationController(rootViewController: viewController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
    func configureMenuController(){
        if menuController == nil{
            //add menu
            menuController = MenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand:Bool, menuOption: MenuModel?){
        if shouldExpand{
            //show menu
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            //hide Menu
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
    }
    
    func didSelectMenuOption(menuOption: MenuModel){
        switch menuOption {
        case .AboutProgram:
            if menuOption.viewControllers != AboutViewController(){
                let about = UINavigationController(rootViewController: AboutViewController())
                about.modalPresentationStyle = .fullScreen
                present(about, animated: true, completion: nil)
            }
        case .Editing:
            if menuOption.viewControllers != EditingViewController(){
                let edit = UINavigationController(rootViewController: EditingViewController())
                edit.modalPresentationStyle = .fullScreen
                present(edit, animated: true, completion: nil)
            }
        case .View:
            if menuOption.viewControllers != ViewViewController(){
                let VVC = UINavigationController(rootViewController: ViewViewController())
                VVC.modalPresentationStyle = .fullScreen
                present(VVC, animated: true, completion: nil)
            }
        }
    }

}

extension ContainerViewController:ViewControllerDelegate{
    func handleMenuToggle(forMenuModel: MenuModel?) {
        if !isExpanding{
            configureMenuController()
        }
        
        isExpanding = !isExpanding
        animatePanel(shouldExpand: isExpanding, menuOption: forMenuModel)
    }
    

        
}
