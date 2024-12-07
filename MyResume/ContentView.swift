//
//  ContentView.swift
//  MyResume
//
//  Created by WorkSpace on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared;
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                HStack {
                    Image("avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200)
                    
                    VStack (spacing: 20) {
                        Text(me.name)
                            .font(.title).bold()
                        Text(me.title)
                        Label(me.location, systemImage: "location.fill")
                            .foregroundColor(.secondary)
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor)
                    }
                    
                }
                
                Text(me.bio).font(.title3).lineSpacing(10)
                
                Text("Contact Me")
                    .foregroundColor(.white)
                    .font(.title2.weight(.bold))
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
                
                Text("Skills")
                    .font(.title2.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    ForEach(me.skills, id: \.self) { item in
                        VStack {
                            Image(item)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            Text(item)
                            
                            
                        }
                        if item != me.skills.last {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                Text("Experience")
                    .font(.title2.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (spacing: 0) {
                    ForEach(me.experiences, id: \.title) { exp in
                        
                        HStack (spacing: 30) {
                            
                            Circle().frame(width: 10)
                                .background( Rectangle().frame(width: 5, height: 120) )
                                .foregroundColor(.gray)
                            
                            VStack (spacing: 8) {
                                Group {
                                    Text("\(exp.start) - \(exp.end)")
                                        .foregroundColor(.secondary)
                                    Text(exp.title).bold()
                                    Text(exp.company).padding(.bottom, 30)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                        }
                        
                    }
                }
                
                
                
            }.padding()
        }
        
    }
}

#Preview {
    ContentView()
}
