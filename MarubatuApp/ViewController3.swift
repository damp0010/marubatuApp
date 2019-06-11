//
//  ViewController3.swift
//  MarubatuApp
//
//  Created by 田中　徳充 on 2019/06/10.
//  Copyright © 2019 田中　徳充. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        初期値に不正解を入れてるよ
        self.answer = false
        // Do any additional setup after loading the view.
    }
    var data: [
    [String: Any]] = []
    
    
    @IBOutlet weak var textField: UITextField!
    var answer: Bool!
    
    @IBAction func yesNoButton(_ sender: UISegmentedControl) {
        
        switch  sender.selectedSegmentIndex{
        case 0:
            answer = false
            
        case 1:
            answer = true
        default:
            print("エラー")
        }
    }
    
//    保存sじゅる
    @IBAction func saveQuestionButton(_ sender: Any) {
        
        if textField.text == ""{
            showAlert2(message: "問題を追加してください")
        }else {
            var ques = textField.text!
//            配列を入れる
            data.append(["question": ques, "answer": answer])
            textField.text = ""
//ユーザーデフォルトにデータを保存
            UserDefaults.standard.set( data, forKey: "qAndA")
//
            
            
        }
    }
    
    @IBAction func removeQuestionButton(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "qAndA")
        showAlert2(message: "全て削除しました")
    }
//    アラートをつける関数
    func showAlert2(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
