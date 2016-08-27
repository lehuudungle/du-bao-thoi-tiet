//
//  ViewController.swift
//  Iweather
//
//  Created by Admin on 8/26/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(tempRandom())
    }

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var doLabel: UILabel!
    @IBOutlet weak var backgroundImageView
    : UIImageView!
    
    
    var quotes = ["Do any additional setup after loading the view, typically from a nib","Dispose of any resources that can be recreated."," Created by Admin on All rights reserved."]
    var citys = ["Hà Nội","Thanh Hoá","Lào Cai"]
    
    var backgroundImage = ["Boold","Noon","Sun"]
    
    var dau = 0
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    @IBAction func randomButton(sender: AnyObject) {
        randomCity()
        randomQuestion()
        getTemp()
    }
    
    
    @IBAction func changeTemp(sender: AnyObject) {
        
        var numberTemp : Double?
        print(tempLabel.text)
        
        numberTemp = Double(tempLabel.text!)! * 1.8 + 32
        print(numberTemp)
        if(dau == 0){
            numberTemp = Double(tempLabel.text!)! * 1.8 + 32
            doLabel.text = "F"
            dau = 1
            
        }else{
            numberTemp = ((Double(tempLabel.text!)! - 32))/1.8
            doLabel.text = "C"
            dau = 0
        }
        tempLabel.text = String(format: "%2.1f",numberTemp!)
        
    }
    
    func randomCity() -> Void {
        let cityIndex = Int(arc4random_uniform(UInt32(citys.count)))
        cityLabel.text = citys[cityIndex]
    }
    func randomQuestion() -> Void{
        let questionIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        quote.text = quotes[questionIndex]
    
    }
    
    func getTemp() ->Void {
        let randomNumber = String(format: "%2.1f",tempRandom())
        tempLabel.text = randomNumber
    }
    
    func tempRandom() -> Double {
        var getNumber :Double?
        getNumber = Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        if(dau == 1){
            return (getNumber! * 1.8 + 32)
        }
        return getNumber!
    }
}

