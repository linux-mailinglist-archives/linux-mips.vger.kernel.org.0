Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C2FF6833
	for <lists+linux-mips@lfdr.de>; Sun, 10 Nov 2019 10:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfKJJaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Nov 2019 04:30:07 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25858 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbfKJJaG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 Nov 2019 04:30:06 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573378188; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=gBUt0TxYaZcoox+luk7ZW/WBgQGwbu7oGoftMguoCBZHHCLi5e79jm3FME7hghONtT94SRoMLk4txQjnfYAfL/keE187lQf6XG/wbfBso1HwKAV5zrKfI6b4WqgB4tjDFekfD3EBZFR6o9F/PQZr2dR382IrJTU6qj91oqOwy3o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573378188; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=1IZucym0+cKydncEOHJ6jUf9TYEnE/wwQsC4HazZBIQ=; 
        b=YqqKAg2QMCJj+em43kiF04g+GoHW2pzz0UV0KOug6UaBg/ROYCbjf31aaQbscoLqO0QoVF4dgNCpH81I/9I9HN8jqeinLzjDTCbtY2vJY+Jl1wLetm+aHWy32jB9Fh5Am3O/r918itcBVj9vxnIfcjNFynSlggPUtrprqBfZ39Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=kJlFeLhDMzof0jklHTCb+nsoqqdR30BcpTeK3SyLKyqjp0Ogr4QbYzhBnzEg4/l2zXArF1GmiUb9
    +zLWaYNsu7xdLny1kZ7FBAU3iMcE6MdKVuN1E/4pbaDtC6hx2jr1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573378188;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2465; bh=1IZucym0+cKydncEOHJ6jUf9TYEnE/wwQsC4HazZBIQ=;
        b=NxLklDQ28ad0yK1p96N2ERVETy9zm1uzXBmbXfSo2tDqQCA2EQZ2P114Ad4qQSLt
        +elC0l/0ts+NSez1XSw2r3kgQYrYWt6aL17mEGfgq3gkup7h9QOYSvoKeU2LRXa1yis
        h/T9l6zdOiXBUL3jDaWSlq6bQ1Q6BrgcWmf7oWHs=
Received: from localhost.localdomain (171.221.113.200 [171.221.113.200]) by mx.zohomail.com
        with SMTPS id 15733781872321015.8953450010144; Sun, 10 Nov 2019 01:29:47 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        paul.burton@mips.com, sboyd@kernel.org, robh+dt@kernel.org,
        syq@debian.org, mark.rutland@arm.com, paul@crapouillou.net
Subject: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
Date:   Sun, 10 Nov 2019 17:28:21 +0800
Message-Id: <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the X1000 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
 include/dt-bindings/clock/x1000-cgu.h              | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
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
index 00000000..bbaebaf
--- /dev/null
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -0,0 +1,44 @@
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
+#define X1000_CLK_I2C0		20
+#define X1000_CLK_I2C1		21
+#define X1000_CLK_I2C2		22
+#define X1000_CLK_UART0		23
+#define X1000_CLK_UART1		24
+#define X1000_CLK_UART2		25
+#define X1000_CLK_SSI		26
+#define X1000_CLK_PDMA		27
+
+#endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
-- 
2.7.4


