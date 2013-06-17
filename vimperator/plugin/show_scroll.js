///* dtyuan: 9/22/2010
//	Freeware
//
//*/
var INFO = 
<plugin name="show_scroll" version="1.0"
        href="http://code.google.com/p/vimperator-labs/issues/detail?id=429"
        summary="Show how much screen scrolls"
        xmlns="http://vimperator.org/namespaces/liberator">
    <author email="dty...@gmail.com">DTYUAN</author>
    <license href="http://www.gnu.org/licenses/licenses.html">GNU GPL</license>
    <project name="Vimperator" minVersion="2.0"/>
    <p>
			When screen scrolls, show how much screen scrolls.
    </p>
    <item>
			<tags>'showscroll' 'scroll'</tags>
			<spec>'showscroll' 'scroll'</spec>
			<description>
								<p>
										<![CDATA[ 
										" enalbleing command with default style
										:showscroll
										" autocmd to load enalbe the plugin when page loaded
										autocmd PageLoad .* :showscroll
										" customization styles for scroll indicator, screen center point, and stay-on timeout
										autocmd PageLoad .* :showscroll "width: 5px; background-color: blue; " "solid red 5px; " 200
										]]>;
								</p>
			</description>
	</item>
</plugin>;

var ShowScroll = {};

ShowScroll.showScrollStyle = "width: 5px; background-color: red; ";
ShowScroll.borderStyle = "solid blue 3px; ";
ShowScroll.timeOut = 500;
ShowScroll.showScroll = function(mystyle){

if(mystyle && mystyle[0] && mystyle[0]!="") ShowScroll.showScrollStyle = mystyle[0];
if(mystyle && mystyle[1] && mystyle[1]!="") ShowScroll.borderStyle = mystyle[1];
if(mystyle && mystyle[2] && mystyle[2]!="") ShowScroll.timeOut = mystyle[2];

var theDoc = content.document;
var scrolltopDE = theDoc.documentElement.scrollTop;
var scrolltopBD = theDoc.body.scrollTop;
var bodyObj = (scrolltopDE > 0 ? theDoc.documentElement : theDoc.body);

var marks;
function getMarks()
{
	if(typeof marks == 'undefined' || typeof marks.length == 'undefined')
	{
		createMarks();
	}
}

// original middle default to half of the screen height
var middle = Math.floor(bodyObj.clientHeight/2);
function createMarks () {

	var markL = content.document.createElement('div');
	markL.setAttribute('id', 'markL');
	markL.setAttribute('style', 'display: none; position: absolute; top: '+ middle +'px; left: '+ (bodyObj.scrollLeft + 0) +'px; width: 10px; height: 5px; background-color: red; '+ ShowScroll.showScrollStyle);
	bodyObj.appendChild(markL);

	var markR = content.document.createElement('div');
	markR.setAttribute('id', 'markR');
	markR.setAttribute('style', 'display: none; position: absolute; top: '+ middle +'px; left: '+ (bodyObj.scrollLeft + bodyObj.clientWidth - 10) +'px; width: 10px; height: 5px; background-color: red; '+ ShowScroll.showScrollStyle);
	bodyObj.appendChild(markR);

	marks = new Array(content.document.getElementById("markL"), content.document.getElementById("markR"));
}

var newmiddle = bodyObj.scrollTop + Math.floor(bodyObj.clientHeight/2);
function showMarks() {
	getMarks();
	newmiddle = bodyObj.scrollTop + Math.floor(bodyObj.clientHeight/2);
	var diff = newmiddle - middle;
	var diff_abs = Math.abs(newmiddle - middle);
	if(diff>0)
	{
		var cssText = ShowScroll.showScrollStyle
									+ "position: absolute; "
									+ "top: "+ newmiddle +"px; "
									+ "height: "+ diff +"px; "
									+ "display: block; "
									+ "border-bottom: medium none; "
									+ "border-top: "+ ShowScroll.borderStyle;
		
		marks[0].setAttribute('style', cssText + "left: "+ (bodyObj.scrollLeft + 0) +"px; ");
		marks[1].setAttribute('style', cssText + "left: "+ (bodyObj.scrollLeft + bodyObj.clientWidth - 10) +"px; ");
	}
	else
	{
		var cssText = ShowScroll.showScrollStyle
									+ "position: absolute; "
									+ "top: "+ (newmiddle + diff) +"px; "
									+ "height: "+ diff_abs +"px; "
									+ "display: block; "
									+ "border-top: medium none; "
									+ "border-bottom: "+ ShowScroll.borderStyle;
		
		marks[0].setAttribute('style', cssText + "left: "+ (bodyObj.scrollLeft + 0) +"px; ");
		marks[1].setAttribute('style', cssText + "left: "+ (bodyObj.scrollLeft + bodyObj.clientWidth - 10) +"px; ");
	}
}

function moveMarks () {
	marks[0].style.top = newmiddle +"px";
	marks[1].style.top = newmiddle +"px";
	marks[0].style.display = "none";
	marks[1].style.display = "none";
	middle = newmiddle;
}

var timeout;
function setMarks() {
	showMarks();
	if(typeof timeout != "undefined")
	{
		clearTimeout(timeout);
	}
	timeout = setTimeout(moveMarks, ShowScroll.timeOut);
}

content.window.addEventListener("scroll", function() { setMarks(); }, false);
}


// cannot use "_" in the command name; that is, center_select will not work
commands.add(['showscroll'],
		'run showscroll from within vimperator.',
		function(mystyle) {
			ShowScroll.showScroll(mystyle);
		}
);

