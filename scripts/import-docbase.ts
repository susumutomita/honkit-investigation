import axios from 'axios';
import fs from 'fs';
import path from 'path';

const DOCBASE_API_URL = 'https://api.docbase.io';
const DOCBASE_TEAM = 'your_team';
const DOCBASE_TOKEN = 'your_token';

async function fetchDocBaseArticles() {
  try {
    const response = await axios.get(`${DOCBASE_API_URL}/teams/${DOCBASE_TEAM}/posts`, {
      headers: {
        'X-DocBaseToken': DOCBASE_TOKEN,
      },
    });

    const articles = response.data.posts;
    return articles;
  } catch (error) {
    console.error('Error fetching articles from DocBase:', error);
    throw error;
  }
}

function saveArticlesAsMarkdown(articles: any[]) {
  const docsDir = path.join(__dirname, '../docs');

  if (!fs.existsSync(docsDir)) {
    fs.mkdirSync(docsDir);
  }

  articles.forEach((article) => {
    const filePath = path.join(docsDir, `${article.id}.md`);
    fs.writeFileSync(filePath, article.body);
  });
}

async function importDocBaseArticles() {
  try {
    const articles = await fetchDocBaseArticles();
    saveArticlesAsMarkdown(articles);
    console.log('Successfully imported DocBase articles.');
  } catch (error) {
    console.error('Failed to import DocBase articles.');
  }
}

importDocBaseArticles();
