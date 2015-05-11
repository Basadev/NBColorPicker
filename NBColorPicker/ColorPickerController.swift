//
//  ColorPicker.swift
//  NBColorPicker
//
//  Created by Professional on 2015-05-11.
//  Copyright (c) 2015 Ntambwa. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

//Create the delegate protocol
protocol ColorPickerDelegate {
    func colorSelected(controller: ColorPickerController, selectedColor: UIColor)
}

class ColorPickerController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var colorPicker: UICollectionView!
    var collectionView: UICollectionView?
    
    //Set the delegate variable
    var delegate: ColorPickerDelegate?
    
    // Colors list
    var colors = [
        UIColor.redColor(),
        UIColor.blueColor(),
        UIColor.greenColor(),
        UIColor.grayColor(),
        UIColor.yellowColor(),
        UIColor.whiteColor(),
        UIColor.blackColor(),
        UIColor.turquoiseColor(),
        UIColor.greenSeaColor(),
        UIColor.emeraldColor(),
        UIColor.nephritisColor(),
        UIColor.peterRiverColor(),
        UIColor.belizeHoleColor(),
        UIColor.amethystColor(),
        UIColor.wisteriaColor(),
        UIColor.wetAsphaltColor(),
        UIColor.midnightBlueColor(),
        UIColor.sunflowerColor(),
        UIColor.orangeColor(),
        UIColor.carrotColor(),
        UIColor.pumpkinColor(),
        UIColor.alizarinColor(),
        UIColor.pomergranateColor(),
        UIColor.cloudsColor(),
        UIColor.silverColor(),
        UIColor.concreteColor(),
        UIColor.asbestosColor()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.dataSource = self
        colorPicker.delegate = self
        
        // Code to show color picker Programically
        /*let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 20,width: 200,height: 130), collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.backgroundColor = UIColor.whiteColor()
        
        // Horizontal Scrolling
        var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.scrollDirection = scrollDirection
        self.collectionView!.collectionViewLayout = flowLayout
        
        //flowLayout.headerReferenceSize = CGSize(width: 0,height: 3)
        
        //Add to view
        self.view.addSubview(collectionView!)*/
        
    }

    //UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return colors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        
        // Configure the cell
        cell.backgroundColor = colors[indexPath.row]
        cell.layer.cornerRadius = cell.bounds.size.width/2
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            println("\(indexPath.row)");
            self.delegate?.colorSelected(self, selectedColor: colors[indexPath.row])
        //self.dismissViewControllerAnimated(true, completion: {});
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
