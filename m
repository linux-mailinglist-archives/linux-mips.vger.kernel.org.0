Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA82A39682A
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhEaSvd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:51:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230523AbhEaSv1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 14:51:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DF596135C;
        Mon, 31 May 2021 18:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622486986;
        bh=LuPsBIFhxgd/n8nHsszgAmLqq7folE7IErl+jaDcRN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fcp6c+wZo5wEr710/B2ayV2ajI/zLr+FjkaCm6Mf1S4AqqJWj62k9nfTBcsUjp0KU
         K6IuUxOMbzlfA9/+4DED2VF7ciCjTe2yel6zir9R0NLY2KrkUw9k+cx1iJjYwsXkZH
         uQLxp5m/nADmnU8AnrcbeGKxB8TkgjX3wdJ5ikQdzVxwWnTwSIvfs7TWGlsDMjYkv0
         3S4MKwXHBBpeTKQMsau34FJXuNTh4KpFwpVHZY5EQIoWc9JkOrCraESIeIJSIRBSVg
         xQlc9x4/KOL8BYZjQZco9HJ0pMIC6zCanrFgBs4BQyNX8vJDIf3C8ntY5y0isRpuA5
         lCd768WIJ/Z7w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: [PATCH 7/7] clkdev: remove unused clkdev_alloc() interfaces
Date:   Mon, 31 May 2021 20:47:49 +0200
Message-Id: <20210531184749.2475868-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210531184749.2475868-1-arnd@kernel.org>
References: <20210531184749.2475868-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The last user of clkdev_alloc() and clkdev_hw_alloc() was
removed last year, so everything now calls clkdev_create()
and clkdev_hw_create() instead.

Removing the unused functions lets the compiler optimize
the remaining ones slightly better.

Fixes: e5006671acc7 ("clk: versatile: Drop the legacy IM-PD1 clock code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/clkdev.c   | 28 ----------------------------
 include/linux/clkdev.h |  5 -----
 2 files changed, 33 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 0f2e3fcf0f19..67f601a41023 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -190,34 +190,6 @@ vclkdev_create(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	return cl;
 }
 
-struct clk_lookup * __ref
-clkdev_alloc(struct clk *clk, const char *con_id, const char *dev_fmt, ...)
-{
-	struct clk_lookup *cl;
-	va_list ap;
-
-	va_start(ap, dev_fmt);
-	cl = vclkdev_alloc(__clk_get_hw(clk), con_id, dev_fmt, ap);
-	va_end(ap);
-
-	return cl;
-}
-EXPORT_SYMBOL(clkdev_alloc);
-
-struct clk_lookup *
-clkdev_hw_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt, ...)
-{
-	struct clk_lookup *cl;
-	va_list ap;
-
-	va_start(ap, dev_fmt);
-	cl = vclkdev_alloc(hw, con_id, dev_fmt, ap);
-	va_end(ap);
-
-	return cl;
-}
-EXPORT_SYMBOL(clkdev_hw_alloc);
-
 /**
  * clkdev_create - allocate and add a clkdev lookup structure
  * @clk: struct clk to associate with all clk_lookups
diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
index fd06b2780a22..8a8423eb8e9a 100644
--- a/include/linux/clkdev.h
+++ b/include/linux/clkdev.h
@@ -30,11 +30,6 @@ struct clk_lookup {
 		.clk = c,	\
 	}
 
-struct clk_lookup *clkdev_alloc(struct clk *clk, const char *con_id,
-	const char *dev_fmt, ...) __printf(3, 4);
-struct clk_lookup *clkdev_hw_alloc(struct clk_hw *hw, const char *con_id,
-	const char *dev_fmt, ...) __printf(3, 4);
-
 void clkdev_add(struct clk_lookup *cl);
 void clkdev_drop(struct clk_lookup *cl);
 
-- 
2.29.2

