SPDX-License-Identifier: GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
# SPDX-FileCopyrightText: 2020 Harald Sitter <sitter@kde.org>

# Disable the generic bearer plugin. This is in lieu of diverging packaging 
# from debian as all bearers are in the same package but in reality the generic
# bearer has no reason for being used *at all* on neon as we ship with network
# manager.
# The generic bearer plugin is a polling-based plugin that will check the
# network interfaces via ioctl() every 10 seconds. This effectively causes every
# application with a QNetworkManagerConfiguration instance (for online state
# tracking) to wake up, and there are a lot of those around!
# QtBearer always loads all available plugins rather than trying to find the
# best fitting one, so generic is always loaded and always gets polled.
# The env var disables the plugin.
#
# This gets some notable background daemons (discover, kdeconnect, kded) out of
# the top 20 power consumers on an idle system.
#
# Some further context on the option:
# https://codereview.qt-project.org/c/qt/qtbase/+/126219
# https://bugreports.qt.io/browse/QTBUG-41866

export QT_EXCLUDE_GENERIC_BEARER=1
