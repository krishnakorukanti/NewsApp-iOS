//
//  MainView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 24/03/22.
//

import SwiftUI

enum TabButton : String{
    case home = "Home"
    case search = "Search"
    case fav = "Favorites"
    
    var BtnIcon : String{
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .fav:
            return "star"
        }
    }
}
let tabButtons : [TabButton] = [.home,.search,.fav]
struct MainView: View {
    @State var currentTab : TabButton = .home
    var body: some View {
        VStack{
            
            switch(currentTab){
            case .home : HomeView()
            case .search : SearchView()
            case .fav : Text("Fav")
            }
            Spacer()
            Divider()
            BottomTabView(currentTab: $currentTab)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
