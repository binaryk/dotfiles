#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites
BINARCODE=$HOME/Sites/binarcode
LARAVEL=$SITES/laravel

# BinarCode
git clone git@github.com:BinarCode/binarcode-admin.git $BINARCODE/binarcode-admin
git clone git@github.com:BinarCode/nova.git $BINARCODE/nova
git clone git@github.com:BinarCode/laravel-restify.git $BINARCODE/laravel-restify
git clone git@github.com:BinarCode/laravel-stateless-session.git $BINARCODE/laravel-stateless-session
git clone git@github.com:BinarCode/elements.git $BINARCODE/elements
git clone git@github.com:BinarCode/laravel-mailator.git $BINARCODE/mailator
git clone git@github.com:BinarCode/tse-cli.git $BINARCODE/tse-cli
git clone git@github.com:BinarCode/tse.git $BINARCODE/tse

# Laravel
git clone git@github.com:laravel/browser-kit-testing.git $LARAVEL/browser-kit-testing
git clone git@github.com:laravel/cashier.git $LARAVEL/cashier
git clone git@github.com:laravel/docs.git $LARAVEL/docs
git clone git@github.com:laravel/dusk.git $LARAVEL/dusk
git clone git@github.com:laravel/echo.git $LARAVEL/echo
git clone git@github.com:laravel/envoy.git $LARAVEL/envoy
git clone git@github.com:laravel/framework.git $LARAVEL/framework
git clone git@github.com:laravel/helpers.git $LARAVEL/helpers
git clone git@github.com:laravel/horizon.git $LARAVEL/horizon
git clone git@github.com:laravel/installer.git $LARAVEL/installer
git clone git@github.com:laravel/laravel.git $LARAVEL/laravel
git clone git@github.com:laravel/lumen.git $LARAVEL/lumen
git clone git@github.com:laravel/lumen-framework.git $LARAVEL/lumen-framework
git clone git@github.com:laravel/lumen-installer.git $LARAVEL/lumen-installer
git clone git@github.com:laravel/nexmo-notification-channel.git $LARAVEL/nexmo-notification-channel
git clone git@github.com:laravel/nova.git $LARAVEL/nova
git clone git@github.com:laravel/passport.git $LARAVEL/passport
git clone git@github.com:laravel/sanctum.git $LARAVEL/sanctum
git clone git@github.com:laravel/scout.git $LARAVEL/scout
git clone git@github.com:laravel/slack-notification-channel.git $LARAVEL/slack-notification-channel
git clone git@github.com:laravel/socialite.git $LARAVEL/socialite
git clone git@github.com:laravel/telescope.git $LARAVEL/telescope
git clone git@github.com:laravel/tinker.git $LARAVEL/tinker
git clone git@github.com:laravel/ui.git $LARAVEL/ui
