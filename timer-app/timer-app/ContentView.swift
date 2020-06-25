//
//  ContentView.swift
//  timer-app
//
//  Created by Jeremy's Macbook Pro 16 on 6/24/20.
//  Copyright © 2020 Jeremy Tandjung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var timerMode: TimerMode = .paused
    @State private var selectedPickerIndex = 0
    @ObservedObject private var timerManager = TimerManager()
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(secondsToMinutesAndSeconds(timerManager.secondsLeft))")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180.0, height: 180.0)
                    .foregroundColor(.orange)
                    .onTapGesture {
                        if self.timerManager.timerMode == .initial {
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex] * 60)
                        }
                        
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                }
                
                if timerManager.timerMode == .paused {
                    Image(systemName: "gobackward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50.0, height: 50.0)
                    .padding(.top, 40)
                        .onTapGesture {
                            self.timerManager.reset()
                    }
                }
                
                if timerManager.timerMode == .initial {
                    Picker("", selection: $selectedPickerIndex) {
                        ForEach(0..<self.availableMinutes.count) {
                            if self.availableMinutes[$0] == 1 {
                                Text("1 minute")
                            } else {
                                Text("\(self.availableMinutes[$0]) minutes")
                            }
                        }
                    }
                .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("My Timer")
        }
    }
    func start() {
        timerMode = .running
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
