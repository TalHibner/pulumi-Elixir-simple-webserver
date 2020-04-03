const cloud = require("@pulumi/cloud");

let service = new cloud.Service("simple_webserver", {
    containers: {
        nginx: {
            build: "./app",
            memory: 128,
            ports: [{ port: 8080 }],
        },
    },
    replicas: 1,
});

// export just the hostname property of the container frontend
exports.url = service.defaultEndpoint.apply(e => `http://${e.hostname}`);