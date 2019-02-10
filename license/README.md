Usage:
1) go to ~/complaince/license
2) run go build 
3) run the command "./license -startDate=02/10/2019 -endDate=03/09/2019 -selectedServices=cp" (Update dates as per requirment)


Sample usage:

Input : ./license -startDate=02/10/2019 -endDate=03/09/2019 -selectedServices=cp
startDate - license Starte date - by default datetime now 
endDate - license endDate - by default datetime + 1 month 
selectedService - ps (p - pci and c - cis)  - be default both the serives will be selected

Output: ?version=02-01-2019&type=cp&sdst=02/10/2019&seet=03/09/2019&sign=94d5c715775ba21f5125072dbc44e54d6a89aab86aef346a00fc19f82466841396648cd1dd4b4f7bbd64135c3bc4bc9618d1cff2ee0c435e415567f7a6c4b9c4