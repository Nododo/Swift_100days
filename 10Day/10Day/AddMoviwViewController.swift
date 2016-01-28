//
//  AddMoviwViewController.swift
//  10Day
//
//  Created by 杜维欣 on 16/1/27.
//  Copyright © 2016年 Nododo. All rights reserved.
//

import UIKit

protocol newMovieProtocol: NSObjectProtocol {
    func newMovie(movieName: String)
//下面是完整版  上面是简写  逼格略高一丢丢
//    func newMovie(movieName: String) -> Void
}

class AddMoviwViewController: UIViewController, UITextFieldDelegate {

  weak var addDelegate: newMovieProtocol?
    
    @IBOutlet weak var addField: UITextField!
    
    //有参数  无返回值   声明一个闭包
    var newMovie : (movieName: String) -> Void = {
        movie in
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New Movies"

        addField.delegate = self
        
        addField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //代理方法
        addDelegate?.newMovie(textField.text!)
        //闭包
        //        self.newMovie(movieName: addField.text!)
        self.navigationController?.popViewControllerAnimated(true)
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swift中deinit方法 ==  OC中delloc方法
    deinit {
        print("dealloc")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
