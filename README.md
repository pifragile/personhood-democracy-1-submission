In order to simulate a democratic vote, please follow the steps below. This will:
1. Download and build all the necessary dependencies (this will take a while)
2. Start a blockchain node
3. Setup a test community
4. Run a script where users submit propsals, vote and verifies if the proposals were succesful.


```
docker build -t "personhood-democracy-1-submission" .  --progress plain
docker run personhood-democracy-1-submission
```