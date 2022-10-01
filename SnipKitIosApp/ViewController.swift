//
//  ViewController.swift
//  SnipKitIosApp
//
//  Created by D G on 2022/9/26.
//

import UIKit
import SnapKit
import TangramKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        
    
        let S = TGLinearLayout(.vert)
    
        scrollView.addSubview(S)
        
        
        S.tg_top.equal(50)
        S.tg_width.equal(.fill)
        S.tg_height.equal(.fill)
        S.tg_vspace = 10
        S.tg_orientation = .vert
        
        let A = UILabel()
        A.text = "A"
        A.textColor = UIColor(named:"#766868")
        A.tg_left.equal(20)
        A.tg_top.equal(30)
        S.addSubview(A)
        
        let B = UILabel()
        B.text = "B"
        ///文本居中
        B.textAlignment = .center
        B.tg_left.equal(20)
        B.tg_width.equal(40)
        B.tg_height.equal(40)
        S.addSubview(B)
        
        let C = UILabel()
        C.text = "C"
        C.tg_right.equal(40)
        C.tg_width.equal(50)
        C.tg_height.equal(40)
        S.addSubview(C)
        
        let D = UILabel()
        D.text = "D"
        D.tg_left.equal(10)
        D.tg_right.equal(10)
        D.tg_width.equal(100)
        D.tg_height.equal(40)
        S.addSubview(D)
        
        self.view.addSubview(scrollView)
        A.backgroundColor = .green
        B.backgroundColor = .blue
        C.backgroundColor = .orange
        D.backgroundColor = .cyan
        
    }
    
    
}

