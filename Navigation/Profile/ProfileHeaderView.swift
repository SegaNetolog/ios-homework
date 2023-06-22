//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Sergey Bragin on 05.06.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    private var leadingImageView = NSLayoutConstraint()
    private var trailingImageView = NSLayoutConstraint()
    private var topImageView = NSLayoutConstraint()
    private var widthImageView = NSLayoutConstraint()
    private var heightImageView = NSLayoutConstraint()
    private var heightWrapView = NSLayoutConstraint()
    
    private var statusLabel: String = ""
    private var setStatusButton: UIButton!
    private let avatarLayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let wrapView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
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
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseGesture)))
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

        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openBigBin)))
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
        addSubview(avatarLayView)
        addSubview(wrapView)
        addSubview(imageView)
        addSubview(closeBigBin)
    }
    
    func constrains() {
        
        
        leadingImageView = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topImageView = imageView.topAnchor.constraint(equalTo: topAnchor,constant: 16)
        widthImageView = imageView.widthAnchor.constraint(equalToConstant: 95)
        heightImageView = imageView.heightAnchor.constraint(equalToConstant: 95)
        NSLayoutConstraint.activate([leadingImageView, topImageView, widthImageView, heightImageView])
        
        heightWrapView = wrapView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([heightWrapView])
        
        NSLayoutConstraint.activate([
            
            wrapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            wrapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            wrapView.topAnchor.constraint(equalTo: topAnchor),
            
            closeBigBin.widthAnchor.constraint(equalToConstant: 30),
            closeBigBin.heightAnchor.constraint(equalToConstant: 30),
            closeBigBin.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeBigBin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            avatarLayView.widthAnchor.constraint(equalToConstant: 95),
            avatarLayView.heightAnchor.constraint(equalToConstant: 95),
            avatarLayView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarLayView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor,constant:  -25),
           
            titleStatus.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            titleStatus.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            titleStatus.widthAnchor.constraint(equalToConstant: 170),
          
            titleName.leadingAnchor.constraint(equalTo: avatarLayView.trailingAnchor, constant: 10),
            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            titleName.widthAnchor.constraint(equalToConstant: 190),
        
            textField.topAnchor.constraint(equalTo: titleStatus.bottomAnchor, constant: 12),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 210),
            textField.leadingAnchor.constraint(equalTo: titleName.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    @objc private func openBigBin() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                
                self.widthImageView.constant = UIScreen.main.bounds.width
                self.leadingImageView.constant = 0
                self.trailingImageView.constant = 0
                self.topImageView.constant = 100
                self.heightImageView.constant = self.widthImageView.constant
                self.heightWrapView.constant =  UIScreen.main.bounds.height
                self.imageView.layer.cornerRadius = 0
//                self.imageView.centerYAnchor.constraint(equalTo: self.wrapView.centerYAnchor)
                self.wrapView.isHidden = false
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                self.closeBigBin.layer.opacity = 1
                self.wrapView.layer.opacity = 0.3

            }
        }
        
    }
    
    @objc private func tapCloseGesture() {
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1) {
                self.closeBigBin.layer.opacity = 0
                self.wrapView.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.1) {
                self.wrapView.isHidden = false
                self.wrapView.isHidden = true
                self.imageView.layer.cornerRadius = 50
                self.widthImageView.constant = 95
                self.leadingImageView.constant = 16
                self.trailingImageView.constant = 30
                self.topImageView.constant = 16
                self.heightImageView.constant = 95
                self.heightWrapView.constant =  UIScreen.main.bounds.height
            }
        }
    }
}
