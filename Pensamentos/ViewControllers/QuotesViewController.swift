//
//  ViewController.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class QuotesViewController: UIViewController {

    //MARK: - Lets and Vars
    let config = Configuration.shared
    let quotesManager = QuotesManager.shared
    var timer: Timer?
    
    //MARK: - IBOutlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    //MARK: - Custom Methods
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        quoteLabel.textColor = config.colorScheme == 0 ? .black : .white
        authorNameLabel.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    func prepareQuote() {
        timer?.invalidate()
        if config.autorefresh {
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
                self.showRandomQuote()
            }
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        quoteLabel.text = quote.quote
        authorNameLabel.text = quote.author
        authorImageView.image = UIImage(named: quote.image)
        
        quoteLabel.alpha = 0.0
        authorNameLabel.alpha = 0.0
        authorImageView.alpha = 0.0
        
        UIView.animate(withDuration: 2.5) {
            self.quoteLabel.alpha = 1.0
            self.authorNameLabel.alpha = 1.0
            self.authorImageView.alpha = 1.0
        }
    }
    
    //MARK: - Memory Managmement
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

