package latesttag

test_input_allow_tag {
    input := {"review": input_review(input_container_allowed)}
    results := violation with input as input
    count(results) == 0
}

test_input_deny_tag {
    input := {"review": input_review(input_container_deny)}
    results := violation with input as input
    count(results) == 1
}

input_review(containers) = output {
    output = {
        "object" : {
            "metadata" : {
                "name": "nginx"
            },
            "spec": {
                "containers": containers,
            }
        }
    }
}

input_container_allowed = [
    {
        "name": "nginx",
        "image": "awesomeimage:v1"
    }
]

input_container_deny = [
    {
        "name": "nginx",
        "image": "awesomeimage:latest"
    }
]