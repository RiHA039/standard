//
//  ViewController.swift
//  PasswordViewController
//
//  Created by 김리하 on 9/11/25.
//

import UIKit

class PasswordViewController: UIViewController {
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "비밀번호 입력"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let  passwordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("입력", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordButton)
        
        setupLayout()
        
        passwordButton.addTarget(self, action: #selector(didTapPasswordButton), for: .touchUpInside)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -10),
            
            passwordButton.centerXAnchor.constraint(equalTo: passwordLabel.centerXAnchor),
            passwordButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordButton.widthAnchor.constraint(equalToConstant: 100),
            passwordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func didTapPasswordButton() {
        
        if passwordTextField.text == "password" {
            passwordLabel.text = "성공"
        } else {
        }
        
    }
    
}
