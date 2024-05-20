//
//  BadgeBackground.swift
//  PeakPeace
//
//  Created by Rodion Akhmedov on 5/20/24.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { reader in
            Path { path in
                var width: CGFloat = min(reader.size.width, reader.size.height)
                let height = width
                let xScale = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParametrs.adjustment)
                    )
                )
                
                HexagonParametrs.segments.forEach { segment in
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(.linearGradient(Gradient(colors: [Self.colorStart, Self.colorEnd]), startPoint: UnitPoint(x: 0.50, y: 0.00), endPoint: UnitPoint(x: 0.50, y: 0.60)))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    static let colorStart = Color(red: 239 / 255, green: 120 / 255, blue: 221 / 255)
    static let colorEnd = Color(red: 239 / 255, green: 172 / 255, blue: 120 / 255)
}

#Preview {
    BadgeBackground()
}
