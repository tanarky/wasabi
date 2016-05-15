# wasabi

## CMS

cms.example.com <- admin tool(port 3000)

### routing

* / (sites list)
* /sites/{{site_id}}/tags
* /sites/{{site_id}}/pages
* /sites/{{site_id}}/pages/{{page_id}}/bins
* /sites/{{site_id}}/pages/{{page_id}}/bins/{{bin_id}}/1
* /sites/{{site_id}}/pages/{{page_id}}/preview

### tables

* site
  - id
  - name <- uneditable because of html dump path
* tags
  - id
  - status
  - site_id
  - slug (unique)
  - name (unique)
* pages
  - id
  - status
  - site_id
  - template_id
  - path (unique, and must /.html$/ )
  - html
* templates
  - id
  - site_id
  - name
* bins
  - id
  - page_id
  - name_with_ext
  - content_type
  - body
* pages_tags
  - id
  - page_id
  - tag_id

## pre

pre.example.com <- pre env

### routing

* {{doc_root}}/wasabi <- cms tool dir
* {{doc_root}}/wasabi_pre <- pre html dir
* {{doc_root}}/wasabi_aws <- production dir for aws S3 sync

