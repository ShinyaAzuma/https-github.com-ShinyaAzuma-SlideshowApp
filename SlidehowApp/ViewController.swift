//
//  ViewController.swift
//  SlidehowApp
//
//  Created by 東真也 on 2019/04/28.
//  Copyright © 2019 NEXTSTAGE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var preButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var timer: Timer!
    let slideImages:[String] = ["1.jpg","2.jpg","3.jpg"]
    var index: Int = 0
    
    
    @IBAction func preButton(_ sender: Any) {
        if self.timer == nil{
            self.index -= 1
            if self.index < 0 {
                self.index = slideImages.count - 1
            }
            slideImageView.image = UIImage(named:self.slideImages[self.index])
            
        }
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        if self.timer == nil {
            self.index += 1
            if self.index == slideImages.count{
                self.index = 0
            }
            slideImageView.image = UIImage(named:self.slideImages[self.index])
        }
    }
    
    @IBAction func startButton(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
            // 進む・戻るボタンの無効化
            preButton.isEnabled = false
            nextButton.isEnabled = false
            startButton.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
            // 進む・戻るボタンの有効化
            preButton.isEnabled = true
            nextButton.isEnabled = true
            startButton.setTitle("再生", for: .normal)
        }
    }
    
   
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slideImageView.image = UIImage(named:self.slideImages[self.index])
        slideImageView.isUserInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        slideImageView.addGestureRecognizer(myTap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateImage(timer: Timer) {
        self.index += 1
        if self.index == slideImages.count {
            self.index = 0
        }
        slideImageView.image = UIImage(named: self.slideImages[self.index])
    }
   @objc func tapGesture(sender: UIGestureRecognizer){
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            preButton.isEnabled = true
            nextButton.isEnabled = true
        }

    let enlargedViewController = storyboard?.instantiateViewController(withIdentifier: "enlarged") as! EnlargedViewController
    enlargedViewController.slide = self.slideImages[self.index]
    self.present(enlargedViewController, animated: true, completion: nil)
    }
    
    
}
