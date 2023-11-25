//
//  PageModel.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to IKAMBA App!", description: "Safely Send Money with Ease: The Best App for Seamless International Transfers", imageUrl: "cowork", tag: 0),
        Page(name: "BorderlessPay", description: "Seamless Money Transfers from Russia to Rwanda, Bringing You Closer Across Borders", imageUrl: "work", tag: 1),
        Page(name: "Competitive Rates", description: "Save More with Us – It's That Simple", imageUrl: "website", tag: 2),
    ]
}
