//
//  ViewController.swift
//  prueba2
//
//  Created by Carolina Solis on 06/25/21.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    //User Input
    @IBOutlet var name: UITextField!
    
    @IBOutlet var birthmonth: UITextField!
    
    @IBOutlet var displaytext: UITextView!
    
    @IBOutlet var displayname: UITextView!
    
    @IBAction func enterbutton(_ sender: Any) {
        //Print name
        displayname.text = "Welcome, \(name.text!)!"
    
        //Options based on birth months
        if(birthmonth.text == "January"){
            displaytext.text = "Your birthstone: Red Garnet\nYour birth flower: Carnations\nFun Fact: Most couples tend to divorce on January than on any other month of the year"
        }
        else if(birthmonth.text == "February"){
            displaytext.text = "Your birthstone: Amethyst\nYour birth flower: Primrose\nFun Fact: February is the only month that can pass without a full moon"
        }
        else if(birthmonth.text == "March"){
            displaytext.text = "Your birthstone: Aquamarine\nYour birth flower: Daffodil\nFun Fact: March is the time of the year when animals begin waking from hibernation"
        }
        else if(birthmonth.text == "April"){
            displaytext.text = "Your birthstone: Diamond \nYour birth flower: Daisy\nFun Fact: America's 1st astronauts were announced by NASA on April 9th, 1959"
        }
        else if(birthmonth.text == "May"){
            displaytext.text = "Your birthstone: Emerald\nYour birth flower: Lily of the Valley\nFun Fact: No month ever begins or ends on the same day of the week as May"
        }
        else if(birthmonth.text == "June"){
            displaytext.text = "Your birthstone: Red Garnet\nYour birth flower: Carnations\nFun Fact: June is Accordion Awareness and Papaya Month"
        }
        else if(birthmonth.text == "July"){
            displaytext.text = "Your birthstone: Ruby\nYour birth flower: Larkspur Water Lily\nFun Fact: July is, on average, the warmest month of the year in the Northern Hemisphere"
        }
        else if(birthmonth.text == "August"){
            displaytext.text = "Your birthstone: Agate\nYour birth flower: Gladiolus\nFun Fact: August is named after Augustus Caesar"
        }
        else if(birthmonth.text == "September"){
            displaytext.text = "Your birthstone: Sapphire\nYour birth flower: Aster\nFun Fact: Romans believed September was looked after by the God of Fire"
        }
        else if(birthmonth.text == "October"){
            displaytext.text = "Your birthstone: Tourmaline\nYour birth flower: Marigold\nFun Fact: October ends on the same day of the week as February every year"
        }
        else if(birthmonth.text == "November"){
            displaytext.text = "Your birthstone: Topaz\nYour birth flower: Chrysanthemum\nFun Fact: The full moon is traditionally called the Beaver Moon during November in the US"
        }
        else if(birthmonth.text == "December"){
            displaytext.text = "Your birthstone: Turquoise\nYour birth flower: Narcissus\nFun Fact: The song Jingle Bells, composed during December, was meant to be a Thanksgiving song"
        }
    }
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //edits on viewer did load for user input
        name.delegate = self
        birthmonth.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    //Music
    var audioPlayer: AVAudioPlayer?
    
    @IBAction func musictapped(_ sender: UIButton) {
            let pathToSound = Bundle.main.path(forResource: "ItsMyLife", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
                
            } catch{
                //error handling
            }
        }
    
    @IBAction func pausemusic(_ sender: Any) {
            audioPlayer?.pause()
    }
    
    //Timer
    @IBOutlet var timerlabel: UILabel!
    
    var time = 0 //set variable
    
    var timer = Timer()
    
    @IBAction func start(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        time = 0
        timerlabel.text = ("0")
    }
    
    @objc func action(){
        time += 1
        timerlabel.text = String(time)
    }
    
    //Changing Image
    @IBOutlet var ChangingImageView: UIImageView!
    
    @IBAction func changingimage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
                case 0:
                    ChangingImageView.image = UIImage(named:"heart")!
                case 1:
                    ChangingImageView.image = UIImage(named:"steps")!
                case 2:
                    ChangingImageView.image = UIImage(named:"moon")!
                case 3:
                    ChangingImageView.image = UIImage(named:"lungs")!
                default:
                    ChangingImageView.image = UIImage(named:"lungs")!
                }
    }
}

//Extension for text
extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
