//
//  ViewController.swift
//  MasteringProtocol
//
//  Created by Max on 13/08/2015.
//  Copyright (c) 2015 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var numberArray = ["1","1"]
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "ShowPickerDemo" {
      let controller = segue.destinationViewController as? PickerDemoViewContoller
      
    }
    
    
    if segue.identifier == "AddItemViewController" {
      let navigationController = segue.destinationViewController as? UINavigationController
      let addItemViewController = navigationController?.topViewController as? AddItemViewController
      
      if let viewController = addItemViewController {
        viewController.delegate = self
      }
    }
  }

}

extension ViewController:AddItemViewControllerDelegate {
  // MARK: Add Item View Controller Delegate Methods
  func controller(controller: AddItemViewController, didAddItem: String) {
    println("\(didAddItem)")
    // Update Data Source
    self.numberArray.append(didAddItem)
    
    // Reload Table View
    tableView.reloadData()
    
    // Dismiss Add Item View Controller
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}

extension ViewController:UITableViewDelegate {
  
}

extension ViewController:UITableViewDataSource{
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.numberArray.count
    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    
      let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
      cell.textLabel!.text = "\(self.numberArray[indexPath.row])"
      return cell
    
  }
}