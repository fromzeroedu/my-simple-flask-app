#### A basic Flask App

- Build the image with `docker build -t hello-app .`
- Run the container with `docker run -d -p 5000:5000 -e PORT=5000 --name hello-server hello-app`
- Check that the container is running
- Go to `localhost:5000`. You should see `Hello, World!`
