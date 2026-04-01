function layout() {
    return {
        name: "Four Corners",
        getFrameAssignments: (windows, screenFrame) => {
            const fullCornerHeight = screenFrame.height / 2;
            const fullCornerWidth = screenFrame.width / 2;

            let remainderHeight = 0;
            const remainderWidth = fullCornerWidth;

            if (windows.length > 4) {
                remainderHeight = fullCornerHeight / (windows.length - 3);
            }

            const frames = windows.map((window, index) => {
                if (windows.length == 1) {
                    const frame = {
                        x: screenFrame.x,
                        y: screenFrame.y,
                        width: screenFrame.width,
                        height: screenFrame.height
                    };
                    return { [window.id]: frame };
                } else if (windows.length == 2) {
                    if (index == 0) {
                        const frame = {
                            x: screenFrame.x,
                            y: screenFrame.y,
                            width: fullCornerWidth,
                            height: screenFrame.height
                        };
                        return { [window.id]: frame };
                    } else {
                        const frame = {
                            x: screenFrame.x + fullCornerWidth,
                            y: screenFrame.y,
                            width: fullCornerWidth,
                            height: screenFrame.height
                        };
                        return { [window.id]: frame };
                    }
                } else if (windows.length == 3) {
                    if (index == 0) {
                        const frame = {
                            x: screenFrame.x,
                            y: screenFrame.y,
                            width: fullCornerWidth,
                            height: screenFrame.height
                        };
                        return { [window.id]: frame };
                    } else if (index == 1) {
                        const frame = {
                            x: screenFrame.x + fullCornerWidth,
                            y: screenFrame.y,
                            width: fullCornerWidth,
                            height: fullCornerHeight
                        };
                        return { [window.id]: frame };
                    } else {
                        const frame = {
                            x: screenFrame.x + fullCornerWidth,
                            y: screenFrame.y + fullCornerHeight,
                            width: fullCornerWidth,
                            height: fullCornerHeight
                        };
                        return { [window.id]: frame };
                    }
                } else if (index <= 2 || index == 3 && windows.length == 4) {
                    const frame = {
                        x: screenFrame.x + (fullCornerWidth * (index % 2)),
                        y: screenFrame.y + (fullCornerHeight * Math.floor(index / 2)),
                        width: fullCornerWidth,
                        height: fullCornerHeight
                    };
                    return { [window.id]: frame };
                } else {
                    const frame = {
                        x: screenFrame.x + fullCornerWidth,
                        y: screenFrame.y + fullCornerHeight + (remainderHeight * (index - 3)),
                        width: remainderWidth,
                        height: remainderHeight
                    }
                    return { [window.id]: frame };
                }
            });
            return frames.reduce((frames, frame) => ({ ...frames, ...frame }), {});
        }
    };
}
