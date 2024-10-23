


var websites: [String] = []

while websites.count < 1000 {
    websites.append("codewars")
}
print(websites)



func greet() -> String {
  return "hello world!"
}




var text = ["h", "e", "l", "l", "o"]
var reversed = [String]()
var counter = text.count - 1

while counter >= 0 {
  reversed.append(text[counter])
  counter -= 1
}

if text == reversed {
  print("We have a palindrome!")
} else {
  print("No palindrome!")
}



struct Exercise {
  var name: String
  var muscleGroups: [String]
  var reps: Int
  var sets: Int
  var totalReps: Int

  init(name: String, muscleGroups: [String], reps: Int, sets: Int) {
    self.name = name
    self.muscleGroups = muscleGroups
    self.reps = reps
    self.sets = sets
    self.totalReps = reps * sets
  }

}

var pushUp = Exercise(name: "Push Up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3) 
var pullUp = Exercise(name: "Pull Up", muscleGroups: ["Biceps", "Back"], reps: 10, sets: 3)

struct Regimen {
  var dayOfWeek: String
  var exercises: [Exercise]

  init(dayOfWeek: String, exercises: [Exercise]) {
    self.dayOfWeek = dayOfWeek
    self.exercises = exercises
  }
  func printExercisePlan() {
    print("Today is \(self.dayOfWeek) and the plan is to:")
    for exercises in self.exercises {
      print("Do \(exercises.sets) sets of \(exercises.reps) \(exercises.name)")
      print("That's a total of \(exercises.totalReps) \(exercises.name)")
    }
  }

}

var mondayRegimen = Regimen(dayOfWeek: "Monday", exercises: [pullUp])

print(mondayRegimen)

mondayRegimen.printExercisePlan()