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

    var baloons:[Baloon] = []  // empty baloons array that will hold our baloons
    var currentIndex = 0       // first instance on the screen index
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBaloons() // this actually calls the function to create baloons
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Our button pressed action
    
    @IBAction func nextBaloonButtonPressed(sender: UIBarButtonItem) {
        
        
        
        let baloon = baloons[currentIndex] // svaki put kad pritisnemo dugme, pristupamo balonu s trenutnim indexom i prikazujemo ga na ekranu
        
        numberBaloonsLabel.text = "\(baloon.number) baloon"  // pristupamo broju trenutne instance i ispisujemo ga
        randomBaloonImageView.image = baloon.image           // pristupamo slici trenutne instance i pokazujemo je
        
        currentIndex += 1     // povečavamo index za 1, tj. prelazimo na sljedeću instancu balona
        
    }
    
    // helper function that should normaly go to viewDidLoad, but this make it clean, we will call the function in viewDidLoad
    
    func createBaloons () {            // create 99 baloons function
        for var baloonCount = 1; baloonCount <= 99; baloonCount++ {  // for loop that adds 1 to balooncount every time
            var baloon = Baloon()   // creating variable that will be an instance of baloon (do this 99 times)
            baloon.number = baloonCount // each baloon instance getting it's number from 1 to 99
            
            let randomNumber = Int(arc4random_uniform(UInt32(4))) // creating random number that is used for switch statement (0-3)
            
            switch randomNumber {     // switch statement assigning images to generated random numbers
            case 1:
                baloon.image = UIImage(named: "RedBalloon1.jpg") // if number is 1
            case 2:
                baloon.image = UIImage(named: "RedBalloon2.jpg") // if number is 2
            case 3:
                baloon.image = UIImage(named: "RedBalloon3.jpg") // if number is 3
            default:
                baloon.image = UIImage(named: "RedBalloon4.jpg") // if number is 0
            }
            self.baloons.append(baloon)  // appends every baloon instance to ballons array (isto baloons += [baloon])
        }
    }
}

