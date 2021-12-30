The following applications are available:

# 1. *dbms.FindAvailableBrandAndOrder*

  * **Description:** Finds all the available cars of a given brand.
  * **Inputs:** A brand.
  * **Outputs:** A list of cars.
  * **Example:**

    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.FindAvailableBrandAndOrder Fiat
         L. P.         Brand            Name    Year        Km         Price  Type        Category
       DS025UY          Fiat           Panda    2011    110000      3200.00€  Used   ForSaleRental
    mm7@pc7 /p/m/u/d/d/f/s/java (master)>
    ```

# 2. *dbms.FindAvailableCarsUnderKm*

  * **Description:** Finds all the available cars that drove less than a specificed number of kms.
  * **Inputs:** The number of km.
  * **Outputs:** A list of cars.
  * **Example:**

    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.FindAvailableCarsUnderKm 10000
         L. P.         Brand            Name    Year        Km         Price  Type        Category
       FZ286JY        Lancia         Ypsilon    2021         0     16200.00€   New         ForSale
       FW680RN        Toyota           Yaris    2021         0     22000.00€   New         ForSale
       FY168KZ          Opel           Corsa    2021         0     15000.00€   New         ForSale
    mm7@pc7 /p/m/u/d/d/f/s/java (master)>
    ```

# 3. *dbms.FindPerformancesOfBranches*

  * **Description:** Compute the total income from sales for each branch.
  * **Inputs:** None.
  * **Outputs:** A list of branches with the associated income.
  * **Example:**

    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.FindPerformancesOfBranches
       Branch Id    Total Sales of Branch
      Motorsport    42000.00
          Unicar    10000.00
    mm7@pc7 /p/m/u/d/d/f/s/java (master)>
    ```

# 4. *dbms.FindPerformancesOfSellers*

  * **Description:** Compute the total income from sales for each employee.
  * **Inputs:** None.
  * **Outputs:** A list of employee with the associated income.
  * **Example:**
 
    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.FindPerformancesOfSellers
        Employee        Total Sales
    SYLDNM04C47B947T    20000.00
    CLMGLI90E41G224E    15000.00
    PRRMTH10E53D682J    10000.00
    RSSMRA74E23G224P     7000.00
    mm7@pc7 /p/m/u/d/d/f/s/java (master)>
    ```

# 5. *dbms.FindRentalCars*

  * **Description:** List all the rentals in the system ordered by end_date (ascending).
  * **Inputs:** None.
  * **Outputs:** A list of rentals.
  * **Example:**

    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.FindRentalCars
            id     L. P.   Start Date    End Date      Deal Date        Price      Employee           Customer
             1   FN885VO   2020-08-11   2022-07-11     2020-08-11      900.00€  RSSMRA74E23G224P   FROHVS03Y31Z372K
             4   EX524YC   2020-06-06   2022-08-06     2020-06-06      200.00€  RSSMRA74E23G224P   MJTIVC50U54C200B
             3   DL654NV   2020-06-08   2022-08-08     2020-06-08      530.00€  CZZLLN10C71F401D   FPOMKO55E27M241C
             9   DL654NV   2020-05-30   2022-11-30     2020-05-28      610.00€  RSSMRA74E23G224P   FROHVS03Y31Z372K
            10   EX524YC   2019-09-01   2023-04-01     2019-09-01      660.00€  CSCGTA94T45I290X   XFKVFA20N06I270H
             6   DK237DR   2019-11-18   2023-04-18     2019-11-18      330.00€  CZZLLN10C71F401D   ITQFWR28S88Y708C
             2   DI229PJ   2020-06-04   2023-07-04     2020-06-04      630.00€  BGLGLI09B14E415X   FROHVS03Y31Z372K
             5   FE756EY   2019-07-07   2025-07-07     2019-07-07      820.00€  BGLGLI09B14E415X   FROHVS03Y31Z372K
             7   FN885VO   2020-09-11   2025-09-11     2020-09-11      600.00€  BGLGLI09B14E415X   XFKVFA20N06I270H
             8   DI229PJ   2019-09-17   2027-09-17     2019-09-17      120.00€  CSCGTA94T45I290X   XFKVFA20N06I270H
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> 
    ```

# 6. *dbms.InsertCustomerCars*

  * **Description:** Insert new cars from a .csv file into the database.
  * **Inputs:** Path of the correct .csv file.
  * **Outputs:** Successfully added istances and time.
  * **Example:**

    ```shell
    mm7@pc7 /p/m/u/d/d/f/s/java (master)> java -classpath build/classes/java:lib/postgresql-42.3.1.jar dbms.InsertCustomerCars ./CustomerCar.csv
    15 rows successfully inserted in 63.91 ms
    mm7@pc7 /p/m/u/d/d/f/s/java (master)>
    ```
