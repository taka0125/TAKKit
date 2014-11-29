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
    
    NSLog("name = \(NSStringFromClass(CustomView.self)), identifier = \(CustomView.tak_defaultIdentifier())")
    NSLog("name = \(NSStringFromClass(UIView.self)), identifier = \(UIView.tak_defaultIdentifier())")
    
    modifyFrame()
    modifyOrigin()
    modifySize()
  }
  
  // MARK: - Private Methods
  
  private func modifyFrame() {
    let v = UIView(frame: CGRectZero)
    NSLog("[modifyFrame] before = \(v.frame)");
    v.tak_modifyFrame {
      (var f) -> CGRect in
      f.origin.x = 1;
      f.origin.y = 2;
      f.size.width = 3;
      f.size.height = 4;
      return f
    }
    NSLog("[modifyFrame] after = \(v.frame)");
  }
  
  private func modifyOrigin() {
    let v = UIView(frame: CGRectZero)
    NSLog("[modifyOrigin] before = \(v.frame)");
    v.tak_modifyOrigin {
      (var o) -> CGPoint in
      o.x = 1;
      o.y = 2;
      return o
    }
    NSLog("[modifyOrigin] after = \(v.frame)");
  }
  
  private func modifySize() {
    let v = UIView(frame: CGRectZero)
    NSLog("[modifySize] before = \(v.frame)");
    v.tak_modifySize {
      (var s) -> CGSize in
      s.width = 1;
      s.height = 2;
      return s
    }
    NSLog("[modifySize] after = \(v.frame)");
  }
}