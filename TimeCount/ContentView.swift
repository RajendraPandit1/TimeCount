//
//  ContentView.swift
//  TimeCount
//
//  Created by rajendra pandit on 22/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var backgroundTaskManager = BackgroundTaskManager.shared
  
   
    var body: some View {
        ZStack {
                
                VStack {
                    
                    
                    HStack {
                        Button(action: {
                            BackgroundTaskManager.shared.start()
                        }) {
                            Text("START")
                                .frame(width: 120, height: 70)
                                .foregroundColor(.white)
                                .frame(width: 110, height: 50, alignment: .center)
                                .background(Color.green)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .cornerRadius(20)
                                .padding()
                        }

                        Button(action: {
                            BackgroundTaskManager.shared.stop()
                        }) {
                            Text("RESET")
                                .frame(width: 110, height: 50, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.red)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .cornerRadius(20)
                                .padding()
                                
                        }
                    }
                    .frame(width: 380, height: 80, alignment: .center)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    
                    HStack{
                                //Button(action: clean){
                                  Text("Day Count")
                                     .foregroundColor(.blue)
                                       .font(.system(size: 30, weight: .bold, design:.default))
                                          .bold()
                                                 //  }
                                               
                                               }
                                            Spacer() //spaceing
                                       
                                       //The number of time indicator
                    VStack {
                        
                        HStack{
                            Text("\(backgroundTaskManager.hourCount)"+":")
                            Text("\(backgroundTaskManager.minuteCount)"+":")
                            Text("\(backgroundTaskManager.secondCount)")
                        }
                            
                                               .font(.system(size: 70, weight: .bold, design: .default))
                                               .padding(10)

                                           Text("Day: (\(backgroundTaskManager.dayCount))")
                                               .font(.system(size: 20, weight: .bold, design: .default))
                                               .padding(10)

                                           Text("Hour: (\(backgroundTaskManager.hourCount))")
                                               .font(.system(size: 20, weight: .bold, design: .default))
                                               .padding(10)

                                           Text("Minute: (\(backgroundTaskManager.minuteCount))")
                                               .font(.system(size: 20, weight: .bold, design: .default))
                                               .padding(10)

                                           Text("Second: (\(backgroundTaskManager.secondCount))")
                                               .font(.system(size: 20, weight: .bold, design: .default))
                                               .padding(10)
                                       } // Vstack
                                       
                                               Spacer() // spaceing
                                    
                                                   HStack{
                                                       ProgressView(value: Double(backgroundTaskManager.hourCount),total: 24) //24 hour on minute
                                                   }.padding()
                                       
                                       
                                               Spacer()// spaceing
                                                
                                       
                                       
                                                   HStack{
                                                    Text("BEST: "+"\(backgroundTaskManager.daymax)")
                                                        .foregroundColor(.blue)
                                                           .font(.system(size: 20, weight: .bold))
                                                           .padding(2)
                                                           .frame(width: 160, height: 25, alignment: .leading)
                                                       
                                                       
                                                       Text("GAVE UP: "+"\(backgroundTaskManager.gaveUp)")
                                                           .foregroundColor(.blue)
                                                           .font(.system(size: 20, weight: .bold))
                                                           .padding(2)
                                                           .frame(width: 160, height: 25, alignment: .trailing)
                                                           
                                                   }//Hstack
                                                   
                                                   
                                       
                                                   
                                                   //buttom  blue color bar and two buttons
                                                Spacer()
                                       

                    // Buttons to start and reset the timer
                    
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
