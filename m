Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC699A9529
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 23:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfIDVd1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 17:33:27 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:36212 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbfIDVd1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Sep 2019 17:33:27 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id B55C8A1AC1;
        Wed,  4 Sep 2019 23:33:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de [80.241.56.117]) (amavisd-new, port 10030)
        with ESMTP id ttW76c2Tsm89; Wed,  4 Sep 2019 23:33:21 +0200 (CEST)
From:   Hauke Mehrtens <hauke@hauke-m.de>
To:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org
Cc:     john@phrozen.org, linux-mips@vger.kernel.org,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] MIPS: ralink: deactivate PCI support for SOC_MT7621
Date:   Wed,  4 Sep 2019 23:33:06 +0200
Message-Id: <20190904213306.26493-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Linux does not support PCI on the SOC_MT7621, if it is selected the
Linux build runs into a compile error. Remove HAVE_PCI from the
SOC_MT7621 SoC.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/ralink/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 49c22ddd9c41..1434fa60f3db 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -51,7 +51,6 @@ choice
 		select MIPS_GIC
 		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
-		select HAVE_PCI
 endchoice
 
 choice
-- 
2.20.1

