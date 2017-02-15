//
//  ViewController.swift
//  AppStoreLikeExample
//
//  Created by piyush sinroja on 25/05/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UICollectionView Outlet
    @IBOutlet weak var collectionviewUper: UICollectionView!
    
    // NSLayoutConstraint Outlet
    @IBOutlet weak var constrTableTop: NSLayoutConstraint!
    @IBOutlet weak var constrViewUperHeight: NSLayoutConstraint!
    @IBOutlet weak var constrViewUper: NSLayoutConstraint!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    
    // UIScrollView Outlet
    @IBOutlet weak var scrollmain: UIScrollView!
    
    // UITableView Outlet
    @IBOutlet weak var tableviewmain: UITableView!
    
    // Cells Properties
    var tableCellobj: TableCellMiddle = TableCellMiddle()
    var tableCellbottomobj: TableViewCellbottom = TableViewCellbottom()
    
    var objCollectionViewCellMiddle : CollectionViewCellmiddle = CollectionViewCellmiddle()
    var objCollectionViewCellBottom : CollectionViewCellBottom = CollectionViewCellBottom()
    var objCollectionViewCellUper : CollectionViewCellUper = CollectionViewCellUper()
    
    // Other Var
    var arrayName: NSMutableArray = NSMutableArray()
    var arrayImages: NSArray = NSArray()
    var arrayImageDetail: NSArray = NSArray()
    var  hightcount : CGFloat = CGFloat()
    var heightForMiddlecell : CGFloat!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollmain.delegate  = self
        arrayImageDetail = ["20.png Nice Nature Price 1$","21.png Nice Nature Price 2$","22.png Nice Nature Price 3$","23.png Nice Nature Price 4$","24.png Nice Nature Price 5$","25.png Nice Nature Price 6$","26.png Nice Nature Price 7$","27.png Nice Nature Price 8$","28.png Nice Nature Price 9$","29.png Nice Nature Price 10$","30.png Nice Nature Price 11$","31.png Nice Nature Price 12$","32.png Nice Nature Price 13$","33.png Nice Nature Price 14$","34.png Nice Nature Price 15$","35.png Nice Nature Price 16$","36.png Nice Nature Price 1$"]
        
        arrayName.add("New Games We Love")
        arrayName.add("New Apps We Love")
        arrayName.add("Wild Rides")
        arrayName.add("")
        
        arrayName.add("Hot This Week")
        arrayName.add("₹ 60 for a Limited Time")
        arrayName.add("Apps & Games for ₹ 10")
        arrayName.add("10 Best Infinite Runners")
        
        arrayImages = ["20.png","21.png","22.png","23.png","24.png","25.png","26.png","27.png","28.png","29.png","30.png","31.png","32.png","33.png","34.png","35.png","36.png"]
        
        print(arrayName.count)
        tableviewmain.rowHeight = UITableViewAutomaticDimension
        tableviewmain.estimatedRowHeight = 110
        
        let heightOfYourTabBar: CGFloat = 64
        let insets: UIEdgeInsets = UIEdgeInsetsMake(0,0 , heightOfYourTabBar, 0)
        tableviewmain.contentInset = insets
        tableviewmain.scrollIndicatorInsets = insets
        
        if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
            constrViewUperHeight.constant = 120
            constrTableTop.constant = 184 // 120 + 64(NavigationBar)
        }
        else if ScreenCheck.isiPhone_6
        {
            constrViewUperHeight.constant = 150
            constrTableTop.constant = 214 // 150 + 64(NavigationBar)
        }
        else{
            constrViewUperHeight.constant = 170
            constrTableTop.constant = 234 // 170 + 64(NavigationBar)
        }
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    
    func update() {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let  battary : Float = batteryLevel()
        let percetage : Int = Int(battary)*100
        // print(battary*100)
        if battary*100 == 81 {
            print(percetage)
        }
    }
    
    func batteryLevel() -> Float {
        return UIDevice.current.batteryLevel
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- ScrollView Support Method
    func scrollforHotcell(_ scrollView: UIScrollView) {
        var value2 : Int = Int()
        var valueremain : CGFloat = CGFloat()
        let offset: CGFloat = scrollView.contentOffset.x
        var offset1: CGFloat = CGFloat()
        var cellwidthandspace: CGFloat = CGFloat()
        
        print(offset)
        
        if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
            cellwidthandspace = 100
            valueremain = 320
            value2 =  Int ((scrollView.contentOffset.x + 45)/cellwidthandspace)
            offset1 = scrollView.contentSize.width-350 // 380 = 320 + 30
        }
            
        else if ScreenCheck.isiPhone_6{
            cellwidthandspace = 110
            valueremain = 375
            value2 =  Int ((scrollView.contentOffset.x + 50)/cellwidthandspace)
            offset1 = scrollView.contentSize.width-400 // 380 = 375 + 25
        }
            
        else{
            cellwidthandspace = 120
            valueremain = 414
            value2 =  Int ((scrollView.contentOffset.x + 55)/cellwidthandspace)
            offset1 = scrollView.contentSize.width-430 // 380 = 414 + 16
        }
        
        if offset>offset1{
            scrollView.setContentOffset(CGPoint(x: scrollView.contentSize.width-valueremain, y: scrollView.contentOffset.y), animated: true)
        }
        else{
            scrollView.setContentOffset(CGPoint(x: cellwidthandspace * CGFloat (value2), y: scrollView.contentOffset.y), animated: true)
        }
    }
    
    func heightForView(_ text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        // label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    //MARK:- RoundedCorner Method
    func roundedCornerForView(_ sourceView: UIView,cournerNumber: CGFloat, cornorRadius: CGFloat ) {
        var maskPath: UIBezierPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.bottomLeft, .bottomRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        switch cournerNumber {
        case 1:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 2:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: .topRight, cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 3:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: .bottomLeft , cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 4:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: .bottomRight, cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 5:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.topLeft, .topRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 6:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.bottomLeft, .bottomRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 7:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.topLeft, .bottomRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 8:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.bottomLeft, .topRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        case 9:
            maskPath = UIBezierPath(roundedRect: sourceView.bounds, byRoundingCorners: ([.topLeft, .topRight,.bottomLeft,.bottomRight]), cornerRadii: CGSize(width: cornorRadius, height: cornorRadius))
        default:
            break
        }
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = sourceView.bounds
        maskLayer.path = maskPath.cgPath
        sourceView.layer.mask = maskLayer
    }
}
//MARK:- UITableViewDataSource Methods
extension ViewController: UITableViewDataSource {
    
