Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C31363475
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 11:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhDRJfs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Apr 2021 05:35:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229807AbhDRJfq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 18 Apr 2021 05:35:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72B8A600CD;
        Sun, 18 Apr 2021 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618738518;
        bh=qv8wADW+muFr8WpYAfX+6bIu6e6NMZO1CVAeLWGp2J8=;
        h=From:To:Cc:Subject:Date:From;
        b=uioPKfg8WrHZs19RNadLHdYiJVqzZFlm7kZIEotkqOfR54BYo7KC/CsWkmtLM4oi4
         5liTWPkf/i/gtWfIElEL7t31Q3LvhV/kFaTda/EFL7nRuSA+v7wF1qqtx/vOxKkI2N
         86wrvz8Pc7UTb0tJyrtC1IvCs38fl3uhVEBAyzCCKKSLgSdkUWDgFAosRRhYCo4vpy
         g87eGvn7J4E2RG5P1hiV7+ooLCcELPvRCH8qZdQpPSx/6+FnuMwcnIF1/m0z5vwX/i
         iGyfF1n9YrGgzMTQ21WonMlFtpQGqrtcgx/l6GZkVOCBAVYRAfblK46hFb5zXAEEC5
         /z/8p8kzfc1eQ==
From:   Mike Rapoport <rppt@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [RFT PATCH] MIPS: Octeon: drop dependency on CONFIG_HOLES_IN_ZONE
Date:   Sun, 18 Apr 2021 12:35:12 +0300
Message-Id: <20210418093512.668-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

CAVIUM_OCTEON_SOC configuration selects HOLES_IN_ZONE option to cope with
memory crashes that were happening in 2011.

This option effectively aliases pfn_valid_within() to pfn_valid() when
enabled and hardwires it to 1 when disabled. The check for
pfn_valid_within() is only relevant in case the memory map may have holes
or undefined struct page instances inside MAX_ORDER chunks.

Since 2011 memory management initialization in general and memory map
initialization particularly became much more robust so the check for
pfn_valid_within() is not required on Octeon even despite its, hmm, unusual
memory setup.

Remove the selection of HOLES_IN_ZONE by CAVIUM_OCTEON_SOC and drop the
HOLES_IN_ZONE configuration option entirely as Octeon was the only MIPS
platform to use it.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---

Hi,

I've tried to find why Octeon needed CONFIG_HOLES_IN_ZONE in the first
place, but there is nothing except the changelog in commit 465aaed0030b
("MIPS: Octeon: Select CONFIG_HOLES_IN_ZONE"):

  Current Octeon systems do in fact have holes in their memory zones.
  We need to select HOLES_IN_ZONE. If we do not, some memory configurations
  will result in crashes at boot time

Since then there were too many changes around memory management
initialization both in the generic mm and on the MIPS side to track what
exactly could case the crashes.

I'm pretty confident that HOLES_IN_ZONE is not required for Octeon systems
anymore and can be removed.

I'd really appreciate if somebody with access to an Octeon system could
test this patch.

 arch/mips/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..96b08cd3b442 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -990,7 +990,6 @@ config CAVIUM_OCTEON_SOC
 	select HAVE_PLAT_FW_INIT_CMDLINE
 	select HAVE_PLAT_MEMCPY
 	select ZONE_DMA32
-	select HOLES_IN_ZONE
 	select GPIOLIB
 	select USE_OF
 	select ARCH_SPARSEMEM_ENABLE
@@ -1226,9 +1225,6 @@ config HAVE_PLAT_MEMCPY
 config ISA_DMA_API
 	bool
 
-config HOLES_IN_ZONE
-	bool
-
 config SYS_SUPPORTS_RELOCATABLE
 	bool
 	help
-- 
2.28.0

