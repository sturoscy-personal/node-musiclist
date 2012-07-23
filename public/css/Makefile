BOOTSTRAP = ./bootstrap.css
BOOTSTRAP_LESS = ./less/bootstrap.less
BOOTSTRAP_RESPONSIVE = ./bootstrap-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ./less/bootstrap-responsive.less

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# recess & uglifyjs are required
#

bootstrap:
	recess --compile ${BOOTSTRAP_LESS} > ./bootstrap.css
	recess --compress ${BOOTSTRAP_LESS} > ./bootstrap.min.css
	recess --compile ${BOOTSTRAP_RESPONSIVE_LESS} > ./bootstrap-responsive.css
	recess --compress ${BOOTSTRAP_RESPONSIVE_LESS} > ./bootstrap-responsive.min.css