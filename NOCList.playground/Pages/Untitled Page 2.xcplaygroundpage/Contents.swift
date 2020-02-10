
let agent1 = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: false)
let agent2 = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: true)
let agent3 = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
let agent4 = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
let agent5 = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
let agent6 = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
let agent7 = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
let agent8 = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
let agent9 = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
let agent10 = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
let agent11 = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)

let nocList = [agent1, agent2, agent3, agent4, agent5, agent6, agent7, agent8, agent9, agent10, agent11]



func compAgents (_ list: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) -> Int  {
    var compromisedAgents: Int = 0;
    for agent in list {
        if agent.compromised {
            compromisedAgents += 1
            print("Agent \(agent.coverName) is compromised.")
        }
    }
    
    return compromisedAgents
}

func findCleanAgents (_ list: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) -> [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)] {
    
    var cleanAgents: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)] = []
    
    for agent in list {
        if !(agent.compromised) {
            cleanAgents.append(agent)
            print("Agent \(agent.coverName) is uncompromised.")
        }
    }
    
    return cleanAgents
}

func findHighRisk (_ list: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) {
    
    for agent in list {
        var string = ""
        
        if agent.accessLevel > 7 {
            string = "\(agent.realName), level \(agent.accessLevel)"
            if agent.compromised {
                string += " **WARNING** **COMPROMISED**"
            }
            print(string)
        }
    }
    
}

func agentLevels (_ list: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) {
    var low: UInt = 0
    var mid: UInt = 0
    var high: UInt = 0
    
    for agent in list {
        switch agent.accessLevel {
        case 0...4:
            low += 1
        case 5...7:
            mid += 1
        default:
            high += 1

        }
    }
    print("\(low) low level agents, \(mid) mid level agents, and \(high) high level agents.")
}

func levelOrder (_ list: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)]) {
    var holder = list // Pass by value. This will have its content deleted overtime.
    var next = holder[0] // Start with first item in the array
    var index = 0 // This will let us delete the item after it's printed
    

    while holder.count > 0 { // For as long as our placeholder has any items in it, loop.
        for i in 0..<holder.count {
            // check if said item is smaller
            if holder[i].accessLevel < next.accessLevel {
                // If it is, make it the new agent. Do this until there is no smaller one
                next = holder[i]
                index = i
            }
            
        }

        print("\(next.coverName), level \(next.accessLevel)") // Print the agent we're left with
        holder.remove(at: index) // Remove this agent from the holder or get ready for xcode to YELL at you.
        if holder.count > 0 { // Check if items left
          next = holder[0] // Reset next to index 0 of the array
          index = 0 // Reset index back to 0
        }
        
        
    }
    
}

print("\(compAgents(nocList)) agents are compromised.")

findCleanAgents(nocList)

print("\(findCleanAgents(nocList).count) clean agents out of \(nocList.count) agents.")

findHighRisk(nocList)

agentLevels(nocList)

levelOrder(nocList)


