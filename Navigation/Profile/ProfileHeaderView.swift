//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Bragin on 05.06.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    var xPositionAvatar = Int()
    var yPositionAvatar = Int()
    private var statusLabel: String = ""
    private var setStatusButton: UIButton!
    private let avatarLayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let vc = ProfileViewController()
    
    private lazy var wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0
        return view
    }()
    
    private lazy var closeBigBin: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image =  UIImage(systemName: "xmark.circle")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.layer.opacity = 0
        imageView.tintColor = .white
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeAnimation)))
        return imageView
    }()
    
    private var statusText: String = " "
    
    private let titleName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Mister"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Setup status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "mister")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAnimation)))
        
        return imageView
    }()
    
    var titleStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Status"
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.minimumFontSize = 15
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.placeholder = "Status"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        subview()
        constrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func btnTap() {
        print( textField.text ?? "Get status")
        titleStatus.text = textField.text
    }
    
    func subview() {
        addSubview(titleName)
        addSubview(titleStatus)
        addSubview(button)
        addSubview(textField)
        addSubview(wrapView)
        addSubview(imageView)
        addSubview(closeBigBin)
    }
    
    func constrains() {
        NSLayoutConstraint.activate([
            
            titleName.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 10),
            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleName.widthAnchor.constraint(equalToConstant: 190),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor,constant:  -25),
            
            titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            titleStatus.widthAnchor.constraint(equalToConstant: 170),
            
            imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: titleName.topAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 12),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 210),
            textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            closeBigBin.widthAnchor.constraint(equalToConstant: 30),
            closeBigBin.heightAnchor.constraint(equalToConstant: 30),
            closeBigBin.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeBigBin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        ])
    }

    @objc private func openAnimation() {
        
        self.wrapView.layer.frame = CGRect(x: 0, y: 0, width: self.vc.view.layer.frame.width, height: self.vc.view.layer.frame.height)
      
        xPositionAvatar = Int(self.imageView.layer.frame.minX)
        yPositionAvatar = Int(self.imageView.layer.frame.minY)

        let avatarAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) { [self] in
            self.imageView.layer.frame = CGRect(x: 0, y: 0, width: self.vc.view.layer.frame.width, height: self.vc.view.layer.frame.width)

            self.imageView.center = vc.view.center
            self.imageView.layer.zPosition = 1
            self.imageView.layer.cornerRadius = 0
            self.wrapView.alpha = 0.8
        }
        avatarAnimator.startAnimation()
  
        let crossAnimator = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
            self.closeBigBin.alpha = 1
        }
        crossAnimator.startAnimation(afterDelay: 0.5)
    }
    
    @objc private func closeAnimation() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.wrapView.alpha = 0
            self.closeBigBin.alpha = 0
            self.imageView.layer.frame = CGRect(x: self.xPositionAvatar, y: self.yPositionAvatar, width: 100, height: 100)
            self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
        }
        animator.startAnimation()
    }
}
