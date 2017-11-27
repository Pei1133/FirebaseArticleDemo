//
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
    
    override func viewDidLoad() {
//        self.edgesForExtendedLayout = []
    }
    
    // MARK: - Callback
    // 新增節點資料
    @IBAction func goSave(_ sender: Any) {

        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("users")
        let articleRef = ref.child(uid!).child("articles").childByAutoId()
        
        guard let title = self.titleTextField.text, let content = self.articleTxtView.text else{
            print("Form is not valid")
            return
        }
        
        let value = ["title": title, "content": content, "publish date": "\(Date())"]
        articleRef.setValue(value)
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
