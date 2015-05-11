//
//  ViewController.swift
//  NBColorPicker
//
//  Created by Professional on 2015-05-11.
//  Copyright (c) 2015 Ntambwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate,ColorPickerDelegate {

    var myColorPicker: ColorPickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myColorPicker = ColorPickerController()
    }
    
    //Implement the Color Picker Delegate Method
    func colorSelected(controller: ColorPickerController, selectedColor: UIColor) {
        self.view.backgroundColor = selectedColor
    }
    
    @IBAction func showColorPicker(sender: AnyObject) {
        myColorPicker = ColorPickerController()
        //myColorPicker!.modalPresentationStyle = UIModalPresentationStyle.Popover
        //myColorPicker!.popoverPresentationController!.delegate = self
        myColorPicker!.delegate = self
        self.presentViewController(myColorPicker!, animated: true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverSegue" {
            let popoverViewController = segue.destinationViewController as! ColorPickerController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
            popoverViewController.delegate = self
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

