#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
    
}
-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //this get called everytime player touches the screen
    [character flap];
}
-(void) doSomething
{
    NSLog(@"YOLO dude");
}
-(void)update:(CCTime)delta
{
    // put update code here
    // this will be run every frame.
    // delta is the time that has elapsed since the last time it was run. This is usually 1/60, but can be bigger if the game slows down
    timeSinceObstacle += delta; //delta is approximately 1/60th of a second
    // check tosee if 2 secs have passed
    if (timeSinceObstacle > 2.0f)
    {
        //add a new obstacle
        [self addObstacle];
        
        //then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here

@end
