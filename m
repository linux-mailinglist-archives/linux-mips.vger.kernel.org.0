Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7611A3D46CF
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbhGXIzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:55:00 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:48011 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbhGXIy4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:56 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3154039|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00625938-0.00019483-0.993546;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047194;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:26 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 08/11] dt-bindings: clock: Add JZ4775 clock bindings.
Date:   Sat, 24 Jul 2021 17:34:43 +0800
Message-Id: <1627119286-125821-9-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the JZ4775 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.
    
    v5->v6:
    No change.
    
    v6->v7:
    Change to dual license.

 include/dt-bindings/clock/jz4775-cgu.h | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 include/dt-bindings/clock/jz4775-cgu.h

diff --git a/include/dt-bindings/clock/jz4775-cgu.h b/include/dt-bindings/clock/jz4775-cgu.h
new file mode 100644
index 00000000..4625418
--- /dev/null
+++ b/include/dt-bindings/clock/jz4775-cgu.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * This header provides clock numbers for the ingenic,jz4775-cgu DT binding.
+ *
+ * They are roughly ordered as:
+ *   - external clocks
+ *   - PLLs
+ *   - muxes/dividers in the order they appear in the jz4775 programmers manual
+ *   - gates in order of their bit in the CLKGR* registers
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
+#define __DT_BINDINGS_CLOCK_JZ4775_CGU_H__
+
+#define JZ4775_CLK_EXCLK		0
+#define JZ4775_CLK_RTCLK		1
+#define JZ4775_CLK_APLL			2
+#define JZ4775_CLK_MPLL			3
+#define JZ4775_CLK_OTGPHY		4
+#define JZ4775_CLK_SCLKA		5
+#define JZ4775_CLK_UHC			6
+#define JZ4775_CLK_UHCPHY		7
+#define JZ4775_CLK_CPUMUX		8
+#define JZ4775_CLK_CPU			9
+#define JZ4775_CLK_L2CACHE		10
+#define JZ4775_CLK_AHB0			11
+#define JZ4775_CLK_AHB2PMUX		12
+#define JZ4775_CLK_AHB2			13
+#define JZ4775_CLK_PCLK			14
+#define JZ4775_CLK_DDR			15
+#define JZ4775_CLK_VPU			16
+#define JZ4775_CLK_OTG			17
+#define JZ4775_CLK_EXCLK_DIV2	18
+#define JZ4775_CLK_I2S			19
+#define JZ4775_CLK_LCD			20
+#define JZ4775_CLK_MSCMUX		21
+#define JZ4775_CLK_MSC0			22
+#define JZ4775_CLK_MSC1			23
+#define JZ4775_CLK_MSC2			24
+#define JZ4775_CLK_SSI			25
+#define JZ4775_CLK_CIM0			26
+#define JZ4775_CLK_CIM1			27
+#define JZ4775_CLK_PCM			28
+#define JZ4775_CLK_BCH			29
+#define JZ4775_CLK_EXCLK_DIV512	30
+#define JZ4775_CLK_RTC			31
+#define JZ4775_CLK_NEMC			32
+#define JZ4775_CLK_I2C0			33
+#define JZ4775_CLK_I2C1			34
+#define JZ4775_CLK_I2C2			35
+#define JZ4775_CLK_SADC			36
+#define JZ4775_CLK_UART0		37
+#define JZ4775_CLK_UART1		38
+#define JZ4775_CLK_UART2		39
+#define JZ4775_CLK_UART3		40
+#define JZ4775_CLK_PDMA			41
+#define JZ4775_CLK_MAC			42
+
+#endif /* __DT_BINDINGS_CLOCK_JZ4775_CGU_H__ */
-- 
2.7.4

