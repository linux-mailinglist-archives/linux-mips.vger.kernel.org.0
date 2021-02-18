Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB3F31E6CF
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 08:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhBRHQr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 02:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhBRHH5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Feb 2021 02:07:57 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF93AC0613D6;
        Wed, 17 Feb 2021 23:07:14 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id a207so1965317wmd.1;
        Wed, 17 Feb 2021 23:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=CTJiqVUX/SVQVf///f/zCWngeFKO6y6MyE88SNzV3igouS2HKHgFLEPLp6xTxQwea5
         lwMdfNP0ucxV/wHDeimsRT5Eah0DbyyAdaTmvI58i5JhZCW2g6UmzdoU3Dfjb/xf7pey
         FqM2OjF2HchiOVkhxQHySLsySNYc//1ISOrOBCmJLdBsuQaIuDJKp9CayCmu45/Mcx8N
         1v842AOZpO5T6dheLXEMLQPhu4GcGTRpbP5TNSM0z/Jv7jO4KmLThDQ/FhQjEGHTOfAQ
         tAq32//jTJhTZfOk9bcR+fNXdRc25c4LBzLtf6s14j0jCzS8lIz4aJyvKrv4uj/03Ran
         DruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=KQB98/OltgUIE0riTpllI9RZWM5EHsIcYeeTUruMOC1z58nKuLjXoghtbBydlo5ogr
         ArBJSXj8Ii6W7QxBry+J4Op3ahDTY+JClSFdsmRQgkNQoN/tuiPqHB5tB1AaJiu2s7Zw
         vtLnUmX9p1jsiyd5p9JdvWgZH7/JgXhiqR4J5bFuYbyFzNCvYEnA42HgsbI5eBz22tdC
         mV8GgU3v5Cy4LMsjZ+c6lMHieHydpmwksNlmOQ+NC3hH1MXiZ5ddv0p0rw5Yi0U0hewg
         CiD+zmgh094211T4ZPTaMhMAoASFFh6k7epFwGAJxc1A1dSu8A1FessxGbe/FWhKYPtb
         TgKQ==
X-Gm-Message-State: AOAM530nXeYbWmq3R54XvFDLJccKvLP+Sbeis3B+FV3GRmRhkzAk3+Ht
        mPkprtBu0dDfyZ6EEFMxSaA=
X-Google-Smtp-Source: ABdhPJy3yaYVnkGl32nNzN4hWUd+ug/uSReUGq084f57kInFgPxKqQmo5dNOxEvaiDjLj4pU8XCNTQ==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr2218135wmb.59.1613632033642;
        Wed, 17 Feb 2021 23:07:13 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id 4sm6136555wma.0.2021.02.17.23.07.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 23:07:13 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Thu, 18 Feb 2021 08:07:04 +0100
Message-Id: <20210218070709.11932-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
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

