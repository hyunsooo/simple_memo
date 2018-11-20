//
//  MemoReadVC.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    var params: Model.Memo?
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subject.text = params?.title
        self.contents.text = params?.contents
        self.img.image = params?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨."
        let dateString = formatter.string(from: (params?.regdate)!)
        
        self.navigationItem.title = dateString
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
