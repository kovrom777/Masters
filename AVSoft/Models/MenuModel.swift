//
//  MenuTableViewModel.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import Foundation
import UIKit

enum MenuModel:Int, CustomStringConvertible {
    
    
    case Editing
    case View
    case AboutProgram
    
    var description: String {
        switch self {
        case .Editing: return "Редактирование"
        case .View: return "Просмотр"
        case .AboutProgram: return "О программе"
        }
    }
    
    var viewControllers: UIViewController{
        switch self {
        case .Editing: return EditingViewController()
        case .View: return ViewViewController()
        case .AboutProgram: return AboutViewController()
        }
    }
}

