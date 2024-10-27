import * as fs from 'fs';
import * as path from 'path';

const publicDir = path.join(__dirname, '..', 'public');
const summaryFile = path.join(__dirname, '..', 'SUMMARY.md');

function generateSummary(dir: string, depth: number = 0): string {
  if (!fs.existsSync(dir)) {
    console.error(`Error: Directory ${dir} does not exist.`);
    return '';
  }

  let summary = '';
  const items = fs.readdirSync(dir);

  items.forEach(item => {
    const fullPath = path.join(dir, item);
    const relativePath = path.relative(path.dirname(summaryFile), fullPath);
    const indent = '  '.repeat(depth);

    if (fs.statSync(fullPath).isDirectory()) {
      summary += `${indent}* [${item}](#)\n`;
      summary += generateSummary(fullPath, depth + 1);
    } else {
      const fileName = path.basename(item, path.extname(item));
      summary += `${indent}* [${fileName}](${relativePath})\n`;
    }
  });

  return summary;
}

function writeSummaryToFile(summary: string) {
  const header = '# Summary\n\n';
  fs.writeFileSync(summaryFile, header + summary, 'utf8');
}

const summaryContent = generateSummary(publicDir);
writeSummaryToFile(summaryContent);

console.log('SUMMARY.md has been generated.');
