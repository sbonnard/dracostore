<?php

// HEAD

/**
 * Get a template of HTML head.
 *
 * @return string - HTML for <head>.
 */
function fetchHTMLHead(string $headTitle): string
{
    return '    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>' . $headTitle . '</title>
        <!-- if development -->
    <script type="module" src="http://localhost:5173/@vite/client"></script>
    <script type="module" src="http://localhost:5173/js/script.js"></script>
    ';
}
