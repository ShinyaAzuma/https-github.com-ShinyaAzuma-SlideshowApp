//
//  EnlargedViewController.swift
//  SlidehowApp
//
//  Created by 東真也 on 2019/04/29.
//  Copyright © 2019 NEXTSTAGE. All rights reserved.
//

import UIKit

class EnlargedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var slide:String = "1.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: slide)
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
