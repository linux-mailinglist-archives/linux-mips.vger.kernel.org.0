Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD3110A91C
	for <lists+linux-mips@lfdr.de>; Wed, 27 Nov 2019 04:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfK0De0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 22:34:26 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25805 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfK0De0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 22:34:26 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574825632; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=IA0hdkIK8miRg+J1FPY0GKqX9KiUSKPWJ6ezvAxAxhT115SVkkeQMZvPGkPlpEmxU2k2ZfBiy1ijP5p8bI8GF+JbVfO+dBBZXwx3mqZxFWHb8sUeibuPs2zJ1fdJJ6+4BTvOI5uZDGloOfw2YTw9GIY/4oVZh3ZTvV+H+i3m4BI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574825632; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=RgmfTfKwoYXw8kf5jEJ7b6HWPMYg4f37CM1yKIrzA2g=; 
        b=fTJKYKeRdPmuW6KGzYUqlyeasyUB8m9hbjQFmc8ICJGIeRaErpQtAd/1pxF0hKtEhiZq9s576JgyW5yUIQa2Jh21XU2sPwjkoF1BmleLeWRgysMBfnM+B9FN5vOp+sPePnx9pf2daNNlyM+X9h5HMD0ERvDZ2UBiS1T50uL6ZN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=F9QpSSzPxy2q5NcJxQMrn4mCo/R7KIrlDFnHr58zP6nx0+7gzVJdo1mzlQ2GIe9RVA2tnO+6VE3l
    H5hY955pVW8It7Sr0YpZ6jMsuVt0ROgN6BPo6ur4aH7JcRx24udJ  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574825632;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=RgmfTfKwoYXw8kf5jEJ7b6HWPMYg4f37CM1yKIrzA2g=;
        b=lDeI+uJ34GT2H/XNNumsLzS6MgPRQ+joEJ112rdoW511dx3ZH0UoMO2LEoxECxCp
        dl+wGoQ0IDmo6aI3QX7qOR3DyUuxKG1hf0Ez91C1hUkfcdI09f6eIHmWsN3L8OXQl6h
        ochf7MZ1vviJaD3ZXow8uYhXwhbNEFln8Ejku4fI=
Received: from zhouyanjie-virtual-machine.localdomain (139.207.174.158 [139.207.174.158]) by mx.zohomail.com
        with SMTPS id 1574825630972581.4125167303802; Tue, 26 Nov 2019 19:33:50 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH 2/5] dt-bindings: clock: Add X1830 bindings.
Date:   Wed, 27 Nov 2019 11:32:53 +0800
Message-Id: <1574825576-91028-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the clock bindings for the X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
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


