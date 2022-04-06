//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    let tableView = UITableView.init(frame: .zero, style: .plain)
    
    let backView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        return view
    }()
    
    var sizeAvatarImageView: UIImageView = {
        let imageName = "catImage.png"
        let avatarImage = UIImage(named: imageName)
        let avatarView = UIImageView(image: avatarImage)
        avatarView.toAutoLayout()
        avatarView.layer.borderColor = UIColor.white.cgColor
        avatarView.layer.borderWidth = 3
        avatarView.layer.cornerRadius = 50
        avatarView.clipsToBounds = true
        avatarView.alpha = 0.0
        return avatarView
    }()
    
    var exitIcon: UIImageView = {
        var exit = UIImageView(image: UIImage(systemName: "xmark"))
        exit.tintColor = .white
        exit.alpha = 0.0
        exit.toAutoLayout()
        exit.isHidden = true
        return exit
    }()
    
    let cellReuseID = "MyTableViewCell"
    
    let cellProfileID = "ProfileTableViewCell"
    
    let cellPhotosID = "PhotosTableViewCell"
    
    var posts: [Post]!
    
    init(_ color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
        view.backgroundColor = backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.register(ProfileTableViewCell.self, forHeaderFooterViewReuseIdentifier: cellProfileID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellPhotosID)
        posts = getPostData()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        backView.isHidden = true
        let gestureExit = UITapGestureRecognizer(target: self, action: #selector(handleExitTapGesture))
        exitIcon.addGestureRecognizer(gestureExit)
        exitIcon.isUserInteractionEnabled = true
        handlerDebigReleaseColor()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLayoutHeaderView()
    }
    
    @objc func handleTapGesture(gesture: UITapGestureRecognizer) {
        UIView.animateKeyframes(
            withDuration: 0.8,
            delay: 0.0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.5,
                    animations: {
                        self.backView.isHidden = false
                        self.sizeAvatarImageView.isHidden = false
                        self.exitIcon.isHidden = false
                        
                        self.sizeAvatarImageView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
                        self.sizeAvatarImageView.transform = CGAffineTransform(scaleX: self.view.bounds.width / gesture.view!.bounds.width, y: self.view.bounds.width / gesture.view!.bounds.width)
                        self.sizeAvatarImageView.alpha = 1.0
                        self.sizeAvatarImageView.layer.cornerRadius = 0
                        self.sizeAvatarImageView.layer.borderWidth = 0
                        self.backView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.2,
                    animations: {
                        self.sizeAvatarImageView.layer.cornerRadius = 0
                        self.sizeAvatarImageView.layer.borderWidth = 0
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.3,
                    animations: {
                        self.exitIcon.alpha = 1.0
                    })
            },
            completion: nil)
    }
    
    @objc func handleExitTapGesture(gesture: UITapGestureRecognizer) {
        UIView.animateKeyframes(
            withDuration: 0.9,
            delay: 0.0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.3,
                    animations: {
                        self.exitIcon.alpha = 0.0
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.3,
                    relativeDuration: 0.5,
                    animations: {
                        self.sizeAvatarImageView.center = CGPoint(x: self.sizeAvatarImageView.bounds.midX, y: self.sizeAvatarImageView.bounds.midY)
                        self.sizeAvatarImageView.transform = .identity
                        self.sizeAvatarImageView.alpha = 0.0
                        self.sizeAvatarImageView.layer.cornerRadius = 50
                        self.sizeAvatarImageView.layer.borderWidth = 3
                        self.backView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
                    })
                UIView.addKeyframe(
                    withRelativeStartTime: 0.8,
                    relativeDuration: 0.1,
                    animations: {
                        self.backView.isHidden = true
                        self.exitIcon.isHidden = true
                    })
            }
        )
    }
    
    func handlerDebigReleaseColor() {
#if DEBUG
        self.view.backgroundColor = UIColor(named: "debugColor")
        tableView.backgroundColor = UIColor(named: "debugColor")
#else
        self.view.backgroundColor = UIColor(named: "releaseColor")
        tableView.backgroundColor = UIColor(named: "releaseColor")
#endif
    }
    
    func configureLayoutHeaderView() {
        self.view.addSubviews([tableView, sizeAvatarImageView, exitIcon])
        tableView.addSubview(backView)
        tableView.toAutoLayout()
        let constrHeaderView : [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            exitIcon.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
            exitIcon.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -16),
            
            backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            sizeAvatarImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            sizeAvatarImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            sizeAvatarImageView.heightAnchor.constraint(equalToConstant: 100),
            sizeAvatarImageView.widthAnchor.constraint(equalToConstant: 100),
        ]
        NSLayoutConstraint.activate(constrHeaderView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return posts.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellProfileID) as! ProfileTableViewCell
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            headerCell.avatarImageView.addGestureRecognizer(gesture)
            headerCell.avatarImageView.isUserInteractionEnabled = true
            return headerCell
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 0
        } else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellPhotosID, for: indexPath) as? PhotosTableViewCell else { fatalError() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as? PostTableViewCell else { fatalError() }
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            let myPost = posts[indexPath.row]
            cell.authorLabel.text = "\(myPost.author)"
            cell.postImageView.image = UIImage(named: myPost.image)
            cell.descriptionLabel.text = "\(myPost.description)"
            cell.likeLabel.text = "Likes: \(myPost.like)"
            cell.viewsLabel.text = "Views: \(myPost.views)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosViewController = PhotosViewController(.white, title: "Photo Gallery")
        if indexPath.section == 0 {
            navigationController?.pushViewController(photosViewController, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
