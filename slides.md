# The Great Language Wars

------

# On *Correctness*

------

# On *Intent*

------

## Clear Intent?

```
def init_array(item, array=[]):
    array.append(item)
	return array
```

------

## Clear Intent?

```
def init_array(item, array=[]):
    array.append(item)
	return array
```

Usage:

```






```

------

## Clear Intent?

```
def init_array(item, array=[]):
    array.append(item)
	return array
```

Usage:

```
>>> print init_array(1)
[1]




```

------

## Surprise?

```
def init_array(item, array=[]):
    array.append(item)
	return array
```

Usage:

```
>>> print init_array(1)
[1]
>>> print init_array(1)
[1, 1]


```

------

## Surprise?

```
def init_array(item, array=[]):
    array.append(item)
	return array
```

Usage:

```
>>> print init_array(1)
[1]
>>> print init_array(1)
[1, 1]
>>> print init_array(1)
[1, 1, 1]
```

------

# *Context*

------

## Examples

1. Object Oriented
2. Function Oriented
3. Purely Functional

------

# Object Oriented

------

## Object Oriented

```
class Account:

    def __init__(self, initial_deposit):
        self.balance = initial_deposit

    def withdraw(self, amount):
        allowed = min(amount, self.balance)
        self.balance = self.balance - allowed
        return allowed

    def deposit(self, amount):
        self.balance = self.balance + amount

    def get_balance(self):
        return self.balance
```

------

## Object Oriented

```
class Account:

    def __init__(self, initial_deposit):
        self.balance = initial_deposit











```


------

## Object Oriented

```
class Account:




    def withdraw(self, amount):
        allowed = min(amount, self.balance)
        self.balance = self.balance - allowed
        return allowed






```

------

## Object Oriented

```
class Account:









    def deposit(self, amount):
        self.balance = self.balance + amount



```

------

## Object Oriented

```
class Account:












    def get_balance(self):
        return self.balance
```

------

## Object Oriented Usage

```
account = Account(100)






```

------

## Object Oriented Usage

```
account = Account(100)

withdrawn = account.withdraw(50)




```

------

## Object Oriented Usage

```
account = Account(100)

withdrawn = account.withdraw(50)
new_balance = account.get_balance()



```

------

## Object Oriented Usage

```
account = Account(100)

withdrawn = account.withdraw(50)
new_balance = account.get_balance()

print "I withdrew %i, still have %i" % (
          withdrawn, new_balance)
```

------

## Object Oriented Context?

```
class Account:




    def withdraw(self, amount):
        allowed = min(amount, self.balance)
        self.balance = self.balance - allowed
        return allowed






```

------

## Object Oriented Context?

```
class Account:

    def __init__(self, initial_deposit):
        self.balance = initial_deposit

    def withdraw(self, amount):
        allowed = min(amount, self.balance)
        self.balance = self.balance - allowed
        return allowed






```

------

## Object Oriented Context!

```
class Account(BaseAccount, Autidable):

    def __init__(self, initial_deposit):
        super(Account, self).__init__(initial_deposit)

    def withdraw(self, amount):
        allowed = min(amount, self.balance)
        self.balance = self.balance - allowed
        return allowed






```

------

# Function Oriented

------

## Function Oriented

```
def new_account(initial_deposit):
    return { 'balance': initial_deposit }

def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed

def deposit(account, amount):
    account['balance'] = account['balance'] + amount

def get_balance(account):
    return account['balance']
```

------

## Function Oriented

```
def new_account(initial_deposit):
    return { 'balance': initial_deposit }











```

------

## Function Oriented

```



def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed






```

------

## Function Oriented

```








def deposit(account, amount):
    account['balance'] = account['balance'] + amount



```

------

## Function Oriented

```











def get_balance(account):
    return account['balance']
```

------

## Function Oriented Usage

```
account = new_account(100)






```

------

## Function Oriented Usage

```
account = new_account(100)

withdrawn = withdraw(account, 50)




```

------

## Function Oriented Usage

```
account = new_account(100)

withdrawn = withdraw(account, 50)
new_balance = get_balance(account)



```

------

## Function Oriented Usage

```
account = new_account(100)

withdrawn = withdraw(account, 50)
new_balance = get_balance(account)

print "I withdrew %i, still have %i" % (
          withdrawn, new_balance)
```

------

## Function Oriented Context?

```



def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed






```

------

## Function Oriented Context?

```
def new_account(initial_deposit):
    return { 'balance': initial_deposit }

def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed






```

------

## Function Oriented Concurrency?

```



def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed

def deposit(account, amount):
    account['balance'] = account['balance'] + amount



```

------

# Purely Functional

------

## Purely Functional

```
def new_account(initial_deposit):
    return { 'balance': initial_deposit }

def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    new_balance = account['balance'] - allowed
    return (allowed, { 'balance': new_balance })

def deposit(account, amount):
    new_balance = account['balance'] + amount
    return { 'balance': new_balance }

def get_balance(account):
    return account['balance']
```

