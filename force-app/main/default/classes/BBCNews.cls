public with sharing class BBCNews {
    @AuraEnabled(cacheable=true)
    public static List<Article> getTopArticles() {
        List<Article> articles = new List<Article>();
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://www.bbc.com/news');
            request.setMethod('GET');
            
            HttpResponse response = http.send(request);
                // Parse the HTML to extract the top 10 articles
                String responseBody = response.getBody();
                
                // Extract the specific section of the responseBody that contains the articles
                String sectionTag = responseBody.substringBetween(
                    '<section data-testid="illinois-section-outer-10" data-analytics-group="true" data-analytics_group_name="Most read"',
                    '<div data-component="ad-slot" data-testid="ad-unit" class="sc-c361b622-0 fHxdon"'
                );
                
                // Extract the grid of articles
                String articleGrid = sectionTag.substringBetween(
                    '<div data-testid="illinois-grid-10"', '</div></div></div></a></div></div></div>'
                );

                system.debug('Extracted Article Grid: ' + articleGrid);
                
                // Find the first 10 articles and extract URLs and titles
                for (Integer i = 0; i < 10; i++) {
                    Integer startIndex = articleGrid.indexOf('<a href="/news/articles/');
                    if (startIndex == -1) break; // No more articles found

                    Integer endIndex = articleGrid.indexOf('"', startIndex + 9); // Find the closing quote for the URL
                    String url = 'https://www.bbc.com' + articleGrid.substring(startIndex + 9, endIndex);  // Full URL
                    
                    // Find the title
                    Integer titleStartIndex = articleGrid.indexOf('<h2', endIndex);
                    Integer titleEndIndex = articleGrid.indexOf('</h2>', titleStartIndex);
                    String title = articleGrid.substringBetween('<h2', '</h2>').replaceAll('<[^>]+>', '').trim();
                    title = title.substringAfter('data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">');
                    title = title.replaceAll('&#x27;', '');
                    
                    // Add to the articles list
                    articles.add(new Article(title, url));

                    // Trim down the string to look for the next article
                    articleGrid = articleGrid.substring(titleEndIndex);
                }
                
                // Log the extracted articles
                system.debug('Articles: ' + articles);
            
        } catch (Exception e) {
            system.debug('Error occurred: ' + e.getMessage());
            throw new AuraHandledException('Error fetching articles: ' + e.getMessage());
        }
        return articles;
    }

    // Inner class to represent an article
    public class Article {
        @AuraEnabled public String title { get; set; }
        @AuraEnabled public String url { get; set; }

        public Article(String title, String url) {
            this.title = title;
            this.url = url;
        }

        public override String toString() {
            return 'Title: ' + title + ', URL: ' + url;
        }
    }
}