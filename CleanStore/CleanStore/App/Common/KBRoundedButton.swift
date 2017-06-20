//
//  KBRoundedButton.swift
//  CleanStore
//
//  Created by hoi on 19/6/17.
//  Copyright © 2017 hoi. All rights reserved.
//

import UIKit
import QuartzCore

enum KBRoundedButtonBorder: Int {
    
    case all
    case top
    case bottom
    case left
    case right
    case topBottom
    case leftRight
}

@IBDesignable
class KBRoundedButton: UIButton {
    
    @IBInspectable var borderType: Int {
        get {
            return self.border.rawValue
        }
        
        set(index) {
            self.border = KBRoundedButtonBorder(rawValue: index) ?? .all
        }
    }
    
    private var border: KBRoundedButtonBorder = .all {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderRadius:CGFloat = 3.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor(red: 207.0/255.0, green: 208.0/255.0, blue: 209.0/255.0, alpha: 1) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var backgroundColorForStateNormal:UIColor = UIColor(red: 18.0/255.0, green: 151.0/255.0, blue: 147.0/255.0, alpha: 1) {
        didSet {
        }
    }
    @IBInspectable var backgroundColorForStateSelected: UIColor = UIColor.clear {
        didSet {
        }
    }
    @IBInspectable var backgroundColorForStateHighlighted: UIColor = UIColor.clear {
        didSet {
        }
    }
    @IBInspectable var backgroundColorForStateSelectedAndHighlighted: UIColor = UIColor.clear {
        didSet {
        }
    }
    @IBInspectable var backgroundColorForStateDisabled: UIColor = UIColor.clear {
        didSet {
            
        }
    }

    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard border != .all else {
            setLayerProperties()
            return
        }
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(borderColor.cgColor)
        context?.setLineWidth(borderWidth)
        drawBorder(context, rect: rect)
        context?.strokePath()
    }
    
    
    func setup() {
        // TO-DO
    }
    
    func setLayerProperties() {
        layer.backgroundColor = backgroundColorForStateNormal.cgColor
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = borderRadius
    }
    
    func resetLayerPeroperties() {
        layer.backgroundColor = backgroundColorForStateNormal.cgColor
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0.0
        layer.cornerRadius = 0.0
    }
    
    func drawBorder(_ context: CGContext?, rect: CGRect) {

        switch border {
        case .top:
            drawTopBorder(context, rect: rect)
        case .bottom:
            drawBottomBorder(context, rect: rect)
        case .right:
            drawRightBorder(context, rect: rect)
        case .left:
            drawLeftBorder(context, rect: rect)
        case .topBottom:
            drawTopBorder(context, rect: rect)
            drawBottomBorder(context, rect: rect)
        case .leftRight:
            drawLeftBorder(context, rect: rect)
            drawRightBorder(context, rect: rect)
        case .all:
            break
        }
    }
    
    
    func drawTopBorder(_ context: CGContext?, rect: CGRect) {
        context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
    }
    
    func drawBottomBorder(_ context: CGContext?, rect: CGRect) {
        context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    }
    
    func drawLeftBorder(_ context: CGContext?, rect: CGRect) {
        context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    }
    
    func drawRightBorder(_ context: CGContext?, rect: CGRect) {
        context?.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    }
    
    
}
