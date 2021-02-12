Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E81319AC3
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 08:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhBLHo2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 02:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhBLHoN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 02:44:13 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB75C0613D6;
        Thu, 11 Feb 2021 23:43:33 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z6so6765775wrq.10;
        Thu, 11 Feb 2021 23:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=MK3huTXs0uxPIa/OMVE84EU1u+jNkHIlxmU3tdk8ODeSDUBYkzIPxLQvSmSP7WVPQC
         KRv+ExxAsO9HU4MB//fgGhU4TEIMBYnmEY38fLTicENstDJ9IqVoEokEaP0KhgjH2QOY
         jPEWu7kyFzLAUpzAO1T20skGuJJLh7axQUqsELS26AlmRhJfTNEiaCxu7NqsBU3R4gWT
         +EwSCenq5M+X2zj/NRP+e20nTEiGLOg6hY00aPl0e5o+bja2b1wexUyzUudE2z+WtPXU
         00FXOWrWn0/L1100XuY85EwrSQo8pToBNm+MzZQrgLaVkYYhEFirxMSJqWfmcNAhN1B4
         L5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Ub3gKGJwLJRaryXIKn0038/d6bzjLaWe3sRPb09LY0=;
        b=j740BIi3/+vaPafw1KCZ/irLkx0iL7y1iiWZvZ5w4SLU78Oi0+esnHCOm96TB6yIF9
         WnFbxECBje08zgWeuEcZkR+2FWMyCLiRoTmARwUAs8BhsOKYeD0YvN2TvHmlObYen84Z
         u+SqOLorjelFj9SVD1qx66I1HOr9kexu/D/y8zsuKPPjuHUbnrO0zVPzdGPl5R2bvAQr
         qSNwue3qmid4RI75lmrwa5JyQ3ixZRHTwUxkvxYN/Oke2Ev/s4ly/ZP0zBL/we+ih72B
         I88cLOPXYV3cKiuaWMcE0N0kRLrg7Jd0nowOdZjYLrwMVRne+q1es4nbNuam2YGlPHYh
         eEPg==
X-Gm-Message-State: AOAM533H+CIpeoEMmnNMPA5A7qCk21Yqrvnzeg8NVtYAto0e7DxooPIO
        pSu/6CJzA1fv6EQTg3xMy28=
X-Google-Smtp-Source: ABdhPJwpkcYaVd8HPJLY2Re/cSyjzmo5DQRpKsRMWJddzwplZewGZPHU14Nq8WfaiQvervNBxgfuBQ==
X-Received: by 2002:adf:f009:: with SMTP id j9mr1832933wro.35.1613115812061;
        Thu, 11 Feb 2021 23:43:32 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id a17sm9663858wrx.63.2021.02.11.23.43.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 23:43:31 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v5 1/6] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Fri, 12 Feb 2021 08:43:25 +0100
Message-Id: <20210212074330.4650-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
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

