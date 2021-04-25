//
//  SlideViewController.swift
//  MToon_G5
//
//  Created by Computer on 4/25/21.
//  Copyright © 2021 Computer. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
    
    @IBOutlet weak var mainViewSlide: UIView!
    
    let count = 4
    var indexImage: IndexImage?
    var arrCircle:[UIView] = []
    var arrImage:[UIImageView] = []
    let contentView = UIView()
    var arrLink:[String] = [
        "https://i0.wp.com/truyengroup.com/data/images/4648/95025/001.jpg",
        "https://i0.wp.com/truyengroup.com/data/images/4648/95025/005.jpg",
        "https://i0.wp.com/truyengroup.com/data/images/4648/95025/009.jpg",
        "https://i0.wp.com/truyengroup.com/data/images/4648/95025/013.jpg"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexImage = IndexImage(size: count - 1)
        
        creatImageView()
        creatCircleBottom()
        createCircle()
        creatSwitchImage()
        getData()
    }
    
    func createCircle() {
        let space = 8
        let size = 9
        var spaceX = (Int(mainViewSlide.bounds.width) - ((space * count) + (size * count))) / 2
        for _ in 0 ... count - 1 {
            let circle = UIView()
            circle.layer.cornerRadius = 5
            circle.layer.backgroundColor = UIColor.darkGray.cgColor
            circle.frame = CGRect(x: spaceX, y: Int(mainViewSlide.bounds.height * 0.85), width: size, height: size)
            spaceX += (space + size)
            mainViewSlide.addSubview(circle)
            arrCircle.append(circle)
        }
        
        arrCircle[0].layer.backgroundColor = UIColor.black.cgColor
    }
    
    func creatImageView() {
        contentView.frame = CGRect(x: 0, y: 0, width: mainViewSlide.bounds.width * CGFloat(count), height: mainViewSlide.bounds.height)
        
        for i in 0 ... count - 1 {
            let image = UIImageView()
            let width = mainViewSlide.bounds.width
            let height = mainViewSlide.bounds.height
            let spaceX = width * CGFloat(i)
            image.frame = CGRect(x: spaceX, y: 0, width: width, height: height)
            image.image = UIImage(named: "BackgroudMenu")
            arrImage.append(image)
            contentView.addSubview(image)
        }
        
        mainViewSlide.addSubview(contentView)
    }
    
    func creatCircleBottom() {
        let circleLayerBottom = CAShapeLayer()
        let cricleBottom = UIView()
        let width = contentView.bounds.width / CGFloat(count)
        let height = contentView.bounds.height * 0.12
        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: width, height: height))
        circleLayerBottom.frame = CGRect(x: 0, y:  height / 2, width: width, height: height)
        circleLayerBottom.path = path.cgPath
        cricleBottom.frame = CGRect(x: 0, y: contentView.bounds.height - height , width: width, height: height)
        cricleBottom.layer.backgroundColor = UIColor.white.cgColor
        cricleBottom.layer.mask = circleLayerBottom
        self.view.addSubview(cricleBottom)
    }
    
    func creatSwitchImage() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(sender:)))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(sender:)))
        swipeLeft.direction = .left
        contentView.addGestureRecognizer(swipeRight)
        contentView.addGestureRecognizer(swipeLeft)
    }
    
    func switchImage(direction: UISwipeGestureRecognizer.Direction) {
        switch direction {
        case .right:
            transitionImage(index: indexImage!.getPre())
            print("Debug: ", "Phai")
        case .left:
            transitionImage(index: indexImage!.getNext())
            print("Debug: ", "trai")
        default:
            print("Debug: ", "Default")
        }
    }
    
    func getData() {
        for i in 0 ... count - 1 {
            Image().downoadImage(link: arrLink[i], imageView: arrImage[i])
        }
    }
    
    func changerBackgroundCircle() {
        arrCircle[indexImage!.lastIndex].layer.backgroundColor = UIColor.darkGray.cgColor
        arrCircle[indexImage!.currentIndex].layer.backgroundColor = UIColor.black.cgColor
    }
    
    func autoSwitchImage() {
        DispatchQueue.global().async {
            while true {
                DispatchQueue.main.async {
                    self.transitionImage(index: self.indexImage!.getNext())
                }
                sleep(6)
            }
        }
    }
    
    func transitionImage(index: Int) {
        print("Debug: " , index)
        UIView.animate(withDuration: 2, animations: {
            self.contentView.transform = CGAffineTransform(translationX: -CGFloat(Int(self.contentView.bounds.width / CGFloat(self.count)) * index), y: 0)
            self.changerBackgroundCircle()
        })
    }
    
    @objc func respondToSwipeGesture(sender: UISwipeGestureRecognizer){
        if sender.state == .ended {
            switchImage(direction: sender.direction)
        }
    }
}

class IndexImage {
    var size: Int
    var currentIndex: Int = 0
    var lastIndex: Int = 0
    
    init(size: Int) {
        self.size = size
    }
    
    func getNext() -> Int {
        lastIndex = currentIndex
        if currentIndex == size {
            currentIndex = 0
            return 0
        }
        currentIndex += 1
        return currentIndex
    }
    
    func getPre() -> Int {
        lastIndex = currentIndex
        if currentIndex == 0 {
            currentIndex = size
            return size
        }
        currentIndex -= 1
        return currentIndex
    }
}
