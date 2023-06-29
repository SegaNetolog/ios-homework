//
//  FeedViewController.swift
//  Navigation
//
//

import UIKit

class FeedViewController: UIViewController {
    
    
    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
