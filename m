Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FA611F85E
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 16:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfLOPWI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 10:22:08 -0500
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:60816 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfLOPWI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 10:22:08 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4300325|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0376297-0.00652272-0.955848;DS=CONTINUE|ham_regular_dialog|0.0056039-0.000437744-0.993958;FP=17206493567010576562|3|2|10|0|-1|-1|-1;HT=e02c03304;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GHej-BA_1576423303;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHej-BA_1576423303)
          by smtp.aliyun-inc.com(10.147.42.22);
          Sun, 15 Dec 2019 23:21:53 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v4 3/4] dt-bindings: clock: Add X1830 bindings.
Date:   Sun, 15 Dec 2019 23:21:36 +0800
Message-Id: <1576423297-12710-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576423297-12710-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576423297-12710-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the X1830 Soc from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v1->v2:
    Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
    to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
    the old mailbox is in an unstable state.
    
    v2->v3:
    Adjust order from [3/5] in v2 to [4/5] in v3.
    
    v3->v4:
    Adjust order from [4/5] in v3 to [3/4] in v4.

 .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
 include/dt-bindings/clock/x1830-cgu.h              | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 include/dt-bindings/clock/x1830-cgu.h

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
index 75598e6..74bfc57 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
@@ -12,6 +12,7 @@ Required properties:
   * ingenic,jz4770-cgu
   * ingenic,jz4780-cgu
   * ingenic,x1000-cgu
+  * ingenic,x1830-cgu
 - reg : The address & length of the CGU registers.
 - clocks : List of phandle & clock specifiers for clocks external to the CGU.
   Two such external clocks should be specified - first the external crystal
diff --git a/include/dt-bindings/clock/x1830-cgu.h b/include/dt-bindings/clock/x1830-cgu.h
new file mode 100644
index 00000000..6499170
--- /dev/null
+++ b/include/dt-bindings/clock/x1830-cgu.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,x1830-cgu DT binding.
+ *
+ * They are roughly ordered as:
+ *   - external clocks
+ *   - PLLs
+ *   - muxes/dividers in the order they appear in the x1830 programmers manual
+ *   - gates in order of their bit in the CLKGR* registers
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_X1830_CGU_H__
+#define __DT_BINDINGS_CLOCK_X1830_CGU_H__
+
+#define X1830_CLK_EXCLK		0
+#define X1830_CLK_RTCLK		1
+#define X1830_CLK_APLL		2
+#define X1830_CLK_MPLL		3
+#define X1830_CLK_EPLL		4
+#define X1830_CLK_VPLL		5
+#define X1830_CLK_SCLKA		6
+#define X1830_CLK_CPUMUX	7
+#define X1830_CLK_CPU		8
+#define X1830_CLK_L2CACHE	9
+#define X1830_CLK_AHB0		10
+#define X1830_CLK_AHB2PMUX	11
+#define X1830_CLK_AHB2		12
+#define X1830_CLK_PCLK		13
+#define X1830_CLK_DDR		14
+#define X1830_CLK_MAC		15
+#define X1830_CLK_MSCMUX	16
+#define X1830_CLK_MSC0		17
+#define X1830_CLK_MSC1		18
+#define X1830_CLK_SSIPLL	19
+#define X1830_CLK_SSIMUX	20
+#define X1830_CLK_SSI0		21
+#define X1830_CLK_SMB0		22
+#define X1830_CLK_SMB1		23
+#define X1830_CLK_SMB2		24
+#define X1830_CLK_UART0		25
+#define X1830_CLK_UART1		26
+#define X1830_CLK_SSI1		27
+#define X1830_CLK_SFC		28
+#define X1830_CLK_PDMA		29
+
+#endif /* __DT_BINDINGS_CLOCK_X1830_CGU_H__ */
-- 
2.7.4

