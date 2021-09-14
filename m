Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDDE40AA83
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 11:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbhINJRV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 05:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhINJRU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 05:17:20 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01C5C061574
        for <linux-mips@vger.kernel.org>; Tue, 14 Sep 2021 02:16:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by xavier.telenet-ops.be with bizsmtp
        id tlG12500n2aSKa101lG1wz; Tue, 14 Sep 2021 11:16:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ4Xp-004Qtl-2T; Tue, 14 Sep 2021 11:16:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ4Xo-0008ie-CV; Tue, 14 Sep 2021 11:16:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] reset: pistachio: Re-enable driver selection
Date:   Tue, 14 Sep 2021 11:15:59 +0200
Message-Id: <2c399e52540536df9c4006e46ef93fbccdde88db.1631610825.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After the retirement of MACH_PISTACHIO, the Pistachio Reset Driver is no
longer auto-enabled when building a kernel for Pistachio systems.
Worse, the driver cannot be enabled by the user at all (unless
compile-testing), as the config symbol is invisible.

Fix this partially by making the symbol visible again when compiling for
MIPS, and dropping the useless default.  The user still has to enable
the driver manually when building a kernel for Pistachio systems,
though.

Fixes: 104f942b2832ab13 ("MIPS: Retire MACH_PISTACHIO")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index be799a5abf8a6edc..b0056ae5d463aedd 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -147,8 +147,8 @@ config RESET_OXNAS
 	bool
 
 config RESET_PISTACHIO
-	bool "Pistachio Reset Driver" if COMPILE_TEST
-	default MACH_PISTACHIO
+	bool "Pistachio Reset Driver"
+	depends on MIPS || COMPILE_TEST
 	help
 	  This enables the reset driver for ImgTec Pistachio SoCs.
 
-- 
2.25.1

