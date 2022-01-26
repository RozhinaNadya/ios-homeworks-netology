//
//  PostData.swift
//  Navigation
//
//  Created by Надежда on 26.01.2022.
//

import UIKit

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