------

## Purely Functional

```
def new_account(initial_deposit):
    return { 'balance': initial_deposit }












```

------

## Purely Functional

```



def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    new_balance = account['balance'] - allowed
    return (allowed, { 'balance': new_balance })







```

------

## Pure vs Impure

"Pure"

```
def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    new_balance = account['balance'] - allowed
    return (allowed, { 'balance': new_balance })
```

"Impure" --- Side Effects

```
def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    account['balance'] = account['balance'] - allowed
    return allowed
```

------

## Purely Functional

```








def deposit(account, amount):
    new_balance = account['balance'] + amount
    return { 'balance': new_balance }



```

------

## Purely Functional

```












def get_balance(account):
    return account['balance']
```

----

## Purely Functional Usage

```
account = new_account(100)






```

----

## Purely Functional Usage

```
account = new_account(100)

(withdrawn, updated_account) = withdraw(account, 50)




```

----

## Purely Functional Usage

```
account = new_account(100)

(withdrawn, updated_account) = withdraw(account, 50)
new_balance = get_balance(updated_account)



```

----

## Purely Functional Usage

```
account = new_account(100)

(withdrawn, updated_account) = withdraw(account, 50)
new_balance = get_balance(updated_account)

print "I withdrew %i, still have %i" % (
          withdrawn, new_balance)
```

------

## Purely Functional Concurrency?

```



def withdraw(account, amount):
    allowed = min(amount, account['balance'])
    new_balance = account['balance'] - allowed
    return (allowed, { 'balance': new_balance })

def deposit(account, amount):
    new_balance = account['balance'] + amount
    return { 'balance': new_balance }



```

------

# But... What If?

------

# *Actually* Purely Functional

------

## *Actually* Purely Functional

```
new_account(InitialDeposit) ->
    {account, InitialDeposit}.

withdraw({account, Balance}, Amount) ->
     Allowed = min(Amount, Balance),
     NewBalance = Balance - Allowed,
     {Allowed, {account, NewBalance}}.

deposit({account, Balance}, Amount) ->
    NewBalance = Balance + Amount,
    {account, NewBalance}.

get_balance({account, Balance}) ->
    Balance.
```

------

## *Actually* Purely Functional

```
new_account(InitialDeposit) ->
    {account, InitialDeposit}.












```

------

## *Actually* Purely Functional

```



withdraw({account, Balance}, Amount) ->
     Allowed = min(Amount, Balance),
     NewBalance = Balance - Allowed,
     {Allowed, {account, NewBalance}}.







```

------

## *Actually* Purely Functional

```








deposit({account, Balance}, Amount) ->
    NewBalance = Balance + Amount,
    {account, NewBalance}.



```

------

## *Actually* Purely Functional

```












get_balance({account, Balance}) ->
    Balance.
```

------

## *Actually* Pure Usage

```
Account = new_account(100),






```

------

## *Actually* Pure Usage

```
Account = new_account(100),

{Withdrawn, UpdatedAccount} = withdraw(Account, 50),




```

------

## *Actually* Pure Usage

```
Account = new_account(100),

{Withdrawn, UpdatedAccount} = withdraw(Account, 50),
NewBalance = get_balance(UpdatedAccount),



```

------

## *Actually* Pure Usage

```
Account = new_account(100),

{Withdrawn, UpdatedAccount} = withdraw(Account, 50),
NewBalance = get_balance(UpdatedAccount),

io:format("I withdrew ~b, still have ~b~n", [
              Withdrawn, NewBalance]).
```

------

## Context?

```



withdraw({account, Balance}, Amount) ->
     Allowed = min(Amount, Balance),
     NewBalance = Balance - Allowed,
     {Allowed, {account, NewBalance}}.

deposit({account, Balance}, Amount) ->
    NewBalance = Balance + Amount,
    {account, NewBalance}.



```

------

# `X ≠ X + 1`

------

## The Deal With Functional Programming

<ul>
 <li class="fragment">Not Object Oriented</li>
 <ul>
  <li class="fragment">Separate data and functions</li>
  <li class="fragment">Avoid non-obvious dispatch</li>
 </ul>
 <li class="fragment">Immutability has surprising benefits</li>
 <li class="fragment">Encourages <em>clarity of intent</em></li>
</ul>

------

## Clarity of Intent

<ul>
 <li class="fragment">Know when you're not being clear</li>
 <li class="fragment">Easier to spot clear code</li>
 <li class="fragment">Easier to change code (bugs and features)</li>
</ul>

------

## What Next?

- Erlang
- Clojure
- F#
- Haskell
- OCaml

------

## [chicagoerlang.com](http://www.chicagoerlang.com)
### Sept 22 - Gene Siskel Film Center
