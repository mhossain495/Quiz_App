//  ViewController.swift
//  Quizzler-iOS13



import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Calling function to display question on UI.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        } else {
            sender.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
        
        // Go to next question in array
        
        quizBrain.nextQuestion()
        
        // Time delay between animations.
        
        let delay = 0.2
        UIView.animate(withDuration: delay, animations: { self.updateUI()
        })
        
    }
    
    // Function to update progress bar, change question, and clear True/False button colors after answering question.
    
    func updateUI() {
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
    
    
}


