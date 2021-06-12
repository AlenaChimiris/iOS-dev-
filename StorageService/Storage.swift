//
//  Storage.swift
//  Navigation
//
//  Created by Алена Чимирис on 31.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

public struct Storage{
    
    public static let  postViews = [
        [ PostViewModel(author: "Сat", image:#imageLiteral(resourceName: "котик"), description: "Forever young", likes: "Likes:214", views: "Views:314")],
        [ PostViewModel(author: "Rabbit",image:#imageLiteral(resourceName: "кролик"), description: "Cherish the moments",likes:"Likes:535",views:"Views:984")],
        [   PostViewModel(author: "BabyYoda",image:#imageLiteral(resourceName: "мем"), description: "LOL",likes:"Likes:594",views:"Views:607")],
        [  PostViewModel(author: "Winter",image:#imageLiteral(resourceName: "зима"), description: "A life is a moment",likes:"Likes:234",views:"Views:407")]
    ]
}

public struct PostViewModel {
    
    public let author: String
    public   let image: UIImage
    public   var description: String? = nil
    public   let likes: String
    public   let views: String
    
}
