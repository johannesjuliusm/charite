#' @noRd
.motivational_statements <- c(
  "Begin before you're ready.",
  "You've got this!",
  "You can do this!",
  "Just do it.",
  "Make today count.",
  "Trust the process.",
  "Impossible is nothing.",
  "One line of code at a time.",
  "Small steps move you forward.",
  "Keep going. Future you will be proud you did.",
  "Seize the day!",
  "Don't quit now.",
  "Courage!",
  "Not bad. Not bad at all.",
  "Trust me, it's worth it.",
  "Trust me, you can do this without AI.",
  "One small step for you, one big leap for your project!",
  "Keep calm and code on.",
  "Shouldn't you be working on your code right now?",
  "Almost there!",
  "Progress, not perfection.",
  "Take a break from worrying about what you can't control.",
  "Live a little!",
  "We are all once beginners.",
  "A pro is a beginner who didn't quit.",
  "Progress is progress.",
  "Take a breath. Then try again.",
  "Every expert was once a beginner.",
  "Today's bug is tomorrow's experience.",
  "You are closer than you think.",
  "Don't stop believing!",
  "Don't ever let somebody tell you you can't do something.",
  "Your future is whatever you make it! So make it a good one!",
  "If you're good at something, never do it for free.",
  "Why do we fall? So we can learn to pick ourselves up.",
  "Just keep swimming.",
  "Do or do not. There is no try."
)

#' Print a motivating statement
#'
#' Prints a motivating statement.
#'
#' @return Invisibly returns the motivation.
#' @export
#'
#' @examples
#' motivate()
motivate <- function() {
  statement <- sample(.motivational_statements, size = 1)
  cat(statement, "\n")
  invisible(statement)
}
