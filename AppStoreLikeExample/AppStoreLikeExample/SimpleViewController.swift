//
//  SimpleViewController.swift
//  AppStoreLikeExample
//
//  Created by piyush sinroja on 30/05/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollmain: UIScrollView!
    @IBOutlet weak var constrViewUper: NSLayoutConstraint!
    @IBOutlet weak var viewUper: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollmain.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        constrViewUper.constant =  -(scrollView.contentOffset.y)
        //  print(constrViewUper.constant)
        if scrollView.contentOffset.y<=0 {
            print(scrollView.contentOffset.y)
            constrViewUper.constant =  0
        }
        
    }
}
