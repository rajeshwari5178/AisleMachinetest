//
//  OTPViewController.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit
import IBAnimatable

class OTPViewController: UIViewController {

   
    @IBOutlet weak var EditNumberButtonOutlet: UIButton!
    
    @IBOutlet weak var NumberLabel: UILabel!
   
    
    @IBOutlet weak var OTPTextField: UITextField!
    
    @IBOutlet weak var ContinueButtonOutlet: AnimatableButton!
    
    var Number:String?
    var Token:String?
     var OTPViewmodel=OTPViewModel()
    var countdownTimer: Timer!
    var totalTime=00
    @IBOutlet weak var TimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //timer Aunction call
        startTimer(time: totalTime ?? 0)
        NumberLabel.text="+91\(String(describing: Number!))"
        
        //keyboard dismiss objective function  and add to view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
       
    }
    
    @objc func dismissKeyboard(){
        OTPTextField.resignFirstResponder()
    }
    
    @IBAction func edit(_ sender: Any) {
        EditViewControllerCAll()
    }
    
    @IBAction func contibtn(_ sender: Any) {
        print("button click")
        let otp=OTPTextField.text!
        let number=Number!
        //Validation
        if OTPTextField.text == "" {
            ShowBottomToast(title: "Message", body: "Field can not be Empty")
      
        } else {
            //Calling Api
            OTPViewmodel.OTPVerify(parameters: ["number":"+91"+"\(number)","otp":"\(otp)"]){ [self]result in
                switch result {
                case .success(let response):
                    // Handle successful login response
                    print("OTPVerify successful: \(response)")
                    
                    let token=response.token ?? ""
                    Token=token
                   
                    print(token)
                    if token=="32c7794d2e6a1f7316ef35aa1eb34541"{
                        CallNotesVC()
                       
                    }else{
                        ShowBottomToast(title: "Message", body: "Please enter 1234 OTP ")
                    }
                case .failure(let error):
                    // Handle login failure
                    print(" error: \(error.localizedDescription)")
                    
                    
                }
                
            }
        }
        
    }
    
    
    func EditViewControllerCAll(){
        let nextvc =  self.storyboard?.instantiateViewController(withIdentifier: "PhoneNoViewController") as! PhoneNoViewController
        nextvc.modalPresentationStyle = .fullScreen
        
        self.present(nextvc, animated: true, completion: nil)
    }
    
    
    func CallNotesVC(){
        let nextvc =  self.storyboard?.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        nextvc.modalPresentationStyle = .fullScreen
        nextvc.token=Token!
        self.present(nextvc, animated: true, completion: nil)
    }
    
    // timer function create
    private func startTimer(time:Int) {
        totalTime =  60

        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        totalTime -= 1
        TimeLabel.text = "\(timeFormatted(totalTime ))"
        
        if totalTime == 0{
            endTimer()
                }
    }
    //countdown 0 (end ) time stop
    private func endTimer() {
        countdownTimer.invalidate()
        countdownTimer = nil
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }



}
