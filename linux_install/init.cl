API SET API.Manager assetsFolder '/path/to/assets'
API SET API.Manager physicsEnabled false

CREATE telnet
telnet SET active false
telnet ADD Api.FromTelnet
telnet SET Api.FromTelnet port 10200
telnet SET active true
