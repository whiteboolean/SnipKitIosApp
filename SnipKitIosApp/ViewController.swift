//
//  ViewController.swift
//  SnipKitIosApp
//
//  Created by D G on 2022/9/26.
//

import UIKit
import SnapKit
import TangramKit

/**
(void)initialize：函数并不会每次创建对象都调用，只有在第一次初始化的时候才会调用，再次创建将不会调用initialize方法。
 init方法和initCoder方法相似，知识被调用的环境不一样。如果用代码初始化，会调用init方法，从nib文件或者归档(xib、storyboard)进行初始化会调用initCoder。initCoder是NSCoding协议中的方法，NSCoding是负责编码解码，归档处理的协议。
 loadView：是开始加载view的起始方法，除非手动调用，否则在ViewController的生命周期中只调用一次。
 viewDidLoad：是我们最常用的方法，类成员对象和变量的初始化我们都会放在这个方法中。在创建类后无论视图展现还是消失，这个方法也只会在布局是调用一次。
 viewWillAppear:(BOOL)animated：方法 是在视图将要展现出来的时候调用。
 viewWillLayoutSubviews：方法是在将要布局子视图的时候调用。
 viewDidLayoutSubviews：方法是在子视图布局完成后调用。
 viewDidAppear:(BOOL)animated：方法是视图已经出现。
 viewWillDisappear:(BOOL)animated：方法是视图即将消失。
 viewDidDisappear:(BOOL)animated：视图已经消失。
 dealloc：ViewController被释放时调用。
 */

class ViewController: UIViewController {

    
    override func loadView() {
        print("loadView")
        
        let rootLayout = TGLinearLayout(.vert)
        rootLayout.backgroundColor = .white
        rootLayout.tg_insetsPaddingFromSafeArea = .all
        self.view = rootLayout
         
        let vertTitleLabel = self.createTitleLabel("垂直布局")
        
        vertTitleLabel.tg_top.equal(self.topLayoutGuide, offset:10)  //顶部距离前面的视图10
//        vertTitleLabel.tg_top.equal(10)  //您可以注释上面，解开这句看看运行效果
        vertTitleLabel.tg_leading.equal(10)
        rootLayout.addSubview(vertTitleLabel)
        
        let vertLinearLayout = self.createVerticalLinearLayout()
        vertLinearLayout.tg_size(width: .fill, height: .wrap)
        rootLayout.addSubview(vertLinearLayout)
        
        
        let horizontalLabel = self.createTitleLabel("水平布局")
        horizontalLabel.tg_top.equal(20)
        horizontalLabel.tg_leading.equal(10)
        rootLayout.addSubview(horizontalLabel)
        
        let horizontalLinearLayout = self.createHorizontalLinearLayout()
        horizontalLinearLayout.tg_size(width: .fill, height: .fill)
        rootLayout.addSubview(horizontalLinearLayout)
        
        
        
        
        
        
        
         
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    
}


extension ViewController {
    
    
    func createHorizontalLinearLayout() ->TGLinearLayout {
        let horiLinearLayout = TGLinearLayout(.horz)
        horiLinearLayout.backgroundColor = CFTool.color(0)
        let topMarginLabel = self.createContainerLabel("topMargin", backgroundColor: .cyan)
        topMarginLabel.tg_origin(x: 10, y: 10)
        topMarginLabel.tg_size(width: 100, height: .wrap)
        horiLinearLayout.addSubview(topMarginLabel)
        
        let secondLabel = self.createContainerLabel("secondLabel", backgroundColor: .yellow)
        secondLabel.tg_centerY.equal(0)
        horiLinearLayout.addSubview(secondLabel)
        
        let thirdBottomLabel = self.createContainerLabel("thirdBottomLabel", backgroundColor: .orange)
        thirdBottomLabel.tg_bottom.equal(10)
        horiLinearLayout.addSubview(thirdBottomLabel)
        
        let forthFullLabel = self.createContainerLabel("fourthFullLabel", backgroundColor: .green)
        forthFullLabel.tg_vertMargin(10)
        forthFullLabel.tg_trailing.equal(10)
        horiLinearLayout.addSubview(forthFullLabel)
    
    
        return horiLinearLayout
    }
    
    func createTitleLabel(_ title :String) ->UILabel{
        let label = UILabel()
        label.text = title
        label.font  = CFTool.font(17)
        label.sizeToFit()
        return label
    }
    
    
    func createContainerLabel(_ title:String, backgroundColor:UIColor) ->UILabel{
        let label = UILabel()
        label.text = title;
        label.font = CFTool.font(15)
        label.tg_size(width: .wrap, height: .wrap)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor =  backgroundColor
        label.layer.shadowOffset = CGSize(width:3, height:3)
        label.layer.shadowColor = CFTool.color(4).cgColor
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.3
        return label
    }
    
    func createVerticalLinearLayout() -> TGLinearLayout{
        let vertLinearLayout = TGLinearLayout(.vert)
        vertLinearLayout.backgroundColor = CFTool.color(0)
        
        let leftLabel = self.createContainerLabel("leftLabel", backgroundColor: .red)
        leftLabel.tg_origin(x: 10, y: 10)
        leftLabel.tg_size(width: 200, height: 35)   //设置视图的宽度和高度
        vertLinearLayout.addSubview(leftLabel)
        
        
        let centerLabel = self.createContainerLabel("centerLabel", backgroundColor: .orange)
        centerLabel.tg_top.equal(10)
        centerLabel.tg_centerX .equal(0)
        centerLabel.tg_size(width: 200, height: 35)
        vertLinearLayout.addSubview(centerLabel)
        
        
        let rightLabel = self.createContainerLabel("rightLabel", backgroundColor: UIColor.systemBlue)
        rightLabel.tg_top.equal(10)
        rightLabel.tg_size(width: 200, height: 35)
        rightLabel.tg_right.equal(10)
        vertLinearLayout.addSubview(rightLabel)
        
        let bottomLabel = self.createContainerLabel("bottomLabel", backgroundColor: UIColor.cyan)
        bottomLabel.tg_height.equal(35)
        bottomLabel.tg_horzMargin(10)
        bottomLabel.tg_top.equal(10)
        bottomLabel.tg_bottom.equal(10)
        
        vertLinearLayout.addSubview(bottomLabel)
        return vertLinearLayout
    }
}

