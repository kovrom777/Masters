//
//  MenuViewController.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let tableView:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
        self.view.addSubview(tableView)
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setConstraints(){
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
   

}

extension MenuViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        let model = MenuModel(rawValue: indexPath.row)
        cell.myLabel.text = model?.description
        return cell
    }
}

extension MenuViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
