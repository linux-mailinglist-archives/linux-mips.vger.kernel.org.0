Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9694831DB25
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 15:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbhBQOIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 09:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbhBQOIh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 09:08:37 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74398C061756;
        Wed, 17 Feb 2021 06:07:57 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id u14so17552453wri.3;
        Wed, 17 Feb 2021 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=bfsR1UQ45DzRedXqdyErOY5l0kz93w2Om3KYDWLA+7hBAm/BvtApSCCbfGZ4eoZldl
         WFDgH7hRLCKNP6151f9xPeNJez59q6Q+z85IKHd0B9qMfHdfSqaod1tz98mjr+9z4Xw0
         TS7FElk8cO4xH0LCgqK0PuMJN7pk2/ICSwQlppVwNwFhgArAxoXqCNOfVl9RKlfAp00Y
         o8j/eit7ZTVjIv41d9cyhyaSkXOB1DcnsOpBZQxIs69t8fpKG2GAa/HO/pE2SPYEOlkH
         lacBrg9Z/6o/MBXYDXeTgnulwupPiJDehdNywlKUdRKGBGny3AoficIJKScXAYQaXFYk
         6GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=QY6KGKvGPh3p3xe1choWWWTwJWJitEOCZSpY/4oYi0wU0m3Iy2vVfn3WTWMF0oe8NT
         umivMDzJX53v725Mnvrr9lospEz85g7CrObYlrqgCj1zHBL1gmbJdcO1a9xzw6h/6jzT
         v5P3ewPgpeEREb4lkFLL59SBs+u4ygECTDzxXkt6mBT/e4mIJCUQvsJNrasRU9HsjYdr
         vENtkQHyqd2XfAFuwMhgMpuoQ1S+Hg0ecQzX+9JczZsQQR91m85rKQy4uqx/B9uq/R8W
         SQ345VUjpEEpFmU2YiWAxmWKsFaZLE5wiMtKHNbFJvIv2NSXxV3KeslxJO/cb93ciP42
         5jWQ==
X-Gm-Message-State: AOAM531W+xOiqk+ANTeMiVn8noYavHOiE36IKDl8xfOgLrBYdz/YBmPY
        ZhyrJvZwAZs4CKSuozEm0c8=
X-Google-Smtp-Source: ABdhPJzwskY/ZkRW4COY9lxOj5u8fY89zN0jlfjNItUZsDJ/5luMINpSfC3CAv/4kVgSJrtl3m3j7Q==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr29793510wrw.170.1613570876202;
        Wed, 17 Feb 2021 06:07:56 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id n66sm3274099wmn.25.2021.02.17.06.07.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 06:07:55 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Wed, 17 Feb 2021 15:07:47 +0100
Message-Id: <20210217140752.15712-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
References: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
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

