Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1130216B67
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 21:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfEGTeg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 15:34:36 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:56034 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEGTeg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 15:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557257672; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=9NMfdnya0GuZD5SgIy37BX/N2lS6vwhuvXIT4drEbnY=;
        b=nMydFJ0XZqxs/6gFn6b50tlXto+17s/QudbdwWYuG5VysPUCbl0PfOjNJUwGvc573Qy8/T
        mZXEtC7/J6+Oz4qw48Ef24GE1WyeIbSNpDl4SI5N3AEsadZ6QE6cKtFYs1RBEuhF0NEonW
        J0fVlaWz4MNfRkMILkF0fUB1DbMdUhQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/5] clk: ingenic: Add missing header in cgu.h
Date:   Tue,  7 May 2019 21:34:17 +0200
Message-Id: <20190507193421.12260-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The cgu.h has structures that contain 'clk_onecell_data' and 'clk_hw'
structures (no pointers), so the <linux/clk-provider.h> header should be
included.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.h         | 1 +
 drivers/clk/ingenic/jz4725b-cgu.c | 1 -
 drivers/clk/ingenic/jz4740-cgu.c  | 1 -
 drivers/clk/ingenic/jz4770-cgu.c  | 1 -
 drivers/clk/ingenic/jz4780-cgu.c  | 1 -
 5 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.h b/drivers/clk/ingenic/cgu.h
index e12716d8ce3c..c18198ba2955 100644
--- a/drivers/clk/ingenic/cgu.h
+++ b/drivers/clk/ingenic/cgu.h
@@ -19,6 +19,7 @@
 #define __DRIVERS_CLK_INGENIC_CGU_H__
 
 #include <linux/bitops.h>
+#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 584ff4ff81c7..044bbd271bb6 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -6,7 +6,6 @@
  * Author: Paul Cercueil <paul@crapouillou.net>
  */
 
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4725b-cgu.h>
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index b86edd328249..09629c0613c1 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -15,7 +15,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4740-cgu.h>
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index bf46a0df2004..2e6fd8b1c248 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/syscore_ops.h>
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index 6427be117ff1..ad64afb438a5 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -15,7 +15,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <dt-bindings/clock/jz4780-cgu.h>
-- 
2.21.0.593.g511ec345e18

