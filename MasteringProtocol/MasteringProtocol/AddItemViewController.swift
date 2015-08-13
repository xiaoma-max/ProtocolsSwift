//
//  AddItemViewController.swift
//  MasteringProtocol
//
//  Created by Max on 13/08/2015.
//  Copyright (c) 2015 Max. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
  func controller(controller: AddItemViewController, didAddItem: String)
}

class AddItemViewController: UIViewController {
  
  @IBOutlet var textField: UITextField!
  
  var delegate: AddItemViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  
  @IBAction func cancel(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func create(sender: AnyObject) {
    let item = self.textField.text
    
    if let delegate = self.delegate {
      delegate.controller(self, didAddItem: item)
    }
  }
  
}
