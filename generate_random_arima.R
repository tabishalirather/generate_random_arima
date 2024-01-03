max_p = 3
max_d = 1
max_q = 1
num_observations = 1000

generate_random_arima <- function(max_p, max_d, max_q, num_observations, seed = NULL) {

  # Setting a seed for reproducibility (optional, can be removed or modified)
  if(!is.null(seed)){
	print(seed)
  	set.seed(seed)
  }

  # Randomly select the values for p, d, and q
  repeat
  {
  p <- sample(0:max_p, 1)
  d <- sample(0:max_d, 1)
  q <- sample(0:max_q, 1)
  # Generate random AR and MA coefficients
  ar_coefs <- if(p > 0)
  {
  ar_coefs <- runif(p, min = -0.8, max = 0.8)
  }
  else
  {
	numeric(0)  # Handles case when p=0
  }
  ma_coefs <- if(q > 0)
  {
	runif(q, min = -1, max = 1)
  }
  else
  {
	numeric(0)  # Handles case when q=0
  }
  # Define the ARIMA model
  rand_model <- list(ar = ar_coefs, ma = ma_coefs, order = c(p, d, q))

  # Generate and return the ARIMA data, the error we are concerned about is "Error: AR is not stationary, so we repeat the process until a given interation has a stationary AR model
  rand_arima <- tryCatch({
      arima.sim(n = num_observations, model = rand_model)
    }, error = function(e) {
      # If an error occurs, print a message and return NULL
      cat("Error in generating ARIMA data: ", e$message, "\n")
      return(NULL)
    })

    # If arima.sim was successful and did not return NULL, break the repeat loop
    if (!is.null(rand_arima)) {
      break
    }
}
  model_and_data <- list(rand_arima, rand_model)
  return(model_and_data)
}

rand_model_and_data <- generate_random_arima(max_p, max_d, max_q, num_observations, seed = NULL)