//
//  MemoFormVC.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {

    var subject: String?
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!

}

extension MemoFormVC: UITextViewDelegate {
    @IBAction func save(_ sender: Any) {
        guard let text = contents.text else { alert("내용을 입력해주세요."); return }
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let memo = Model.Memo(idx: delegate.memoList.count, title: subject ?? "", contents: text, image: preview.image, regdate: Date())
        
        delegate.memoList.append(memo)
        
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = contents.length > 15 ? 15 : contents.length
        subject = contents.substring(with: NSRange(location: 0, length: length))
        navigationItem.title = subject
    }
}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        picker.dismiss(animated: false)
    }
}


extension UIViewController {
    func alert(_ message: String) {
        let alertController = UIAlertController(title: "Simple Memo", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default))
        present(alertController, animated: true)
    }
}
