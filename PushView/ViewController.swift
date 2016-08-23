//
//  ViewController.swift
//  PushView
//
//  Created by Chung on 8/23/16.
//  Copyright © 2016 newayplus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var lbZing: UILabel!
    
    var duration:NSTimeInterval = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animateWithDuration(duration, animations: {
            self.logo!.alpha = 1
            
        }) { (finished) in
            UIView.animateWithDuration(self.duration, animations: {
                self.lbZing.center = CGPoint(x: self.lbZing!.center.x, y: 100)
                self.lbZing!.alpha = 1
            }) { (finished) in
                UIView.animateWithDuration(self.duration, animations: {
                    self.lbName.center = CGPoint(x: self.lbName!.center.x, y: 500)
                    self.lbName!.alpha = 1
                }) { (finished) in
                    let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("V2") as! View2
                    self.navigationController?.pushViewController(v2, animated: true)
                    
                }
            }
            
            
        }

    }
}

