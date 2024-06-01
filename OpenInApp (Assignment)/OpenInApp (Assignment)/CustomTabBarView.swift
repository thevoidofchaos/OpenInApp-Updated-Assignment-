//
//  CustomTabBarView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 02/06/24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var selectedIndex: Int
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            
            Button(action: {
                selectedIndex = 0
                impactFeedbackGenerator.impactOccurred()
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "house")
                    Text("Links")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                    
                }
                    
            })
            .foregroundStyle(selectedIndex == 0 ? (colorScheme == .light ? Color.black : Color.white) : Color.gray)
//            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                selectedIndex = 1
                impactFeedbackGenerator.impactOccurred()
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "house")
                    Text("Courses")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                    
                }
            })
            .foregroundStyle(selectedIndex == 1 ? (colorScheme == .light ? Color.black : Color.white) : Color.gray)
            
            Spacer()
            
            Button(action: {
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.large)
                    .foregroundStyle(Color.white)
                    .padding()
                    .background {
                        Circle()
                            .frame(height: 80)
                    }
            })
            .shadow(color: Color(uiColor: .systemBlue).opacity(0.5), radius: 5, y: 2)
            .offset(x: 12, y: -15)
            
            Spacer()
            
            Button(action: {
                selectedIndex = 2
                impactFeedbackGenerator.impactOccurred()
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "house")
                    Text("Campaigns")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                    
                }
            })
            .foregroundStyle(selectedIndex == 2 ? (colorScheme == .light ? Color.black : Color.white) : Color.gray)
//            .padding(.leading, 20)
            
            Spacer()
            
            Button(action: {
                selectedIndex = 3
                impactFeedbackGenerator.impactOccurred()
            }, label: {
                VStack(spacing: 5) {
                    Image(systemName: "house")
                    Text("Profile")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                    
                }
            })
            .foregroundStyle(selectedIndex == 3 ? (colorScheme == .light ? Color.black : Color.white) : Color.gray)
            
//                        Spacer()
        }
        .padding(.horizontal)
        .background {
            CustomTabShape()
                .fill(colorScheme == .light ? .white : .black)
                .shadow(color: .black.opacity(0.2), radius: 5)
                
        }
        
    }
}

struct CustomTabBarView_Preview: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(selectedIndex: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}

struct CustomTabShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: UIScreen.main.bounds.maxY))
            path.addLine(to: CGPoint(x: rect.width, y: UIScreen.main.bounds.maxY))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            let center = rect.width / 2
            path.move(to: CGPoint(x: center - 45, y:
            0))
            let to1 = CGPoint(x: center, y: -20)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: -20)
            
            let to2 = CGPoint(x: center + 45, y: 0)
            let control3 = CGPoint(x: center + 25, y: -20)
            let control4 = CGPoint(x: center + 25, y: 0)
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

