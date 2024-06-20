@sanity
Feature: Using 'Products api' to demonstarte various test validation that can be performed on response

Background:
    #Declarations and file read of headers/ cookies, URL
    * def fetchDataFromPrerequisiteFile = read('../other/prerequsite.json')
    * def getUrl = fetchDataFromPrerequisiteFile.config
    * def getHeaders = fetchDataFromPrerequisiteFile.actualHeaders

@products
Scenario: [TC-PO-01] To verify number(count) of products from the response
    Given url getUrl.storeBaseUrl + getUrl.products
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200

    * def titles = karate.map(response.data, function(countNoProducts){ return countNoProducts.title })
    * def totalProducts = karate.sizeOf(titles)
    * print "Total Products based on key title: ", totalProducts

@products
Scenario: [TC-PO-02] To verify product and its respective price from the response
    Given url getUrl.storeBaseUrl + getUrl.products
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200

    * def productsPrice = karate.map(response.data, function(productNameprice){ return { name: productNameprice.title, price: productNameprice.price } })
    * print "Products and its respective Price: ", productsPrice

@products
Scenario: [TC-PO-03] To verify product are printed based on product price in ascending order from the response
    Given url getUrl.storeBaseUrl + getUrl.products
    * headers getHeaders
    When method get
    And print response
    
    And assert responseStatus == 200

    # * def sortedProducts = karate.sortBy(response.data, 'price')
    # The above sortBy did NOT work so used this thread for the desired output - https://github.com/karatelabs/karate/issues/1819
    
    * def allProductResponse = response.data
    * def sortedProducts = karate.sort(allProductResponse, allProductResponse=>allProductResponse.price)
    * def productNames = karate.map(sortedProducts, function(product){ return { name: product.title, price: product.price} })
    * print "Product Names based on Price in Ascending Order : ", productNames