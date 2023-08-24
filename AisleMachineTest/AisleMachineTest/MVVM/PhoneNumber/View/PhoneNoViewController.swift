//
//  PhoneNoViewController.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit
import IBAnimatable

class PhoneNoViewController: UIViewController {

   
   //var declaration
    @IBOutlet weak var NumberTextField: UITextField!
    
    @IBOutlet weak var ContinueButtonOutlet: AnimatableButton!
 
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()//show activity indicator
    
     var PhoneViewModel=PhoneNoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
       
        
        //keyboard dismiss objective function  and add to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func dismissKeyboard(){
        NumberTextField.resignFirstResponder()
    }
    
    @IBAction func nextscreen(_ sender: Any) {
       
        let number=NumberTextField.text!
        
      //Validation
       
        if NumberTextField.text == "" {
            ShowBottomToast(title: "Message", body: "Fields can not be Empty")
        } else if let validphone = NumberTextField.text, validphone.isValidPhone() != true {
            ShowBottomToast(title: "Message", body: "Please enter valid mobile number ")
        
        } else {
            debugPrint("calling Api")
            activityIndicator.startAnimating()
            
            //calling Api
            PhoneViewModel.SignupPostApi(parameter: ["number":"+91"+"\(number)"]) { [self] result in
                switch result {
                case .success(let response):
                    // Handle successful login response
                    print(" Response successful: \(response)")
                    
                    let status=response.status ?? nil
                    let Status=status!
                    print(Status)
                    activityIndicator.stopAnimating()
                    if Status==true{
                        CallViewController()
                    }else{
                        self.ShowBottomToast(title: "", body: "Please Use this Number 9876543212")
                    }
                case .failure(let error):
                    // Handle login failure
                    print(" error: \(error.localizedDescription)")
                 activityIndicator.stopAnimating()
                    
                }
                
            }
        }
            
        }
   
    
    func CallViewController(){
        let nextvc =  self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        nextvc.modalPresentationStyle = .fullScreen
        nextvc.Number=NumberTextField.text
        self.present(nextvc, animated: true, completion: nil)
    }
    
    
    }


    






   
