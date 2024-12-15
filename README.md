# Task Managemet System CLI
using bash for versity project.
### Features:
1. custom app command name
2. install & lunch app globally using terminal
3. remove or change app command any time
4. full responsive and batter working user interface
5. quick add, remove, update, delete, find & get tasks easily
6. well documented help screen
7. No data loss after removing the command
8. We can easily backup our task database
###  User Menual:
- **Installation Process**
	* Download source zip file from gitHub 
	* Unzip the source zip file
	* Enter to the directory
	* open in terminal and run command `./install.sh custom_command_name `
	* or run `./install.sh` // here default command mtask
- **Lunch App**
	* open terminal and type your `custom_command_name` or `mtask` then press enter
	* Then type your password first time
- **Add tasks**
	* open terminal
	* Run `custom_command_name action_name title date`
	* action_name list `add | create | new | +`  
	* Some examples
	```Bash
	mtask add "project presentation" 15Dec # add task for 15 decmber
	mtask add "project report" tomorrow # add task for tomorrow
	mtask add "meeting" +5days # add task for next 5th day form today
	mtask add "friends birthday" 22Jan25 # add task for 22 Jan 2025
    ```

	# date formate 
	
    - **View tasks**
	* Open terminal
	* Run `custom_command_name action_name date`
	* action_name list `li | list | get | fetch | for`
	* Some examples
	```Bash
	mtask li 15Dec # see all tasks for 15 dec
	mtask for tomorrow # see all tasks for tomorrow
	mtask add +5days # see all tasks for next 5 days
	mtask add -7days # see all tasks for previous 7 days
	# date formate *
	```
    - **Edit / update Tasks**
	* Open terminal
	* Run `custom_command_name action_name ``title new_title new_date`` `
	* action_name list `up | edit | update | change | =`
	* for update `date` only run  `custom_command_name add existing_title new_date`
	* the press y
	* Some examples
	```Bash
	mtask up "project presentation" "project pre" # update task name
	mtask up "project report" "report" yesterday # update task name and date
	 
	# date formate *
	mtask add "metting" +2days  # change date using addition or creation operations
	```
    - Search Tasks
	* Open terminal
	* Run `custom_command_name action_name searcn_text `
	* action_name list `find | s |search | . `
	* Some examples
	```Bash
	mtask s project # get all tasks whrere title contains project
	```- Mark Tasks
	* Open terminal
	* Run `custom_command_name action_name title `
	* action_name list `done | !done | complete | !complete `
	* Some examples
	```Bash
	mtask done report # mark report as complete
	mtask done metting # mark metting as complete

	mtask !done metting # mark metting as incomplete
	```
    - Delete Tasks
	* Open terminal
	* Run `custom_command_name action_name title `
	* action_name list `del | rm | delete | remove| - `
	* Some examples
	```Bash
	mtask rm report # remove report
	mtask del metting # remove metting
	```
    - Remove App Command
	* Go to app dir
	* Open in terminal
	* Run  `./remove.sh `
- Backup Process
	* Go to app dir
	* Then go to `src/DB/` directory
	* Then upload the db file to your cloud or replace the file with previous

## Future Work
- Intregration & Share the tasks
- Chanels or Groups or Community creation
- Cloud base solution & syncronization
- More filtering and customization option
- adding description 
