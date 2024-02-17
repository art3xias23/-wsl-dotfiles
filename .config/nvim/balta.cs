
using System;

namespace BankingSystem
{
    class Program
    {
        static void Main(string[] args)
        {
            Bank bank = new Bank();
            while (true)
            {
                Console.WriteLine("1. Create Account");
                Console.WriteLine("2. Deposit");
                Console.WriteLine("3. Withdraw");
                Console.WriteLine("4. Display Account Details");
                Console.WriteLine("5. Exit");
                Console.Write("Enter your choice: ");
                int choice = int.Parse(Console.ReadLine());
                switch (choice)
                {
                    case 1:
                        Console.Write("Enter account holder's name: ");
                        string name = Console.ReadLine();
                        bank.CreateAccount(name);
                        break;
                    case 2:
                        Console.Write("Enter account number: ");
                        int accNumber1 = int.Parse(Console.ReadLine());
                        Console.Write("Enter amount to deposit: ");
                        double depositAmount = double.Parse(Console.ReadLine());
                        bank.Deposit(accNumber1, depositAmount);
                        break;
                    case 3:
                        Console.Write("Enter account number: ");
                        int accNumber2 = int.Parse(Console.ReadLine());
                        Console.Write("Enter amount to withdraw: ");
                        double withdrawAmount = double.Parse(Console.ReadLine());
                        bank.Withdraw(accNumber2, withdrawAmount);
                        break;
                    case 4:
                        Console.Write("Enter account number: ");
                        int accNumber3 = int.Parse(Console.ReadLine());
                        bank.DisplayAccountDetails(accNumber3);
                        break;
                    case 5:
                        Environment.Exit(0);
                        break;
                    default:
                        Console.WriteLine("Invalid choice! Please enter a number between 1 and 5.");
                        break;
                }
            }
        }
    }

    class Account
    {
        private static int accountCount = 0;
        private int accountNumber;
        private string accountHolder;
        private double balance;

        public Account(string name)
        {
            accountCount++;
            accountNumber = accountCount;
            accountHolder = name;
            balance = 0;
        }

        public int AccountNumber { get { return accountNumber; } }
        public string AccountHolder { get { return accountHolder; } }

        public void Deposit(double amount)
        {
            if (amount > 0)
            {
                balance += amount;
                Console.WriteLine($"${amount} deposited successfully into Account {accountNumber}. New balance: ${balance}");
            }
            else
            {
                Console.WriteLine("Invalid deposit amount!");
            }
        }

        public void Withdraw(double amount)
        {
            if (amount > 0 && amount <= balance)
            {
                balance -= amount;
                Console.WriteLine($"${amount} withdrawn successfully from Account {accountNumber}. New balance: ${balance}");
            }
            else
            {
                Console.WriteLine("Insufficient balance or invalid withdrawal amount!");
            }
        }

        public void DisplayDetails()
        {
            Console.WriteLine($"Account Number: {accountNumber}");
            Console.WriteLine($"Account Holder: {accountHolder}");
            Console.WriteLine($"Balance: ${balance}");
        }
    }

    class Bank
    {
        private Account[] accounts;
        private int totalAccounts;

        public Bank()
        {
            accounts = new Account[100];
            totalAccounts = 0;
        }

        public void CreateAccount(string name)
        {
            if (totalAccounts < 100)
            {
                Account newAccount = new Account(name);
                accounts[totalAccounts] = newAccount;
                totalAccounts++;
                Console.WriteLine($"Account created successfully! Account number: {newAccount.AccountNumber}");
            }
            else
            {
                Console.WriteLine("Cannot create more accounts. Bank capacity reached!");
            }
        }

        public void Deposit(int accountNumber, double amount)
        {
            Account acc = FindAccount(accountNumber);
            if (acc != null)
            {
                acc.Deposit(amount);
            }
            else
            {
                Console.WriteLine("Account not found!");
            }
        }

        public void Withdraw(int accountNumber, double amount)
        {
            Account acc = FindAccount(accountNumber);
            if (acc != null)
            {
                acc.Withdraw(amount);
            }
            else
            {
                Console.WriteLine("Account not found!");
            }
        }

        public void DisplayAccountDetails(int accountNumber)
        {
            Account acc = FindAccount(accountNumber);
            if (acc != null)
            {
                acc.DisplayDetails();
            }
            else
            {
                Console.WriteLine("Account not found!");
            }
        }

        private Account FindAccount(int accountNumber)
        {
            foreach (Account acc in accounts)
            {
                if (acc != null && acc.AccountNumber == accountNumber)
                {
                    return acc;
                }
            }
            return null;
        }
    }
}

