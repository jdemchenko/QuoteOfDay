//
//  Quote.swift
//  QuoteOfDay
//
//  Created by macbook on 6.05.21.
//
struct QuoteNested: Decodable {
    let quote: Quote
}

struct Quote: Decodable {
    let author: String?
    let body: String?
}

enum URLS: String {
    case randomQuote = "https://favqs.com/api/qotd"
}
