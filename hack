// let url = "https://res.cloudinary.com/practicaldev/image/fetch/s--V3Le4n-W--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3qul2upbi8ko7vdg8bm7.png";

// function replace(){
//     let everyImage = document.getElementsByTagName("img");
//     for (img = 0; img < everyImage.length; img++){
//         everyImage[img].src = url;
//     };
// }

// let script = document.createElement("script");
// script.innerHTML = `
//     console.log("HI")
// `



function inject(){
    function myFunction(){
        let waitTime;
        try{
            waitTime = parseFloat(prompt("How much seconds should I add? "));
        }catch{
            waitTime = 0.5;
        }
        
        function waitForElm(selector) {
            return new Promise(resolve => {
                if (document.querySelector(selector)) {
                    return resolve(document.querySelector(selector));
                }
        
                const observer = new MutationObserver(mutations => {
                    if (document.querySelector(selector)) {
                        resolve(document.querySelector(selector));
                        observer.disconnect();
                    }
                });
        
                observer.observe(document.body, {
                    childList: true,
                    subtree: true
                });
            });
        };
        waitForElm(".MatchModeQuestionGridBoard").then(elm => {
            setTimeout(() => {
                Object.values(elm)[0].return.stateNode.props.onBoardCleared();
            }, waitTime * 1000);
        });
        waitForElm(".MatchModeQuestionScatterBoard").then(elm => {
            setTimeout(() => {
                Object.values(elm)[0].return.stateNode.props.onBoardCleared();
            }, waitTime * 1000);
        });
    };
    const script = `( ${myFunction.toString()} )('${window.crypto.getRandomValues(new Uint32Array(5)).toString()}', '${'document'}');`
    const scriptTag = document.createElement('script');
    const scriptBody = document.createTextNode(script);
    scriptTag.id = 'chromeExtensionDataPropagator';
    scriptTag.appendChild(scriptBody);
    document.body.append(scriptTag);
}
inject()
