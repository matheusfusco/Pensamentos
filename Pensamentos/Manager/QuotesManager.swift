//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import Foundation

class QuotesManager {
    
    var quotes: [Quote]
    static let shared: QuotesManager = QuotesManager()
    var previousQuoteIndex = 1
    
    private init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        quotes = try! JSONDecoder().decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        var index = Int(arc4random_uniform(UInt32(quotes.count)))
        while index == previousQuoteIndex {
            index = Int(arc4random_uniform(UInt32(quotes.count)))
        }
        previousQuoteIndex = index
        return quotes[index]
    }
    
    func save(quote: Quote) {
        quotes.append(quote)
    }
}
