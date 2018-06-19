//
//  ViewController.swift
//  第二天表的练习
//
//  Created by LYH on 2018/6/19.
//  Copyright © 2018年 Toocms. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var tableView = UITableView()
    var data = ["30 Days Swift", "在这个特殊的日子里「奋斗」和「理想」", "建一个工程 敲两行代码", "吃饭旅行 走走停停", "呵呵，再见🤗 See you next Project", "QQ 545119722",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载UI
        creatView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func creatView(){
     tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WIDTH, height: HEIGHT), style: UITableViewStyle.plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.rowHeight=70*pix //cell高度
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fontcell")
        self.view .addSubview(tableView)
    }
    //组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //每组中cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    //加载cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontcell")
        cell?.textLabel?.text=data[indexPath.row]
        cell?.textLabel?.font=UIFont.systemFont(ofSize: 15*pix)
        
        return cell!
    }
    //row的高度
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70*pix
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点啦---\(indexPath.row)")
    }
    
}

