//
//  ViewController.swift
//  BoxMovingProgramaticUI
//
//  Created by Md. Zahidul Islam Mazumder on 11/1/21.
//

import UIKit

class ViewController: UIViewController {

    var boxHeight:NSLayoutConstraint!
    var boxWidth:NSLayoutConstraint!
    var boxTop:NSLayoutConstraint!
    var boxTrailing:NSLayoutConstraint!
    var boxCenter:NSLayoutConstraint!
    
    let box:UIView = {
        let box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .white
        box.layer.cornerRadius = 8
        return box
    }()
    
    lazy var imageView:UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "sunrise"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.frame = view.frame
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        view.addSubview(box)
        
        boxHeight = box.heightAnchor.constraint(equalToConstant: 125)
        boxWidth = box.widthAnchor.constraint(equalToConstant: 125)
        boxTop = box.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        boxCenter = box.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        boxCenter.isActive = true
        
        boxTop.isActive = true
        boxWidth.isActive = true
        boxHeight.isActive = true
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(dragDownGesture))
            swipeDown.direction = .down
            self.box.addGestureRecognizer(swipeDown)
        
    }


    @objc func dragDownGesture(){
        print("njk")
        boxCenter.isActive = false
        boxTop.isActive = false
        boxTop = box.topAnchor.constraint(equalTo: view.bottomAnchor,constant: -200)
        boxTop.isActive = true
        
        
        boxTrailing = box.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -10)
        boxTrailing.isActive = true
    }
    
}

