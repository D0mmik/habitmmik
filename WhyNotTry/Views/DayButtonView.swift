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
    let isActive: Bool;
    
    var body: some View {
        
        
        Button(String(text)) {
            
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
    DayButtonView(text: "10", isToday: true, isActive: true)
}
