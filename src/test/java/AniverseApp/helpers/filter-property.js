function getErrorMessageProperty(messages, property) {
    //Function to get the error message that exist in the property that we indicated
    karate.log(messages)
    karate.log("property: "+property)
    karate.log(messages[property])
    // return messages.find(e => e.field === property)
    return messages[property];
}