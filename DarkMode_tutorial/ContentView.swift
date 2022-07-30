//
//  ContentView.swift
//  DarkMode_tutorial
//
//  Created by minkyuLee on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack{
            Theme.myBackgroundColor(forScheme: scheme)
            VStack{
                
                Spacer()
                
                Button(action: {
                    print("버튼이 클릭되었다.")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인하러 가기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Theme.myButtonChBackgroundColor(forScheme: scheme))
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                        .overlay(RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.white, lineWidth: 3))
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("안녕하세요"), message: Text("오늘은 휴가"), dismissButton: .default(Text("닫기")))
                })
                
                Spacer().frame(height: 100)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        
        let lightColor = Color.white
        let darkColor = Color.black
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> UIColor {
        
        //#colerLiteral(
        let lightColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        let darkColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonChBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        
        let lightColor = Color.white
        let darkColor = Color.pink
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
}
