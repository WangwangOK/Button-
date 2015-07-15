//
//  ViewController.swift
//  Button边界问题探究
//
//  Created by 王望 on 15/6/11.
//  Copyright (c) 2015年 王望. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.button.addTarget(self, action: "btnDrag:withEvent:", forControlEvents: UIControlEvents.TouchDragInside)
        self.button.addTarget(self, action: "btnDrag:withEvent:", forControlEvents: UIControlEvents.TouchDragOutside)
//        self.button.continueTrackingWithTouch(<#touch: UITouch#>, withEvent: <#UIEvent#>)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnDrag(sender:UIButton,withEvent events:UIEvent){
        var touch: AnyObject = ((events.allTouches()!) as NSSet).anyObject()!
        var boundsExtension:CGFloat = CGFloat(0.0)
        var outBounds:CGRect = CGRectInset(sender.bounds, CGFloat(-1) * boundsExtension, CGFloat(-1) * boundsExtension)
        var touchOutside:Bool = !CGRectContainsPoint(outBounds, touch.locationInView(sender))
        if(touchOutside){
            var previewTouchInside:Bool = CGRectContainsPoint(outBounds, touch.locationInView(sender))
            if(previewTouchInside){
                // UIControlEventTouchDragExit
                //print("UIControlEventTouchDragExit\n")
                self.button.setTitle("UIControlEventTouchDragExit", forState: UIControlState.Normal)
            }else{
                // UIControlEventTouchDragOutside
                //print("UIControlEventTouchDragOutside\n")
                self.button.setTitle("UIControlEventTouchDragOutside", forState: UIControlState.Normal)
            }
        }else{
            var previewTouchOutside:Bool = !CGRectContainsPoint(outBounds, touch.locationInView(sender))
            if(previewTouchOutside){
                // UIControlEventTouchDragEnter
                //print("UIControlEventTouchDragEnter\n")
                self.button.setTitle("UIControlEventTouchDragEnter", forState: UIControlState.Normal)
            }else{
                // UIControlEventTouchDragInside
                //print("UIControlEventTouchDragInside\n")
                self.button.setTitle("UIControlEventTouchDragInside", forState: UIControlState.Normal)
            }
        }
    }
    


}

