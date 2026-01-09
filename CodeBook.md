Author: Lukas Steuer

# SOURCE
Data are from the UCI HAR Dataset. Measurements from Smartphone sensors have
been used from 30 users during several activities.

Training and test sets have been...
- merged
- reduced to mean and standard deviation measurements
- renamed and re-labeled based on the given codebook and understanding
- reduced to the averages of each subject x activity combination

# VARIABLES
### subject: Identifies person via a personal ID

### activity: Six different ones have been taken into account:
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### measurement variables consist of several parts:
  - **time** (directly recorded) 
     or **frequency** (obtained via Fast Fourier Transformation)
     
  - **Body** (voluntary movement of the subject)
     or **Gravity** (static effect on the sensor due to grav. acceleration)
     
  - **Accelerometer** (linear acceleration)
     or **Gyroscope** (Angular velocity)
     
  - **Jerk** (how abruptly the movement changed)
     or **Magnitude** (Overall strength)
     
  - **X, Y, Z** (Axes on the phone's coordinate system)
     **Mean** (Arrithmetic mean/average of the signal over a time period)
     or **Std** (Standard deviation, showing variation around the mean)
     
  e.g.: timeBodyAccelerationMeanX is the variation around the mean time of body 
  acceleration signal along the X axis.
  
