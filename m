Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9C5196507
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 11:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgC1K11 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 06:27:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:33862 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbgC1K11 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 28 Mar 2020 06:27:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 5AC13AF0E;
        Sat, 28 Mar 2020 10:27:25 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] MIPS: ralink: mt7621: Fix soc_device introduction
Date:   Sat, 28 Mar 2020 11:27:13 +0100
Message-Id: <20200328102715.8309-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Depending on selected SMP config options soc_device didn't get
initialised at all. With UP config vmlinux didn't link because
of missing soc bus.

Fixes: 71b9b5e0130d ("MIPS: ralink: mt7621: introduce 'soc_device' initialization")
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/ralink/Kconfig  | 1 +
 arch/mips/ralink/mt7621.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 94e9ce994494..35c2ebd8f094 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -52,6 +52,7 @@ choice
 		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
 		select HAVE_PCI if PCI_MT7621
+		select SOC_BUS
 endchoice
 
 choice
diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index 905460aeeb1f..0accb80db709 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -243,12 +243,12 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
 
 	rt2880_pinmux_data = mt7621_pinmux_data;
 
+	soc_dev_init(soc_info, rev);
+
 	if (!register_cps_smp_ops())
 		return;
 	if (!register_cmp_smp_ops())
 		return;
 	if (!register_vsmp_smp_ops())
 		return;
-
-	soc_dev_init(soc_info, rev);
 }
-- 
2.16.4

