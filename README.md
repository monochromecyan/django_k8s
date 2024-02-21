# Django K8s project

This is a Django project running correctly.

Here is a list of important commands that you will need to run.

This will run the production service for the project, we are using `waitress` instead of
`gunicorn` as we are running on a Windows machine. We are including both libraries so that
it can be ran on a linux machine.

If you wish to run it on a windows system execute the following command.
```commandline
waitress-serve --call django.core.wsgi:get_wsgi_application
```

If you wish to run it on a linux system execute the following command.
```commandline
gunicorn --worker-tmp-dir /dev/shm django_k8s.wsgi:application
```



Here are the commands to setup migrations and create superusers for the project.

Local change for the database.
```commandline
python manage.py makemigrations
```

To migrate the database after making the local migrations.
```commandline
python manage.py migrate --noinput
```

Create superuser for the project and in the database.
```commandline
python manage.py createsuperuser --email YOUR_EMAIL --noinput
```

If you wish to set the kubernetes environment variable to access the cluster deployed 
on Digital Ocean run the following command.
```commandline
$Env:KUBECONFIG="$HOME\PycharmProjects\django_k8s\.kube\kubeconfig.yaml"
```
We can also set this up on our local code editor depending on which one we are using.
