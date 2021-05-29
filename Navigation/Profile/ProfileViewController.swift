
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алена Чимирис on 07.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.

import UIKit

class ProfileViewController: UIViewController {
    
    private let headerView : ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        headerView.backgroundColor = .white
        return headerView
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        
        setupLayout()
        setupTableView()
        
//Настроить разный цвет фона для Debug и Release сборки с помощью флага компиляции DEBUG.
        #if  DEBUG
            tableView.backgroundColor = .green
        #else
            tableView.backgroundColor = .yellow
        #endif
    }
    
    var postView: PostViewModel?
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.reuseID)
    }
    
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        let constraints = [
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return 0 }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
}


extension ProfileViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.postViews.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.postViews[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseID, for: indexPath) as! PostTableViewCell
        
        let postView: PostViewModel = Storage.postViews[indexPath.section][indexPath.row]
        cell.configure(postView: postView)
        
        return cell
    }    
}
