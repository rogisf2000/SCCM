Set env = CreateObject("Microsoft.SMS.TSEnvironment") 
For Each oVar In env.GetVariables 
WScript.Echo oVar & "=" & env(oVar) 
Next