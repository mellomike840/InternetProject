//
//  InternetDetailViewController.swift
//  InternetProject
//
//  Created by Rottlaender, Alex on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import WebKit

public class InternetDetailViewController: UIViewController
{
    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    var detailTitle : String?
    {
        didSet
        {
            updateView()
        }
    }
    
    var detailAddress : String?
    {
        didSet //Listener for the variable
        {
            updateView()
        }
    }
    
    private func updateView() -> Void
    {
        if (detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if(detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil) //is this anywhere in this range of values
            {
                loadPDF()
            }
            else
            {
                if (detailAddress != nil)
                {
                    loadURL(webaddress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    

    public override func viewDidLoad()
    {
        super.viewDidLoad()

        updateView()
        // Do any additional setup after loading the view.
    }

    private func loadURL(webaddress: String) -> Void
    {
        let currentURL = URL(string : webaddress)
        let currentWebRequest = URLRequest(url : currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF() -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "Definitions and stuff", withExtension: "pdf", subdirectory: nil, localization: nil )
        {
            let requestedPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestedPDF as URLRequest)
        }
    }
    
    
    public override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
