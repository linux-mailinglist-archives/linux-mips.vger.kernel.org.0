Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 256E826910A
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 18:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgINQFw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 12:05:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:37346 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgINQFH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Sep 2020 12:05:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 82DDEABB2;
        Mon, 14 Sep 2020 16:05:19 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <florian@openwrt.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: SNI: Fix MIPS_L1_CACHE_SHIFT
Date:   Mon, 14 Sep 2020 18:05:00 +0200
Message-Id: <20200914160500.21356-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 930beb5ac09a ("MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>") forgot
to select the correct MIPS_L1_CACHE_SHIFT for SNI RM. This breaks non
coherent DMA because of a wrong allocation alignment.

Fixes: 930beb5ac09a ("MIPS: introduce MIPS_L1_CACHE_SHIFT_<N>")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484c..8f328298f8cc 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -877,6 +877,7 @@ config SNI_RM
 	select I8253
 	select I8259
 	select ISA
+	select MIPS_L1_CACHE_SHIFT_6
 	select SWAP_IO_SPACE if CPU_BIG_ENDIAN
 	select SYS_HAS_CPU_R4X00
 	select SYS_HAS_CPU_R5000
-- 
2.16.4

