//
//  ViewController.swift
//  QuoteOfDay
//
//  Created by macbook on 6.05.21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var authorOfQuoteLabel: UILabel!
    @IBOutlet weak var bodyOfQuoteLabel: UILabel!
    
    @IBOutlet weak var quoteBtn: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    private var author = ""
    private var body = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorOfQuoteLabel.text = nil
        bodyOfQuoteLabel.text = nil
        
        quoteBtn.layer.cornerRadius = quoteBtn.frame.height / 2
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
    }
    
    
    
    @IBAction func quoteBtnPressed() {
        
        activityIndicator.startAnimating()
        
        AF.request(URLS.randomQuote.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let quoteData = value as? [String: Any] else { return }
                    guard let quote = quoteData["quote"] as? [String: Any] else { return }
                    guard let author = quote["author"] as? String else { return }
                    guard let body = quote["body"] as? String else { return }
                   
                    self.author = author
                    self.body = body

                case .failure(let error):
                    print(error)
                }
                
                DispatchQueue.main.async { [self] in
                    authorOfQuoteLabel.text = author
                    bodyOfQuoteLabel.text = body
                    activityIndicator.stopAnimating()
                }
            }
    }
    
}

