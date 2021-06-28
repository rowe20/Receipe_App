//
//  LoginVC.swift
//  Receipe_list
//
//  Created by MacBook Pro on 28/06/21.
//

import UIKit

class LoginVC: UIViewController {

    private let bgimage: UIImageView = {
        let bgimage = UIImageView()
        bgimage.image = UIImage(named: "Homebg.jpg")
        return bgimage
    }()
    
    private let label :UILabel = {
        let label = UILabel()
        let font : UIFont = UIFont.boldSystemFont(ofSize: 30)
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "Recipe Live Healthy"
        label.textAlignment = .center
        label.font = font
        label.textColor = .white
        
        return label
    }()
    
    private let username : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Username"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 70
        return textView
    }()
    
    private let password : UITextField = {
        
        let textView = UITextField()
        textView.placeholder = "Enter Password"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.layer.cornerRadius = 70
        return textView
    }()
    
    private let vcbutton : UIButton = {
        let vc_button = UIButton()
        vc_button.setTitle("Login", for: .normal)
        vc_button.backgroundColor = .black
        vc_button.addTarget(self, action: #selector(redirect), for: .touchUpInside)
        vc_button.layer.cornerRadius = 50
        return vc_button
    } ()
    
    @objc func redirect()
    {
        let vc = ReceipeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgimage)
        view.addSubview(label)
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(vcbutton)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgimage.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 700)
        label.frame = CGRect(x: 20, y: 200, width: view.width - 40, height: 40)
        username.frame = CGRect(x: 20, y: label.bottom + 20, width: view.width - 40, height: 40)
        password.frame = CGRect(x: 20, y: username.bottom + 20, width: view.width - 40, height: 40)
        vcbutton.frame = CGRect(x: 20, y: password.bottom + 20, width: view.width - 40, height: 40)
        
        
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
