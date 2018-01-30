<h1><a id="Instagram_Automation_0"></a>Instagram_Automation</h1>
<p>Automates the installation and use of <a href="https://github.com/timgrossmann/InstaPy">InstaPy</a>.</p>
<h1><a id="What_it_Does_3"></a>What it Does</h1>
<p>Automates a Chrome browser to:</p>
<ul>
<li>Like Instagram photos containing specified hash tags.</li>
<li>Ignore Instagram photos containing specified hash tags.</li>
<li>Ignores specified followers. This is done so that interactions with followers remains genuine.</li>
</ul>
<h3><a id="Requirements_9"></a>Requirements:</h3>
<ul>
<li>Linux Box (Tested using Arch)</li>
<li>Python 3.6x</li>
<li>pip</li>
<li>virtualenv</li>
<li>Chrome Browser</li>
<li><a href="https://stedolan.github.io/jq/">jq</a> Likely in you favorite repository</li>
</ul>
<h3><a id="How_It_Works_17"></a>How It Works</h3>
<pre><code class="language-sh">$ <span class="hljs-built_in">cd</span> ~/Desktop/
$ git <span class="hljs-built_in">clone</span> https://github.com/scott48074/Instagram_Automation.git
$ <span class="hljs-built_in">cd</span> Instagram_Automation
</code></pre>
<p>Next edit the config.json file:</p>
<ul>
<li>Add your Instagram user_name.</li>
<li>Add your Instagram password .</li>
<li>Add the URL pointing to a CSV containing your followers user names. One name on each line.</li>
<li>Add Add the URL pointing to a CSV containing the hash tags that you want to like.</li>
<li>Add Add the URL pointing to a CSV containing the hash tags that you want to ignore.</li>
</ul>
<pre><code class="language-sh">$ <span class="hljs-built_in">cd</span> ~/Desktop/Instagram_Automation
$ bash install_instapy.sh
$ bash update_and_move.sh
$ bash start_automation.sh
</code></pre>
<p>With any luck Chrome will start the automation will start.</p>
<h3><a id="bashrc_38"></a>.bashrc</h3>
<p>I made things even quicker by adding a alias to my .bashrc.</p>
<pre><code class="language-sh"><span class="hljs-keyword">function</span> <span class="hljs-function"><span class="hljs-title">ig</span></span> () {
    <span class="hljs-keyword">if</span> [ <span class="hljs-variable">$1</span> = <span class="hljs-string">"-u"</span> ]; <span class="hljs-keyword">then</span>
        bash ~/Documents/Instagram_Automation/install_instapy.sh
    <span class="hljs-keyword">fi</span>
    bash ~/Documents/Instagram_Automation/update_and_move.sh
    bash ~/Documents/Instagram_Automation/start_automation.sh
} 