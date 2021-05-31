Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A12A395B8C
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 15:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhEaNVo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 09:21:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:55014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231823AbhEaNUD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 09:20:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 234386135D;
        Mon, 31 May 2021 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622467101;
        bh=2DKgRIUx3bq4bj2n7TveWOz0TPwQ1RJ+G6bHpOUG4Y0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UldYwMDCEXgBfzPCNJpwLovVefGRYpGncnKVWEwJOEXoOXGYuC+RL2Wnm3Ukhzc//
         MndCNoybVjc1Y6SGWW7QBb/WcEN9iABFwJnuY6qVSjCk/l0mSIWdnddTASfYMIhy4q
         F2BKaxf83vjvmk5LmrwAY5o/7WI1mwZbHuVMh+H8=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@iguana.be>,
        John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.4 51/54] MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
Date:   Mon, 31 May 2021 15:14:17 +0200
Message-Id: <20210531130636.666522100@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531130635.070310929@linuxfoundation.org>
References: <20210531130635.070310929@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit fef532ea0cd871afab7d9a7b6e9da99ac2c24371 ]

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
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/ralink/of.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -10,6 +10,7 @@
 
 #include <linux/io.h>
 #include <linux/clk.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
@@ -27,6 +28,7 @@
 
 __iomem void *rt_sysc_membase;
 __iomem void *rt_memc_membase;
+EXPORT_SYMBOL_GPL(rt_sysc_membase);
 
 __iomem void *plat_of_remap_node(const char *node)
 {


