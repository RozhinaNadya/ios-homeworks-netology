//
//  PostView.swift
//  Navigation
//
//  Created by Надежда on 16.12.2021.
//

//не убираю пока на всякий случай

/*class PostView: UIView {
    
    init?(author: String, descriptionn: String, image: String, like: Int, views: Int) {
        super.init(frame: .zero)
        authorLabel.text = author
        descriptionLabel.text = descriptionn
        imageView = UIImageView(image: UIImage(named: image))
        likeLabel.text = "Likes: \(like)"
        viewsLabel.text = "Views: \(views)"
        configureLayoutPost()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var authorLabel: UILabel = {
        let aLabel = UILabel()
        aLabel.toAutoLayout()
        aLabel.backgroundColor = .white
        aLabel.font = .systemFont(ofSize: 16, weight: .bold)
        aLabel.textColor = .black
        return aLabel
    }()
    
    var descriptionLabel: UILabel = {
        let dLabel = UILabel()
        dLabel.toAutoLayout()
        dLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dLabel.textColor = .gray
        dLabel.backgroundColor = .lightGray
        return dLabel
    }()
    
    var imageView: UIImageView = {
        let iView = UIImageView()
        iView.toAutoLayout()
        return iView
    }()
    
    var likeLabel: UILabel = {
        let lLabel = UILabel()
        lLabel.toAutoLayout()
        lLabel.font = .systemFont(ofSize: 14, weight: .regular)
        lLabel.textColor = .black
        return lLabel
    }()
    
    var viewsLabel: UILabel = {
        let vLabel = UILabel()
        vLabel.toAutoLayout()
        vLabel.font = .systemFont(ofSize: 14, weight: .regular)
        vLabel.textColor = .black
        return vLabel
    }()
    
    func configureLayoutPost() {
        addSubviews([authorLabel, descriptionLabel, imageView, likeLabel, viewsLabel])
        let constrPost = [
            authorLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            authorLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            authorLabel.widthAnchor.constraint(equalTo: widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
            imageView.widthAnchor.constraint(equalTo: authorLabel.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likeLabel.leftAnchor.constraint(equalTo: leftAnchor),
       //     likeLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor, multiplier: 0.5),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewsLabel.rightAnchor.constraint(equalTo: rightAnchor),
       //     viewsLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor, multiplier: 0.5)
        ]
        
        NSLayoutConstraint.activate(constrPost)
        setNeedsLayout()
        layoutIfNeeded()
    }
    

}
*/
