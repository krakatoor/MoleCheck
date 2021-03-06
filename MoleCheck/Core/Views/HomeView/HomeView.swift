//
//  HomeView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var store: Store
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack (spacing: 20){
                title
                UserDetailView(user: store.user)
                recentEvents
                AddSubscriptionView()
                molesList
                
                Spacer(minLength: 60)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Store())
    }
}

extension HomeView {
    var title: some View{
        Text("Главная страница")
            .font(.title)
            .bold()
            .foregroundColor(.colors.black)
            .leadingView()
            .padding(.top, 63)
    }
    
    var recentEvents: some View {
        HStack {
            Text("Последние события")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.colors.black)
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Очистить")
                    .font(.system(size: 13))
                    .foregroundColor(.colors.gray)
            })
        }
        .padding([.top, .horizontal])
    }
    
    var molesList: some View{
        VStack {
            ForEach(store.user.result.reversed()) { result in
                NavigationLink(
                    destination: Text("Описание теста"),
                    label: {
                        MoleTestResultView(mole: result, index: store.user.result.firstIndex(of: result)!)
                    })
                    .buttonStyle(FlatLinkStyle())
            }
        }
    }
}





