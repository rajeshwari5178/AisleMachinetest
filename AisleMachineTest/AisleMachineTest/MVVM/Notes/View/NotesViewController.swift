//
//  NotesViewController.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    var viewmodel = NotesViewModel()
    
    var token:String?
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()//show activity indicator
    
 
    var arrrr:NotesDataModel?

  
    @IBOutlet weak var Tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableviewSetup()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        //  Calling api
        viewmodel.NotesGetApi(Header: token!){ [weak self] result in
                   switch result {
                   case .success(let data):
                       self?.viewmodel.notes = data
                       print(data)
                                      DispatchQueue.main.async {
                                          self?.Tableview.reloadData()
                                        
                                          self!.activityIndicator.stopAnimating()
                                      }
                   case .failure(let error):
                       print("Error fetching data: \(error)")
                       self!.activityIndicator.stopAnimating()
                   }
               }
            // Do any additional setup after loading the view.
        }
    //Tableview Setup function
    
    func TableviewSetup(){
        Tableview.delegate=self
        Tableview.dataSource=self
        Tableview.register(UINib(nibName:"NotesTableViewCell" , bundle: Bundle.main), forCellReuseIdentifier: "NotesTableViewCell")
        Tableview.register(UINib(nibName:"InterestedTableViewCell" , bundle: Bundle.main), forCellReuseIdentifier: "InterestedTableViewCell")
      
      
        
    }

}
extension NotesViewController{
    //tableView methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section{
            case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotesTableViewCell") as! NotesTableViewCell
            print("NotesTableViewCell")
            if let data = viewmodel.notes?.invites?.profiles![indexPath.row].photos! {
                cell.configuretablecell(with: data)
                print("data====== :\(data)")
                
            }
           
            return cell
       
            
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "InterestedTableViewCell") as! InterestedTableViewCell
            if let data = viewmodel.notes?.likes?.profiles{
                cell.configuretablecell(with: data)
                print("data ====:\(data)")
            }
            
            return cell



            
        default:
            break
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
        case 0 :
            return 450
        case 1:
            return 400
      
        default:
            break
            
        }
        
        return 0
    }
}
