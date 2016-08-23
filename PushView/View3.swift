//
//  View3.swift
//  PushView
//
//  Created by Chung on 8/23/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class View3: UIViewController {
    var time: Int = 0
    var dapAn: Int = 0
    var dung: Int = 0
    var sai: Int = 0
    var timer = NSTimer()
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var lbResult: UILabel!
    
    @IBOutlet weak var lbNum1: UILabel!
    
    @IBOutlet weak var lbNum2: UILabel!
    
    @IBOutlet weak var lbDau: UILabel!
    
    
    @IBOutlet weak var lbRight: UILabel!
    
    @IBOutlet weak var lbWrong: UILabel!
    
    @IBOutlet weak var lbTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        dapAn = randomPosition(setRandom())
        start()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("countDown"), userInfo: nil, repeats: true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    func countDown() {
        time = time - 1
        lbTime.text = String(time)
        if time == 0 {
            sai += 1
            lbWrong.text = String(sai)
            dapAn = randomPosition(setRandom())
            time = 10
        }
    }
    func start(){
        time = 10
        
        
    }
    func resetTimer() {
        //        timer.invalidate()
    }
    
    @IBAction func btn1(sender: UIButton) {
        if dapAn == 1 {
            dung += 1
            lbRight.text = String(dung)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
        }else{
            sai += 1
            lbWrong.text = String(sai)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
        }
    }
    
    @IBAction func btn2(sender: UIButton) {
        if dapAn == 2 {
            dung += 1
            lbRight.text = String(dung)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
            
        }else{
            sai += 1
            lbWrong.text = String(sai)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
            
        }
        
    }
    
    @IBAction func btn3(sender: UIButton) {
        if dapAn == 3 {
            dung += 1
            lbRight.text = String(dung)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
        }else{
            sai += 1
            lbWrong.text = String(sai)
            dapAn = randomPosition(setRandom())
            resetTimer()
            start()
        }
        
    }
    
    
    func setRandom()-> Int {
        var result : Int = 0
        let random1 = Int(arc4random_uniform(5)+1)
        let random2 = Int(arc4random_uniform(5)+1)
        let randomDau = Int(arc4random_uniform(3)+1)
        lbNum1.text = String(random1)
        lbNum2.text = String(random2)
        lbDau.text = "+"
        switch randomDau {
            
        case 1:
            lbDau.text = "+"
            result = random1 + random2
        case 2:
            lbDau.text = "-"
            if random1 < random2 {
                lbNum1.text = String(random2)
                lbNum2.text = String(random1)
                result = random2 - random1
            }else{
                result = random1 - random2
            }
        case 3:
            lbDau.text = "x"
            result = random2 * random1
        default:
            lbDau.text = "+"
            result = random1 + random2
        }
        return result;
    }
    
    func randomPosition(numb:Int)-> Int {
        var kq : Int = 0
        let randomPos = Int(arc4random_uniform(3)+1)
        switch randomPos {
        case 1:
            btn1.setTitle(String(numb), forState: .Normal)
            btn2.setTitle(String(numb + 1), forState: .Normal)
            btn3.setTitle(String(numb - 1), forState: .Normal)
            kq = 1
        case 2:
            btn1.setTitle(String(numb + 1), forState: .Normal)
            btn2.setTitle(String(numb), forState: .Normal)
            btn3.setTitle(String(numb - 1), forState: .Normal)
            kq = 2
        case 3:
            btn1.setTitle(String(numb - 1), forState: .Normal)
            btn2.setTitle(String(numb + 1), forState: .Normal)
            btn3.setTitle(String(numb), forState: .Normal)
            kq = 3
        default:
            btn1.setTitle(String(numb), forState: .Normal)
            btn2.setTitle(String(numb + 1), forState: .Normal)
            btn3.setTitle(String(numb - 1), forState: .Normal)
            kq = 1
        }
        return kq
    }
}
