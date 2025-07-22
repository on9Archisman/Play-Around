import UIKit

/* Write a function to move all 0s to the end of it while maintaining the relative order of the non-zero elements. Example: Input: [0,1,0,3,12] Output: [1,3,12,0,0] */

let givenNumberArray = [0, 1, 0, 3, 12]
let sortedNumberArray = givenNumberArray.sorted()
print(sortedNumberArray)
var resultNumberArray: [Int] = []
var resultNumberArray_Temp: [Int] = []
sortedNumberArray.compactMap {
    if $0 == 0 {
        resultNumberArray_Temp.append($0)
    } else {
        resultNumberArray.append($0)
    }
}
print(resultNumberArray)
print(resultNumberArray_Temp)
// resultNumberArray.append(contentsOf: resultNumberArray_Temp)
resultNumberArray += resultNumberArray_Temp
print("Type 1:", resultNumberArray)

func moveZerosToEnd(inputArray: inout [Int]) {
    let count = inputArray.count
    var index = 0
    
    for number in inputArray where number != 0 {
        inputArray[index] = number
        index += 1
    }
    
    while index < count {
        inputArray[index] = 0
        index += 1
    }
}
var givenNumberArray_2 = [0, 1, 0, 3, 12]
moveZerosToEnd(inputArray: &givenNumberArray_2)
print("Type 2:", givenNumberArray_2)

print("--------------------------------------------------")

/* Write a function to check whether the given string is anagram */

// Type 1
func anagram_one(input_one: String, input_two: String) -> Bool {
    let finalStr1 = input_one.lowercased().filter { $0.isWhitespace == false }
    print(finalStr1)
    
    let finalStr2 = input_two.lowercased().filter { $0.isWhitespace == false }
    print(finalStr2)
    
    guard finalStr1.count == finalStr2.count else {
        return false
    }
    
    return finalStr1.sorted() == finalStr2.sorted()
}

print("Type 1:", anagram_one(input_one: "Listen ", input_two: " Silent"))
print("Type 1:", anagram_one(input_one: " Hello", input_two: "World"))

// Type 2
func anagram_two(input_one: String, input_two: String) -> Bool {
    var dict: [Character: Int] = [:]
    
    let finalStr1 = input_one.lowercased().filter { $0.isWhitespace == false }
    print(finalStr1)
    
    let finalStr2 = input_two.lowercased().filter { $0.isWhitespace == false }
    print(finalStr2)
    
    for char in finalStr1 {
        dict[char, default: 0] += 1
    }
    
    print(dict)
    
    for char in finalStr2 {
        dict[char, default: 0] -= 1
    }
    
    print(dict)
    
    for (key, value) in dict {
        if value != 0 {
            return false
        }
    }
    
    return true
}

print("Type 2:", anagram_two(input_one: "Listen ", input_two: " Silent"))
print("Type 2:", anagram_two(input_one: " Hello", input_two: "World"))

print("--------------------------------------------------")

/* Check Unique Charecter */

func checkUnique(input: String) -> Bool {
    let finalInput = input.filter { !$0.isWhitespace }
    
    var customeArray: Array<Character> = []
    
    for char in finalInput {
        if customeArray.contains(char) {
            return false
        }
        
        customeArray.append(char)
    }
    
    return true
}

print("Type 1:", checkUnique(input: "program "))
print("Type 1:", checkUnique(input: "swift"))

func checkUnique_DictDefault(input: String) -> Bool {
    let finalInput = input.filter { !$0.isWhitespace }
    
    var customDict: [Character: Int] = [:]
    
    for char in input {
        customDict[char, default: 0] += 1
    }
    
    for (key, value) in customDict {
        if value != 1 {
            return false
        }
    }
    
    return true
}

print("Type 2:", checkUnique_DictDefault(input: "program "))
print("Type 2:", checkUnique_DictDefault(input: "swift"))

print("--------------------------------------------------")

/* Rotate the string */

func rotateString(input: String) -> String {
    var finalRotateString = ""
    
    for char in input {
        print("Before>", finalRotateString)
        finalRotateString = String(char) + finalRotateString
        print("After>", finalRotateString)
    }
    
    return finalRotateString
}

print(rotateString(input: "Archisman"))

print("--------------------------------------------------")

/* Find the vowels */

func findVowels(input: String) -> [Character] {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    
    var finalVowels: [Character] = []
    
    for char in input {
        if vowels.contains(char) {
            finalVowels.append(char)
        }
    }
    
    return finalVowels
}

print(findVowels(input: "Hello Swift World"))

print("--------------------------------------------------")

/* Check Palindrome */

func checkPalindrome(input: String) -> Bool {
    let finalInput = input.lowercased().filter { !$0.isWhitespace }
    print(finalInput)
    
    var finalOutput = ""
    
    for char in finalInput {
        finalOutput = "\(char)\(finalOutput)"
    }
    
    return finalInput == finalOutput
}

print(checkPalindrome(input: "Never odd or even"))
print(checkPalindrome(input: "Madam"))

print("--------------------------------------------------")

/* Find Non Repeating Character */

func findNonRepeatingCharacter(input: String) -> [Character] {
    let finalInput = input.filter { !$0.isWhitespace }
    
    var customDict: [Character: Int] = [:]
    
    for char in finalInput {
        if customDict.keys.contains(char) {
            
            let value = customDict[char]
            
            if let finalValue = value {
                customDict[char] = finalValue + 1
            } else {
                customDict[char] = 1
            }
        } else {
            customDict[char] = 1
        }
        
        // OR
        
        // customDict[char, default: 0] += 1
    }
    
    var finalNonRepeatingCharacter: [Character] = []
    
    for (key, value) in customDict {
        if value == 1 {
            finalNonRepeatingCharacter.append(key)
        }
    }
    
    return finalNonRepeatingCharacter
}

print(findNonRepeatingCharacter(input: "Archisman Banerjee"))
