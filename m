Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA43D32FF58
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 08:05:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCGHE5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 02:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbhCGHEb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 02:04:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBB7C06174A;
        Sat,  6 Mar 2021 23:04:30 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 124-20020a1c00820000b029010b871409cfso1849723wma.4;
        Sat, 06 Mar 2021 23:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=AmB7IwiFXx0W13v8S9Z2zbPBM7+n887S+jm3NBBFN2lfZiaLPdECQRuUviS2w7wFOB
         lfnxNHM7crl+YYuytYu9kMdbYXk+/1hAfwuN0dyE6tDZxNf9qe+LvS6m8eSKMcF4aDlr
         WmlDmxGP9I/W75pwwP7GrLXpQAnA9YspWj1wYS9NKw/+TX0UCG/ypkjpoqEZtwAEu1PG
         m0voZoS6zB0Pm/VsKV07sIur4MOdVFTL3tNxttVZed2zdPgHHI1IVSvUa7bxDOSZNdU3
         GEr1sQfciYwpDA40lmawQ/Izsv57GkFB7jAQiz5bc/VVT0YB84/usK3zxDTRXtkuEccY
         DqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=L3fIQEcbcZaCDkyOzXKp2/P0FK2H+9B2M5Byaw1N9NhOY6uZL87OOoy3bJCht/ZYGY
         A+gTLd5jefQqzrkSRlstbRUgRnEanGQ4UlQ6iU5vvMDMjCyuZuM7B1CfT2+lGZrANwSP
         YX0kZtMIyril6PiByleQFxtQuz60pC08zHpJcPYjM0Taaix7qgGoO2Q7pxXQf/6FQT4h
         XtrcUNIL/UF/d+3FaDgTMhQRAsfsm089eKPDLxqeESIklhmeBDdMqQ8gSvziYEUiD97M
         EyOnU7+OJERr+cL8SaJTJNDY5/NFaWLqkmP9aQfPz4Lik63P+jr6K8eidlbuYPckrSN0
         7BAQ==
X-Gm-Message-State: AOAM530odZviaD7cGqgXZfEccaerc6yZ/cFhcJI1spwfud4sC9ID9SbH
        G52UYhHIVSCWzQqoctnjcRA=
X-Google-Smtp-Source: ABdhPJyfKAoQsPOxQOdi2EBax2XgOCjp2YAIO/dGDM9G4jHSQUDuK5/fBT+8oLKopuFZb1bbS/3wAQ==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr16866001wmh.9.1615100669632;
        Sat, 06 Mar 2021 23:04:29 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id j9sm12162533wmi.24.2021.03.06.23.04.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Mar 2021 23:04:29 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v10 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Sun,  7 Mar 2021 08:04:21 +0100
Message-Id: <20210307070426.15933-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
References: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
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

