//
//  ClockControlView.swift
//  ClockCircularSlider
//
//  Created by edi santoso on 04/06/23.
//

import SwiftUI

struct ClockControlView: View {
    @Binding var clockValue: CGFloat
    @State var angleValue: CGFloat  = 0.0
    let minimumValue: CGFloat       = 15.0
    let maximumValue: CGFloat       = 40.0
    let totalValue: CGFloat         = 100.0
    let knobRadius: CGFloat         = 10.0
    let radius: CGFloat             = 40.0
    
    @Binding var circleColor: Color
    
    let colorChanged: (Color) -> Void
    
    var body: some View {
        HStack{
            
            Image(systemName: "sun.max.fill")
                .font(.system(size: 18))
                .foregroundColor(.orange)
                .onTapGesture {
                }
            ZStack {
               
//                OutBorderCircle()
                Circle()
                    .trim(from: minimumValue/totalValue, to: maximumValue/totalValue)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [Color.orange, Color.blue]),
                            center: .center,
                            startAngle: .degrees(50),
                            endAngle: .degrees(150))
                        ,
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        
                    )
                    .frame(width: radius * 5, height: radius * 5)
                    .rotationEffect(.degrees(-180))
                
                Group {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                        .rotationEffect(.degrees(45))
                        .offset(y: -20)
                        .rotationEffect(Angle.degrees(CGFloat(angleValue)))
                    
                    
                    KnobCircle(radius: knobRadius * 2, padding: 6)
                        .offset(y: -radius)
                        .rotationEffect(Angle.degrees(CGFloat(angleValue)))
                        .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged({ value in
                                change(location: value.location)
                                print(value.startLocation)
                            }).onEnded({ value in
                                let knobCenterX = knobRadius + value.startLocation.x
                                let knobCenterY = knobRadius + value.startLocation.y
                                let knobOffsetX = value.location.x - knobCenterX
                                let knobOffsetY = value.location.y - knobCenterY
                                
                                if knobOffsetX > 0 && knobOffsetY > 0 {
                                    circleColor = .green
                                    colorChanged(.green)
                                } else if knobOffsetX < 0 && knobOffsetY < 0 {
                                    circleColor = .orange
                                    colorChanged(.orange)
                                } else {
                                    circleColor = .blue
                                    colorChanged(.blue)
                                }
                            })
                                 
                        )
                    
                    
                }
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: -3, y: 2)
                .rotationEffect(.degrees(-100))
                
                
                
                KnobCircle(radius: 30, padding: 10)
                
                
                InnerCircle()
                
            }
            .onAppear {
                updateInitialValue()
            }
            Image(systemName: "moon.fill")
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .onTapGesture {
                }
        }
    }
    
    private func updateInitialValue() {
        clockValue = minimumValue
        angleValue = CGFloat(clockValue/totalValue) * 360
    }
    
    private func change(location: CGPoint) {
        let vector = CGVector(dx: location.x, dy: location.y)
        let angle = atan2(vector.dy - knobRadius, vector.dx - knobRadius) + .pi/2.0
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        let value = fixedAngle / (2.0 * .pi) * totalValue
        
        if value >= minimumValue && value <= maximumValue {
            clockValue = value
            angleValue = fixedAngle * 180 / .pi
        }
        
        
    }
    
    
    
    struct OutBorderCircle: View {
        var body: some View{
            ZStack {
                Circle()
                    .stroke(Color(white: 0.9), lineWidth: 1)
                    .frame(width: 46, height: 46)
                
                Circle()
                    .stroke(LinearGradient(
                        gradient: Gradient(
                            stops: [Gradient.Stop(color: Color(white: 0.9), location: 0.0),
                                    Gradient.Stop(color: Color(white: 0.92), location: 0.5),
                                    Gradient.Stop(color: Color(white: 0.92), location: 1.0)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom),
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: CGLineCap.butt,
                                dash: [2, 8]))
                    .frame(width: 36, height: 36)
            }
        }
    }
    
    struct InnerCircle: View {
        var body: some View {
            ZStack {
                Circle()
                    .fill(ColorConstant.grayCircle)
                    .frame(width: 20, height: 20)
                
                Circle()
                    .fill(ColorConstant.greenCirle)
                    .frame(width: 8, height: 8)
            }
        }
    }
    
    struct KnobCircle: View {
        let radius: CGFloat
        let padding: CGFloat
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.init(white: 0.96))
                    .frame(width: radius, height: radius)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: -10, y: 8)
                
                Circle()
                    .fill(Color.white)
                    .frame(width: radius - padding, height: radius - padding)
            }
        }
    }
}
