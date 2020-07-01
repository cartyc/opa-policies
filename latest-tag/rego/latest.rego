package latesttag

violation[{"msg":msg}] {
    container := input.review.object.spec.containers[_]
    tag :=  split(container.image, ":")[1]

    not tag != "latest"

    msg := sprintf("container <%v> uses '%v' tag", [container.name, tag])
}

