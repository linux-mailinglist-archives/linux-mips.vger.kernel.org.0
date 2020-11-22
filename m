Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78DF62BC4E1
	for <lists+linux-mips@lfdr.de>; Sun, 22 Nov 2020 10:56:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgKVJ4E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Nov 2020 04:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727318AbgKVJ4B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Nov 2020 04:56:01 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F37AC0613D2;
        Sun, 22 Nov 2020 01:56:01 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id m6so15427653wrg.7;
        Sun, 22 Nov 2020 01:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=jBT0H1Dp2FdOl9/WZ1YWZ+a17R3h28nmfNH/n3MTXgBZvp0B0tFBVLrSX1eel3fws7
         zczlkEU8MXE3OlLatadk4ioBE2wyEB8xDJuj8AVal3kayTkAnFQnYB9f3jwp+COyd6N8
         PCVwR3PayXHMNyY/KZf5lkplIy2q3LQZxjQgRn2JE3ROeoTyc4yRuHDG5iyQavFoZAyx
         CM6aEhZf6GvySbBfVeqGxijjM/KP7ugxV7qF799TjmM0hrXZKuu5jr578iXyR430Smgw
         5adXJq28o3cBGvHc7sMflHk0dzLxBNPuK+4w5d+6yrgtpbVJNiAWWJLAJWMNcBchi+KZ
         6YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=q8HBvBTNT69UAsy/YMP+AsQNaC6lur2lU0reOnp2x6rUR7Ib9DtTOxVzKp0M8wumDB
         2CZjQcA/jdI6ki7A+LVDt4S4VMj5J+qjBnvA6YGPKBgG+C95Dv5KZzTYjIvbsMjm4UVP
         /BeO+zheVfl5bYs4jrvutCeaIqIJ1SltGPh6bmMF3u6N2Erqus+S+kqmBjcrCLVDRG5N
         VVUCvyLOS53cXU6/NUKZOTa0fcv+jbk+4n/pHMz7DsNMjC42jmP+RT4Ghu117qHvDcSJ
         PWMKQgCobYgW0wthNH1S26NNTIuNhOj+wqBax8ioiZqVXC04uoK8liqP5FXTQnJCeiH6
         iOoQ==
X-Gm-Message-State: AOAM530ZaY/G8KHahUrSozeWWRDhu5Du2oqJwD1xkDnv9Idyl6elEYID
        8n+qdq3CIGrirtVnGJOwcPdUcp/HIXITqSqU
X-Google-Smtp-Source: ABdhPJwRL/xcxAwX7RQbo8ROZ7c59q0dn7A87ObIujR0wFzdpeevrwvC6al2Y2KMHD3wzntxlKexSw==
X-Received: by 2002:adf:f083:: with SMTP id n3mr25048052wro.391.1606038960179;
        Sun, 22 Nov 2020 01:56:00 -0800 (PST)
Received: from localhost.localdomain (196.red-83-40-48.dynamicip.rima-tde.net. [83.40.48.196])
        by smtp.gmail.com with ESMTPSA id p21sm10593570wma.41.2020.11.22.01.55.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:55:59 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
        gch981213@gmail.com, hackpascal@gmail.com,
        linux-clk@vger.kernel.org, evicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Sun, 22 Nov 2020 10:55:51 +0100
Message-Id: <20201122095556.21597-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
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

