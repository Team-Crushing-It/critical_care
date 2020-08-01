const userAction = async () => {
    const response = await fetch('https://uploaded-report-api.herokuapp.com/');
    const myJson = await response.json(); //extract JSON from the http response
    // do something with myJson
    console.log(myJson);
  }