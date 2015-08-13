//
//  MyKeyBoard.swift
//  ElectrivLifeSwift
//
//  Created by Max on 15/7/20.
//  Copyright (c) 2015年 appscore. All rights reserved.
//

import Foundation
import UIKit

protocol MyKeyBoardDelegate: class{
  func numberKeyboardInput(number:Int)
  func numberKeyboardBackspace()
  func numberKeyboardSave()
  func numberKeyboardClear()
  func stringKeyboardInput(str:String)
}

class MyKeyBoard: UIView {
  let kLineWidth = 1
  let kNumFont = UIFont.systemFontOfSize(27)
  weak var delegate: MyKeyBoardDelegate?
  var frameXArray = []
  var frameWArray = []
  var linePositionArray = []
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    var screenRect = UIScreen.mainScreen().bounds
    var screenWidth = screenRect.size.width;
    var screenHeight = screenRect.size.height;
    println("\(screenWidth)\(screenHeight)");
    self.bounds = CGRectMake(0, 0, screenWidth, 270);
    
    switch screenWidth {
    case 414.00:
      linePositionArray = [138,276]
      frameXArray = [0,139,277]
      frameWArray = [137,136,137]
    case 375.00:
      linePositionArray = [124,250]
      frameXArray = [0,126,251]
      frameWArray = [124,123,124]
    case 320.00:
      linePositionArray = [105,214]
      frameXArray = [0,105,214]
      frameWArray = [106,110,106]
    default:
      println("Just suitable for i5,6,6plus")
    }
    
    for i in 0...4{
      for j in 0...2 {
        var button = creatButtonWithX(i, y: j)
        self.addSubview(button)
      }
    }
    
  }
  
  func creatButtonWithX(x:Int,y:Int) -> UIButton{
    var button: UIButton
    var frameX: Float
    var frameW: Float
    switch y
    {
    case 0:
      frameX = frameXArray.objectAtIndex(0) as! Float
      frameW = frameWArray.objectAtIndex(0) as! Float
      break;
    case 1:
      frameX = frameXArray.objectAtIndex(1) as! Float
      frameW = frameWArray.objectAtIndex(1) as! Float
      break;
    case 2:
      frameX = frameXArray.objectAtIndex(2) as! Float
      frameW = frameWArray.objectAtIndex(2) as! Float
      break;
    default:
      frameX = frameXArray.objectAtIndex(0) as! Float
      frameW = frameWArray.objectAtIndex(0) as! Float
      break;
    }
    var frameY = 54*x
    button = UIButton()
    button.frame = CGRectMake(frameX.f, frameY.f, frameW.f, 54.f)
    
    var num = y + 3*x + 1
    button.tag = num
    button .addTarget(self, action:"clickButton:", forControlEvents: .TouchUpInside)
    var colorNormal: UIColor = UIColor(red: 252/255.0, green: 252/255.0 , blue: 252/255.0, alpha: 1)
    var colorHightlighted: UIColor = UIColor(red: 186.0/255, green: 189.0/255 , blue: 194.0/255, alpha: 1)
    if num == 13 || num == 15
    {
      var colorTemp: UIColor = colorNormal
      colorNormal = colorHightlighted
      colorHightlighted = colorTemp
    }
    
    if num == 1 || num == 2 || num == 3
    {
      var colorTemp: UIColor = colorNormal
      colorNormal = UIColor.orangeColor()
      colorHightlighted = colorTemp
    }
    
    button.backgroundColor = colorNormal
    var imageSize:CGSize = CGSizeMake(frameW.f, 54.f)
    UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.mainScreen().scale)
    colorHightlighted.set()
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height))
    var pressedColorImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    button.setImage(pressedColorImg, forState: .Highlighted)
    
    var label:UILabel = UILabel(frame: CGRectMake(0.f, 15.f, frameW.f, 28.f))
    label.textColor = UIColor.blackColor()
    label.textAlignment = .Center
    
    if (num == 1){
      label.text = "Cancel"
    }
    else if (num == 2){
      
      label.text = "<-"
      
    }
    else if (num == 3){
      
      label.text = "Save"
      
    }
    
    if (3 < num && num < 13)
    {
      label.text = NSString(format:"%ld",num-3) as String
      label.font = kNumFont
      
    }
    else if (num == 13)
    {
      
      label.text = "-"
      
    }
    else if (num == 14)
    {
      
      label.text = "0"
      label.font = kNumFont
      
    }
    else if (num == 15)
    {
      
      label.text = "+"
      
    }else{
      NSLog("adsad")
      
    }
    button.addSubview(label)
    return button
  }
  
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    
  }
  
  func clickButton(sender:UIButton) {
    if (sender.tag == 1)
    {
      delegate?.numberKeyboardClear()
      return
    }
    else if(sender.tag == 2)
    {
      delegate?.numberKeyboardBackspace()
      
    }else if(sender.tag == 3)
    {
      delegate?.numberKeyboardSave()
      
    }else if(sender.tag == 13)
    {
      delegate?.stringKeyboardInput("-")
      
    }else if(sender.tag == 14)
    {
      var num:NSInteger  = 0
      delegate?.numberKeyboardInput(num)
    }
    else if(sender.tag == 15)
    {
      delegate?.stringKeyboardInput("+")
    }
    else if (3 < sender.tag && sender.tag < 13)
    {
      var num:NSInteger = sender.tag - 3;
      delegate?.numberKeyboardInput(num)
    }
  }
}



extension Float {
  var f: CGFloat { return CGFloat(self) }
}
extension Int {
  var f: CGFloat { return CGFloat(self) }
}