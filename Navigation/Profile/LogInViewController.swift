//
//  LogInViewController.swift
//  Navigation
//
//  Created by Алена Чимирис on 22.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit


class LogInViewController: UIViewController {
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var contentSize: CGSize = .zero
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        
        navigationController?.navigationBar.isHidden = true
        
        setupLayout()
        
        //скрытие клавиатуры при нажатии на облатсь View вне TextField
        setupHideKeyboardOnTap()
        
        //Клавиатура
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logInImage)
        contentView.addSubview(logInButton)
        contentView.addSubview(logInLabel)
        contentView.addSubview(passwordLabel)
        
        
        let constraints = [
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            logInImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logInImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInImage.widthAnchor.constraint(equalToConstant: 100),
            logInImage.heightAnchor.constraint(equalToConstant: 100),
            
            
            logInLabel.topAnchor.constraint(equalTo: logInImage.bottomAnchor, constant: 120),
            logInLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            logInLabel.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 0.5),
            passwordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            passwordLabel.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    private(set) lazy var logInImage: UIImageView = {
        let logInImage = UIImageView()
        logInImage.image = #imageLiteral(resourceName: "logo")
        logInImage.layer.borderColor = UIColor.lightGray.cgColor
        logInImage.layer.borderWidth = 0.5
        logInImage.layer.cornerRadius = 10
        logInImage.translatesAutoresizingMaskIntoConstraints = false
        return logInImage
    }()
    
    var avatarImageSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    var logInLabel: UITextField = {
        let logInLabel = UITextField()
        logInLabel.textColor = .black
        logInLabel.attributedPlaceholder = NSAttributedString(string: "Email of phone")
        logInLabel.layer.borderColor = UIColor.lightGray.cgColor
        logInLabel.layer.borderWidth = 0.5
        logInLabel.layer.cornerRadius = 10
        logInLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInLabel.autocapitalizationType = .none
        logInLabel.translatesAutoresizingMaskIntoConstraints = false
        return logInLabel
    }()
    
    var passwordLabel: UITextField = {
        let passwordLabel = UITextField()
        passwordLabel.textColor = .black
        passwordLabel.layer.borderColor = UIColor.lightGray.cgColor
        passwordLabel.attributedPlaceholder = NSAttributedString(string: "Password")
        passwordLabel.layer.borderWidth = 0.5
        passwordLabel.layer.cornerRadius = 10
        passwordLabel.font = UIFont.systemFont(ofSize: 16)
        passwordLabel.isSecureTextEntry = true
        passwordLabel.autocapitalizationType = .none
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    
    private(set) lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.layer.cornerRadius = 10
        return logInButton
    }()
    
    let profileViewController = ProfileViewController()
    
    @objc  func logInButtonPressed() {
        print("tapped")
        view.endEditing(true)
        if passwordLabel.isFirstResponder {
            passwordLabel.resignFirstResponder()
        }
        if logInLabel.isFirstResponder {
            logInLabel.resignFirstResponder()
        }
        
        performSegue(withIdentifier: "ShowProfile", sender: nil)
        
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        contentView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        
    }
}

//скрытие клавиатуры при нажатии на облатсь View вне TextField
extension UIViewController {
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
