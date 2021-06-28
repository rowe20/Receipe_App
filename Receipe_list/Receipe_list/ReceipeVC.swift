//
//  ReceipeVC.swift
//  Receipe_list
//
//  Created by MacBook Pro on 28/06/21.
//

import UIKit

class ReceipeVC: UIViewController {

    private let mytableview = UITableView()
    private var simplefood_LST = ["Burger","Pizza","Maggie","Frankie"]
    private var simplefood_Abt = ["Burger is Pleasant","Pizza is Unique","Maggie is Spicy","Frankie Roll is Delicious."]
    
    public let myButton:UIButton = {
        
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        //button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        //button.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        button.tintColor = .systemGreen
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "List Of Receipe"
        view.addSubview(mytableview)
        setupTableView()
        view.addSubview(myButton)        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mytableview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
        myButton.frame = CGRect(x: 160, y: view.safeAreaInsets.top + 500, width: 70, height: 70)
    }

}
extension ReceipeVC:UITableViewDelegate ,UITableViewDataSource {
    
    private func setupTableView()
    {
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.register(ReceipeTableViewCell.self, forCellReuseIdentifier:"receipecall") // for reusing the call
     
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        simplefood_LST.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = UITableViewCell()
        cell.textLabel?.text = "hello"
        return cell*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "receipecall", for: indexPath) as! ReceipeTableViewCell
        cell.setupsimpleFood(title: simplefood_LST[indexPath.row], and: indexPath.row, Abt: simplefood_Abt[indexPath.row])
        cell.myButton.addTarget(self, action: #selector(opensimplefooddetails), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(simplefood_LST[indexPath.row])
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mytableview.beginUpdates()
            simplefood_LST.remove(at: indexPath.row)
            
            mytableview.deleteRows(at: [indexPath], with: .fade)
            mytableview.endUpdates()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120 //For Setting Up the height of the each row
    }

   
    @objc private func opensimplefooddetails( _ sender:UIButton) {
        print(simplefood_LST[sender.tag])
        let vc = ReceipeIngredientsVC()
        vc.food_item = simplefood_LST[sender.tag]
        vc.food_no = Int32(sender.tag)
        navigationController?.pushViewController(vc, animated: true)
        
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
