//
//  PostViewController.swift
//  Navigation
//
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Anon"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBrown
        self.navigationItem.title = titlePost
        let postButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newPost))
        navigationItem.rightBarButtonItem = postButton
    }
    
    @objc func newPost () {
        let infoViewController = InfoViewController ()
        view.backgroundColor = .white
        infoViewController.modalTransitionStyle = .coverVertical
        present(infoViewController, animated: true)
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
