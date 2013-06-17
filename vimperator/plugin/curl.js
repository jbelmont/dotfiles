var INFO = 
<plugin name="curl" version="0.1"
        summary="Curl Commandline Generator"
        xmlns="http://vimperator.org/namespaces/liberator">
    <project name="Vimperator" minVersion="2.0"/>
    <p>
        This plugin provides a means to generate a <tt>curl(1)</tt>
	commandline from the data in a given form.
    </p>
    <item>
	<tags>;c</tags>
	<spec>;c</spec>
	<description>
            <p>
                Generates a curl commandline from the data in the selected form.
                The command includes the data from each form element, along with
                the current User-Agent string and the cookies for the current
                page.
            </p>
	</description>
    </item>
</plugin>;

hints.addMode('c', "Generate curl command for:", function(elem) {
    if (elem.form)
        var [url, data, elems] = parseForm(elem);
    else
        var url = elem.getAttribute("href");
    if (!url || /^javascript:/.test(url))
        return;

    function escape(str) '"' + str.replace(/[\\"$]/g, "\\$&") + '"';

    util.copyToClipboard(["curl"].concat(
        [].concat(
            [["--form-string", escape(datum)] for ([n, datum] in Iterator(elems || []))],
            data != null && !elems.length ? [["-d", escape("")]] : [],
            [["-H", escape("Cookie: " + elem.ownerDocument.cookie)],
	     ["-A", navigator.userAgent],
             [escape(url)]]
        ).map(function(e) e.join(" ")).join(" \\\n\t")).join(" "), true);
});

/* vim:se sts=4 sw=4 et: */
