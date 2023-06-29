//
//  LogInViewController.swift
//  Navigation
//
//  Created by Sergey Bragin on 09.06.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default
    
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "Email of phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()    //
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .systemGray6 //
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    private let  seporatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let stackAutorization: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var  loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor  = (UIColor(named: "newColor"))
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushLogin), for: .touchUpInside)
        switch button.state {
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        default: button.alpha = 1
        }
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var messageForm: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: label.font.pointSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func layout() {
                
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(stackAutorization)
        stackAutorization.addArrangedSubview(loginTextField)
        stackAutorization.addArrangedSubview(seporatorLine)
        stackAutorization.addArrangedSubview(passwordTextField)
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            
            loginTextField.topAnchor.constraint(equalTo: stackAutorization.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: stackAutorization.leadingAnchor),
            loginTextField.widthAnchor.constraint(equalTo: stackAutorization.widthAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: seporatorLine.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: stackAutorization.leadingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 49),
            passwordTextField.widthAnchor.constraint(equalTo: stackAutorization.widthAnchor),
            
            seporatorLine.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 0),
            seporatorLine.leadingAnchor.constraint(equalTo: stackAutorization.leadingAnchor),
            seporatorLine.heightAnchor.constraint(equalToConstant: 1),
            seporatorLine.widthAnchor.constraint(equalTo: stackAutorization.widthAnchor),
           
            stackAutorization.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackAutorization.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackAutorization.widthAnchor.constraint(equalToConstant:  view.frame.width - 32),

            loginButton.topAnchor.constraint(equalTo: stackAutorization.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: stackAutorization.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalTo: stackAutorization.widthAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
        @objc private func pushLogin() {
                
                guard let loginText  = loginTextField.text else {
                    return
                }
                guard let passwordText  = passwordTextField.text else {
                    return
                }
                
                var loginAlert = false
                    if loginText == "login" && passwordText == "password" {
                         loginAlert = false
                        navigationController?.pushViewController(ProfileViewController(), animated: true)
                    } else {
                         loginAlert = true
                        if loginText.count == 0 {
                            loginTextField.backgroundColor = .systemRed
                            loginTextField.shake()
                             loginAlert = false
                        }
                        
                        if passwordText.count == 0 {
                            passwordTextField.backgroundColor = .systemRed
                            passwordTextField.shake()
                            loginAlert = false
                        } else if passwordText.count < 6 {
                            messageForm.text = "Пароль должен быть длинее 5 символов"
                            loginAlert = false
                        }
                    }
                
                if loginAlert {
                    showAlert(title: "Ошибка авторизации", message: "Неверный логин или пароль")
                    passwordTextField.text = ""
                }
            
            
            
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + loginButton.frame.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height + loginButton.frame.height + 16,
                                                                    right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
