//
//  ViewController.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/24.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

let SCREENWIDTH = UIScreen.main.bounds.width
let SCREENHEIGHT = UIScreen.main.bounds.height

class ViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource {
    var tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleLabel = UILabel.init(frame: CGRect(x: 10, y: 25, width: 150, height: 44))
        titleLabel.text = "FNMatchPullDemo"
        titleLabel.textColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
        view.addSubview(titleLabel)
        
        
        
        for i in 0 ... 2 {
            let btn = UIButton.init(frame: CGRect(x: SCREENWIDTH - 60 * CGFloat(i + 1), y: 35, width: 45, height: 24))
            btn.setTitle(NSString.init(format: "Mode%d", 2 - i) as String, for: UIControlState())
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.backgroundColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
            btn.tag = 100 + 2 - i
            btn.layer.cornerRadius = 5
            view.addSubview(btn)
            btn.addTarget(self, action: #selector(modeChange(_:)), for: .touchUpInside)
        }
        
        tableView = newTableView()
        view.addSubview(tableView)
        mode0()        
    }
    
    func modeChange(_ btn:UIButton) {
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
        let matchAnimator = FNMatchPullAnimator(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 80))
        matchAnimator.startPoints = [NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 30, y: 25)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 30, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 30, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 30, y: 25)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2, y: 25)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2, y: 25)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 30, y: 25)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 30, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 30, y: 55)),
                                     NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 30, y: 25))]
        matchAnimator.endPoints = [NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15 - 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15 - 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15 - 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15 - 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15 + 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 - 15 + 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15 + 30, y: 40)),
                                   NSValue.init(cgPoint: CGPoint(x: SCREENWIDTH/2 + 15 + 30, y: 40))]
        tableView.addPullToRefreshWithAction({
            OperationQueue().addOperation {
                sleep(4)
                OperationQueue.main.addOperation {
                    self.tableView.stopPullToRefresh()
                }
            }
            }, withAnimator: matchAnimator)
    }
    
    func mode1() {
        let matchAnimator = FNMatchPullAnimator(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 80))
        matchAnimator.text = "HELLO,FNOZ"
        matchAnimator.style = .text
        tableView.addPullToRefreshWithAction({
            OperationQueue().addOperation {
                sleep(4)
                OperationQueue.main.addOperation {
                    self.tableView.stopPullToRefresh()
                }
            }
        }, withAnimator: matchAnimator)
    }
    
    func mode2() {
        let matchAnimator = FNMatchPullAnimator(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 80))
        matchAnimator.text = "HELLO,FNOZ"
        matchAnimator.style = .text
        matchAnimator.lineWidth = 4.0
        tableView.addPullToRefreshWithAction({
            OperationQueue().addOperation {
                sleep(4)
                OperationQueue.main.addOperation {
                    self.tableView.stopPullToRefresh()
                }
            }
            }, withAnimator: matchAnimator)
    }

    func newTableView() -> UITableView {
        let newTableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64), style: UITableViewStyle.plain)
        newTableView.delegate = self
        newTableView.backgroundColor =  UIColor.init(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1)
        newTableView.dataSource = self
        newTableView.separatorStyle = .singleLineEtched
        newTableView.showsVerticalScrollIndicator = false
        return newTableView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: FNMatchPullTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "FNMatchPullTableViewCell") as? FNMatchPullTableViewCell
        if (cell == nil) {
            cell = FNMatchPullTableViewCell(style: .default, reuseIdentifier: "FNMatchPullTableViewCell")
        }
        cell?.contentView.backgroundColor = UIColor.init(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1)
        cell?.centerImageView.image = UIImage.init(named: NSString.init(format: "icn_%d", (indexPath.row+1)%3) as String)
        cell?.centerImageView.center = CGPoint(x: view.bounds.size.width/2, y: 85)
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }
}

