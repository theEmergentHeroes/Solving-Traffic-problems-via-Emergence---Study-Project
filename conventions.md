### conventions followed in the code:

only initialize traffic uses the absolute convention of 0 to 359 degrees 
so whenever accessing car objects i.e cars(i).theta always expect a value b/w 0 and 360
but theta1 and theta2 inputs to the neural network are relative to the viewing car so they are b/w -180 and 180