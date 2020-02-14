Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734CD15ECAF
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 18:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390914AbgBNR3E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 12:29:04 -0500
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:54045 "EHLO
        out28-3.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404361AbgBNR3D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 12:29:03 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.28405|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0386694-0.00507426-0.956256;DS=CONTINUE|ham_regular_dialog|0.0101767-0.000332658-0.989491;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03293;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.Go9djQb_1581701284;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Go9djQb_1581701284)
          by smtp.aliyun-inc.com(10.147.41.231);
          Sat, 15 Feb 2020 01:28:21 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Subject: [PATCH v5 5/6] dt-bindings: clock: Add and reorder ABI for X1000.
Date:   Sat, 15 Feb 2020 01:27:41 +0800
Message-Id: <1581701262-110556-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The SSI clock of X1000 not like JZ4770 and JZ4780, they are not
directly derived from the output of SSIPLL, but from the clock
obtained by dividing the frequency by 2. "X1000_CLK_SSIPLL_DIV2"
is added for this purpose, it must between "X1000_CLK_SSIPLL"
and "X1000_CLK_SSIMUX", otherwise an error will occurs when
initializing the clock. These ABIs are only used for X1000, and
I'm sure that no other devicetree out there is using these ABIs,
so we should be able to reorder them.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.

 include/dt-bindings/clock/x1000-cgu.h | 58 ++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/include/dt-bindings/clock/x1000-cgu.h b/include/dt-bindings/clock/x1000-cgu.h
index bbaebaf..5d6eec5 100644
--- a/include/dt-bindings/clock/x1000-cgu.h
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -12,33 +12,35 @@
 #ifndef __DT_BINDINGS_CLOCK_X1000_CGU_H__
 #define __DT_BINDINGS_CLOCK_X1000_CGU_H__
 
-#define X1000_CLK_EXCLK		0
-#define X1000_CLK_RTCLK		1
-#define X1000_CLK_APLL		2
-#define X1000_CLK_MPLL		3
-#define X1000_CLK_SCLKA		4
-#define X1000_CLK_CPUMUX	5
-#define X1000_CLK_CPU		6
-#define X1000_CLK_L2CACHE	7
-#define X1000_CLK_AHB0		8
-#define X1000_CLK_AHB2PMUX	9
-#define X1000_CLK_AHB2		10
-#define X1000_CLK_PCLK		11
-#define X1000_CLK_DDR		12
-#define X1000_CLK_MAC		13
-#define X1000_CLK_MSCMUX	14
-#define X1000_CLK_MSC0		15
-#define X1000_CLK_MSC1		16
-#define X1000_CLK_SSIPLL	17
-#define X1000_CLK_SSIMUX	18
-#define X1000_CLK_SFC		19
-#define X1000_CLK_I2C0		20
-#define X1000_CLK_I2C1		21
-#define X1000_CLK_I2C2		22
-#define X1000_CLK_UART0		23
-#define X1000_CLK_UART1		24
-#define X1000_CLK_UART2		25
-#define X1000_CLK_SSI		26
-#define X1000_CLK_PDMA		27
+#define X1000_CLK_EXCLK			0
+#define X1000_CLK_RTCLK			1
+#define X1000_CLK_APLL			2
+#define X1000_CLK_MPLL			3
+#define X1000_CLK_SCLKA			4
+#define X1000_CLK_CPUMUX		5
+#define X1000_CLK_CPU			6
+#define X1000_CLK_L2CACHE		7
+#define X1000_CLK_AHB0			8
+#define X1000_CLK_AHB2PMUX		9
+#define X1000_CLK_AHB2			10
+#define X1000_CLK_PCLK			11
+#define X1000_CLK_DDR			12
+#define X1000_CLK_MAC			13
+#define X1000_CLK_MSCMUX		14
+#define X1000_CLK_MSC0			15
+#define X1000_CLK_MSC1			16
+#define X1000_CLK_OTG			17
+#define X1000_CLK_SSIPLL		18
+#define X1000_CLK_SSIPLL_DIV2	19
+#define X1000_CLK_SSIMUX		20
+#define X1000_CLK_SFC			21
+#define X1000_CLK_I2C0			22
+#define X1000_CLK_I2C1			23
+#define X1000_CLK_I2C2			24
+#define X1000_CLK_UART0			25
+#define X1000_CLK_UART1			26
+#define X1000_CLK_UART2			27
+#define X1000_CLK_SSI			28
+#define X1000_CLK_PDMA			29
 
 #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
-- 
2.7.4

