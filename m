Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA54631CB33
	for <lists+linux-mips@lfdr.de>; Tue, 16 Feb 2021 14:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBPNhJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Feb 2021 08:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhBPNhE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Feb 2021 08:37:04 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A16AC06174A;
        Tue, 16 Feb 2021 05:36:22 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b3so13029475wrj.5;
        Tue, 16 Feb 2021 05:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=sesjORb50GMvDvoSkJLcf7QPM1HrUkK/0b1vu6Pn999cVgoqbf8e5/KSIiYW60FNIG
         PuqrZap8lfh9ib85fH/TFbT0JIS14PTa0Nt2L0XxFhAheHygGoass+1ZBRJ1aQUift2a
         N3wqREMcFF3YJEnoZUmLOfE9lRtlwYgbd+JxfLUsD4Ka6a6XdvkISDGGCtpNMpQRNkcx
         G14pyMh1majLNxO9uCWLWzg1j0j5gityJKWbAg610eXy/wuJT5ZUNbAaR4ZrlmfHAhOa
         EZOU/1aEBNSE7ryv7O0bMrxas8BvvIVvK7zRtLtwvJGbE8AxLC/9lzW9k/BjKME9oLdX
         7MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=ULHLZsAHCgr3kedmC/s5lmxuGKiovXauvCfK4vz8WNXolf+cT8JCdgyt/Wjwz2qSzf
         DaPZLokd5HyKDMkji/h+TuprkMO51Da8u7SMl0xvlLubjsysCmQLOAbtiDD2vAK+mh9z
         aKuCKIUoPXTHpnaYsqOgFhoxGxYwVqKkzjaSSG0GdKfpnG/CWJb5BzdgRW4qwk52Cmds
         Ln42Wfzv5x76o1IKPg/TtAPgMgEpFoKr6hSdwlYyJsjwoRjbmfROIVjbmyEYwG3i3Tl8
         S5hDKwcXxnebudrcybaP1jBykg9nKSPMftzsBYxF0RzcA9tIDUAQHPC+7WuIwYRqJyK6
         IuoA==
X-Gm-Message-State: AOAM532Gtv+h78qZRIEfsHykAF0F5u4pUpq8HCJ2LGxL7QP2rf877WaO
        p1CkRaYEhgi3jeEnbqgyzDU=
X-Google-Smtp-Source: ABdhPJzWPijBYbjHa9q5bZqsUPMJLas6xb5T5yZwRg2HOG+l6D3/tcT97MjWQF6Ultrc/ZcNkLfqsQ==
X-Received: by 2002:adf:e5d1:: with SMTP id a17mr24393774wrn.260.1613482580464;
        Tue, 16 Feb 2021 05:36:20 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id l7sm28032530wrn.11.2021.02.16.05.36.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 05:36:20 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Tue, 16 Feb 2021 14:36:12 +0100
Message-Id: <20210216133617.22333-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
References: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
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

