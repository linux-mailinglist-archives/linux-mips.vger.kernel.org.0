Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC939FA80
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 17:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhFHP0x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 11:26:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232377AbhFHP0V (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Jun 2021 11:26:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0515661375;
        Tue,  8 Jun 2021 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623165868;
        bh=4Os6CR4tEQ00n/+2ln1euX1FtJH9pwevnbQbOo/vINM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QBybnYoZUFQmFgdTBQZ1+Xj2jOEoeDuMQSl5ErbezuCF1LzuDqZO0PbEF/4M1rycD
         BnXfKG3sGlXrEeKExw7ybE817h6Hch48h5wFmiMqXoJELfJggBxT4NPmVPLk8InU7F
         giN8bYjg0tevnICTD3eS1EfquCEUNjOptagPmROl7e+q7SFWLZVvlRIFZH8M2hn2rD
         6VqlatJ8u1sQkN0vJC6YOY8RwtSBSU8PZVAITEEhO7RTc0iwKErXCPiGx1XwpyTQod
         nqG6aIx5azCAAZJcwXyPO2280eDax4ssABxH/rv9gxlMdT24bqokdBwq/61ftFNII+
         JbuX3PK+NlwSQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] clkdev: remove unused clkdev_alloc() interfaces
Date:   Tue,  8 Jun 2021 17:22:14 +0200
Message-Id: <20210608152214.1231666-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210608152214.1231666-1-arnd@kernel.org>
References: <20210608152214.1231666-1-arnd@kernel.org>
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

