//
//  ContentView.swift
//  miniShopWithTabView
//
//  Created by Peter Clarke on 24.01.2023.
//

import SwiftUI

struct ContentView: View {
    @State var positionOfTab = 0
    
    var body: some View {
        
        
        TabView(selection: $positionOfTab){
            
            ProfileView(basketButton: $positionOfTab)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Профиль")
                }
                .tag(0)
 
            CatalogView()
            BasketView()
 
        }
        .accentColor(Color.pink)
        .animation(Animation.spring(response: 0.7, blendDuration: 0.5))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProfileView: View {
    
    @Binding var basketButton : Int
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea(edges: .top)
            Text("The first tab")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Button(
                action: {
                    basketButton = 2
                },
                label: {
                    Text("Перейти в корзину")
                        .padding()
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(20)
                        .position(x : 185 , y : 500 )
                    
                })
            
        }
        
    }
    
}


struct BasketView: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea(edges : .top)
            Text("Корзина")
        }
        .badge(5)
        .tabItem{
            Image(systemName: "basket.fill")
            Text("Корзина")
            
        }
        .tag(2)
    }
}

struct CatalogView: View {
    var body: some View {
        ZStack{
            Color.pink.ignoresSafeArea(edges : .top)
            Text("The second tab")
            
        }
        .tabItem{
            Image(systemName: "star.fill")
            Text("Каталог")
        }
        .tag(1)
    }
}
