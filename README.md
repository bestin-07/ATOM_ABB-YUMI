# ATOM_ABB-EGM

Implementation of ATOM - Advanced Tele-Operation Machine on ABB Yumi.

[For more details - check here](https://github.com/bestin-07/ATOM)

## Table of Contents
- [Abstract](#abstract)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Abstract
ATOM, Advanced Tele-Operation Method is a data capturing technique for teleoperation machines. This approach is cheaper, efficient, and also reduces the requirement for wearable components.

## Installation
1. Add `egm_pb2.py` file to the `ATOM_ABB-YUMI-main/Python` folder. The `egm_pb2` provides the Python classes necessary for the communication.
2. Check whether the [proto](https://github.com/ros-industrial/abb_libegm/blob/master/proto/egm.proto) file has been updated from ABB.
3. To compile the proto file, please check the following [repo](https://github.com/bestin-07/ABB_EGM_PYTHON).

## Usage
1. Connect the Python server to the Robot Studio server using the local IP and port mentioned in the Robot Studio (should be the same in Python).
2. The class `egm` is known to both Python and Robot Studio. Go through the `egm_pb2.py` file to get the value you want to change for the robot and overwrite these values in the Python server.
3. Only `TASK1` of robot backup is actually required for the EGM. The `TASK1` contains the `module1` and `test1`. `Module1` is the brain behind the EGM server for the robot and `test1` is written for controlling the robot.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
