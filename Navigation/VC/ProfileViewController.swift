//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var post = Post.createPost()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)

        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupContraints()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addSubviews(){
        view.addSubview(tableView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  post.count
        }    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: post[indexPath.row])
            
            cell.tapHandler = {
                let detailModalPostVC = DetailModalPostVC()
                self.post[indexPath.item].views += 1
                self.tableView.reloadData()
                detailModalPostVC.detailPost = self.post[indexPath.item]
                detailModalPostVC.parentNavigationControler = self.navigationController
                self.navigationController?.present(detailModalPostVC, animated: true)
            }
            
            cell.tapLikes = {
                    self.post[indexPath.item].likes += 1
                    self.tableView.reloadData()
                
            }
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController()
        if indexPath.section == 0 {
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }

}

