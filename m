Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A533D46D2
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbhGXIzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:55:00 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:54074 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235183AbhGXIy6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3363862|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0239443-0.000906498-0.975149;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 09/11] dt-bindings: clock: Add X2000 clock bindings.
Date:   Sat, 24 Jul 2021 17:34:44 +0800
Message-Id: <1627119286-125821-10-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the X2000 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.
    
    v5->v6:
    No change.
    
    v6->v7:
    Change to dual license.

 include/dt-bindings/clock/x2000-cgu.h | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 include/dt-bindings/clock/x2000-cgu.h

diff --git a/include/dt-bindings/clock/x2000-cgu.h b/include/dt-bindings/clock/x2000-cgu.h
new file mode 100644
index 00000000..6d6faa2
--- /dev/null
+++ b/include/dt-bindings/clock/x2000-cgu.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * This header provides clock numbers for the ingenic,x2000-cgu DT binding.
+ *
+ * They are roughly ordered as:
+ *   - external clocks
+ *   - PLLs
+ *   - muxes/dividers in the order they appear in the x2000 programmers manual
+ *   - gates in order of their bit in the CLKGR* registers
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_X2000_CGU_H__
+#define __DT_BINDINGS_CLOCK_X2000_CGU_H__
+
+#define X2000_CLK_EXCLK			0
+#define X2000_CLK_RTCLK			1
+#define X2000_CLK_APLL			2
+#define X2000_CLK_MPLL			3
+#define X2000_CLK_EPLL			4
+#define X2000_CLK_OTGPHY		5
+#define X2000_CLK_SCLKA			6
+#define X2000_CLK_I2S0			7
+#define X2000_CLK_I2S1			8
+#define X2000_CLK_I2S2			9
+#define X2000_CLK_I2S3			10
+#define X2000_CLK_CPUMUX		11
+#define X2000_CLK_CPU			12
+#define X2000_CLK_L2CACHE		13
+#define X2000_CLK_AHB0			14
+#define X2000_CLK_AHB2PMUX		15
+#define X2000_CLK_AHB2			16
+#define X2000_CLK_PCLK			17
+#define X2000_CLK_DDR			18
+#define X2000_CLK_ISP			19
+#define X2000_CLK_MACPTP		20
+#define X2000_CLK_MACPHY		21
+#define X2000_CLK_MAC0TX		22
+#define X2000_CLK_MAC1TX		23
+#define X2000_CLK_RSA			24
+#define X2000_CLK_SSIPLL		25
+#define X2000_CLK_LCD			26
+#define X2000_CLK_MSC_EXCLK		27
+#define X2000_CLK_MSC0			28
+#define X2000_CLK_MSC1			29
+#define X2000_CLK_MSC2			30
+#define X2000_CLK_PWM			31
+#define X2000_CLK_SFC			32
+#define X2000_CLK_CIM			33
+#define X2000_CLK_DMIC_EXCLK	34
+#define X2000_CLK_DMIC			35
+#define X2000_CLK_EXCLK_DIV512	36
+#define X2000_CLK_RTC			37
+#define X2000_CLK_EMC			38
+#define X2000_CLK_EFUSE			39
+#define X2000_CLK_OTG			40
+#define X2000_CLK_SCC			41
+#define X2000_CLK_I2C0			42
+#define X2000_CLK_I2C1			43
+#define X2000_CLK_I2C2			44
+#define X2000_CLK_I2C3			45
+#define X2000_CLK_SADC			46
+#define X2000_CLK_UART0			47
+#define X2000_CLK_UART1			48
+#define X2000_CLK_UART2			49
+#define X2000_CLK_DTRNG			50
+#define X2000_CLK_TCU			51
+#define X2000_CLK_SSI0			52
+#define X2000_CLK_OST			53
+#define X2000_CLK_PDMA			54
+#define X2000_CLK_SSI1			55
+#define X2000_CLK_I2C4			56
+#define X2000_CLK_I2C5			57
+#define X2000_CLK_ISP0			58
+#define X2000_CLK_ISP1			59
+#define X2000_CLK_HASH			60
+#define X2000_CLK_UART3			61
+#define X2000_CLK_UART4			62
+#define X2000_CLK_UART5			63
+#define X2000_CLK_UART6			64
+#define X2000_CLK_UART7			65
+#define X2000_CLK_UART8			66
+#define X2000_CLK_UART9			67
+#define X2000_CLK_MAC0			68
+#define X2000_CLK_MAC1			69
+#define X2000_CLK_INTC			70
+#define X2000_CLK_CSI			71
+#define X2000_CLK_DSI			72
+
+#endif /* __DT_BINDINGS_CLOCK_X2000_CGU_H__ */
-- 
2.7.4

