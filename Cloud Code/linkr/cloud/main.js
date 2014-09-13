
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
require('cloud/app.js');

Parse.Cloud.define("createLink", function(request,response){
	var title = request.params.title;
	var lnk = request.params.link;
	var iconImage = request.params.icon;
	var launchImage = request.params.launch;
	var prompt = request.params.prompt;
	var info = request.params.info;
	var Link = Parse.Object.extend("Links");
	var link = new Link();
	link.set("title", title);
	link.set("link", lnk);
	link.set("iconImage", iconImage);
	link.set("launchImage", launchImage);
	link.set("info", info);
	link.set("prompt", prompt);
	var rand = Math.floor((Math.random() * 1000000));
	link.set("hash", rand.toString());
	link.save(null, {
		success:function(a){
			response.success(rand);
		},
		error:function(a,e){
			response.error(e);	
		}
	});
});