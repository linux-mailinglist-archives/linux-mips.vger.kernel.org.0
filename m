Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238CA1F81DD
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jun 2020 10:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgFMIWQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Jun 2020 04:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgFMIVv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 13 Jun 2020 04:21:51 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5BFC08C5C2;
        Sat, 13 Jun 2020 01:21:50 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id d128so10025979wmc.1;
        Sat, 13 Jun 2020 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eFELRKlgi51zXRTgZvULoamMhty3QhBmoZ29VwRZiTs=;
        b=KfZDBbAZFKRdgc3DrMOy5US+r/xs5xOcPlRZNDrPt3zst6Mz8gOiU6Rut8NHj85onA
         MhwJdL9h4kaK6wIiNxsDrBXEIxJobpdH8i0xKrlybi43dAz8fu6DXeNzkyAGMCdIX8kg
         4getyyN3+eTxA/1b2U2w5ArrVJckk0CcKk4Tx6icB4vaIteEUFh6kPkWlKJiREpEX7Zs
         zBnZHt17GbW2UvRzUYzPYmXQfmxcenyVnp4i4lyQvRw8Z8WKuGT4FTXY4c0ErPZ+vnhn
         Wah7oGPjejzz6ULSk1yZ0faFlXyUySt5BxuMuO3GqSUv+IR9aBh5C3mVhOd3bQ2DZQ8o
         Iviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eFELRKlgi51zXRTgZvULoamMhty3QhBmoZ29VwRZiTs=;
        b=Bsi5CIC4ZIru8vCfKZX6/a97ffToo8/jerJ849UygFYMFNOq2YBvAp/c4EuUQUZQQ0
         Uyb6ClL8p2N6wsdM3fBK87cOlvcW87boX4TYiBb3SDRJZxIIWsx5zIFKLejoHSy6/5oq
         XlPvcbl7l2TRMgabJULqDUSq9R5qHUelYz/P1kr7j/rCGE8pysVgKr8HghQqTrZvzUyg
         vPfAZsjuQnXpLycIUNrJ4eIYvBO6a4dKD77jeHHtOvfH+WS7iRdmrf/aM4XSZGy2JnXu
         HgQ5vjSpIZg7TqFNPyy9gjdxQ1uVRi2F3F49teNQG/4j9/HbPYtR+LjKZ/+KMgAXRzN7
         nIIg==
X-Gm-Message-State: AOAM533douPPHqpS9A9aUZVP7Qt2eFpNooIjfppHqe0LlLKOzYJMEcbY
        +NoVpyXWlDadUJrDr7gP3eI=
X-Google-Smtp-Source: ABdhPJz9nU/D/VRRxp4n9kuI1XmXf+ipBXnCNKdlvJCgjqyVUG/Xb4Et2dJ3dt+soSRKl9cIvdRJdw==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr2901906wmb.69.1592036509020;
        Sat, 13 Jun 2020 01:21:49 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id n189sm12243603wmb.43.2020.06.13.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 01:21:48 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 5/9] mips: bmips: add BCM6318 power domain definitions
Date:   Sat, 13 Jun 2020 10:21:36 +0200
Message-Id: <20200613082140.2009461-6-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200613082140.2009461-1-noltari@gmail.com>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318 SoCs have a power domain controller to enable/disable certain
components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: no changes.
 v3: no changes (patch reordered).
 v2: Add BCM6318 dt-bindings header file.

 include/dt-bindings/soc/bcm6318-pm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/soc/bcm6318-pm.h

diff --git a/include/dt-bindings/soc/bcm6318-pm.h b/include/dt-bindings/soc/bcm6318-pm.h
new file mode 100644
index 000000000000..05931dce8333
--- /dev/null
+++ b/include/dt-bindings/soc/bcm6318-pm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_BMIPS_BCM6318_PM_H
+#define __DT_BINDINGS_BMIPS_BCM6318_PM_H
+
+#define BCM6318_POWER_DOMAIN_PCIE	0
+#define BCM6318_POWER_DOMAIN_USB	1
+#define BCM6318_POWER_DOMAIN_EPHY0	2
+#define BCM6318_POWER_DOMAIN_EPHY1	3
+#define BCM6318_POWER_DOMAIN_EPHY2	4
+#define BCM6318_POWER_DOMAIN_EPHY3	5
+#define BCM6318_POWER_DOMAIN_LDO2P5	6
+#define BCM6318_POWER_DOMAIN_LDO2P9	7
+#define BCM6318_POWER_DOMAIN_SW1P0	8
+#define BCM6318_POWER_DOMAIN_PAD	9
+
+#endif /* __DT_BINDINGS_BMIPS_BCM6318_PM_H */
-- 
2.27.0

