Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48489DD7F5
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2019 12:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfJSKJd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Oct 2019 06:09:33 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25479 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfJSKJd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Oct 2019 06:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571479750; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=iTJ3tdXJZ2HEufP6/YRiFO/R4UNGpwrRKs+oHfjSw2byLmdBp3G0MXizehavx83rHK9a4XaV17phyouLWJG8zSWSGif7dJ3CSV/0OIvWvk9yZ7cZdOhDIQjkO2lrRPC3ul1XDNqg+nFzO25lsmsgIbknBfWnBdkKpsEzDCC1FJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1571479750; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=sH4pFGkuzyCP+VL37dW8fs+vDrXjNK/N8LMxlk9kxLI=; 
        b=jOV0rBWr04Kq7w4ZYGnGwQxHxmnVbGS1Z4ywRdXVKyukfmT4oDfuTAx4yStwXvSHwi0qpVoIXKn2pFsBpEY79naOjAT+ITnoiqdWZWTai/HgFyEBit6NUoJEFY6uBjWmCg8E3P/WuPnr44v2iNdtvGz2OXebokpD6IbUJ+rdQwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=hGtE8YvJvSmxaMjG2K225MvwLGtr3nb4pDt6kZChOh16ngD+YaCdkZnUjrI3NIaRpPsmy1H2HiIj
    cKK9YwSGA7tY+zq/r+dAZD6qRiaq2VP+os9Yi86YVHplgxNPX6JZ  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571479750;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2381; bh=sH4pFGkuzyCP+VL37dW8fs+vDrXjNK/N8LMxlk9kxLI=;
        b=asjqVi4L945jgVVyy6TDpHyhoSBfdbkBiCn6ItUKqFWJZnsM7ttGcWcbnH4NFfEF
        Ygg3/Oy/3u/df08ccfGKDFzbJ2PsRv3+p9UMcpZaKBXSKAurIf5bn/hR8MwCVC7N2VI
        uxGl/mMNQU2MTeGDRUy0BnXmH44SSPavF+D8B+H0=
Received: from localhost.localdomain (171.221.113.199 [171.221.113.199]) by mx.zohomail.com
        with SMTPS id 1571479748838122.43536088288272; Sat, 19 Oct 2019 03:09:08 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, mturquette@baylibre.com, paul@crapouillou.net
Subject: [PATCH 1/2] dt-bindings: clock: Add X1000 bindings.
Date:   Sat, 19 Oct 2019 01:50:05 +0800
Message-Id: <1571421006-12771-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
 include/dt-bindings/clock/x1000-cgu.h              | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/clock/x1000-cgu.h

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
index ba5a442..75598e6 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
@@ -11,6 +11,7 @@ Required properties:
   * ingenic,jz4725b-cgu
   * ingenic,jz4770-cgu
   * ingenic,jz4780-cgu
+  * ingenic,x1000-cgu
 - reg : The address & length of the CGU registers.
 - clocks : List of phandle & clock specifiers for clocks external to the CGU.
   Two such external clocks should be specified - first the external crystal
diff --git a/include/dt-bindings/clock/x1000-cgu.h b/include/dt-bindings/clock/x1000-cgu.h
new file mode 100644
index 00000000..f0a1496
--- /dev/null
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,x1000-cgu DT binding.
+ *
+ * They are roughly ordered as:
+ *   - external clocks
+ *   - PLLs
+ *   - muxes/dividers in the order they appear in the x1000 programmers manual
+ *   - gates in order of their bit in the CLKGR* registers
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_X1000_CGU_H__
+#define __DT_BINDINGS_CLOCK_X1000_CGU_H__
+
+#define X1000_CLK_EXCLK		0
+#define X1000_CLK_RTCLK		1
+#define X1000_CLK_APLL		2
+#define X1000_CLK_MPLL		3
+#define X1000_CLK_SCLKA		4
+#define X1000_CLK_CPUMUX	5
+#define X1000_CLK_CPU		6
+#define X1000_CLK_L2CACHE	7
+#define X1000_CLK_AHB0		8
+#define X1000_CLK_AHB2PMUX	9
+#define X1000_CLK_AHB2		10
+#define X1000_CLK_PCLK		11
+#define X1000_CLK_DDR		12
+#define X1000_CLK_MAC		13
+#define X1000_CLK_MSCMUX	14
+#define X1000_CLK_MSC0		15
+#define X1000_CLK_MSC1		16
+#define X1000_CLK_SSIPLL	17
+#define X1000_CLK_SSIMUX	18
+#define X1000_CLK_SFC		19
+#define X1000_CLK_UART0		20
+#define X1000_CLK_UART1		21
+#define X1000_CLK_UART2		22
+#define X1000_CLK_SSI		23
+#define X1000_CLK_PDMA		24
+
+#endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
-- 
2.7.4


