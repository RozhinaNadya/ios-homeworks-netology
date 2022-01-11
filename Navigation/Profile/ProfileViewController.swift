//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    let profileHeaderView = ProfileHeaderView()
    
    let tableView = UITableView.init(frame: .zero, style: .plain)
    
    let cellReuseID = "TableViewCell"
    
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
        self.navigationController?.navigationBar.isHidden = false
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        posts = getPostData()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    var profileScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    var contentProfileView: UIView = {
        let content = UIView()
        content.toAutoLayout()
        return content
    }()
    
    func getPostData() -> [Post] {
        var posts: [Post] = [Post]()
        let myJsonData = """
            [
                {"author": "Google memes",
                "description": "Eto ya после полугодового обучения",
                "image": "gde_swift.png",
                "like": 55,
                views: 100},

                {"author": "test",
                "description": "Eto ya после полугодового обучения",
                "image": "not_found.png",
                "like": 55,
                "views": 100},

                {"author": "test",
                "description": "Eto ya после полугодового обучения",
                "image": "not_found.png",
                "like": 55,
                "views": 100},

                {"author": "test",
                "description": "Eto ya после полугодового обучения",
                "image": "not_found.png",
                "like": 55,
                "views": 100}
            ]
            """
        if let jsonData = myJsonData.data(using: .utf8) {
            let decoder = JSONDecoder()
            do { posts = try decoder.decode([Post].self, from: jsonData)
                for post in posts {
                    print(post.author)
                    print(post.image)
                    print(post.description)
                    print(post.like)
                    print(post.views)
                }
            } catch {
                
            }
        }
        return posts
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLayoutHeaderView()
    }
    
    func configureLayoutHeaderView() {
        self.view.addSubview(profileScrollView)
        self.profileScrollView.addSubview(contentProfileView)
        self.contentProfileView.addSubviews([profileHeaderView, tableView])
        profileHeaderView.toAutoLayout()
        tableView.toAutoLayout()
        
        let constrHeaderView : [NSLayoutConstraint] = [
            
            profileScrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            profileScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            profileScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            contentProfileView.leadingAnchor.constraint(equalTo: profileScrollView.leadingAnchor),
            contentProfileView.topAnchor.constraint(equalTo: profileScrollView.topAnchor),
            contentProfileView.bottomAnchor.constraint(equalTo: profileScrollView.bottomAnchor),
            contentProfileView.trailingAnchor.constraint(equalTo: profileScrollView.trailingAnchor),
            contentProfileView.widthAnchor.constraint(equalTo: profileScrollView.widthAnchor),
            
            profileHeaderView.topAnchor.constraint(equalTo: contentProfileView.topAnchor),
            profileHeaderView.centerXAnchor.constraint(equalTo: contentProfileView.centerXAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: profileScrollView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constrHeaderView)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as? MyTableViewCell else {
            fatalError()
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let myPost = posts[indexPath.row]
        cell.authorLabel.text = "\(myPost.author)"
        cell.postImageView.image = UIImage(named: myPost.image)
        cell.descriptionLabel.text = "\(myPost.description)"
        cell.likeLabel.text = "\(myPost.like)"
        cell.viewsLabel.text = "\(myPost.views)"
        return cell
    }
}

// черновик

/* let data = [
    PostView(author: "Google memes", descriptionn: "Eto ya после полугодового обучения", image: "gde_swift.png", like: 55, views: 100),
    PostView(author: "test", descriptionn: "fghjklkjhgfdsdfghjkjhgfdsdfghjkjhgfdsdfghjklkjh", image: "not_found.png", like: 60, views: 70),
    PostView(author: "test", descriptionn: "fghjklkjhgfdsdfghjkjhgfdsdfghjkjhgfdsdfghjklkjh", image: "not_found.png", like: 60, views: 70),
    PostView(author: "test", descriptionn: "fghjklkjhgfdsdfghjkjhgfdsdfghjkjhgfdsdfghjklkjh", image: "not_found.png", like: 60, views: 70)
]*/
