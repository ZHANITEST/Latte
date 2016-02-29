/*
 *
 * latte.d
 * - 라떼
 * 가벼운 HTML 태그 파서
 *
 * License: BSD
 * By ZHANITEST(github.com/zhanitest)
 *
 */

// C - 상수
// X - 카피

module latte;

import std.stdio:File,writeln;
import std.array;

immutable string Ctag_attr_patthen = "([\\w]+)=[\",\']{1}([\\.:\\/\\#\?\\&\\=\\%\\_\\- \\dA-zㄱ-ㅎㅏ-ㅣ가-힣]*)[\",\']{1}";
immutable string Cstyle_attr_patthen = "(style)=[\",\']{1}([\\)\\(\\.:;,\\/\\#\?\\&\\=\\%\\_\\- \\d\\w]*)[\",\']{1}";
immutable string[] Cinline = [
	"a", "abbr", "acronym", "applet",
	"b", "basefont", "bdo", "big", "br", "button",
	"cite", "code", "dfn", "em", "font", "i", "iframe", "img", "input",
	"kbd", "label", "map", "object", "q",
	"s", "samp", "select", "small", "span", "strike", "strong", "sub", "sup",
	"textarea", "tt", "u", "var",
];

immutable string[] Cinline_html5 = [
	"a", "abbr", "acronym", "b", "bdo", "big", "br", "button", "cite", "code", "dfn",
	"em", "i", "img", "input", "kbd", "label", "map", "object", "q", "samp", "small",
	"script", "select", "span", "strong", "sub", "sup", "textarea", "tt", "var"
];

immutable string[] Cblock = [
	"address", "blockquote",
	"center", "dir", "div", "dl", "fieldset", "form",
	"h1", "h2", "h3", "h4", "h5", "h6", "hr", 
	"isindex", "menu", "noframes", "ol", "p", "pre", "table", "ul",
];

import std.algorithm.searching:countUntil,canFind;
import std.string:indexOf,lastIndexOf,replace;
import std.regex:regex,RegexMatch,matchAll,match,replaceAll;

class LatteCup{
	private string HTML_BODY;
	private string[] TOKEN_LIST;

	this( string html_body )
	{
		this.HTML_BODY = html_body;
		this.TOKEN_LIST = parsing();
	}

	string strip(){
		string temp = this.HTML_BODY;
		return temp;
	}

	string[] parsing(){
		// 개행하여 불러오기
		string temp = this.HTML_BODY.replace("\n", "");
		temp = replaceAll(this.HTML_BODY, regex("<br[/]*>"), "\\n");

		// split 구분 하기
		temp = temp.replace("><", ">\n<");
		
		// split 구분 하기 - 2
		auto regex_match_obj = matchAll(temp, regex(">([\\w])") );
		if( !regex_match_obj.empty() )
		{
			// html_body 사본에 반영
			foreach( regex_element; regex_match_obj)
			temp = temp.replace(
				regex_element[0],
				">\n"~regex_element[1]
			);
		}
		regex_match_obj = matchAll(temp, regex("</([\\w])") );
		if( !regex_match_obj.empty() )
		{
			// html_body 사본에 반영
			foreach( regex_element; regex_match_obj)
			temp = temp.replace(
				regex_element[0],
				"\n</"~regex_element[1]
			);
		}

		string[] token_array = split( temp, "\n" );
		return token_array;
	}

	string[string][] chop(){
		string[string][] result;
		string[] token_array = parsing();

		// 본격적으로 분리시작
		foreach( token; token_array )
		{
			// Cinline부터 검색
			if(countUntil(Cinline, "<"~token) != -1)
			{
			}
		}
		return result;
	}

	// 태그 주문
	string[string][] takeAll( string tag_name )
	{
		// 있는 지 보고 없으면 Error로 Throw
		if( countUntil(Cinline, tag_name) == -1 || countUntil(Cblock, tag_name) == -1 )
			{ throw new Error("Coudn't find <"~tag_name~"> tag."); }
		string[] Xtoken_list = this.TOKEN_LIST;
		string[] result = [];
		foreach( token; Xtoken_list )
		{
			if( token.indexOf("<"~tag_name)!=-1 || token.indexOf("</"~tag_name)!=-1 )
			{
				auto tag_attr = matchAll();
				auto style_attr;
			}
		}
	}
}

void main()
{
	auto f = File("sample_ez.txt", "r");
	string html_body = "";
	while( !f.eof() ) { html_body~=f.readln(); } f.close();

	
	auto cup = new LatteCup( html_body );
	foreach( e; cup.parsing() ){
		writeln(e);
	}
}