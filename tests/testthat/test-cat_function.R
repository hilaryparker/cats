context("cat_function")

test_that("Cat lovers are appreciated", {
  expect_that(cat_function(TRUE), prints_text("I love cats!"))
})

test_that("Cat haters are scored", {
  expect_that(cat_function(FALSE), prints_text("I am not a cool person."))
})

#test_that("Dog people are cool, though", {
#  expect_that(dog_function(TRUE), prints_text("Very cool person."))
#})
