Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55E42AF681
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgKKQaY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgKKQaT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:19 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB1EC0613D1;
        Wed, 11 Nov 2020 08:30:19 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p22so2803520wmg.3;
        Wed, 11 Nov 2020 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4Z4TGbujRr8lzA8mvSLe6pQfLuePfjA32xx1R5acwU=;
        b=TcGg7wZoHU3Mz7quoPpRmbrozU3kYjLYJ9tPVBCl/RJUKI9kZhR9/kL7Xau+5B1y6b
         FVEpa5PoQDOh55hABpqUCE0WVEcSCv1+dZzvYoRkYb5CcndMpJPrC4m2xzkwvOwsKPUV
         mhROj2Hwe3soJU5/lTiaqisvqXuH8zFaWZa+Ni17Ag80cg3iV9+fG0ZbFgYTcQvNC3DF
         TFJILtlF/AsyBSNeQQsAt7OWYsYWGXHUUEOwEG/TkvBrynPMq04C80f+D2Iwui/BhlTN
         2Bjq/xk91LCSHEcrA+JY2v9kfVD1sdpOSGAKvACFdRJuRz6MyPK3hhNrrT4LExn9aK3W
         BO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4Z4TGbujRr8lzA8mvSLe6pQfLuePfjA32xx1R5acwU=;
        b=sFVAaVtmca4VvvkDj9X4C8ePEEYSeD9mjP/xOVeL3T5RToTOBzAy7wxppD/foPDsKy
         BvOJZavDP6ebwrOFKLIr1/6qmsl7LWqMaLkwhilDes6pljSdlctNbPG5+4X7LRaUP9Uy
         bDH0FPD6h0VS3PHeh4W1zhKMEuzzGTKb+gBeU8bM95SohlgkJn4cXOs/h/V18SS1vme3
         /YzuQUmU62VvROopsFY0/EnwAT4ImEvkzC55aXhxe+NvaN8xvN9YPwJ+Ivt0KmQibTvW
         9hRuIeenUkkNFcbAVfPQ/33oRb6Y/dxtbK96+hBlh+e2DDfdU0+neEsxBk0jB9DNdK62
         M20w==
X-Gm-Message-State: AOAM531P6yoW+lapEHWlTaypnoVPmKBFtsTrb5OdMWFpKQGcTyNjViFp
        iEpkZ1ajVeo2Ra7UmIfhe0A=
X-Google-Smtp-Source: ABdhPJxYUhF2Px9RpGRLF5QdVMttBLrphbFvtCG8DbH3ut8bbRrCWzIayYGZZ9Qpq35eFuVtX2Vn4w==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr4962941wme.22.1605112217753;
        Wed, 11 Nov 2020 08:30:17 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:17 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 1/7] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Wed, 11 Nov 2020 17:30:07 +0100
Message-Id: <20201111163013.29412-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds dt binding header for 'mediatek,mt7621-pll' PLL controller
and for 'mediatek,mt7621-clk' clock gates.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 include/dt-bindings/clock/mt7621-clk.h | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

diff --git a/include/dt-bindings/clock/mt7621-clk.h b/include/dt-bindings/clock/mt7621-clk.h
new file mode 100644
index 000000000000..8fccfa514185
--- /dev/null
+++ b/include/dt-bindings/clock/mt7621-clk.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT7621_H
+#define _DT_BINDINGS_CLK_MT7621_H
+
+/* SYS CLOCKS */
+#define MT7621_CLK_CPU		0
+#define MT7621_CLK_AHB		1
+#define MT7621_CLK_APB		2
+#define MT7621_CLK_MAX		3
+
+/* CLOCK GATES */
+#define MT7621_CLK_HSDMA	0
+#define MT7621_CLK_FE		1
+#define MT7621_CLK_SP_DIVTX	2
+#define MT7621_CLK_TIMER	3
+#define MT7621_CLK_INT		4
+#define MT7621_CLK_MC		5
+#define MT7621_CLK_PCM		6
+#define MT7621_CLK_PIO		7
+#define MT7621_CLK_GDMA		8
+#define MT7621_CLK_NAND		9
+#define MT7621_CLK_I2C		10
+#define MT7621_CLK_I2S		11
+#define MT7621_CLK_SPI		12
+#define MT7621_CLK_UART1	13
+#define MT7621_CLK_UART2	14
+#define MT7621_CLK_UART3	15
+#define MT7621_CLK_ETH		16
+#define MT7621_CLK_PCIE0	17
+#define MT7621_CLK_PCIE1	18
+#define MT7621_CLK_PCIE2	19
+#define MT7621_CLK_CRYPTO	20
+#define MT7621_CLK_SHXC		21
+
+#endif /* _DT_BINDINGS_CLK_MT7621_H */
-- 
2.25.1

