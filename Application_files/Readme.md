This application predicts the stopping distance of a car from an initial speed. The prediction is done through regression. A regression model is fit into the `cars` dataset that contains 50 observations of two variables: speed of the car and the distance it needs for stopping. The model fitted is quadratic in the speed

`distance = a * speed + b * speed^2`

The estimation solves the coefficients `a` and `b`. The stopping distances are then predicted by inserting into the above formula the estimated coefficients and value of the initial speed.

The application demands as input values the unit of the distance, either feets (ft) or meters (m), and the unit of speed, either miles per hour (mph) or kilometers per hour (kph). Once the units are decided one can give as a numerical input a speed for which one wishes to know the stopping distance. In the slider one can define the minimum and maximum speeds between which a plot showing the initial speed vs. the stopping distance is produced using the fitted model.

The "Apply changes" button needs to be clicked in order to change any of the units or the input values.