Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0F11B0321
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 09:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgDTHfN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 03:35:13 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59030 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbgDTHfN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 03:35:13 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 8137120CF0;
        Mon, 20 Apr 2020 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587368112; bh=bDSuF4kuZpYpNlfsiSYtB4XVxy4h2Vp476P6s+KXRFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HW2pgeCqOei8AF7Iy4NgvHPS8XAZbZ0Ei87BFcwHGFDytzJieqLuoGX575ssMDlk+
         m5CYxBAOcqxZK1kVW9KG/stLt78tMqb0oE+kHrK0B9Q5KLZprWEEbA3iMWtdDJiS9X
         Zk0t6KJBtg5WEsCbGUmZEnT5YVnKdNep/w+MhzemZP+sTMmXx6OucaumUblFZWrswz
         //Q8rHXeHMqULxS68ai0itPfz0qkKTBaeiOwHNuhB2gonjLaFQupSLuL3a6xnat2Kr
         OHhbheXb1nIWXFLreDFkViiOYUSo/KWk3oBr4VghpffVsXnt8alQGEYUypnoDsYURR
         JAkDUSsh49vTg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 5/5] MIPS: Loongson64: Mark RS780 HPET as broken
Date:   Mon, 20 Apr 2020 15:33:40 +0800
Message-Id: <20200420073347.157230-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
References: <20200420073347.157230-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver is using some dangerous hack to set MMIO address for HPET,
which might break systems with other kinds of PCH.

Also, as Loongson-3 cpufreq driver never appeared in mainline,
this driver rarely got used.

So we temporarily mark it as broken until we find a better solution.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index c386b8a3c753..16e6acab8cce 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -4,14 +4,12 @@ if MACH_LOONGSON64
 config RS780_HPET
 	bool "RS780/SBX00 HPET Timer"
 	depends on MACH_LOONGSON64
+	depends on BROKEN
 	select MIPS_EXTERNAL_TIMER
 	help
 	  This option enables the hpet timer of AMD RS780/SBX00.
 
-	  If you want to enable the Loongson3 CPUFreq Driver, Please enable
-	  this option at first, otherwise, You will get wrong system time.
-
-	  If unsure, say Yes.
-
+	  Note: This driver is doing some dangerous hack. Please only enable
+	  it on RS780E systems.
 
 endif # MACH_LOONGSON64
-- 
2.26.0.rc2

