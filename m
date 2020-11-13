Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438FF2B1EFF
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 16:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgKMPqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 10:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKMPqn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 10:46:43 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41096C0613D1;
        Fri, 13 Nov 2020 07:46:42 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id j7so10410128wrp.3;
        Fri, 13 Nov 2020 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H75jGjzD/BZomDbFJbk8FfNvVtCaaCciMBYbMeB6+AM=;
        b=pIEp+e4qRW1bcXHLhMC4WLZxWBYDzi1kXNOvn6LdQANLChDlwkQ/LTmhDKJXlgQRzd
         maD18WBmu/megHU3egk9hRL/axFexdQgcVlX9rOqth+iM/PEEu1SYoRpkl5/Xb2gv+hc
         BlTgT44yyD3QFBG6YoYzXWJ7uO37ERgeDgyEdIlyZIgQZBrxGMNgKrjm9iQ+En/q59Fe
         v8VoDIuxQDQtW+69o7zoNjaLKR5bRAEQnGbBg8jIuQqhBmRNJ0VRwwWXTMQ8nGNblMmm
         CwtsljYHlmQ4BRTmfL/ZCXwfFPn5HQ2IxuWQh3biJ4HLqjLn07NW0vuX1MQHpV+FSuXw
         xTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H75jGjzD/BZomDbFJbk8FfNvVtCaaCciMBYbMeB6+AM=;
        b=dDXBdAVrxSqjNh6nLcv03zs29iDChRo5MNIVuwsw6aQeaoc47yNJdzXYJHSCkelrvA
         XcwBopHZydw9uv85RxhJSoB/l06yyHALb+N5K8VnHiwiE8Fz6B0b4xhmYTd/joSfm6nt
         e2W0jd5oaBdccOROqAJo4SJQIMKzmDe9+XkisuHWhMEQvKmjXXPUelwJPf5jCkTJLZcS
         Xp8VGegd6zNSJR+QSmkhdgfucRN2X7LoQehOJvpyOvFZpFjldsuCVdmEJuUWnvkjY//P
         hV2gAHY7Tp30YPE1Q4kvGmC/ONUbSWxx/m/KzEjRdFPW7TnVi7f0RuYmSl4GBRjBo9TT
         ciMQ==
X-Gm-Message-State: AOAM532x/J5b9pqg44OuSV2SBXmfyM6hb3q3jFVfXA95CF8wMT5eKc7G
        VHypCYh8yr3s5EPLmBNmF28=
X-Google-Smtp-Source: ABdhPJz9kQiQQSKrVzFJVkJxDPfqcOwqABAvoja70EZ0kYZC/N8ZzSpXc+26M8unJdnQ8Af9+F5Ryw==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr4529777wre.55.1605282396077;
        Fri, 13 Nov 2020 07:46:36 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id n15sm11727978wrq.48.2020.11.13.07.46.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:46:35 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v3 1/5] dt-bindings: clock: add dt binding header for mt7621 clocks
Date:   Fri, 13 Nov 2020 16:46:28 +0100
Message-Id: <20201113154632.24973-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
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

