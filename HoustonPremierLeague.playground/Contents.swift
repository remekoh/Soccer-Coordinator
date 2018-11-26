// Soccer Coordinator Project - Treehouse iOS Techdegree Unit 1 Project - Reme Ekoh

/*
 Part 1
 League Players Data
 */

// Instead of listing out each player in a dictionary and then later adding them to another collection, I'm creating an array of dictionaries to hold all player data

let players: [[String : Any]] = [
  ["name": "Joe Smith", "heightInInches": 42, "isExperienced": true, "namesOfGuardians": "Jim and Jan Smith"],
  ["name": "Jill Tanner", "heightInInches": 36, "isExperienced": true, "namesOfGuardians": "Clara Tanner"],
  ["name": "Bill Bon", "heightInInches": 43, "isExperienced": true, "namesOfGuardians": "Sara and Jenny Bon"],
  ["name": "Eva Gordon", "heightInInches": 45, "isExperienced": false, "namesOfGuardians": "Wendy and Mike Gordon"],
  ["name": "Matt Gill", "heightInInches": 40, "isExperienced": false, "namesOfGuardians": "Charles and Sylvia Gill"],
  ["name": "Kimmy Stein", "heightInInches": 41, "isExperienced": false, "namesOfGuardians": "Bill and Hillary Stein"],
  ["name": "Sammy Adams", "heightInInches": 45, "isExperienced": false, "namesOfGuardians": "Jeff Adams"],
  ["name": "Karl Saygan", "heightInInches": 42, "isExperienced": true, "namesOfGuardians": "Heather Bledsoe"],
  ["name": "Suzane Greenberg", "heightInInches": 44, "isExperienced": true, "namesOfGuardians": "Henrietta Dumas"],
  ["name": "Sal Dali", "heightInInches": 41, "isExperienced": false, "namesOfGuardians": "Gala Dali"],
  ["name": "Joe Kavalier", "heightInInches": 39, "isExperienced": false, "namesOfGuardians": "Sam and Elaine Kavalier"],
  ["name": "Ben Finkelstein", "heightInInches": 44, "isExperienced": false, "namesOfGuardians": "Aaron and Jill Finkelstein"],
  ["name": "Diego Soto", "heightInInches": 41, "isExperienced": true, "namesOfGuardians": "Robin and Sarika Soto"],
  ["name": "Chloe Alaska", "heightInInches": 47, "isExperienced": false, "namesOfGuardians": "David and Jamie Alaska"],
  ["name": "Arnold Willis", "heightInInches": 43, "isExperienced": false, "namesOfGuardians": "Claire Willis"],
  ["name": "Phillip Helm", "heightInInches": 44, "isExperienced": true, "namesOfGuardians": "Thomas Helm and Eva Jones"],
  ["name": "Les Clay", "heightInInches": 42, "isExperienced": true, "namesOfGuardians": "Wynonna Brown"],
  ["name": "Herschel Krustofski", "heightInInches": 45, "isExperienced": true, "namesOfGuardians": "Hyman and Rachel Krustofski"]
]

/*
 Part 2
 Logic to sepearate players into their respective teams
 */

// Experienced players Collection
var experiencedPlayers: [[String: Any]] = []

// Inexperienced players Collection
var inexperiencedPlayers: [[String: Any]] = []

// Logic to iterate through all players and seperate into groups of experienced & inexperienced players
for player in players {
  if let experienced = player["isExperienced"] as? Bool {
    if experienced {
      experiencedPlayers.append(player)
    }
    else {
      inexperiencedPlayers.append(player)
    }
  }
}

// Testing the above logic
experiencedPlayers.count
inexperiencedPlayers.count

// Collections for all teams in the League
var teamDragons: [[String: Any]] = []
var teamSharks: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

// Collection holding the total number of teams in the league to avoid hard-coding
let teamsInTheLeague = [teamRaptors, teamSharks, teamDragons]

// Constants to hold data and avoid hard-coding
let limitOfExperiencedPlayers = experiencedPlayers.count / teamsInTheLeague.count
let totalPlayersInTeams = players.count / teamsInTheLeague.count

// Logic to add players to the three teams, ensuring balance of Experienced and Inexperienced players on all teams

// Sort through experienced players
for experiencedPlayer in experiencedPlayers {
  if teamDragons.count < limitOfExperiencedPlayers {
    teamDragons.append(experiencedPlayer)
  } else if teamRaptors.count < limitOfExperiencedPlayers {
    teamRaptors.append(experiencedPlayer)
  } else if teamSharks.count < limitOfExperiencedPlayers {
    teamSharks.append(experiencedPlayer)
  }
}

// Sort through inexperienced players
for inexperiencedPlayer in inexperiencedPlayers {
  if teamSharks.count < totalPlayersInTeams {
    teamSharks.append(inexperiencedPlayer)
  } else if teamRaptors.count < totalPlayersInTeams {
    teamRaptors.append(inexperiencedPlayer)
  } else if teamDragons.count < totalPlayersInTeams {
    teamDragons.append(inexperiencedPlayer)
  }
}

// Check count to confirm above logic
teamSharks.count
teamDragons.count
teamRaptors.count

/*
 Part 3
 Personalized letters to guardians
 */

// Array to hold all letters to guardians
var letters = [String]()

// Constants for team practice dates amd times
let teamDragonsPraticeInfo = "March 17, 1pm"
let teamRaptorsPracticeInfo = "March 17, 3pm"
let teamSharksPracticeInfo = "March 18, 1pm"

// Contants to hold team names
let teamDragonsName = "Dragons"
let teamSharksName = "Sharks"
let teamRaptorsName = "Raptors"


//Function to generate the letters that will be sent to the guardian(s) of each player
func generateLettersToGuardiansUsing(team: [[String: Any]], teamName: String, teamPracticeInfo: String) {
  for player in team {
    if let nameOfGuardian = player["namesOfGuardians"], let nameOfPlayer = player["name"] {
      let letterToGuardian = "Dear \(nameOfGuardian), \n\n We are excited for the start of the 2018/2019 Season of the Houston Premier League! Your child, \(nameOfPlayer), has been seleted as a member the \(teamName). Their first practice for this season will be on \(teamPracticeInfo). The attached PDF will have more information. \n\n Looking forward to a fun season. \n\n Thanks, \n Reme Ekoh \n HPL Soccer Coordinator"
      letters.append(letterToGuardian)
    }
  }
}

// Create guardian letters by calling above function with declared constants
generateLettersToGuardiansUsing(team: teamRaptors, teamName: teamRaptorsName, teamPracticeInfo: teamRaptorsPracticeInfo)
generateLettersToGuardiansUsing(team: teamDragons, teamName: teamDragonsName, teamPracticeInfo: teamDragonsPraticeInfo)
generateLettersToGuardiansUsing(team: teamSharks, teamName: teamSharksName, teamPracticeInfo: teamSharksPracticeInfo)

// Print guardian letters
for letter in letters {
  print(letter, "\n")
}

// End of Project
