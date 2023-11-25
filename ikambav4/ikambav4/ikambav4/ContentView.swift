//
//  ContentView.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    
    @State private var username = ""
    @State private var issighupView = false
    @State private var isloginView = false
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView{
            TabView(selection: $pageIndex) {
          
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        PageView(page: page)
                        Spacer()
                        if page == pages.last {
                            
                            NavigationLink("Create Account", destination: sighup())
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Text("Already have an account?")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                
                                NavigationLink("Login", destination: login())
                                Spacer()
                                
                            }
                            
                        } else {
                            Button("next", action: incrementPage)
                            
                                .buttonStyle(DefaultButtonStyle())
                            
                        }
                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
            .animation(.easeInOut, value: pageIndex)// 2
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }.navigationBarBackButtonHidden(true)
    }
        func incrementPage() {
            pageIndex += 1
        }
        
        func goToZero() {
            pageIndex = 0
        }
    }
