//
//  CreateViewController.swift
//  Todo
//
//  Created by Daniel on 1/13/24.
//

import UIKit

class CreateViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    // MARK: Properties
    var textViewHeightConstraint: NSLayoutConstraint?
    var cancelBtn: UIButton!
    var createBtn: UIButton!
    private var titleTextField: UITextField!
    private var noteTextView: UITextView!


    private let titleLabel: UILabel = {
        let label = UILabel();
        label.font = .boldSystemFont(ofSize: 36)
        label.textColor = .black
        label.text = "What is your task?"
        return label
    }()
    
    private func createButton(title: String, target: Selector, backgroundColor: UIColor) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.addTarget(self, action: target, for: .touchUpInside)
        btn.backgroundColor = backgroundColor
        btn.tintColor = UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 10
        btn.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        return btn
    }
    
    private func textField(t text: String) -> UIStackView {
        let stackView = UIStackView()
        let textField = UITextField()
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.tintColor = UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 0.8)
        textLabel.font = .systemFont(ofSize: 14)

        textField.font = .systemFont(ofSize: 14)
        textField.backgroundColor = .clear
        textField.layer.cornerRadius = 18
        textField.layer.borderColor = UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 0.8).cgColor
        textField.layer.borderWidth = 1
        textField.textColor = UIColor.lightGray

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
            textField.rightView = paddingView
            textField.rightViewMode = .always
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.addArrangedSubview(textLabel)
        textLabel.anchor(top: stackView.topAnchor,left: stackView.leftAnchor, right: stackView.rightAnchor,paddingTop: 0, paddingLeft: 8 ,paddingRight: 0)
        stackView.addArrangedSubview(textField)
        textField.anchor(top: textLabel.bottomAnchor,left: stackView.leftAnchor, right: stackView.rightAnchor,paddingTop: 5, paddingLeft: 0 ,paddingRight: 0, height: 40)
        
        titleTextField = textField
        return stackView
    }
    
    private func noteField(n note: String) -> UIStackView {
        let textLabel = UILabel()
           let textView = UITextView()
           let stackView = UIStackView()

           // label
           textLabel.font = .systemFont(ofSize: 14)
           textLabel.text = note
           textLabel.tintColor = UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 0.8)

           // textView
           textView.font = .systemFont(ofSize: 14)
           textView.backgroundColor = .clear
           textView.layer.cornerRadius = 18
           textView.layer.borderColor = UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 0.8).cgColor
           textView.layer.borderWidth = 1
           textView.textContainerInset = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 12)

           stackView.axis = .vertical
           stackView.spacing = 12
           stackView.addArrangedSubview(textLabel)
           textLabel.anchor(top: stackView.topAnchor, left: stackView.leftAnchor, right: stackView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingRight: 0)
           
           stackView.addArrangedSubview(textView)
           textView.anchor(top: textLabel.bottomAnchor, left: stackView.leftAnchor, right: stackView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingRight: 0)
           
           textView.isScrollEnabled = false
           textView.translatesAutoresizingMaskIntoConstraints = false
           textView.textColor = UIColor.lightGray
           textView.font = UIFont.systemFont(ofSize: 16)
        
            noteTextView = textView
           return stackView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    // MARK: - Helper function
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor,paddingTop: 70)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        let form = UIStackView();
        let noteTtl = textField(t: "Note Title")
        let task = noteField(n: "Task")
        form.axis = .vertical
        form.spacing = 15
        form.addArrangedSubview(noteTtl)
        form.addArrangedSubview(task)
        view.addSubview(form)
        if let textView = task.arrangedSubviews.last as? UITextView {
        textView.delegate = self
        textViewHeightConstraint = textView.heightAnchor.constraint(equalToConstant: 100)
        textViewHeightConstraint?.isActive = true
        }

        if let noteFiled = noteTtl.arrangedSubviews.last as? UITextField {
            noteFiled.delegate = self
        }
        
        noteTtl.anchor(top: form.topAnchor, left: form.leftAnchor, right: form.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0)
        task.anchor(left: view.leftAnchor, right: view.rightAnchor,paddingLeft: 30, paddingRight: 30)
        form.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 30, paddingRight: 30)

        let stackView = UIStackView();
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        createBtn = createButton(title: "Create", target: #selector(createTodo), backgroundColor: UIColor(red: 159.0/255.0, green: 230.0/255.0, blue: 160.0/255.0, alpha: 1))
        cancelBtn = createButton(title: "Cancel", target: #selector(cancelTodo), backgroundColor: UIColor(red: 86.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1))
        
        stackView.addArrangedSubview(createBtn)
        stackView.addArrangedSubview(cancelBtn)
        view.addSubview(stackView)
        stackView.anchor(top: form.bottomAnchor ,left: view.safeAreaLayoutGuide.leftAnchor ,right: view.safeAreaLayoutGuide.rightAnchor,paddingTop: 20,paddingLeft: 12, paddingRight: 12)
        createBtn.anchor(top: stackView.topAnchor ,left: stackView.leftAnchor,right: stackView.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12, height: 50)
        cancelBtn.anchor(top: createBtn.bottomAnchor, left: stackView.leftAnchor, right: stackView.rightAnchor, paddingTop: 10, paddingLeft: 12, paddingRight: 12, height: 50)
        
        // Set up constraints for the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        

    }
    
    func btnAnimation(btn :UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            btn.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
               }) { _ in
                   UIView.animate(withDuration: 0.1) {
                       btn.transform = .identity
                   }
               }
    }
    
    // MARK: - LifeCycle and Delegate
    func textViewDidChange(_ textView: UITextView) {
            updateTextViewHeight(textView)
        }

    func updateTextViewHeight(_ textView: UITextView) {
        // Update the height constraint based on the content size
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        if ceil(newSize.height) < 117  {
            textViewHeightConstraint?.constant = 100
        } else {
            textViewHeightConstraint?.constant = newSize.height
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true
    }
    
    // MARK: - Selectors
    @objc func createTodo() {
        self.btnAnimation(btn: createBtn)
        guard let ttl = titleTextField.text else {return}
        guard let note = noteTextView.text else {return}
        PostService.share.insertItem(ttl: ttl, note: note ){
            (err,ref) in
            self.titleTextField.text = ""
            self.noteTextView.text = ""
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @objc func cancelTodo() {
        self.btnAnimation(btn: cancelBtn)
        dismiss(animated: true, completion: nil)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