    //MARK:- Tableview Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        //        var cellnew : UITableViewCell? = (tableView.dequeueReusableCellWithIdentifier("cell"))
        //        if cellnew == nil{
        //            cellnew = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        //        }
        //
        //        cellnew?.textLabel?.text = "\(indexPath.row+1)"
        //        return cellnew!
        
        let strname = arrayName[indexPath.row]
        if (strname as AnyObject).isEqual(to: "New Apps We Love") || (strname as AnyObject).isEqual(to: "New Games We Love") || (strname as AnyObject).isEqual(to: "Hot This Week") ||  (strname as AnyObject).isEqual(to: "Apps & Games for ₹ 10"){
            tableCellobj = tableView.dequeueReusableCell(withIdentifier: "cellmiddle", for: indexPath) as! TableCellMiddle
            
            tableviewHeight.constant = tableviewmain.contentSize.height + 64
            tableCellobj.lblMiddle.text = "\(strname)"
            return tableCellobj
        }
        else if (strname as AnyObject).isEqual(to: ""){
            tableCellbottomobj = tableView.dequeueReusableCell(withIdentifier: "cellbottom", for: indexPath) as! TableViewCellbottom
            
            tableCellbottomobj.constrLabelHeight.constant = 0
            
            tableviewHeight.constant = tableviewmain.contentSize.height + 64
            tableCellbottomobj.lblBottom.text = "\(strname)"
            return tableCellbottomobj
        }
            
        else{
            tableCellbottomobj = tableView.dequeueReusableCell(withIdentifier: "cellbottom", for: indexPath) as! TableViewCellbottom
            tableviewHeight.constant = tableviewmain.contentSize.height + 64
            tableCellbottomobj.constrLabelHeight.constant = 30
            tableCellbottomobj.lblBottom.text = "\(strname)"
            return tableCellbottomobj
        }
    }
    
}

