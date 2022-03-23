//
//  HomeView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 22/03/22.
//

import SwiftUI

struct HomeView: View {
 @Environment(\.openURL) var openUrl
 @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    let countryFilters : [NewsAPI] = [.getIndianNews,.getUsNews,.getSANews,.getAusNews,.getCanadaNews,.getPhillipNews,.getRussianNews]
    var body: some View {
        Group{
            switch viewModel.state{
                
            case .loading :
                ProgressView()
            case .failed(let error) : ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles) :
              
                NavigationView{
                   
                        List(articles){
                            item in
                            ArticleView(article: item).onTapGesture {
                            
                               load(url: item.url)
                            }
                        }.navigationTitle(Text("News "+viewModel.newsAPI.countryName))
                        //.navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            HStack{
                               
                            
                                Menu("Change Country") {
                                    ForEach(countryFilters,id : \.self){ item in
                                        Button {
                                            viewModel.newsAPI = item
                                            viewModel.getArticles()
                                        } label: {
                                            Text(item.countryName)
                                        }
                                    }
                                }
                            }.padding()
                           
                        }
                    
                }
            
        }
        }.onAppear(perform: viewModel.getArticles)
    }
    func load(url : String?){
        guard let link = url,
              let url = URL(string: link)
        else {return}
        openUrl(url)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
