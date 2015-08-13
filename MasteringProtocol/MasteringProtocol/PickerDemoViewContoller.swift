//
//  PickerDemoViewContoller.swift
//  MasteringProtocol
//
//  Created by Max on 13/08/2015.
//  Copyright (c) 2015 Max. All rights reserved.
//

import UIKit

class PickerDemoViewContoller: UIViewController {

  @IBOutlet weak var lblDemo: UILabel!
  @IBOutlet weak var pckOptions: UIPickerView!
  
  @IBOutlet weak var textFieldMax: UITextField!
  
  var fifaWinners = ["Germany 2014", "Spain (2010)", "Italy (2006)",
    "Brazil (2002)"]
  var keyboard:MyKeyBoard!
  override func viewDidLoad() {
    super.viewDidLoad()
    keyboard = MyKeyBoard(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 270))
    keyboard.delegate  = self
    textFieldMax.inputView = keyboard
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

extension PickerDemoViewContoller: UIPickerViewDataSource{
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return fifaWinners.count
  }
}

extension PickerDemoViewContoller: UIPickerViewDelegate{
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    return fifaWinners[row]
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.lblDemo.text = fifaWinners[row]
  }
}

extension PickerDemoViewContoller: MyKeyBoardDelegate {
  func numberKeyboardInput(number:Int){

  }
  
  func numberKeyboardBackspace(){

  }
  func numberKeyboardSave(){

  }
  func numberKeyboardClear(){

    
  }
  func stringKeyboardInput(str:String){}
  
  
  
  
  //  func numberKeyboardSave()
  //  {
  //
  ////  NSString *tempString = self.currentTextField.text;
  ////
  ////  if(self.currentTextField.tag==0){
  ////  NSLog(@"%ld",(long)self.currentTextField.tag);
  ////  [self addToNumberArray:tempString];
  ////
  ////  }else
  ////  {
  ////  [self updateTheNumber:tempString];
  ////  }
  ////  NSLog(@"dataList%@",self.dataList);
  //  }
  //
  //  func numberKeyboardClear()
  //  {
  ////  NSLog(@"Cancel");
  ////  [self.currentTextField endEditing:YES];
  ////  [self dismiss:self.alert];
  //  }
  
}

