foreach ($node in knife node list){
    knife node delete $node -y
}
foreach ($node in knife client list|sls -pattern "^(?!madacs-home-validator$)"){
    knife client delete $node -y
}