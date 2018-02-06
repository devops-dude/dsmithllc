FROM alpine:latest
ENV AWS_SECRET_ACCESS_KEY=AsxECejzIt4xnHjMaKpp2HGwZ+8fUrpNt3DSVX1Q
ENV AWS_ACCESS_KEY_ID=AKIAJWWAA3ZP56373F5A

# install packages
CMD apk update
CMD apk add --update py-pip
CMD apk add py-pip zip
CMD pip install awscli

# validate templates and zip
CMD cd templates
CMD for template in `ls *.yaml`; \
      do \
        echo "Testing template $template" && \
        aws cloudformation validate-template --template-body file://$template && \
        filename="${template%.*}" && \
        echo "Zipping $template" && \
        zip $filename.zip $template; \
      done

# sync to s3
CMD aws s3 sync . s3://dsmith-test
