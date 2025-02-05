//
//  DayButtonView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 25.01.2025.
//

import SwiftUI

struct DayButtonView: View {
    
    let text: String;
    let isToday: Bool;
    @State private var isActive: Bool = false
    
    var body: some View {
        
        
        Button(String(text)) {
            isActive.toggle()
        }
        .frame(width: 40, height: 40)
        .background(isActive ? .blue : .clear)
        .foregroundColor(.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(isActive || isToday ? .blue : .gray, lineWidth: 2)
        )
    }
}

#Preview {
    DayButtonView(text: "10", isToday: true)
}
