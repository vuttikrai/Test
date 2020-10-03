def get_column_for_inputText(str):
    mydata = str.split("_")
    if len(mydata) <= 1:
        mydata = "empty" #"notinputtext"
    else:
        mydata = mydata[1]
    return mydata

def get_loc_inputText(str):
    mydata = str.split("_")
    return mydata[0]

def get_input_element(str):
    if str.lower().find("text") >= 0:
        element_return = "text"
    elif str.lower().find("button") >= 0:
        element_return = "button"
    elif str.lower().find("link") >= 0:
        element_return = "link"
    elif str.lower().find("mouseover") >= 0:
        element_return = "mouseover"
    elif str.lower().find("option") >= 0:
        element_return = "option"
    return element_return

def get_verifying_element(str):
    if str.lower().find("text") >= 0:
        element_return = "textdisplay"
    elif str.lower().find("button status") >= 0:
        element_return = "buttonstatus"
    return element_return

def replace_str(str):
    mydata = str.replace(" ","_")
    return mydata

