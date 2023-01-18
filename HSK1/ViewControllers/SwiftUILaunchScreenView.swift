//
//  SwiftUILaunchScreenView.swift
//  HSK1
//
//  Created by mac on 02.11.2022.
//

import SwiftUI

struct SwiftUILaunchScreenView: View {
    var body: some View {
    VStack{
        Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .font(.system(size: 50))
        Spacer()
            Rectangle()
                .foregroundColor(.yellow)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .font(.system(size: 50))
        Spacer()
        }
    }
}

struct SwiftUILaunchScreenView_Previews:
    PreviewProvider {
    static var previews: some View {
        SwiftUILaunchScreenView()
.previewInterfaceOrientation(.portrait)
    }
}
