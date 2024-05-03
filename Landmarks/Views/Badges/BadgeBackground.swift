//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct BadgeBackground untuk menampilkan latar belakang badge.
struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in // Membaca geometri dari tata letak.
            Path { path in // Membuat path untuk latar belakang badge.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move( // Memindahkan path ke titik awal.
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )

                // Menambahkan garis dan kurva pada path sesuai parameter dari HexagonParameters.
                HexagonParameters.segments.forEach { segment in
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
            .fill(.linearGradient( // Mengisi path dengan gradien linear.
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0), // Titik awal gradien.
                endPoint: UnitPoint(x: 0.5, y: 0.6) // Titik akhir gradien.
            ))
        }
        .aspectRatio(1, contentMode: .fit) // Menyesuaikan aspek rasio tata letak.
    }
    // Warna awal dan akhir gradien untuk latar belakang badge.
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}


#Preview {
    BadgeBackground()
}
