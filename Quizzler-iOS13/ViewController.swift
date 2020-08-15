//  ViewController.swift
//  Quizzler-iOS13



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //array of questions
    let quiz = [
    Question(q:"First Question", a:"True"),
    Question(q:"Second Question", a:"True"),
    Question(q:"Third Question", a:"False")]
    
    
    
    var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI() //calling function to display question on UI
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.a
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {questionNumber = 0
            
        }
        
        
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber].q
    }
    
    
}


