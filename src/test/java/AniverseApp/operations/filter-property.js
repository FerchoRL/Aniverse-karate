function getErrorMessageProperty(messages, property) {
    karate.log(messages)
    karate.log("property: "+property)
    karate.log(messages[property])
    // return messages.find(e => e.field === property)
    return messages[property];
}