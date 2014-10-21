//
//  ViewController.swift
//  99BaloonsProject
//
//  Created by Igor Majer on 21.10.2014..
//  Copyright (c) 2014. Igor Majer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
                                                                         // defining our label and imageView
    
    @IBOutlet weak var numberBaloonsLabel: UILabel!
    @IBOutlet weak var randomBaloonImageView: UIImageView!

    var baloons:[Baloon] = []                                            // empty baloons array that will hold our baloons
    var currentIndex = 0                                                 // first instance on the screen index
    var currentNumber = 0                                                // initialization of variable CurrentNumber which we'll use to avoid the possibility that the same image is assigned twice in a row
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBaloons()                                                  // this actually calls the function to create baloons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func prevBaloonButtonPressed(sender: UIBarButtonItem) {     // Our Previous button pressed action
        
        var x: Int                                                        // variable x serves us so we avoid that currentIndex gets less than 0
        
//        if currentIndex == 0 {                                          // we can use IF LOOP or SWITCH STATEMENT to do the same thing
//           x = 0
//        }
//        else if currentIndex == 1 {
//            x = 1
//        }
//        else  {
//            x = 2
//        }

        switch currentIndex {                                             // we can use IF LOOP or SWITCH STATEMENT to do the same thing 
        case 0:
            x = 0
        case 1:
            x = 1
        default:
            x = 2
        }
        
        let baloon = baloons[currentIndex - x]                            // by pressing the button, we get access  to baloon instance with current index (minus x)
        
        numberBaloonsLabel.text = "\(baloon.number + 1) baloon"           // number property of current instance (we add 1 so instead 0-98 we get 1-99) and print out on the screen
        randomBaloonImageView.image = baloon.image                        // image property of current instance becomes the background image
        
        if currentIndex > 1 {                                             // if statement to check if currentIndex is greater than 1 (start of Array)
            UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {  // animated transition only if it's not begining of array
            }, completion: {(finished:Bool) -> () in })
            
            currentIndex -= 1                                             // if currentIndex is greater than 1, we dimminish the index for 1, (going to lower baloon index)
        }
        else {
            currentIndex = 1                                              // if is equal to 1, it stays 1 (start of the array)
        }
        
    }

    
    @IBAction func nextBaloonButtonPressed(sender: UIBarButtonItem) {     // Our Next button pressed action
        
        
        
        let baloon = baloons[currentIndex]                                // by pressing the button, we get access  to baloon instance with current index (minus x)
        
        numberBaloonsLabel.text = "\(baloon.number + 1) baloon"           // number property of current instance (we add 1 so instead 0-98 we get 1-99) and print out on the screen
        randomBaloonImageView.image = baloon.image                        // image property of current instance becomes the background image
        
        if currentIndex < 98 {                                            // if statement to check if currentIndex is less than 98 (end of Array)
            UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {  // animated transition only if not end of array
            }, completion: {(finished:Bool) -> () in })
            
            currentIndex += 1                                             // if currentIndex is less than 98, we add 1 to index, (going to next baloon index)
        }
        else {
            currentIndex = 98                                              // if is equal to 98, it stays 98 (end of the array)
        }
    }
    
    // helper function that should normaly go to viewDidLoad, but this make it clean, we will call the function in viewDidLoad
    
    func createBaloons () {                                               // create 99 baloons function
        for var baloonCount = 0; baloonCount <= 98; baloonCount++ {       // for loop that adds 1 to baloonCount every time
            var baloon = Baloon()                                         // creating variable that will be an instance of baloon (do this 99 times)
            baloon.number = baloonCount                                   // each baloon instance getting it's number from 0 to 98
            

            var randomNumber: Int                                         // initialisation of variable randomNumber
            
            do {                                                          // DO randomNumber WHILE
                    randomNumber = Int(arc4random_uniform(UInt32(4)))     // creating random number that is used for switch statement (0-3)
            } while currentNumber == randomNumber                         // (while currentNumber is equal to randomNumber)
            
            currentNumber = randomNumber                                  // when the statement is no longer true, and we get a different number than before
                                                                          //... currentNumber gets the value of randomNumber and there is no repetition of numbers
            

            
            switch randomNumber {                                         // switch statement assigning images to generated random numbers
            case 1:
                baloon.image = UIImage(named: "RedBalloon1.jpg")          // if number is 1
            case 2:
                baloon.image = UIImage(named: "RedBalloon2.jpg")          // if number is 2
            case 3:
                baloon.image = UIImage(named: "RedBalloon3.jpg")          // if number is 3
            default:
                baloon.image = UIImage(named: "RedBalloon4.jpg")          // if number is 0
            }
            self.baloons.append(baloon)                                   // appends every baloon instance to ballons array (isto baloons += [baloon])
        }
    }
}

