//
//  BottomTabView.swift
//  NewsApp iOS
//
//  Created by sai krishna korukanti on 24/03/22.
//

import SwiftUI

struct BottomTabView: View {
    @Binding var currentTab : TabButton
   var body: some View{
       HStack{
           ForEach(tabButtons, id: \.self){ tabButton in
               Spacer()
               Button {
                   currentTab = tabButton
               } label: {
                       Image(systemName: tabButton.BtnIcon)
                           .font(.system(size: 20, weight: .bold))
                           .foregroundColor(currentTab == tabButton ? Color(.black) : Color.gray)
               }.padding()
               Spacer()
               
           }
       }
   }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView(currentTab: .constant(.search))
            .previewLayout(.sizeThatFits)
    }
}