//MARK:- UITableViewDelegate Methods
extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //  return   UITableViewAutomaticDimension
        
        //        var total : CGFloat = CGFloat()
        //        for i in tableviewmain.visibleCells
        //        {
        //            total = total + i.frame.size.height
        //            print(i.frame.size.height)
        //            print(total)
        //            tableviewHeight.constant = total
        //
        //        }
        
        let strname = arrayName[indexPath.row]
        if (strname as AnyObject).isEqual(to: "New Apps We Love") || (strname as AnyObject).isEqual(to: "New Games We Love") || (strname as AnyObject).isEqual(to: "Hot This Week") ||  (strname as AnyObject).isEqual(to: "Apps & Games for ₹ 10"){
            let font1 = UIFont(name: "Helvetica", size: 20.0)
            let strcheck =  arrayImageDetail[indexPath.row] as? String
            heightForMiddlecell = heightForView(strcheck!, font: font1!, width: 100)
            
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                return heightForMiddlecell + 80 + 40
            }
            else if ScreenCheck.isiPhone_6{
                return heightForMiddlecell + 100 + 40
            }
            else{
                return heightForMiddlecell + 110 + 40
            }
        }
            
        else if (strname as AnyObject).isEqual(to: ""){
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                return 120
            }
            else if ScreenCheck.isiPhone_6{
                return 130
            }
            else{
                return 140
            }
        }
        else{
            
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                return 140
            }
            else if ScreenCheck.isiPhone_6{
                return 150
            }
            else{
                return 160
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- UICollectionViewDataSource Methods
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return arrayImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if collectionView.tag == 2 {
            objCollectionViewCellMiddle = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncellmiddle", for: indexPath) as! CollectionViewCellmiddle
            
            // self.roundedCornerForView(objCollectionViewCellMiddle.imageview, cournerNumber: 9, cornorRadius: 15)
            objCollectionViewCellMiddle.imageview.image = UIImage(named: arrayImages[indexPath.item] as! String)
            objCollectionViewCellMiddle.imageview.layer.masksToBounds = true
            objCollectionViewCellMiddle.imageview.clipsToBounds = true
            objCollectionViewCellMiddle.imageview.layer.cornerRadius = 15.0
            objCollectionViewCellMiddle.imageview.layer.borderColor = UIColor.red.cgColor
            objCollectionViewCellMiddle.imageview.layer.borderWidth = 1.0
            
            objCollectionViewCellMiddle.lblMiddle.text = arrayImageDetail[indexPath.row] as? String
            
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                objCollectionViewCellMiddle.constrImageHeight.constant = 80
            }
            else if ScreenCheck.isiPhone_6{
                objCollectionViewCellMiddle.constrImageHeight.constant = 90
            }
            else{
                objCollectionViewCellMiddle.constrImageHeight.constant = 100
            }
            //            objCollectionViewCellMiddle.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            return objCollectionViewCellMiddle
            
        }
            
        else if collectionView.tag == 4 {
            objCollectionViewCellUper = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncelluper", for: indexPath) as! CollectionViewCellUper
            
            objCollectionViewCellUper.imageviewUper.image = UIImage(named: arrayImages[indexPath.item] as! String)
            return objCollectionViewCellUper
        }
        else {
            objCollectionViewCellBottom = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncellBottom", for: indexPath) as! CollectionViewCellBottom
            objCollectionViewCellBottom.imageviewBottom.image = UIImage(named: arrayImages[indexPath.item] as! String)
            
            objCollectionViewCellBottom.imageviewBottom.layer.cornerRadius = 10
            objCollectionViewCellBottom.imageviewBottom.layer.masksToBounds = true
            
            return objCollectionViewCellBottom
        }
    }
}

//MARK:- UICollectionViewDelegateFlowLayout Method
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        //        objCollectionViewCellMiddle.setNeedsUpdateConstraints()
        //        objCollectionViewCellMiddle.updateConstraintsIfNeeded()
        //        objCollectionViewCellMiddle.setNeedsLayout()
        //        objCollectionViewCellMiddle.layoutIfNeeded()
        
        if collectionView.tag == 2 {
            let font1 = UIFont(name: "Helvetica", size: 20.0)
            let strcheck =  arrayImageDetail[indexPath.row] as? String
            heightForMiddlecell = heightForView(strcheck!, font: font1!, width: 100)
            print(heightForMiddlecell)
            
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                return CGSize(width: 90, height: heightForMiddlecell+80)
            }
            else if ScreenCheck.isiPhone_6{
                return CGSize(width: 100, height: heightForMiddlecell+90)
            }
            else{
                return CGSize(width: 110, height: heightForMiddlecell+100)
            }
        }
            
        else if collectionView.tag == 4{
            return CGSize(width: UIScreen.main.bounds.size.width, height: constrViewUperHeight.constant-1)
        }
            
        else {
            if ScreenCheck.isiPhone_4 || ScreenCheck.isiPhone_5 {
                return CGSize(width: 180, height: 90)
            }
            else if ScreenCheck.isiPhone_6{
                return CGSize(width: 200, height: 90)
            }
            else{
                return CGSize(width: 220, height: 100)
            }
        }
    }
}

//MARK:- ScrollView Methods
extension ViewController: UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 0 {
            constrViewUper.constant =  -(scrollView.contentOffset.y)
            if scrollView.contentOffset.y<=0 {
                constrViewUper.constant =  0
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDragging")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        print("scrollViewDidEndDragging")
        
        if scrollView.tag == 2 {
            
            print(scrollView.contentOffset.x)
            print(scrollView.contentSize.width - scrollView.frame.size.width)
            
            if (scrollView.contentOffset.x < 0) || (scrollView.contentOffset.x > (scrollView.contentSize.width - scrollView.frame.size.width)){
                print("bouncing left Or Right")
            }
            else{
                scrollforHotcell(scrollView)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print("scrollViewDidEndDecelerating")
        
        if scrollView.tag == 2 {
            if (scrollView.contentOffset.x < 0) || (scrollView.contentOffset.x > (scrollView.contentSize.width - scrollView.frame.size.width)){
                print("bouncing left Or Right")
            }
            else{
                scrollforHotcell(scrollView)
            }
        }
    }
    
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewWillBeginDecelerating")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("scrollViewWillEndDragging")
    }
    
}

struct ScreenCheck{
    static var kScreenBounds    :   CGRect = UIScreen.main.bounds
    static var isiPhone_4       :   Bool   = 480 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_5       :   Bool   = 568 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_6       :   Bool   = 667 == UIScreen.main.bounds.size.height ? true:false
    static var isiPhone_6_Plus  :   Bool   = 736 == UIScreen.main.bounds.size.height ? true:false
}

