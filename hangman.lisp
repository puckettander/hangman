(defun show-secret (secret-word)
  (coerce
   (loop for char across secret-word
	 collect (if (member char guessed-letters)
		     char #\_))
   'string))

(defparameter secret-word "hangman")
(defparameter guessed-letters '())
(defparameter wrong-guesses-left 5)
(defparameter letter-guessed nil)

(loop
  do (print "Unknown word:")
     (print (show-secret secret-word))
     
     (print "Guess letter:")
     (setq letter-guessed
	   (aref (read-line) 0))

     (push letter-guessed guessed-letters)
     (if (not (find letter-guessed secret-word))
	 (progn
	   (format t "letter '~a' not in word" letter-guessed)
	   (decf wrong-guesses-left)))
     
  when (string= (show-secret secret-word) secret-word)
    return (print "YOU WIN")
  when (= wrong-guesses-left 0)
    return (print "too many guesses, GAME OVER"))
