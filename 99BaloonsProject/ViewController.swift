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
    var currentNumber = 0                                                // iniciramo varijablu koja ćemo iskoristiti u randomizaciji broja da se slike ne ponavljaju 2 puta za redom
    
    
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
        
        var x: Int                                                        // uvodimo varijablu x da izbjegnemo da currentIndex bude manji od 0
        
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
        
        let baloon = baloons[currentIndex - x]                            // svaki put kad pritisnemo dugme, pristupamo balonu s trenutnim indexom i prikazujemo ga na ekranu
        
        numberBaloonsLabel.text = "\(baloon.number + 1) baloon"           // pristupamo broju trenutne instance dodajemo 1 (da izbjegnemo 0) i ispisujemo ga
        randomBaloonImageView.image = baloon.image                        // pristupamo slici trenutne instance i pokazujemo je
        
        if currentIndex > 1 {                                             // if statement to check if currentIndex is greater than 1 (start of Array)
            UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {  // animiramo tranziciju između slika
            }, completion: {(finished:Bool) -> () in })
            
            currentIndex -= 1                                             // ako je veći od 1 umanjujemo index za 1, tj. prelazimo na prijašnju instancu balona
        }
        else {
            currentIndex = 1                                              // ako nije veći od 1, onda dodjeljujemo currentIndex vrijednost 1
        }
        
    }

    
    @IBAction func nextBaloonButtonPressed(sender: UIBarButtonItem) {     // Our Next button pressed action
        
        
        
        let baloon = baloons[currentIndex]                                // svaki put kad pritisnemo dugme, pristupamo balonu s trenutnim indexom i prikazujemo ga na ekranu
        
        numberBaloonsLabel.text = "\(baloon.number + 1) baloon"           // pristupamo broju trenutne instance dodajemo 1 (da izbjegnemo 0) i ispisujemo ga
        randomBaloonImageView.image = baloon.image                        // pristupamo slici trenutne instance i pokazujemo je
        
        if currentIndex < 98 {                                            // if statement to check if currentIndex is less than 98 (end of Array)
            UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {  // animiramo tranziciju između slika
            }, completion: {(finished:Bool) -> () in })
            
            currentIndex += 1                                             // ako je manji od 98 uvećavamo index za 1, tj. prelazimo na sljedeću instancu balona
        }
        else {
            currentIndex = 98                                              // ako nije manji od 98, onda ga ostavljamo da stoji na 98
        }
    }
    
    // helper function that should normaly go to viewDidLoad, but this make it clean, we will call the function in viewDidLoad
    
    func createBaloons () {                                               // create 99 baloons function
        for var baloonCount = 0; baloonCount <= 98; baloonCount++ {       // for loop that adds 1 to balooncount every time
            var baloon = Baloon()                                         // creating variable that will be an instance of baloon (do this 99 times)
            baloon.number = baloonCount                                   // each baloon instance getting it's number from 1 to 99
            

            var randomNumber: Int                                         // inicijaliziramo varijablu randomNumber
            
            do {                                                          // DO randomNumber WHILE
                    randomNumber = Int(arc4random_uniform(UInt32(4)))     // creating random number that is used for switch statement (0-3)
            } while currentNumber == randomNumber                         // (sve dok je currentNumber jednak randomNumber)
            
            currentNumber = randomNumber                                  // kad uvijet postane neistinit, tj. dobijemo broj drugačiji od prijašnjeg...
                                                                          //... currentNumber poprima vrijednost randomNumber i tako nema šanse da se index ponovi
            

            
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

