@sanity
Feature: Using 'Categories api' to demonstarte various test validation that can be performed on response

Background:
    #Declarations and file read of headers/ cookies, URL
    * def fetchDataFromPrerequisiteFile = read('../other/prerequsite.json')
    * def getUrl = fetchDataFromPrerequisiteFile.config
    * def getHeaders = fetchDataFromPrerequisiteFile.actualHeaders

@categories
Scenario: [TC-CT-01] To verify number(count) of categories from the response
    Given url getUrl.storeBaseUrl + getUrl.categories
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200

    * def categoryCounts = {}
    * def categories = response.data
    * def totalCategories = karate.sizeOf(categories)
    * print "Total Categories: ", totalCategories

@categories
Scenario: [TC-CT-02] To verify and print number(count) of categories from the response
    Given url getUrl.storeBaseUrl + getUrl.categories
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200

    # Below line of code prints name of categories and respective count
    * def categories = response.data
    * def categoryNames = karate.map(categories, function(category){ return category.name })
    * print "Category Names: ", categoryNames
    * def categoryCountofCategoryNames = karate.sizeOf(categoryNames)
    * print "Category Count as per category names: ", categoryCountofCategoryNames

    # Below line of code gives count of Categories as per overall response
    * def categoryCounts = {}
    * def categories = response.data
    * def totalCategories = karate.sizeOf(categories)
    * print "Total Categories: ", totalCategories

    And assert categoryCountofCategoryNames == totalCategories

@categories
Scenario Outline: [TC-CT-03 - TC-CT-10] To verify product details for the respective category
    Given url getUrl.storeBaseUrl + getUrl.categories + '<categoryName>'
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200
    And def expectedProducts = <expectedProducts>
    And def actualProducts = response.data.products

Examples:
| Test Case |      categoryName    |                                                            expectedProducts                                                             |
| TC-CT-03  |    /mens-fashion     | [ {"title": "special cotton shirt for men"}, {"title": "high quality men distress skinny blue jeans"}, {"title": "cotton o neck mens clothing t shirts"} ] |
| TC-CT-04  |    /womens-fashion   | [ {"title": "cotton pullover embroidery sweatshirt women"}, {"title": "breast button belt sur collar winter coat women"} ] |
| TC-CT-05  | /jewlary-and-watches | [ {"title": "waterproof fitness racker sports watch"}, {"title": "bracelet blood pressure sport fitness smartwatch"}, {"title": "heart rate monitor gps fitness smartwatch"} ] |
| TC-CT-06  |    /bags-and-shoes   | [ {"title": "running sneaker"}, {"title": "men casual shoes sports running sneakers"}, {"title": "premium leather matt black casual boot"} ] |
| TC-CT-07  |      /computers      | [ {"title": "Sceptre LED  curved 2xHDMI display port monitor"}, {"title": "ASUS Full HD HDMI Sync Eye Care eSports Gaming Monitor"} ] |
| TC-CT-08  |  /phone-and-tablets  | [ {"title": "iphone 13 pro black color 512gb storage"}, {"title": "Dual 3G Phone Call Octa Core 10 Inch Android Tablet"} ] |
| TC-CT-09  |  /tools-and-hardware | [ {"title": "electrical maintenance tools kit boxes with plastic box"}, {"title": "Drill Tool Set High Quality Powerful Multifunction Portable Drill"} ] |
| TC-CT-10  |  /home-and-furniture | [ {"title": "RGB Gaming Chair with Lights and Speakers"}, {"title": "Bed Storage Leather Italian Furniture Sofa Luxury"} ] |