//
//  DiceGame.swift
//
//  Created by Val I on 2025-03-01.
//  Version 1.0
//  Copyright (c) 2025 Val I. All rights reserved.
//
//  The DiceGame program generates a random number between 1 and 6,
//  and the user has to guess the number. The program provides feedback
//  on whether the guess is too high or too low and counts the number of guesses.
//

import Foundation

// Creates Random int
var randInt = Int.random(in: 1...6)

// Set default variables
var counter = 0
var userGuess = 0

// defines error for catch
enum InputError: Error {
    case invalidNumber
}

// greet user
print("Welcome to the Dice Game!")
print("Guess a number between 1 and 6: ")

// uses loop to get guess
while userGuess != randInt {
    // do catch to make sure guess is an int
    do{
        // Gets guess from user
        guard let userGuessStr = readLine() else{
            throw InputError.invalidNumber
        }
        // tries to convert guess to int
        guard let guess = Int(userGuessStr) else {
            throw InputError.invalidNumber
        }
        userGuess = guess

        // Checks if guess is too high, low or right
        if userGuess == randInt {
            print("You guessed it!")
        } else if userGuess > randInt {
            print("Your guess is too high. Try again.")
        } else {
            print("Your guess is too low. Try again.")
        }

    } catch {
        // displays error input
        print("Input a valid number.")
    }
    // adds 1 to counter
    counter = counter + 1
}
// displays amount of tries
print("it took you \(counter) tries")