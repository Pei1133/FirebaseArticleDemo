//na
//  AddArticleViewController.swift
//  FirebaseArticle
//
//  Created by 黃珮鈞 on 2017/11/26.
//  Copyright © 2017年 黃珮鈞. All rights reserved.
//

import UIKit
import Firebase

class AddArticleViewController: UIViewController {
    
    @IBOutlet weak var articleTxtView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    var authorName:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAuthorName()
    }
    
    @IBAction func goSave(_ sender: Any) {

        guard
            let uid = Auth.auth().currentUser?.uid
            else { return }
        let ref = Database.database().reference()
        let articleRef = ref.child("articles").childByAutoId()
//        let authorRef = ref.child("users").child(uid)
        
        
        guard let title = self.titleTextField.text, let content = self.articleTxtView.text else{
            print("Form is not valid")
            return
        }

        let value = [
            "title": title,
            "content": content,
            "publish date": "\(Date())",
            "author": authorName
        ] as [String : Any]
        articleRef.setValue(value)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    func getAuthorName() {
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapShot) in

                guard let dictionary = snapShot.value as? [String: AnyObject] else { return }
                guard let authorName = dictionary["name"] as? String else { return }
                //            guard let authorFirstName = dictionary[“firstName”] as? String else { return }
                //            guard let authorLasttName = dictionary[“lastName”] as? String else { return }
                self.authorName = authorName
//                self.tableView.reloadData()
                // self.delegate?.didFetchAuthorName
            
        })
    }
}



