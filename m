Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711FC2DF4D0
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 10:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgLTJiY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 04:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbgLTJiP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 04:38:15 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7815C0617B0;
        Sun, 20 Dec 2020 01:37:29 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r7so7641770wrc.5;
        Sun, 20 Dec 2020 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=VfMBy8EPG6RvxCBAgnCZOkK2qcvr5RE7DBjohJgy11br2mAxsIyJaVtF3e1UMn3r4s
         QjPqLqDXX/d3ESZBlGAS97d/GkwTOEkXKIQfe8m7FXPKn3cALGdrGNN6lw4avRWS90h6
         NNuEbKfJdPgbxBQ+9s053yhsFTvXwOxNVRoBXLvPyS9XP7o7Nk3mEciO1LfcMFmWJv/D
         k9QjGKqKNS/nVoij9Y65hyU3FvU9EhIumqkMTSzfZbCJhpgdJEiqi/fy9BKJoRS5Csv7
         pyQh1hnBUX7UxfNxw5I+JeMnNmQEvj4Bun933Wg0S78FoU+VppwwBr1zPfk8r1YuBwHv
         5jNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=TkAhODnZUzVyNeFxdN4WZDdsanKkJpHJhr/7qru2wgMu4+t3wdNwwtuYOHPsxz54rM
         7MWk+qNYac8x8q4igJjcp6DwP7mpgHAUeCNEKbKHTLF/QZ7622Uz4NW3enY21BnSozwe
         NwCaNOGUn2wL1C+1sI0QHv6noWXCQwosJzQ3vA/7lL4Mv2HS3ZDZyJmdY+jYJpVjPzpU
         s4isKQSbRfifw2brR7TsxqB76sdXSE+sKUyaJQvejxOP3AaXOXnVcxRbB0xOieJg+2cL
         cWtUQRs9UMs6pbtxlb9zKXziQYoD6HxaDpvKofGuHvkOw4J0Nr2WhMRCsIRs8Qhfl0Zd
         XGDA==
X-Gm-Message-State: AOAM532lyucnkyMKAADsjVvzmuYRzxM8kwbdiXH42L3j+loPirml/xZl
        pXkQPFJcrSQBja9+YLOiTmf8+d/TNQ5e3w==
X-Google-Smtp-Source: ABdhPJxo7whrIhIY3LnX3OTkJw2kWi+TmCCzk4Nvbg8t4Sfv7m6plhdXmqv2bz9TMXL6snvzGyiYAg==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr12848401wrw.139.1608457048501;
        Sun, 20 Dec 2020 01:37:28 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id o8sm21288819wrm.17.2020.12.20.01.37.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Dec 2020 01:37:27 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Sun, 20 Dec 2020 10:37:19 +0100
Message-Id: <20201220093724.4906-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
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

