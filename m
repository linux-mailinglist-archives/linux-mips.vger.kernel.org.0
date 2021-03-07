Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D639330324
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 18:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhCGRIW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 12:08:22 -0500
Received: from aposti.net ([89.234.176.197]:40130 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232563AbhCGRIC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 12:08:02 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] clk: Add clk_get_first_to_set_rate
Date:   Sun,  7 Mar 2021 17:07:41 +0000
Message-Id: <20210307170742.70949-2-paul@crapouillou.net>
In-Reply-To: <20210307170742.70949-1-paul@crapouillou.net>
References: <20210307170742.70949-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The purpose of this function is to be used along with the notifier
mechanism.

When a parent clock can see its rate externally changed at any moment,
and a driver needs a specific clock rate to function, it can register a
notifier on the parent clock, and call clk_set_rate() on the base clock
to adjust its frequency according to the new parent clock.

This works fine, until the base clock has the CLK_SET_RATE_PARENT flag
set. In that case, calling clk_set_rate() on the base clock will call
clk_set_rate() on the parent clock, which will trigger the notifier
again, and we're in a loop.

For that reason, we need to register the notifier on the parent clock of
the first ancestor of the base clock that will effectively modify its
rate when clk_set_rate() is called, which we can now obtain with
clk_get_first_to_set_rate().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/clk.c   |  9 +++++++++
 include/linux/clk.h | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5052541a0986..3fd75e283482 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2450,6 +2450,15 @@ struct clk *clk_get_parent(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_get_parent);
 
+struct clk *clk_get_first_to_set_rate(struct clk *clk)
+{
+	while (clk && (clk->core->flags & CLK_SET_RATE_PARENT))
+		clk = clk_get_parent(clk);
+
+	return clk;
+}
+
+
 static struct clk_core *__clk_init_parent(struct clk_core *core)
 {
 	u8 index = 0;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..f0ea6ac6aa39 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -766,6 +766,17 @@ struct clk *clk_get_parent(struct clk *clk);
  */
 struct clk *clk_get_sys(const char *dev_id, const char *con_id);
 
+/**
+ * clk_get_first_to_set_rate - get a pointer to the clock that will
+ *   effectively modify its rate when clk_set_rate(clk) is called
+ *   (might be clk itself, or any ancestor)
+ * @clk: clock source
+ *
+ * Returns struct clk corresponding to the matched clock source, or
+ * NULL on error.
+ */
+struct clk *clk_get_first_to_set_rate(struct clk *clk);
+
 /**
  * clk_save_context - save clock context for poweroff
  *
@@ -928,6 +939,11 @@ static inline struct clk *clk_get_parent(struct clk *clk)
 	return NULL;
 }
 
+static inline struct clk *clk_get_first_to_set_rate(struct clk *clk)
+{
+	return NULL;
+}
+
 static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
 {
 	return NULL;
-- 
2.30.1

