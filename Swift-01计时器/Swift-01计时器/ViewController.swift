//
//  ViewController.swift
//  Swift-01计时器
//
//  Created by LYH on 2018/6/14.
//  Copyright © 2018年 Toocms. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var playBtn = UIButton()
    var pauseBtn = UIButton()
    var timeLabel = UILabel()
    var resetBtn = UIButton()
    
    var timer = Timer()
    //初始值
    var counter:Double = 0.0
    var isPlaying:Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        /**调用函数*/
        creaBtn()
    }

    func creaBtn(){
        /**设置左边view*/
        let leftView = UIView.init(frame:CGRect.init(x: 0, y: YHheight*0.25, width: YHwidth/2, height: YHheight*0.75))
       leftView.backgroundColor=UIColor.yellow
        self.view.addSubview(leftView)
        /**设置右边view*/
        let rightView = UIView.init(frame:CGRect.init(x: YHwidth/2 , y: YHheight*0.25, width: YHwidth/2, height: YHheight*0.75))
        rightView.backgroundColor=UIColor.red
        self.view.addSubview(rightView)
        /**设置button*/
        playBtn=UIButton.init(frame: CGRect.init(x: leftView.center.x, y: leftView.center.y, width: 80, height: 80))
        playBtn.center = CGPoint.init(x: leftView.center.x, y: leftView.center.y)
//        playBtn.setTitle("呵呵", for: UIControlState.normal)
//        playBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
//          playBtn.backgroundColor=UIColor.brown
        playBtn.setBackgroundImage(UIImage.init(named: "play"), for: UIControlState.normal)
        playBtn.addTarget(self, action: #selector(self.playBtnTouch), for: UIControlEvents.touchUpInside)
        /**为什么按钮加在View上才可以剧中显示*/
        self.view.addSubview(playBtn)
        /**停止按钮*/
        pauseBtn=UIButton.init(frame: CGRect.init(x: rightView.center.x, y: rightView.center.y, width: 80, height: 80))
        pauseBtn.center=CGPoint.init(x: rightView.center.x, y: rightView.center.y)
        pauseBtn.setImage(UIImage.init(named: "pause"), for: UIControlState.normal)
        pauseBtn.addTarget(self, action:#selector(self.pauseBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pauseBtn)
        /**创建timerlabel*/
        timeLabel = UILabel.init(frame: CGRect.init(x:YHwidth/2-90, y: 70, width: 180, height: 50))
        timeLabel.font=UIFont.systemFont(ofSize: 17)
        timeLabel.text = "0.0"
        timeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(timeLabel)
        /**重置按钮*/

        resetBtn = UIButton.init(frame: CGRect.init(x: YHwidth-80, y: 20, width: 70, height: 50))
        resetBtn.setTitle("重置", for: UIControlState.normal)
        resetBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        resetBtn.addTarget(self, action: #selector(self.resetBtnTouch), for: UIControlEvents.touchUpInside)
        self.view.addSubview(resetBtn)
        
    }
    
    @objc func  playBtnTouch()  {
        if isPlaying {
            return
        }
        isPlaying = true
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        /**
         *开启计时器
         *每0.1秒调用一次+0.1
         */
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timeClick), userInfo: nil, repeats: true)
    }
    @objc func pauseBtnTouch() {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    @objc func resetBtnTouch() {
        isPlaying = false
        counter = 0.0
        timeLabel.text = "0.0"
        //从运行循环Runloop中删除计时器
        timer.invalidate()
        
        pauseBtn.isEnabled = true
        playBtn.isEnabled = true
    }
    @objc func timeClick()  {
        counter = counter + 0.10
        let vaue = "不是吧"
       //double 类型和字符串拼接
        let result = "\(vaue)\(counter)"
        timeLabel.text = String(result)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

