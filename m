Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF792B17D3
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 10:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgKMJKz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 04:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgKMJKw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 04:10:52 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC06C0613D6;
        Fri, 13 Nov 2020 01:10:51 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id s8so8904437wrw.10;
        Fri, 13 Nov 2020 01:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H75jGjzD/BZomDbFJbk8FfNvVtCaaCciMBYbMeB6+AM=;
        b=M5EgVrIV0AtpMQUCMFE8iqlyuYOI2V3oJtEIqtc5v4k6iD5bnd3ooimKCdZXGrpjDd
         8fmSF934NVnpLLz0QfzBf5uEKZgWO4rG7jMaMZ5JtKKiPeJ+mJBgiBuXzRSR/4YK8Sl6
         Uuv5OrDXL138pEJ7BgsQvBcW/7676VnlWEFvdV9pfHQ6BwQ+RUOBOXFlnupkmUr7LOUx
         ZYdHnSa26O0SxZPsh/U7T12FlNKoqMFWahuigVhht+oxM0eIuMGn730LcQ1b0g3umcGp
         IUk1JeSFH87E6PZ9DZ0cS90vV8rkGdkld1QUmIZqWFsuaCpM2TKy+hgtma0yioeQ4qHS
         jwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H75jGjzD/BZomDbFJbk8FfNvVtCaaCciMBYbMeB6+AM=;
        b=nuUPCBeZ23dJWL4GO6/GM1GOsX/owRYP4duYH3JMkS5XrAnyjeuSNYyXUrynkWRGHV
         eUYuwWo23n/J0d/9RLFm5/+BXGI3cz7Q3khtidAiGhK+j/O/C9LgOSRYjH4iAdpiJJxU
         F7qVOiyltfV1+WiX9OLHCzDh7bXERbSRqrPJ/CtyICDQzDmy8pEv3Vx+Xo7rUG3pepGq
         20f2t7Jh3liNqNYlscjjXWFqD/CdnQ9me9nMZ7363MdMWs84dBusruI/8F75Kt31pgZ8
         GEkbeG+fFUUO9szzKAJ4M5IibWRp4IUzmcN7bD4tmZhOTcPV5m+OBNMl34G9uZWAEBUH
         B+0g==
X-Gm-Message-State: AOAM533+gC/8cOBJ/SF66Cqd4b1wjcpOUNSKCLHHvjMjZH39hxcPralK
        rZA+A4GVPxm3xHRTKAQ16FQ=
X-Google-Smtp-Source: ABdhPJxdfCnZLQCbochfqxLFDHosrnI4gSXq/GQfmyTVKbbvgXqIA2GE1NbqqXwhShWwx75pAZhXTg==
X-Received: by 2002:adf:f2d2:: with SMTP id d18mr2249428wrp.302.1605258650682;
        Fri, 13 Nov 2020 01:10:50 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id 15sm9266183wmg.1.2020.11.13.01.10.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 01:10:50 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v2 1/5] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Fri, 13 Nov 2020 10:10:42 +0100
Message-Id: <20201113091046.30964-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
References: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds dt binding header for 'mediatek,mt7621-clk' clocks.

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

