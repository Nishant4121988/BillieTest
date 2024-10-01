import { LightningElement, track } from 'lwc';
import getTopArticles from '@salesforce/apex/BBCNews.getTopArticles';

export default class Bbc extends LightningElement {
    @track articles = [];

    connectedCallback() {
        this.loadArticles();
    }

    loadArticles() {
        getTopArticles()
            .then(result => {
                this.articles = result.map((article, index) => {
                    return { key: index + 1, title: article.title, url: article.url };
                });
            })
            .catch(error => {
                console.error('Error fetching articles:', error);
            });
    }
}
