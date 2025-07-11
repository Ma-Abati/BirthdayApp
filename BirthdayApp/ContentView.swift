//
//  ContentView.swift
//  BirthdayApp
//
//  Created by Maia Fattori Abati on 11/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    //friend array
    @State private var friends: [Friend] = [
        Friend(name: "Maia", birthday: .now),
        Friend(name: "Aira", birthday: .now)
    ]
    
    var body: some View {
        NavigationStack{
            
            List(friends, id: \.name){ friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text ("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName )
                            .textFieldStyle(.roundedBorder)
                           
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                          
                    }
                
                    .bold()
                }
                .padding()
            }
            
        }  // nav stack
        
    } //closing body
}










#Preview {
    ContentView()
}
