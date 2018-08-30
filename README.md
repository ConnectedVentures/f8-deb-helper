# f8-deb-helper
Helper scripts for DEB deployments

# How to use

`deb-helper` will take care of packaging your files and uploading them to an aptly instance.
There are 2 main entry-points to achieve this:
- `build-all-deb`
- `deb-jazz`, see the Auto-updater section below


They both support the same parameters - except `VERSION` as it's `deb-jazz` specific.

### .deb version and aptly environment

`deb-helper` will look at the branch/tag name to construct a gitflow-inspired version number, and decide which of `testing`, `staging` and `production` environment to upload the `.deb` to.

If you wish to bypass this behaviour, you may use:
- `DEB_VERSION` bash variable to force it to a version of your liking, this will not be validated by `deb-helper`.
- `APT_ENV` to force the apt environment. This is also not validated in order to give the most freedom (tm).

Example usage of `build-all-deb` with those parameters:
`APT_ENV=testing DEB_VERSION="5.69.6+very.free.versioning" f8-deb-helper/build-all-deb`

# Auto-updater

`deb-helper` comes with an auto-updater script, this may be used to ease deployment of deb-helper's own bugfixes. In order to use it you will need the following:
- `python3-pip`
- `curl`
- decide which `VERSION` of deb-helper you wish to use


You can then invoke the auto-updater and the packager with a one-liner:
`wget -qO- https://raw.githubusercontent.com/ConnectedVentures/f8-deb-helper/v5.2.0/deb-jazz | VERSION=5.4 bash`
