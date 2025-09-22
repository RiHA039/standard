//
//  ViewController.swift
//  PasswordError
//
//  Created by 김리하 on 9/15/25.
//

import UIKit


class PasswordViewController: UIViewController {
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "비번 입력"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
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
    
    let validator = PasswordValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordButton)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupLayout()
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
        
        
        passwordButton.addTarget(self, action: #selector(checkPassword), for: .touchUpInside)
    }
    
    @objc func checkPassword() {
        guard let input = passwordTextField.text else { return }
        
        do {
            let result = try validator.validate(with: input)
            if result {
                passwordLabel.text = "성공"
            }
        } catch let error as PasswordError {
            let alert = UIAlertController(title: "오류", message: "\(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        } catch {
            let alert = UIAlertController(title: "알 수 없는 오류", message: "\(error)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        }
        
    }
}
        
        enum PasswordError: Error {
            case emptyInput
            case tooLongInput
            case wrongInput
        }
        
struct PasswordValidator {
    let password: String = "password"
    
    func validate(with input: String) throws -> Bool {
        if input.isEmpty {
            throw PasswordError.emptyInput
        }
        if input.count > 8 {
            throw PasswordError.tooLongInput
        }
        return try passwordCheck(with: input)
    }
    
    private func passwordCheck(with input: String) throws -> Bool {
        if input == password {
            return true
        } else {
            throw PasswordError.wrongInput
        }
    }
}
  
