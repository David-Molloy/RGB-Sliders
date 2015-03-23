//
//  ViewController.swift
//  RGB Sliders
//
//  Created by David Molloy on 23/03/2015.
//  Copyright (c) 2015 riis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorSquare: UIView!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.objectForKey("red") != nil){
            redSlider.value = defaults.floatForKey("red")
            greenSlider.value = defaults.floatForKey("green")
            blueSlider.value = defaults.floatForKey("blue")
        }

        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "openColor"){
            let newViewController = segue.destinationViewController as UIViewController
            
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }

    @IBAction func updateBackgroundColor() {
        
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(redSlider.value, forKey: "red")
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }

}

