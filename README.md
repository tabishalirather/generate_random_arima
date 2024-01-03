# generate_random_arima
Generates random arima data and models based on given maximum limits on p,d an q.

Documentation for `generate_random_arima` Function
Description:
The `generate_random_arima` function is designed to generate random ARIMA (Autoregressive Integrated Moving Average) time series data and corresponding model. This function randomly selects orders (p, d, q) within specified ranges and generates corresponding AR and MA coefficients. It then uses these parameters to simulate a time series dataset. A key feature of this function is its ability to ensure the stationarity of the generated ARIMA model, making it particularly useful for simulation studies and educational purposes.

Usage:
generate_random_arima(max_p, max_d, max_q, num_observations, seed = NULL)
Arguments
 max_p: The maximum value for the AR order (p).
 max_d: The maximum value for the differencing order (d).
 max_q:The maximum value for the MA order (q).
 num_observations: Number of observations to generate in the time series.
seed: Optional. A seed value for reproducibility of results.

Details
The function operates by randomly selecting values for p, d, and q within the user-specified ranges. It then generates AR coefficients in the range of -0.8 to 0.8 and MA coefficients in the range of -1 to 1. This range selection is based on common practices in time series analysis to ensure model stability. The function employs a `repeat` loop to generate a time series dataset using the `arima.sim` function from the `stats` package. If the generated ARIMA model is not stationary, the loop repeats until a stationary model is achieved.

Return value
A list containing two elements:
 rand_arima: The generated ARIMA time series data.
 rand_model: A list object representing the ARIMA model used for data generation. This list includes the AR coefficients, MA coefficients, and the order of the model (p, d, q).

Examples
Generate a random ARIMA time series with the following specifications:
Maximum p, d, q values are 3, 1, 3, respectively, and 100 observations.

random_data_and_model <- generate_random_arima(3, 1, 3, 100, seed = 123)

The returned object contains the time series data and the model used:

print(random_data_and_model$rand_arima)  # Time series data
print(random_data_and_model$rand_model)  # Model parameters


This function may be particularly useful in educational settings where understanding the impact of different ARIMA configurations on time series data is crucial. It is also beneficial for simulation studies in time series analysis.



