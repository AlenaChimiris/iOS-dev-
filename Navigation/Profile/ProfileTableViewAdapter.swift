//
//  ProfileTableViewAdapter.swift
//  Navigation
//
//  Created by Алена Чимирис on 06.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

//final class ProfileTableViewAdapter: NSObject, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return Storage.postViews.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Storage.postViews[section].count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseID, for: indexPath) as! PostTableViewCell
//        
//        let postView: PostView = Storage.postViews[indexPath.section][indexPath.row]
//        cell.configure(postView: postView)
//        //        cell.imagePost.image = image
//        
//        return cell
//    }
//    
//}
