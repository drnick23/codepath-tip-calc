# UIAlertController

You can choose whether to display as an alert or action sheet style. 

## Using Alert style

![Alert|250](http://i.imgur.com/cMAZh9H.gif)

The alert style presents modally in the center of their presenting view controllers. 

### Step 1: Create the UIAlertController

Create and show the alertView as below, setting preferredStyle to Alert

```
var alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
```

### Step 2: Add buttons

Create a UIAlertAction for each button to display and respond to.

```
// create the cancel action
var cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
    // handle cancel response here. Doing nothing will dismiss the view.
}
// add the cancel action to the alertController
alertController.addAction(cancelAction)

// create the OK action
let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
    // handle response here.
}
// add the OK action to the alert controller
alertController.addAction(OKAction)


```

### Step 3: Show the AlertController

```
presentViewController(alertController, animated: true) {
    // optional code for what happens after the alert controller has finished presenting
}
```

## Using Action Sheets style

![Action|250](http://i.imgur.com/8JfoPh3.gif)
The action sheet style anchors the view to the bottom of the presenting view controller.

### Step 1: Create the UIAlertController

Create and show the alertView as below, setting preferredStyle to ActionSheet

```
var alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .ActionSheet)
```

### Step 2: Add buttons

Create a UIAlertAction for each button to display and respond to. The destructive title will appear in red.

```
let alertController = UIAlertController(title: nil, message: "Are you sure you want to log out?", preferredStyle: .ActionSheet)

let logoutAction = UIAlertAction(title: "Log Out", style: .Destructive) { (action) in
    // handle case of user logging out
}
// add the logout action to the alert controller
alertController.addAction(logoutAction)     

let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
    // handle case of user canceling. Doing nothing will dismiss the view.
}
// add the cancel action to the alert controller
alertController.addAction(cancelAction)
```

### Step 3: Show the AlertController

```
presentViewController(alertController, animated: true) {
    // optional code for what happens after the alert controller has finished presenting
}
```
