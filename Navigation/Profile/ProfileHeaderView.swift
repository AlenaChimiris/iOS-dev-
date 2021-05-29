//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алена Чимирис on 07.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init with frame")
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        
        let constrains =
            
            [
                avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                avatarImageView.heightAnchor.constraint(equalToConstant: 120),
                avatarImageView.widthAnchor.constraint(equalToConstant: 120),
                
                
                fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                
                
                statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 38),
                statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                
                
                setStatusButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 34),
                setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),
                setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
                
                
            ]
        
        
        NSLayoutConstraint.activate(constrains)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init with coder")
    }
    
    var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = #imageLiteral(resourceName: "cat")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.cornerRadius = 125/2
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        fullNameLabel.textAlignment = .left
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    var statusLabel: UILabel = {
        
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 16)
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    
    var statusTextField: UITextField = {
        let status = UITextField()
        status.text = "Listening to music"
        return status
    }()
    
    
    var setStatusButton: UIButton =  {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Show Status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(setStatusButton(_:)), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
    
    
    func setupActionButton() {
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.masksToBounds = true
    }
    
    
    @objc func setStatusButton(_ sender: UIButton) {
        let status = statusTextField.text!
        print(status.self)
    }
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func addSubview(_ subview: UIView) {
        super.addSubview(subview)
        print(type(of: self), #function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
