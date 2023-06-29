//
//  ViewController.swift
//  Navigation
//
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBAction func pushAddAction (_ sender: Any) {
        let alertController = UIAlertController (title: "Post", message: "message", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "Написать новый пост!", style: .default) { _ in
            print("Сообщение в консоль")
        }
        let alertAction2 = UIAlertAction(title: "Напишем может быть ещё один пост?", style: .default) { _ in
            print("Сообщение в консоль")
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        present(alertController, animated: true)
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.setTitle("Нажми на меня, пожалуйста!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(pushAddAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
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
