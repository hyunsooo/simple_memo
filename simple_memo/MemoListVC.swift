//
//  MemoListVC.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let revealVC = self.revealViewController() {
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu.png")
            btn.target = revealVC
            btn.action = #selector(revealVC.revealToggle(_:))
            
            self.navigationItem.leftBarButtonItem = btn
            
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let ud = UserDefaults.standard
        if ud.bool(forKey: UserInfoKey.tutorial) == false {
            let vc = self.instanceTutorialVC(name: "MasterVC")
            self.present(vc!, animated: false)
            return
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.memoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = delegate.memoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: data.image == nil ? "memoCell" : "memoCellWithImage", for: indexPath) as! MemoCell
        cell.update(data: data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = delegate.memoList[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else { return }
        vc.params = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
