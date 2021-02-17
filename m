Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E31131D896
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 12:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhBQLnJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 06:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbhBQLkw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 06:40:52 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06455C061756;
        Wed, 17 Feb 2021 03:40:06 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v1so17035137wrd.6;
        Wed, 17 Feb 2021 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=DT5YyN1MOvKp2WuAgEYIlR4ajbLPAmzH8CueHGYC6nk8Xn8oz+MgtOH9LJI/Ptgo+a
         iv0wBtsjV/NINYVMTY0I2UZ6KaFbgb/kkpWwg50vfmNUbG0VXUAxpIDqwmGsf7uTT9MU
         dzzxwcaYJ8qRByQsqALtL9jP1ZidNrraUtKtDWaGZrBF0nh5Yg/efaebvZX8FH+3KlS4
         j1myj9gs82TAASf+YCECDYCpDjJhGsW9pu/TG9Uavm3dFEf1li6DNkjcGMiJPxYC/MEO
         fllzQFRsvy/3DjMnkvBgAaT876WxFRjk196510alcNpJV59Z690xDGW6id7tb72US0Oh
         FqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=HhMutll4R9YiHaHWVV/4jKHAQjJahdOkL+O0lvIAgerNqKWnlyMnML1JFPPIu4Qk/J
         OIUmRRW0qlUQYVqXn7I02f73c0QsHPDDj0dvSME63tSxntbL6+FZKgXH69C0ONpzUTF4
         6vFSHwBBFBY6KceGJQPU0yDUrp2dsRB1FYFzpZNBwpxQv8bV04t7vhOReT2x0EOoEDDc
         /MB5FuXrhbKghSdXAztywOpm9JkNsUZg6kmEBFbtUqyHfEtrmmIBiNE851Jg7T6TmGiU
         wTLGy1tOFaLlv6cV7WrcOAlDQ7EBCquDQrTZb9Vt1+TWAF888tGmUsZwhEykZqk0891k
         eGTw==
X-Gm-Message-State: AOAM530wXBftYs4/Xs53q7m3zKpNvf1wRIUYSI3MAMJQlKa2sLHGiXUK
        L2+Bvojt+53KZFf8ubjBOkI=
X-Google-Smtp-Source: ABdhPJzduoPzl6qqnC0sKdwQMRl++JTO9gIqK1bXITzDft6XpAaJ5pRosTgHGQ+BZ2EeLgp5iZol+A==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr28901840wro.330.1613562004775;
        Wed, 17 Feb 2021 03:40:04 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id q140sm3600813wme.0.2021.02.17.03.40.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 03:40:04 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        neil@brown.name, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Wed, 17 Feb 2021 12:39:55 +0100
Message-Id: <20210217114000.19571-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
References: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
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

