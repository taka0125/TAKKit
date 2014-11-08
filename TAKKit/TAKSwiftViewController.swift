//
//  TAKSwiftViewController.swift
//  TAKKit
//
//  Created by Takahiro Ooishi on 2014/11/08.
//  Copyright (c) 2014年 Takahiro Ooishi. All rights reserved.
//

import Foundation
import UIKit

class TAKSwiftViewController: UIViewController {
  override func viewDidLoad() {
    NSLog("platform => \(UIDevice.currentDevice().tak_platform())")
    
    TAKBlock.runInBackground({
      NSLog("isMainThread = \(NSThread.isMainThread())")
      
      TAKAlert.showWithTitle("title", message: "message")
      
    }, afterDelay: 1.0)
    
    view.backgroundColor = UIColor.tak_RGBColor(0xCCCCCC)
  }
}