Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26029224137
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 19:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgGQRA0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 13:00:26 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:40359 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726938AbgGQRA0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 13:00:26 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1281664|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00566534-0.00266333-0.991671;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.I3U5VZp_1595005212;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.I3U5VZp_1595005212)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sat, 18 Jul 2020 01:00:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, paul@crapouillou.net
Subject: [PATCH v7 3/5] MIPS: Ingenic: Let the Kconfig of platform enable the clocksource driver.
Date:   Sat, 18 Jul 2020 00:59:45 +0800
Message-Id: <20200717165947.56158-4-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
References: <20200717165947.56158-1-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The previous clocksource patch in this series ([2/3]) has remove
"default MACH_INGENIC" and make option silent, so we need to
enable the corresponding driver in the platform's Kconfig.

Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v7:
    New patch.

 arch/mips/jz4740/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 6c065dcaeff8..5ad60998702e 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -36,27 +36,34 @@ endchoice
 config MACH_JZ4740
 	bool
 	select SYS_HAS_CPU_MIPS32_R1
+    select INGENIC_TIMER
 
 config MACH_JZ4770
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+    select INGENIC_TIMER
+    select INGENIC_OST
 
 config MACH_JZ4780
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+    select INGENIC_TIMER
+    select INGENIC_OST
 
 config MACH_X1000
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+    select INGENIC_SYSOST
 
 config MACH_X1830
 	bool
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+    select INGENIC_SYSOST
-- 
2.11.0

