# Bank Tech Test

## Specification

After reading the requirements I have made the decision to implement a solution in Ruby. For testings I have chosen Rspec, I have made these decisions as I have experiences with both of these, and feel the language will allow me to implement a OO solution in a TDD manner.

I have created three classes - based on responsibility. Ledger has the responsibility of maintaining the balance, and creating transactions as required, along with storing these. Transactions hold all the individual data for each transaction, including all the attributes required to allow the data to printed. Statement printer takes the transaction log, and formats the data to the specified output style.

Given more time I would have considered extracting the responsibility of holding all the transaction information to its own class, however at the moment I think the class size and responsibility is maintainable.

To set the credit or debit information within the transaction I have chosen to have this as a method within transaction which is called to allow state to be set. I have considered that this information could be passed as a parameter and set based on this, however I have chosen the method call and true or false to limit the parameters passed to transaction. I believe this allows better encapsulation of the debt / credit state. I have considered that to meet the specification I would only require one attribute of credit, as at the moment debit is not called to check state of the transaction, however I think having this would allow easier extension and improves readability.  

The test suite could also be revisited to remove redundant tests as the features expanded within the app. I have spent some time reviewing tests and removed tests that check arguments saved on initialize as reasonable this would happen. Alternative classes test that correct arguments passed.

Whilst the solution meets all the requirements and acceptance test, I think given more time I could reduce the amount of code required to meet this.

## Getting started
* Clone the repo
* cd to directory
* Run bundle
* Open command line  
* To run tests - rspec
* To run program open IRB
* require './lib/ledger.rb'
* To create a ledger - Ledger.new
* All commands can be run through this object
* To add a deposit - ledger.deposit(amount)
* To add a withdrawal - ledger.withdraw(amount)
* To print statement - ledger.print_statement

### Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
* Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

```
