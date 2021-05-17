Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CAF382266
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 02:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhEQAzi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 May 2021 20:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhEQAzi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 May 2021 20:55:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A30C061573;
        Sun, 16 May 2021 17:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=4LsPAbMJd+IqOKQv3+Gf63mGt6dOG7rzjzIjevXmu6I=; b=GjyCS/ML7yyMOTL6pct57ceADl
        GsFzQhlU54ewVFxjYO63Ud6vL3KsaaoJJxuVzAFSSfiGKGqEV2QRq+XHP4/d6ysprtBpwdKITslGl
        hfhvBCWJLc5ekfRMwG4XC9uKyTEfTIx/jm0EzY+sDZgmc+2AV5EU5rmIZgRvkAu3vF9kUc5U/VYnw
        GhcsHsXN2Gumt+Y+nzTiizvYYh7mAfjMPLk3w6U2NqbeA+dLEHgvRrqRJgeaX279P0XyM+LV2WDtX
        vq7Zknlh7OgwqwgSOe8YnBMeqbOmRsHvjYRZLjhA34NYXkA2puxNgkAJeyoiK+Ga0oneYoJjKreAs
        GMO1CcWA==;
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liRWV-00DOYA-9o; Mon, 17 May 2021 00:54:19 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@iguana.be>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH] MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
Date:   Sun, 16 May 2021 17:54:17 -0700
Message-Id: <20210517005417.18338-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

rt2880_wdt.c uses (well, attempts to use) rt_sysc_membase. However,
when this watchdog driver is built as a loadable module, there is a
build error since the rt_sysc_membase symbol is not exported.
Export it to quell the build error.

ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!

Fixes: 473cf939ff34 ("watchdog: add ralink watchdog driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@iguana.be>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
---
or make the Kconfig symbol RALINK_WDT bool instead of tristate?

 arch/mips/ralink/of.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20210514.orig/arch/mips/ralink/of.c
+++ linux-next-20210514/arch/mips/ralink/of.c
@@ -8,6 +8,7 @@
 
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
@@ -25,6 +26,7 @@
 
 __iomem void *rt_sysc_membase;
 __iomem void *rt_memc_membase;
+EXPORT_SYMBOL_GPL(rt_sysc_membase);
 
 __iomem void *plat_of_remap_node(const char *node)
 {
