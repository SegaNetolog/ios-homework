//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Sergey Bragin on 19.06.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let postImages = DataBase.generatetCV()
    private var initialImageRect: CGRect = .zero
    private let layView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    
    private let dataBaseImages = DataBase.generatetCV()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(
            PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
//    private lazy var wrapView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .black
//        view.layer.opacity = 0
//        return view
//    }()
    
    private let animatingIV: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var closeBigBin: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 40, y: 210, width: 40, height: 40))
        button.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        button.tintColor = .black
        button.alpha = 0
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        
        addSubviews()
        contraints()
        
        title = "Gallery"
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.layView.alpha = 0
            self.animatingIV.frame = rect
            self.animatingIV.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingIV.removeFromSuperview()
            self.closeBigBin.alpha = 0
            self.layView.removeFromSuperview()
        }
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(layView)
        view.addSubview(closeBigBin)
        view.addSubview(animatingIV)
        animatingIV.image = image
        animatingIV.alpha = 1.0
        animatingIV.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        
        UIView.animate(withDuration: 0.6) {
            self.layView.alpha = 0.5
            self.animatingIV.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingIV.center = self.view.center
            self.animatingIV.layer.cornerRadius = UIScreen.main.bounds.width / 2
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeBigBin.alpha = 1
            }
        }
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)
    }
    
    private func contraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    @objc private func crossButtonAction() {
        animateImageToInitial(rect: initialImageRect)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: dataBaseImages[indexPath.row])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosViewController: CustomCellDelegate {
    func pushImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectItem = collectionView.layoutAttributesForItem(at: indexPath)
        
        let rectInSuperView = collectionView.convert(rectItem?.frame ?? .zero, to: collectionView.superview)
        
        initialImageRect = CGRect(x: frameImage.origin.x + rectInSuperView.origin.x,
                                  y: frameImage.origin.y + rectInSuperView.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
