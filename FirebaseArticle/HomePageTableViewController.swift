//
//  HomePageTableViewController.swift
//  FirebaseArticle
//
//  Created by 黃珮鈞 on 2017/11/27.
//  Copyright © 2017年 黃珮鈞. All rights reserved.
//

import UIKit
import Firebase

class Article {
    var title: String = ""
    var content: String = ""
    var date: String = ""
    var author: String = ""
    let ref: DatabaseReference!
    
    init(snapshot: DataSnapshot) {
        self.ref = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            self.title = value["title"] as! String
            self.content = value["content"] as! String
            self.date = value["publish date"] as! String
            self.author = value["author"] as! String
        }
    }
}

class HomePageTableViewController: UITableViewController {
    
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Database.database().reference().child("articles").observe(.value) { (snapshot) in
            self.articles.removeAll()
            
            for child in snapshot.children {
                let childrenSnapshot = child as! DataSnapshot
                let article = Article(snapshot: childrenSnapshot)
                self.articles.insert(article, at: 0)
            }
            self.tableView.reloadData()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomePageTableViewCell
        
        let article = articles[indexPath.row]

            cell.titleLabel.text = self.articles[indexPath.row].title
            cell.contentLabel.text = self.articles[indexPath.row].content
            cell.dateLabel.text = self.articles[indexPath.row].date
            cell.authorButton.setTitle(article.author, for: .normal)
        return cell
    }
}

