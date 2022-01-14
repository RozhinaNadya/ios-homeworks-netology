//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Надежда on 20.10.2021.
//

import UIKit

struct Post: Codable {
    var author: String
    var description: String
    var image: String
    var like: Int
    var views: Int
  }

class ProfileViewController: UIViewController {
    
    var backgroundColor: UIColor = .clear
    
    let tableView = UITableView.init(frame: .zero, style: .plain)
    
    let cellReuseID = "MyTableViewCell"
    
    let cellProfileID = "ProfileTableViewCell"
    
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
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.register(ProfileTableViewCell.self, forHeaderFooterViewReuseIdentifier: cellProfileID)
        posts = getPostData()
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
    }
    
    func getPostData() -> [Post] {
        var posts: [Post] = [Post]()
        let myJsonData = """
            [
                {"author": "Google memes",
                "description": "Eto ya после полугодового обучения",
                "image": "gde_swift.png",
                "like": 55,
                "views": 100},
            
                {"author": "Eugène Henri Paul Gauguin",
                "description": "Поль Гоген – Забавы (1892 г.). Это была одна из работ Гогена, выставленная на его выставке в Дюран-Руэль в 1893 году в Париже. Он был завещан французскому государству в 1961 году и находился в коллекции Лувра. С 1986 года картина находится в коллекции Музея Орсе.",
                "image": "gogen.png",
                "like": 1055,
                "views": 15100},

                {"author": "Икскотер Нетологиевич",
                "description": "Самый сложный выбор при ожидании проверки ДЗ",
                "image": "choice.png",
                "like": 555,
                "views": 5100},

                {"author": "Wikipedia",
                "description": "Южноафриканский узкорот (лат. Breviceps adspersus) — вид бесхвостых земноводных из рода африканских узкоротов.",
                "image": "frog.png",
                "like": 5675547,
                "views": 100674455}
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellProfileID) as! ProfileTableViewCell
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
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
