//
//  SearchView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 24/03/22.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        Group{
            switch viewModel.state{
                
            case .loading :
                ProgressView()
            case .failed(let error) : ErrorView(error: error, handler: viewModel.search)
            case .success(let articles) :
              
                NavigationView{
                   
                        List(articles){
                            item in
                            ArticleView(article: item).onTapGesture {
                            
                               load(url: item.url)
                            }
                        }.navigationTitle(Text("Bitcoin"))
                        //.navigationBarTitleDisplayMode(.inline)
                        
                    
                }
            
        }
        }.onAppear(perform: viewModel.search)
    }
    func load(url : String?){
        guard let link = url,
              let url = URL(string: link)
        else {return}
        openUrl(url)
    }
    }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
