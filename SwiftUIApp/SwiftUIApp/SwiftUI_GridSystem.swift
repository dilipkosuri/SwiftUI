//
//  SwiftUI_GridSystem.swift
//  SwiftUIApp
//
//  Created by Dilip Kosuri on 2022-08-19.
//

import SwiftUI

struct AlignmentView: View {
    var body: some View {
        SwiftUI_GridSystem()
    }
}

struct DataToDisplay {
    let flag: [String] = ["🇸🇨","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🇺🇸","🇫🇲","🇵🇳","🇲🇦","🇨🇳","🇬🇧","🏳️‍🌈","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇩🇰","🇲🇲"]
    let vehicle: [String] = ["🚗","🚀","🚘","⛴","🏎","🚚","🚕","🛫","🚐","🚎","🚛","🚙"]
}

struct SwiftUI_GridSystem: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        
        let data = DataToDisplay()
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 80)) // For min 80, will be expanded to more columns if the screen can accommodate more
                /**
                 GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
                 This will create exactly 3 columns.
                 */
            ],
            alignment: .center,
            spacing: 10,
            pinnedViews: [],
            content: {
                ForEach((1...11).reversed(), id: \.self) { index in
                    cellView(top: data.flag[index],
                             bottom: data.vehicle[index],
                             alignment: .center)
                }
            })
    }
}

private func cellView(top: String, bottom: String, alignment: Alignment) -> some View {
    VStack(spacing: 0) {
        Group {
            Text(top)
                .font(.subheadline)
            Text(bottom)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: alignment)
        .lineLimit(1)
    }
}


struct SwiftUI_GridSystem_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentView()
            .previewDevice("iPhone 8")
    }
}

