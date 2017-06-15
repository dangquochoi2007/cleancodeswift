//
//  KeyboardMovable.swift
//  CleanStore
//
//  Created by hoi on 14/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import Foundation
import ObjectiveC
import UIKit

struct KeyboardMovableKeys {
    
    static var keyboardShowObserver = "km_keyboardShowObserver"
    static var keyboardHideObserver = "km_keyboardHideObserver"
}

protocol KeyboardMovable: class {
    
    var selectedField: UITextField? { get }
    var offset: CGFloat { get set }
}

extension KeyboardMovable where Self: UIViewController {
    
    var notificationCenter: NotificationCenter { return .default }
    
    var keyboardShowObserver: NSObjectProtocol? {
        
        get {
            return objc_getAssociatedObject(self, &KeyboardMovableKeys.keyboardShowObserver) as? NSObjectProtocol
        }
        
        set (newValue) {
            objc_setAssociatedObject(self, &KeyboardMovableKeys.keyboardShowObserver, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    var keyboardHideObserver: NSObjectProtocol? {
    
        get {
            return objc_getAssociatedObject(self, &KeyboardMovableKeys.keyboardHideObserver) as? NSObjectProtocol
        }
        
        set (newValue) {
            objc_setAssociatedObject(self, &KeyboardMovableKeys.keyboardHideObserver, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    func initKeyboardMover() {
        
        keyboardShowObserver = notificationCenter.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { notification in
            
            self.keyboardWillShow(notification)
        }
        
        keyboardHideObserver = notificationCenter.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { notification in
            
            self.keyboardWillHide(notification)
        }
    }
    
    
    func destroyKeyboardMover() {
    }
    
    func keyboardWillShow(_ notification: Notification) {
        guard let info:NSDictionary = (notification as NSNotification).userInfo as NSDictionary? else {

            return
        }
        
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight:CGFloat = keyboardSize.height

        animate(directionUp: true, keyboardHeight: keyboardHeight)
    }
    
    
    func keyboardWillHide(_ notification: Notification) {
    
        guard let info:NSDictionary = (notification as NSNotification).userInfo as NSDictionary? else {
        
            return
        }
        
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardHeight: CGFloat = keyboardSize.height
        animate(directionUp: false, keyboardHeight: keyboardHeight)
    }
    
    func animate(directionUp: Bool, keyboardHeight: CGFloat) {
    
        guard let selectedField = selectedField else {
            print("KEYBOARD MOVER: MUST PROVIDE A SELECTED FIELD: ABORTING.")
            return
        }
        
        
        var textFieldFrame: CGRect = selectedField.frame
        var textFieldCenter: CGPoint = selectedField.center
        
        if let superView = selectedField.superview, superView != view {
            textFieldFrame = superView.convert(selectedField.frame, to: view)
            textFieldCenter = superView.convert(selectedField.center, to: view)
        }
        
        let fieldPoint = CGPoint(x: 0, y: textFieldFrame.origin.y + textFieldFrame.size.height)
        let visibleRect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - keyboardHeight)
        
        if (visibleRect.contains(fieldPoint)) {
            
            print("FIELD VISIBLE: NOT MOVING")

        } else {
            
            //Reset frame view
            print("FIELD NOT VISIBLE: MOVING")
            view.frame = view.frame.offsetBy(dx: 0, dy: -offset)
            UIView.animate(withDuration: 0.35, delay: 0, options: UIViewAnimationOptions(), animations: {
                
                if directionUp {
                    
                    let centerInvisibleRect = CGPoint(x: visibleRect.width / 2, y: visibleRect.height / 2)
                    let y1 = centerInvisibleRect.y
                    let y2 = textFieldCenter.y
                    
                    var offset = y1 - y2
                    
                    if -offset > keyboardHeight {
                        offset = -keyboardHeight
                    }
                    
                    self.offset = offset
                } else {
                    self.offset = 0.0
                }
            }, completion: nil)

        }
    }
    
    
}
