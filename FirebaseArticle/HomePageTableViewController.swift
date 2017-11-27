//
//  HomePageTableViewController.swift
//  FirebaseArticle
//
//  Created by 黃珮鈞 on 2017/11/27.
//  Copyright © 2017年 黃珮鈞. All rights reserved.
//

import UIKit
import Firebase

//struct Article {
//    let id: String
////    let title: String
////    let content: String
////    let date: String
////    let author: String
//}
//
//class HomePageTableViewController: UITableViewController {
//    
//    var articles: [Article] = []
//    
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        Database.database().reference().observe(.childAdded) { (snapshot) in
//////            self.publishArticles = []
////            if snapshot.childrenCount > 0 {
////                var dataList: [Article] = [Article]()
////
////                for item in snapshot.children {
//////                    let data = Article(snapshot: item as! DataSnapshot)
//////                    self.articles.append(data)
//////                    , title: <#String#>, content: <#String#>, date: <#String#>, author:
////                }
////
////                self.articles = dataList
////                self.tableView.reloadData()
//            }
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return articles.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
//        cell.textLabel?.text = self.articles[indexPath.row].id
//        //        cell.detailTextLabel?.text = publishArticles[indexPath.row].author + "   " + publishArticles[indexPath.row].date
//        return cell
//    }
//}

