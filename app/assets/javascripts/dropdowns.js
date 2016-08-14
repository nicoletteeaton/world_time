function populateSubType() {
    removeOptions(subType);
    var types = Object.keys(subTypeOptions);
    var subTypes = subTypeOptions[parentType.value];
    for (var i=0; i < subTypes.length; i++) {
        newOpt = document.createElement("option");
        newOpt.value = subTypes[i][0];
        newOpt.text = subTypes[i][1];

        if(newOpt.value.toString() == (subType.value || currentSubtype)) {
            newOpt.selected = true;
            subType.add(newOpt);
        } else {
            subType.add(newOpt);
        }
    }
}

function removeOptions(selectbox) {
    var i;
    console.log('remove_options');
    for (i = selectbox.options.length - 1; i >= 0; i--) {
        selectbox.remove(i);
    }
}
