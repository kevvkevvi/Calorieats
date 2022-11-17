Calorieats - My Body My Way

Team Members:
- Kevin Li:  kjl2185
- Zheyan Liu: zl3119
- Peihan Liu: pl2804		
- Tianjiao Zhu: tz2498

1. Github Repository: https://github.com/kevvkevvi/Calorieats
2. Heroku Link: https://lit-spire-28596.herokuapp.com/

Instructions:
Firstly run bundle install --with production to install everything inside Gemfile. Then using bin/rake db:setup to setup the database. After that, running bin/rails server -b 0.0.0.0 and press Box URL button will navigate to the Calorieats login page.

Also, you can use the Heroku Link directly navigate to the Calorieats login page.

Action on Calorieats:
The followings are two users’ information that we already provided:
1.username: 'user1', password_digest: '123456', height: '170', weight: '60', age: '20', gender: 'Male', sports_level: 'Active'
2.username: 'user2', password_digest: '123456', height: '165', weight: '75', age: '28', gender: 'Female', sports_level: 'Seldom'
But you are also welcomed to sign up your own account.

Before login, you cannot navigate to ‘market’ or ‘calculator’ pages.

After login, you are supposed to fill in the ‘height’, ‘weight’, ‘gender’ and ‘sports level’ in the Calculator page, then after calculate, you will get your BMI and corresponding food and sports suggestions. In addition, the height is in range(0,300), the weight is in range(0,500), the age is in range(0,300). You are not allowed to input other numbers.

Besides, you can also shop in the Market page and after checkout, it will show your total cost and total calories on your purchase. Besides, the number you ordered for each item is 200 maximal and 0 minimal. After press ‘checkout’, you will come to the checkout page to continue pay if there are something in your cart. Otherwise, you are suggested to back to the market index page to purchase something.
