//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Sergey Bragin on 19.06.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    private var indexPathCell = IndexPath()

     lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAnimation)))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    func setupCell(model: DataBase) {
        imageView.image = UIImage(named: model.image)
    }
    
    private func addSubviews(){
        contentView.addSubview(imageView)
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
 
    @objc private func openAnimation() {
        delegate?.pushImage(imageView.image, frameImage: imageView.frame, indexPath: indexPathCell)
    }
}

protocol CustomCellDelegate: AnyObject {
    func pushImage(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}
