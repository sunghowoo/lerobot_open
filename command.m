from lerobot.common.robot_devices.motors.configs import DynamixelMotorsBusConfig
from lerobot.common.robot_devices.motors.dynamixel import DynamixelMotorsBus

leader_config = DynamixelMotorsBusConfig(
    port="/dev/ttyUSB0",
    motors={
        # name: (index, model)
        "shoulder_pan": [1, "xh540-w150"],
        "shoulder_lift": [2, "xh540-w150"],
        "elbow_flex": [3, "xh540-w150"],
        "wrist_flex": [4, "xc330-t288"],
        "wrist_roll": [5, "xc330-t288"],
        "wrist_roll_last": [6, "xc330-t288"],
    },
)

follower_config = DynamixelMotorsBusConfig(
    port="/dev/ttyACM0",
    motors={
        # name: (index, model)
        "shoulder_pan": [1, "ym070-210-a099-rh"],
        "shoulder_lift": [2, "ym070-210-a099-rh"],
        "elbow_flex": [3, "ym070-210-a099-rh"],
        "wrist_flex": [4, "ym070-210-a099-rh"],
        "wrist_roll": [5, "ym080-230-a099-rh"],
        "wrist_roll_last": [6, "ym080-230-a099-rh"],
    },
)

leader_arm = DynamixelMotorsBus(leader_config)
follower_arm = DynamixelMotorsBus(follower_config)



------
leader_arm.connect()
leader_pos = leader_arm.read("Present_Position")
print(leader_pos)
follower_arm.connect()
follower_pos = follower_arm.read("Present_Position")
print(follower_pos)

--------
calibration

from lerobot.common.robot_devices.robots.configs import KochRobotConfig
from lerobot.common.robot_devices.robots.manipulator import ManipulatorRobot

robot_config = KochRobotConfig(
    leader_arms={"main": leader_config},
    follower_arms={"main": follower_config},
    cameras={},  # We don't use any camera for now
)
robot = ManipulatorRobot(robot_config)



-----

leader_config = DynamixelMotorsBusConfig(
    port="/dev/ttyUSB0",
    motors={
        # name: (index, model)
        "shoulder_pan": [1, "xm430-w350"],
    },
)


---
{"homing_offset": [12976128, 12976128, 12976128, 12976128, 12976128, 12976128], "drive_mode": [0, 1, 0, 0, 0, 0], "start_pos": [5, 131065, 0, -131070, -140291, 0], "end_pos": [5, 0, 131071, 0, -140291, 0], "calib_mode": ["DEGREE", "DEGREE", "DEGREE", "DEGREE", "DEGREE", "DEGREE"], "motor_names": ["shoulder_pan", "shoulder_lift", "elbow_flex", "wrist_flex", "wrist_roll", "wrist_roll_last"]}


---




