//
//  View2.swift
//  PushView
//
//  Created by Chung on 8/23/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class View2: UIViewController {

    var isLogin: Bool = false
    var users = ["1":"1", "2":"2"]

    @IBOutlet weak var tfUsername: UITextField!
    
    
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    @IBOutlet weak var btnUpdate: UIButton!
    
    
    @IBOutlet weak var btnDelete: UIButton!
    

    @IBOutlet weak var btnRegister: UIButton!
    
    
    @IBOutlet weak var btnListAccount: UIButton!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLogin(sender: UIButton) {
        checkLogin()
    }
    
    
    
    @IBAction func btnListAccount(sender: UIButton) {
        if isLogin {
            print("Danh sách người dung:")
            for (tentaikhoan,matkhau) in users {
                print("tên tài khoản \(tentaikhoan)")
            }
        }

    }
    
    
    @IBAction func btnRegister(sender: UIButton) {
        if let key = users[tfUsername.text!]  {
            print("Tài khoản : \(tfUsername.text!) đã tồn tại")
        }else{
            users[tfUsername.text!] = tfPassword.text!
            print("Đăng ký tài khoản : \(tfUsername.text!) thành công")
            
        }
    }
    
    

    @IBAction func btnDelete(sender: UIButton) {
        if isLogin {
            users.removeValueForKey(tfUsername.text!)
            tfUsername.text = ""
            tfPassword.text = ""
            print("Xóa tài khoản \(tfUsername.text!) thành công")
            isLogin = false
        }

    }
    
    
    @IBAction func btnUpdate(sender: UIButton) {
        if isLogin {
            if let newValue = users.updateValue(tfPassword.text!, forKey: tfUsername.text!){
                print("Cập nhật tài khoản \(tfUsername.text!) thành công")
            }else{
                print("Tên tài khoản đã tồn tại")
            }
        }
    }
  
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.backgroundColor = UIColor.clearColor()
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor.blackColor().CGColor
        
        btnListAccount.backgroundColor = UIColor.clearColor()
        btnListAccount.layer.cornerRadius = 5
        btnListAccount.layer.borderWidth = 1
        btnListAccount.layer.borderColor = UIColor.blackColor().CGColor
        
        btnDelete.backgroundColor = UIColor.clearColor()
        btnDelete.layer.cornerRadius = 5
        btnDelete.layer.borderWidth = 1
        btnDelete.layer.borderColor = UIColor.blackColor().CGColor
        
        btnUpdate.backgroundColor = UIColor.clearColor()
        btnUpdate.layer.cornerRadius = 5
        btnUpdate.layer.borderWidth = 1
        btnUpdate.layer.borderColor = UIColor.blackColor().CGColor
        
        btnRegister.backgroundColor = UIColor.clearColor()
        btnRegister.layer.cornerRadius = 5
        btnRegister.layer.borderWidth = 1
        btnRegister.layer.borderColor = UIColor.blackColor().CGColor
        
        
        //        tfUsername.becomeFirstResponder()
        
        //        let keys = users.keys
        //        let values  = users.values
        //        users["newkey"] = "3"
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true

    }
    
    func checkLogin() {
        if let password = users[tfUsername.text!]  {
            if password == tfPassword.text{
                print("Đăng nhập thành công")
                isLogin = true
                let v3 = self.storyboard?.instantiateViewControllerWithIdentifier("V3") as! View3
                self.navigationController?.pushViewController(v3, animated: true)
                
            }else{
                print("Mật khẩu không đúng")
            }
        }else{
            print("Tài khoản không tồn tại")
        }
    }
    

    
}
