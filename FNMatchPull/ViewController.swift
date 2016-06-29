//
//  ViewController.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/24.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.mainScreen().bounds.width
let SCREENHEIGHT = UIScreen.mainScreen().bounds.height

class ViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource {
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel.init(frame: CGRectMake(10, 25, 150, 44))
        titleLabel.text = "FNMatchPullDemo"
        titleLabel.textColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
        view.addSubview(titleLabel)
        
        
        
        for i in 0 ... 2 {
            let btn = UIButton.init(frame: CGRectMake(SCREENWIDTH - 60 * CGFloat(i + 1), 35, 45, 24))
            btn.setTitle(NSString.init(format: "Mode%d", 2 - i) as String, forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(12)
            btn.backgroundColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
            btn.tag = 100 + 2 - i
            btn.layer.cornerRadius = 5
            view.addSubview(btn)
            btn.addTarget(self, action: #selector(modeChange(_:)), forControlEvents: .TouchUpInside)
        }
        
        tableView = newTableView()
        view.addSubview(tableView)
        mode0()        
    }
    
    func modeChange(btn:UIButton) {
        tableView?.removeFromSuperview()
        tableView = newTableView()
        view.addSubview(tableView)

        switch btn.tag - 100 {
        case 0:
            mode0()
            break
        case 1:
            mode1()
            break
        case 2:
            mode2()
            break
        default:
            break
        }
    }
    
    func mode0() {
        let matchAnimator = FNMatchPullAnimator(frame: CGRectMake(0, 0, 320, 80))
        matchAnimator.startPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 25)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 30, 25)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 25)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2, 25)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 30, 25)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 30, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 30, 55)),
                                     NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 30, 25))]
        matchAnimator.endPoints = [NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 - 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 - 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15 - 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15 - 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 + 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 - 15 + 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15 + 30, 40)),
                                   NSValue.init(CGPoint: CGPointMake(SCREENWIDTH/2 + 15 + 30, 40))]
        tableView.addPullToRefreshWithAction({
            NSOperationQueue().addOperationWithBlock {
                sleep(4)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.tableView.stopPullToRefresh()
                }
            }
            }, withAnimator: matchAnimator)
    }
    
    func mode1() {
        let matchAnimator = FNMatchPullAnimator(frame: CGRectMake(0, 0, 320, 80))
        matchAnimator.text = "HELLO,FNOZ"
        matchAnimator.style = .Text
        tableView.addPullToRefreshWithAction({
            NSOperationQueue().addOperationWithBlock {
                sleep(4)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.tableView.stopPullToRefresh()
                }
            }
            }, withAnimator: matchAnimator)
    }
    
    func mode2() {
        let matchAnimator = FNMatchPullAnimator(frame: CGRectMake(0, 0, 320, 80))
        matchAnimator.text = "HELLO,FNOZ"
        matchAnimator.style = .Text
        matchAnimator.lineWidth = 4.0
        tableView.addPullToRefreshWithAction({
            NSOperationQueue().addOperationWithBlock {
                sleep(4)
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    self.tableView.stopPullToRefresh()
                }
            }
            }, withAnimator: matchAnimator)
    }

    func newTableView() -> UITableView {
        let newTableView = UITableView.init(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64), style: UITableViewStyle.Plain)
        newTableView.delegate = self
        newTableView.backgroundColor =  UIColor.init(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1)
        newTableView.dataSource = self
        newTableView.separatorStyle = .SingleLineEtched
        newTableView.showsVerticalScrollIndicator = false
        return newTableView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: FNMatchPullTableViewCell? = tableView.dequeueReusableCellWithIdentifier("FNMatchPullTableViewCell") as? FNMatchPullTableViewCell
        if (cell == nil) {
            cell = FNMatchPullTableViewCell(style: .Default, reuseIdentifier: "FNMatchPullTableViewCell")
        }
        cell?.contentView.backgroundColor = UIColor.init(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1)
        cell?.centerImageView.image = UIImage.init(named: NSString.init(format: "icn_%d", (indexPath.row+1)%3) as String)
        cell?.centerImageView.center = CGPointMake(view.bounds.size.width/2, 85)
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }
}

