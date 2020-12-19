Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5912DF17B
	for <lists+linux-mips@lfdr.de>; Sat, 19 Dec 2020 21:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgLSUAW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Dec 2020 15:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727608AbgLSUAW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Dec 2020 15:00:22 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E993BC0611CA
        for <linux-mips@vger.kernel.org>; Sat, 19 Dec 2020 11:59:02 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kqiNA-0001pg-SN; Sat, 19 Dec 2020 20:58:36 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kqiN8-0007bp-7j; Sat, 19 Dec 2020 20:58:34 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v6 net-next 0/2] net: dsa: add stats64 support 
Date:   Sat, 19 Dec 2020 20:58:31 +0100
Message-Id: <20201219195833.29197-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

changes v6:
- move stats64 callback to ethtool section
- ar9331: diff. fixes
- ar9331: move stats calculation to the worker
- ar9331: extend rx/tx error counters
- use spin lock instead of u64_stats*

changes v5:
- read all stats in one regmap_bulk_read() request
- protect stats with u64_stats* helpers.

changes v4:
- do no read MIBs withing stats64 call
- change polling frequency to 0.3Hz

changes v3:
- fix wrong multiplication
- cancel port workers on remove

changes v2:
- use stats64 instead of get_ethtool_stats
- add worked to poll for the stats

Oleksij Rempel (2):
  net: dsa: add optional stats64 support
  net: dsa: qca: ar9331: export stats64

 drivers/net/dsa/qca/ar9331.c | 163 ++++++++++++++++++++++++++++++++++-
 include/net/dsa.h            |   4 +-
 net/dsa/slave.c              |  14 ++-
 3 files changed, 178 insertions(+), 3 deletions(-)

-- 
2.29.2

