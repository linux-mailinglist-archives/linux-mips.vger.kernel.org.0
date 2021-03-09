Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6B9331E55
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 06:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhCIFXF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 00:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhCIFWc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 00:22:32 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B900C06174A;
        Mon,  8 Mar 2021 21:22:32 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l11so10418113wrp.7;
        Mon, 08 Mar 2021 21:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=PLyqykK7Dn0OcvqfVk5VE5h1Lk/B8yaynryioSFj0j+uk6FK4V2Foqpj3Irwld1qSg
         tVw+NLHgv49jyDDn86LlvEZCsQJO60Tapywa9q/w0mb3KR8sfbpbMkGAmUzzdotTotXx
         3mI0jb0iexKSVcB4Q05Ldee/ycEkmkodYJAzppvvy3Uau4WmSleRBSepPmo8cOldkjTH
         e2EH21N36PNptGp3jhCp9hBkbwv2Smw3BBM0AQgfxFQ1vYlDdcWb8jL+q0cjBqLdQOMO
         YBpk8OXXeKvnd9xSITXJvAmFQmjH4KGmNgmAcx/8cvRvMh44wlBLgpkVIMTiJyq+4RAI
         FDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=AWZIhgQoev29XvPCnWYfWImvC0tjrHad3XBCzk+TVDZyJtzEjX9nNzB2LtqCAAAbZU
         4CWhl2PCVaqk4hgyZ8Up4NOAAMBgA1Y6HCM4i82vBn58FxtXEjWVWeeot1Wvbo1t9YTC
         HQ/Um4qUmWzarX5rRtSrg/Wi10Vjwj4qTJ8CAH7rYOe2eM5fFwkRufwzZxi6/Dw9Z1Ws
         eSahDUxC0X9HL2KGCIvYNhg/G3PkkOqCglPHokPIAC8rLA/rGH3gxIbXsjzWan2Y9Yq3
         8BfmblxYriQLw/zmzjJQguuqT0sEnARRTCyMFgvdCM3jQX5Vja9MqhriN/h2p5IxcN5P
         Q0Vg==
X-Gm-Message-State: AOAM530ne/LX7Fr6pNJ8xzDkL4WqviqpMTDI8V3g1vRac+oQLEtUwLCe
        pH5LNBIZfQgfeOTSqnm1MtI=
X-Google-Smtp-Source: ABdhPJyJNxoKChHWM4gK53Wgs1fLEE/9kkiXaRIQVh2FzKqcs/vkgQ2cY99FfoFY4H+gT8z6wg3A+Q==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr16302844wrp.148.1615267350970;
        Mon, 08 Mar 2021 21:22:30 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id c11sm23450743wrm.67.2021.03.08.21.22.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 21:22:30 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Tue,  9 Mar 2021 06:22:21 +0100
Message-Id: <20210309052226.29531-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds dt binding header for 'mediatek,mt7621-clk' clocks.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 include/dt-bindings/clock/mt7621-clk.h | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

diff --git a/include/dt-bindings/clock/mt7621-clk.h b/include/dt-bindings/clock/mt7621-clk.h
new file mode 100644
index 000000000000..1422badcf9de
--- /dev/null
+++ b/include/dt-bindings/clock/mt7621-clk.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT7621_H
+#define _DT_BINDINGS_CLK_MT7621_H
+
+#define MT7621_CLK_XTAL		0
+#define MT7621_CLK_CPU		1
+#define MT7621_CLK_BUS		2
+#define MT7621_CLK_50M		3
+#define MT7621_CLK_125M		4
+#define MT7621_CLK_150M		5
+#define MT7621_CLK_250M		6
+#define MT7621_CLK_270M		7
+
+#define MT7621_CLK_HSDMA	8
+#define MT7621_CLK_FE		9
+#define MT7621_CLK_SP_DIVTX	10
+#define MT7621_CLK_TIMER	11
+#define MT7621_CLK_PCM		12
+#define MT7621_CLK_PIO		13
+#define MT7621_CLK_GDMA		14
+#define MT7621_CLK_NAND		15
+#define MT7621_CLK_I2C		16
+#define MT7621_CLK_I2S		17
+#define MT7621_CLK_SPI		18
+#define MT7621_CLK_UART1	19
+#define MT7621_CLK_UART2	20
+#define MT7621_CLK_UART3	21
+#define MT7621_CLK_ETH		22
+#define MT7621_CLK_PCIE0	23
+#define MT7621_CLK_PCIE1	24
+#define MT7621_CLK_PCIE2	25
+#define MT7621_CLK_CRYPTO	26
+#define MT7621_CLK_SHXC		27
+
+#define MT7621_CLK_MAX		28
+
+#endif /* _DT_BINDINGS_CLK_MT7621_H */
-- 
2.25.1

