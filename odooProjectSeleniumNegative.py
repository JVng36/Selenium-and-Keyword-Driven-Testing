from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
import time
#You may want to study the following:
#https://selenium-python.readthedocs.io/locating-elements.html
#showing differnt ways of find_element(By. ...

#https://chromedriver.chromium.org/downloads
#Check this to make sure your Chrome and selenium driver versions match to each other (or, you may have weird problems)


driver = webdriver.Chrome('./venv/bin/chromedriver')

# This is a negative test case for creating a task in project. It will create two tasks that have the same name
# It is the same as the robot test case but translated into Selenium

def update_form_field(driver, field_name, field_value):
	search_bar = driver.find_element(By.NAME, field_name)
	search_bar.clear()
	time.sleep(1)
	search_bar.send_keys(field_value)


driver.get("http://localhost:8069/web/login")
print("Jay: Step1 passed")

update_form_field(driver, "login", "odoo")
update_form_field(driver, "password", "odoo")
driver.find_element(By.NAME, "login").send_keys(Keys.RETURN)

print("Jay: I have Logged in!")
time.sleep(3)

# Click Home Menu
HomeMenu = driver.find_element(By.XPATH, "/html/body/header/nav/div[1]/button/i")
HomeMenu.click()
time.sleep(1)

# Click Project
Project = driver.find_element(By.XPATH, "/html/body/header/nav/div[1]/div/a[4]")
Project.click()
time.sleep(1)

# Click Tasks
Tasks = driver.find_element(By.XPATH, "/html/body/header/nav/div[2]/a[2]")
Tasks.click()
time.sleep(1)

# Click Create
Create = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button")
Create.click()
time.sleep(1)

update_form_field(driver, "name", "SeleniumTaskSameAgain2")

driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/div[2]/button[1]")

print("Jay: I have created a task!")
time.sleep(3)

# First task created. Going to create another one the same exact way

# Click Tasks
Tasks = driver.find_element(By.XPATH, "/html/body/header/nav/div[2]/a[2]")
Tasks.click()
time.sleep(1)

# Click Create
Create = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/button")
Create.click()
time.sleep(1)

update_form_field(driver, "name", "SeleniumTaskSameAgain2")

driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div[2]/div[1]/div/div/div[2]/button[1]")

print("Jay: I have created a task again!")
time.sleep(3)

# Click Tasks again to see the list of tasks
Tasks = driver.find_element(By.XPATH, "/html/body/header/nav/div[2]/a[2]")
Tasks.click()
print("Jay: Here are the list of tasks on screen. There are two tasks that have the same exact name which can be conflicting!")
time.sleep(1)

driver.close()
exit(0)

