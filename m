Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983DE51EDB
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfFXW6O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:14 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:32948 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfFXW6N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417091; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EXDpRAr6ae6pdfysqa9Ws5+SbU/ykTOQNDRM1bF/k8E=;
        b=mv+/ByF6C16QiakfHuD6x/Q0NCsGmxRQpHp2CcaeP+HtBJeywOjPYoFMBv+jVRJYlYBStd
        r6FLxL9VzMsZAikAiP2ywSz7octOvOVRIcp8uxkLgVIsG0a7Rr1HdlVW88TSPMur3WtUZy
        8eXFi0yJ3qisoNjV9KcE4Ri4dJ8pmSw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 01/13] dt-bindings: ingenic: Add DT bindings for TCU clocks
Date:   Tue, 25 Jun 2019 00:57:47 +0200
Message-Id: <20190624225759.18299-2-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This header provides clock numbers for the ingenic,tcu
DT binding.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---

Notes:
    v2: Use SPDX identifier for the license
    
    v3/v4: No change
    
    v5: s/JZ47*_/TCU_/ and dropped *_CLK_LAST defines
    
    v6-v13: No change

 include/dt-bindings/clock/ingenic,tcu.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/clock/ingenic,tcu.h

diff --git a/include/dt-bindings/clock/ingenic,tcu.h b/include/dt-bindings/clock/ingenic,tcu.h
new file mode 100644
index 000000000000..d569650a7945
--- /dev/null
+++ b/include/dt-bindings/clock/ingenic,tcu.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This header provides clock numbers for the ingenic,tcu DT binding.
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_INGENIC_TCU_H__
+#define __DT_BINDINGS_CLOCK_INGENIC_TCU_H__
+
+#define TCU_CLK_TIMER0	0
+#define TCU_CLK_TIMER1	1
+#define TCU_CLK_TIMER2	2
+#define TCU_CLK_TIMER3	3
+#define TCU_CLK_TIMER4	4
+#define TCU_CLK_TIMER5	5
+#define TCU_CLK_TIMER6	6
+#define TCU_CLK_TIMER7	7
+#define TCU_CLK_WDT	8
+#define TCU_CLK_OST	9
+
+#endif /* __DT_BINDINGS_CLOCK_INGENIC_TCU_H__ */
-- 
2.21.0.593.g511ec345e18

