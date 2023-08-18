//
//  ViewController.swift
//  CreatingCustomSegmentedControl
//
//  Created by Kirill on 30.06.2023.
//

import UIKit

class ViewController: UIViewController {

    let customSegmnetedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customSegmnetedControl.insertSegment(with: CustomImage().setopImage(image: UIImage(systemName: "heart")!, text: "HEart", isImageBeforeText: true), at: 0, animated: true)
        customSegmnetedControl.insertSegment(with: CustomImage().setopImage(image: UIImage(systemName: "heart")!, text: "HEart", isImageBeforeText: false), at: 0, animated: true)
        
        customSegmnetedControl.frame = CGRect(x: 0, y: 0, width: 300, height: 70)
        customSegmnetedControl.center = view.center
        view.addSubview(customSegmnetedControl)
    }


}


