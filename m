Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656F5271800
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 23:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgITVDw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 17:03:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:40662 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgITVDw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Sep 2020 17:03:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 26149AD04;
        Sun, 20 Sep 2020 21:04:26 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: alchemy: remove unused ALCHEMY_GPIOINT_AU1000
Date:   Sun, 20 Sep 2020 23:03:47 +0200
Message-Id: <20200920210348.114999-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200920210348.114999-1-tsbogend@alpha.franken.de>
References: <20200920210348.114999-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unused config option ALCHEMY_GPIOINT_AU1000.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/alchemy/Kconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/alchemy/Kconfig b/arch/mips/alchemy/Kconfig
index 827256bbe6b8..69734120ada1 100644
--- a/arch/mips/alchemy/Kconfig
+++ b/arch/mips/alchemy/Kconfig
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-# au1000-style gpio and interrupt controllers
-config ALCHEMY_GPIOINT_AU1000
-	bool
-
 choice
 	prompt "Machine type"
 	depends on MIPS_ALCHEMY
@@ -11,7 +7,6 @@ choice
 config MIPS_MTX1
 	bool "4G Systems MTX-1 board"
 	select HAVE_PCI
-	select ALCHEMY_GPIOINT_AU1000
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
 
@@ -29,13 +24,11 @@ config MIPS_DB1XXX
 
 config MIPS_XXS1500
 	bool "MyCable XXS1500 board"
-	select ALCHEMY_GPIOINT_AU1000
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
 
 config MIPS_GPR
 	bool "Trapeze ITS GPR board"
-	select ALCHEMY_GPIOINT_AU1000
 	select HAVE_PCI
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_HAS_EARLY_PRINTK
-- 
2.16.4

