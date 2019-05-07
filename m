Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEFA816B69
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 21:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbfEGTem (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 15:34:42 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56108 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfEGTem (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 15:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557257680; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IcPiB45jv4Du3jNcWzAjDm6qZc2pmDR2VP3HW6bhzj4=;
        b=ul8LtZgMtyVXQhTshbOKA1R32CPilvrSogtbt0Gh7fXvM54BnejQ+GUFaS8tU+G7TLbDUK
        J2Yk3q/eSTp+t/Suhdifemjnu8bvnSNUTkR930OsrfDBDY5KKjP2h2JukT7gL9SV4F1pt8
        wjdKzuRzP72/OLovO+we7/gPS53XbKY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/5] MIPS: jz4740: PM: Let CGU driver suspend clocks and set sleep mode
Date:   Tue,  7 May 2019 21:34:19 +0200
Message-Id: <20190507193421.12260-3-paul@crapouillou.net>
In-Reply-To: <20190507193421.12260-1-paul@crapouillou.net>
References: <20190507193421.12260-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of forcing the jz4740 clocks to suspend here, we let the CGU
driver handle it.
We also let the CGU driver set the "sleep mode" bit.

This has the added benefit that now it is possible to build a kernel on
SoCs newer than the JZ4740 with CONFIG_PM.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/jz4740/pm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/jz4740/pm.c b/arch/mips/jz4740/pm.c
index 2d8653f2fc61..9e6c7a2b955f 100644
--- a/arch/mips/jz4740/pm.c
+++ b/arch/mips/jz4740/pm.c
@@ -18,21 +18,13 @@
 #include <linux/delay.h>
 #include <linux/suspend.h>
 
-#include <asm/mach-jz4740/clock.h>
-
 static int jz4740_pm_enter(suspend_state_t state)
 {
-	jz4740_clock_suspend();
-
-	jz4740_clock_set_wait_mode(JZ4740_WAIT_MODE_SLEEP);
-
 	__asm__(".set\tmips3\n\t"
 		"wait\n\t"
 		".set\tmips0");
 
-	jz4740_clock_set_wait_mode(JZ4740_WAIT_MODE_IDLE);
 
-	jz4740_clock_resume();
 
 	return 0;
 }
-- 
2.21.0.593.g511ec345e18

