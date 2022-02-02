//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    let tableView = UITableView.init(frame: .zero, style: .plain)
    
    let cellReuseID = "MyTableViewCell"
    
    let cellProfileID = "ProfileTableViewCell"
    
    let cellPhotosID = "PhotosTableViewCell"
    
    var posts: [Post]!
    
    init(_ color: UIColor, title: String = "Title") {
        super.init(nibName: nil, bundle: nil)
        backgroundColor = color
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLayoutHeaderView()
    }
    
    func configureLayoutHeaderView() {
        self.view.addSubview(tableView)
        tableView.toAutoLayout()
        let constrHeaderView : [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constrHeaderView)
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
