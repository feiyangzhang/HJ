//
//  ViewController.swift
//  KVODemo
//
//  Created by Leon on 15/9/22.
//  Copyright (c) 2015年 Feiyang. All rights reserved.
//
/*

观察者模式又称KVO, Key-Value Observing，它提供一种机制，当指定的对象的属性被修改后，则对象就会接受到通知。每次指定的被观察的对象的属性被修改后，KVO自动通知相应的观察者。
注意的一点就是要通过setValue(value: AnyObject?, forKey key: String)才有效
*/
import UIKit

class ViewController: UIViewController {
    var person:Person?
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        person = Person(pName: "Feiyang", pMoney:"10000")
        person!.addObserver(self, forKeyPath: "name", options:NSKeyValueObservingOptions.New  | .Old, context: nil)
        person!.addObserver(self, forKeyPath: "money", options:NSKeyValueObservingOptions.New  | .Old, context: nil)
        self.moneyLabel.text = person?.money
        self.nameLabel.text = person?.name
    }
    
     override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if(keyPath == "name") {
             self.nameLabel.text = person?.name
        }
        else if (keyPath == "money") {
            self.moneyLabel.text = person?.money
        }
    }
   
    @IBAction func testKVO(sender: UIButton) {
        person!.setValue("20000", forKey: "money")
        // 这样设置是无效的
        person!.name = "XXX"
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

