//
//  ViewController.swift
//  CoreSpotlightTest
//
//  Created by mac on 15/12/23.
//  Copyright © 2015年 yueDi. All rights reserved.
//

import UIKit
import CoreSpotlight
class ViewController: UIViewController {

    var index = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func insert(sender: UIButton)
    {
        print("插入")
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: "aa")
        attributeSet.title = "测测对不对,下标是\(index)"
        attributeSet.contentDescription = "这个好牛逼牛逼呀"
        
        let item = CSSearchableItem(uniqueIdentifier: "unique\(index)", domainIdentifier: "aaa", attributeSet: attributeSet)
        
    CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([item]) { (err) -> Void in
            print(err)
            self.index++
        }
    }
    @IBAction func upDate(sender: UIButton)
    {
        print("更新")
//        CSSearchableIndex.defaultSearchableIndex().self
//        let item = CSSearchableItem(uniqueIdentifier: "unique\(index)", domainIdentifier: "aaa", attributeSet: )


    }
    @IBAction func dele(sender: UIButton)
    {
        print("删除")
        let delIndex = "unique\(index)"
        if index == 0{
        return
        }
    CSSearchableIndex.defaultSearchableIndex().deleteSearchableItemsWithIdentifiers([delIndex]) { (err) -> Void in
        if (err == nil) {
           self.index--
            print("删除 \(self.index)")
        }
    }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

