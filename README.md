<h1><a id="Instagram_Automation_0"></a>Instagram_Automation</h1>
<p>Automates the installation and use of <a href="https://github.com/timgrossmann/InstaPy">InstaPy</a>.</p>
<h1><a id="What_it_Does_3"></a>What it Does</h1>
<p>Automates a Chrome browser to:</p>
<ul>
<li>Like Instagram photos containing specified hash tags</li>
<li>Ignore Instagram photos containing specified hash tags</li>
<li>Ignores specified followers to keep follower interaction genuine</li>
</ul>
<h3><a id="Requirements_9"></a>Requirements:</h3>
<ul>
<li>Linux Box (Tested using Arch)</li>
<li>Python 3.6x</li>
<li>pip</li>
<li>virtualenv</li>
<li>Chrome Browser</li>
<li><a href="https://stedolan.github.io/jq/">jq</a> Likely in your favorite repository</li>
</ul>
<h3><a id="How_It_Works_17"></a>How It Works</h3>
<pre>$ git <span class="hljs-built_in">clone</span> https://github.com/scott48074/Instagram_Automation.git<code class="language-sh">
$ <span class="hljs-built_in">cd</span> Instagram_Automation
</code></pre>
<p>Next rename the config.change_me to config.json and add the following:</p>
<ul>
<li>Add your Instagram user_name</li>
<li>Add your Instagram password </li>
<li>Add the URL pointing to a CSV containing your followers</li>
<li>Add Add the URL pointing to a CSV containing the hash tags that you want to like</li>
<li>Add Add the URL pointing to a CSV containing the hash tags that you want to ignore</li>
<li>The CSV files should contain one username or tag per line in the first column</li>  
</ul>
<pre><code class="language-sh">$ bash install_instapy.sh<span class="hljs-built_in">
$ bash install_instapy.sh
$ bash update_and_move.sh
$ bash start_automation.sh
</code></pre>
<p>With any luck Chrome automation will start.</p>
<h3><a id="bashrc_38"></a>.bashrc</h3>
<p>I made things even quicker by adding an alias to my .bashrc.</p>
<pre><code class="language-sh"><span class="hljs-keyword">function</span> <span class="hljs-function"><span class="hljs-title">ig</span></span> () {
    <span class="hljs-keyword">if</span> [[ <span class="hljs-variable">$1</span> == <span class="hljs-string">"-u"</span> ]]; <span class="hljs-keyword">then</span>
        bash [YOUR CHOSEN PATH]/install_instapy.sh
    <span class="hljs-keyword">fi</span>
    bash [YOUR CHOSEN PATH]/update_and_move.sh
    bash [YOUR CHOSEN PATH]/start_automation.sh
} 
</code></pre>
<p>Then when you want to run:</p>
<pre><code class="language-sh">$ ig
</code></pre>
<p>If you want to update InstaPy before running:</p>
<pre><code class="language-sh">$ ig -u
</code></pre>
<h3><a id="Using_Google_Drive_to_Host_the_CSV_files_58"></a>Using Google Drive to Host the CSV files</h3>
<ul>
<li>Make the three CSV files (followers.csv, tags.csv, unwanted_tags)</li>
<li>Get the shareable <strong>public</strong> link</li>
<li>Open an incognito window</li>
<li>Visit the CSV file</li>
<li>Download the file as a CSV File &gt; Down as &gt; csv</li>
<li>In Chrome go to your downloads tab</li>
<li>Right click on the file and click copy link</li>
<li>This link can be used in the config.json</li>
</ul>
<h3><a id="Individual_Script_Description_68"></a>Individual Script Description</h3>
<p><strong>install_instapy.sh</strong></p>
<ul>
<li>Clones the InstaPy repository</li>
<li>Downloads the Chrome Driver places it appropriate directory</li>
<li>Starts a virtualenv and install InstaPy’s requirements into it</li>
<li>Edits a file to fix an issue with the way InstaPy handles a browser with English as the default language</li>
</ul>
<p><strong>update_and_move.sh</strong></p>
<ul>
<li>Downloads the CSV files</li>
<li>Moves the three CSV files to the appropriate directory</li>
<li>Moves the config.json to that appropriate directory</li>
<li>Moves the your_automation.py file to the appropriate directory</li>
</ul>
<p><strong>start_automation.sh</strong></p>
<ul>
<li>Starts the virtualenv</li>
<li>Starts the your_automation.py script</li>
</ul>
<p><strong>your_automation.py</strong></p>
<ul>
<li>Interacts with the InstaPy library for automation</li>
</ul>
<h3><a id="License_87"></a>License</h3>
<p><a href="https://github.com/scott48074/Instagram_Automation/blob/master/LICENSE">License</a><br>
<a href="https://github.com/timgrossmann/InstaPy/blob/master/LICENSE">InstaPy License</a></p>
