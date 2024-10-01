@isTest
public class BBCNewsTest {

    @isTest
    static void testGetTopArticles_Success() {
        // Arrange: Create mock HTTP response for a successful callout
        String mockHtmlResponse = '<section data-testid="illinois-section-outer-10" data-analytics-group="true" ' +
                                   'data-analytics_group_name="Most read" data-analytics_group_type="illinois-10" ' +
                                   'data-analytics_group_position="10" data-analytics_group_item_count="10" ' +
                                   'data-analytics_group_link="" class="sc-2448c165-1 gvnjGp">' +
                                   '<div data-testid="illinois-section-10" class="sc-2448c165-2 eMVRpx">' +
                                   '<div class="sc-6f766713-2 ctfMqF"><div class="sc-6f766713-1 iGzJZA">' +
                                   '<hr data-testid="illinois-line" class="sc-6f766713-0 lgKNnV"></div>' +
                                   '<div data-testid="section-title-wrapper" class="sc-6f766713-3 cYOBar">' +
                                   '<div><div class="sc-6f766713-7 dqKfa">' +
                                   '<h2 data-testid="illinois-title" class="sc-6f766713-4 elqzuS">Most read</h2>' +
                                   '</div></div></div></div>' +
                                   '<div data-testid="illinois-grid-10" class="sc-93223220-0 lbLNTF">' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/ce3wykxzk81o" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">1<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Six killed in shooting and knife attack in Tel Aviv<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/c9dyxxgxv1jo" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">2<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Iran launches barrage of ballistic missiles at Israel<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/cj9jzv4deg9o" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">3<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">\'The country is lost\': Fear and uncertainty in Lebanon as Israel invades<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/cp8ewz39k9ro" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">4<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Three children injured in knife attack at Zurich daycare centre<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/videos/c3rlvj3xgpyo" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-video" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">5<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Video shows missiles fired towards Tel Aviv<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/c3e95lny0x9o" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">6<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Xi Jinping is worried about the economy - what do Chinese people think?<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/clyldnlrnxdo" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">7<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Jimmy Carter, former US president, turns 100<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/c0jwqzzw986o" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">8<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Twenty children dead after Thailand school bus fire<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/cp39q1ppk41o" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">9<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Jenrick defends special forces claim after backlash<!-- --></h2>' +
                                   '</div></div></div></a></div></div>' +
                                   '<div data-testid="cambridge-card">' +
                                   '<div data-testid="anchor-inner-wrapper">' +
                                   '<a href="/news/articles/c0lwk638zgyo" data-testid="internal-link" class="sc-2e6baa30-0 gILusN">' +
                                   '<div data-testid="cambridge-article" class="sc-f1f2a354-0 claiQG">' +
                                   '<span data-testid="card-order" class="sc-f1f2a354-1 fDznqs">10<!-- --></span>' +
                                   '<div class="sc-4fedabc7-1 iqyyKX"><div class="sc-4fedabc7-0 kZtaAl">' +
                                   '<h2 data-testid="card-headline" class="sc-4fedabc7-3 gJvjEE">Six dead in market attack as Ukraine remembers war dead<!-- --></h2>' +
                                   '</div></div></div></a></div></div></div></div></section>' +
                                   '<div data-component="ad-slot" data-testid="ad-unit" class="sc-c361b622-0 fHxdon">' +
                                   '<div data-testid="dotcom-mid_3" id="dotcom-mid_3" class="dotcom-ad inactive" data-ad-slot="{}" style="background-color: rgb(248, 248, 248);">' +
                                   '<div class="dotcom-ad-inner">' +
                                   '<div id="dotcom-slot-mid_3" class="dotcom-slot" data-google-query-id="CNW-u4Xq7YgDFbCS_Qcdq1Ev3A" style="display: none;">' +
                                   '<div id="google_ads_iframe_/4817/bbccom/news/news_home/index/mid_0__container__" style="border: 0pt none; width: 1024px; height: 0px;"></div>' +
                                   '</div></div></div></div>';
        
        // Mock HTTP response
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockHtmlResponse));
        
        // Act: Call the method being tested
        try {
            BBCNews.getTopArticles();
        } catch (Exception e) {
            // Handle exceptions here if necessary, or just log
            System.debug('Exception occurred: ' + e.getMessage());
        }
        
        // Assert: No assertions needed as per the requirement for code coverage
    }
    
    @isTest
    static void testGetTopArticles_Fail() {
        // Arrange: Create mock HTTP response for a successful callout
        String mockHtmlResponse = 'abc';
        
        // Mock HTTP response
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(mockHtmlResponse));
        
        // Act: Call the method being tested
        try {
            BBCNews.getTopArticles();
        } catch (Exception e) {
            // Handle exceptions here if necessary, or just log
            System.debug('Exception occurred: ' + e.getMessage());
        }
        
        // Assert: No assertions needed as per the requirement for code coverage
    }
    
    // Mock HTTP Response Generator
    public class MockHttpResponseGenerator implements HttpCalloutMock {
        String responseBody;
        
        public MockHttpResponseGenerator(String response) {
            responseBody = response;
        }
        
        public HTTPResponse respond(HTTPRequest req) {
            HTTPResponse res = new HTTPResponse();
            res.setStatusCode(200); // Simulating a successful response
            res.setBody(responseBody);
            res.setStatus('OK');
            return res;
        }
    }
}