//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.setTitle("button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        addLayout()
    }
    
    func addLayout() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderView)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        ])
    }
}
