//
//  ContainerViewController.swift
//  KeyArtBoardApp
//
//  Created by Noah Goetz on 9/28/14.
//  Copyright (c) 2014 Noah Goetz. All rights reserved.
//

import UIKit

protocol SubPage {
    var index: Int {get set}
}

class ContainerViewController: UIInputViewController, UIPageViewControllerDataSource {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    var index : Int = 0
    var pages : Array<PageContentViewController> = Array<PageContentViewController>()
    var buttonsPerPage : Int = 4//6
    var pageViewController : UIPageViewController?
    var artButtons : Array<KeyArtButton> = Array<KeyArtButton>()
    var textForButton : [String: String] = ["": ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.dataSource = self
        self.artButtons += [KeyboardButtonFactory.generateKeyArtButton(title: "title", text: "text", place: 0), KeyboardButtonFactory.generateKeyArtButton(title: "title2", text: "text2", place: 0), KeyboardButtonFactory.generateKeyArtButton(title: "title3", text: "text3", place: 0)]
        self.makePages()
//        self.makeCanvas()
        self.pageViewController!.setViewControllers(self.pages, direction: .Forward, animated: false, completion: nil)
        // TODO: Autolayout will break this
        self.pageViewController!.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController!.didMoveToParentViewController(self)
        self.drawNextKeyboardButton()
    }

    
    func drawNextKeyboardButton() {
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeCanvas() {
        var canvas = KeyboardCanvasViewController()
        canvas.index = self.pages.count
        self.pages.append(canvas)
    }
    
    func makePages() {
        var pagesNumber = (self.artButtons.count / self.buttonsPerPage) + 1
        
        for(var i = 0; i < pagesNumber; i++) {
            var page = HotKeysViewController()
            page.index = i
            var lower : Int = (self.buttonsPerPage*i)
            var upper : Int = (self.buttonsPerPage*(i+1))
            if upper > self.artButtons.count {
                upper = self.artButtons.count
            }
            page.buttons += self.artButtons[lower..<upper]
            self.pages.append(page)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var currentIndex = (viewController as PageContentViewController).index + 1
        return self.viewControllerAtIndex(currentIndex)?
            
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var currentIndex = (viewController as PageContentViewController).index - 1
            
        return self.viewControllerAtIndex(currentIndex)!
    }
    
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if (index < self.pages.count || (index >= 0 && self.pages.count > 0)) {
            return self.pages[index]
        } else {
            return nil
        }
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pages.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
