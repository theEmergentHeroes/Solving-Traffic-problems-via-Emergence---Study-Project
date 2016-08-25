### conventions followed in the code:

* Only initialize traffic uses the absolute convention of 0 to 359 degrees. 
* So, whenever accessing car objects i.e cars(i).theta always expect a value b/w 0 and 360.
* but the inputs to the neural network theta1 and theta2 are relative to the viewing car so they are b/w -180 and 180
