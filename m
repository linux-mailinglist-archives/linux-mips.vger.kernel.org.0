Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCEE39B853
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jun 2021 13:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhFDLyD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Jun 2021 07:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhFDLyC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Jun 2021 07:54:02 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C823C061761;
        Fri,  4 Jun 2021 04:52:03 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso4158268wmc.1;
        Fri, 04 Jun 2021 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3x1+aQZ2JJskWF5Dy3Ro193oUmFpOWT/5QaeAnilmJs=;
        b=ezQlQ+1UE3RkXyn774fhxcZQgFiagmbcb1kiP/RO3qn0q/2Li2cta0HfeiO+dMLvfV
         xtQb4wVgz1IxdA6JdM9UhSq05wzv0y33DnUYC3W6Gz2caZoz4kybJgBGuyLsu9aErG5I
         Ufwyb6r4TiEOFfzBeuQ4fqhR/Fqd5g3DkMgRfQXvRLzVDcfr+lSL6JUNLNYQt/espqNX
         WawWKt726QlPuOHI/rdb6oMXGbSOnEiRzO/TO8/vdVgGxEB+KMNoPRaRcWv6xpbtsRjY
         owxAJbkVQEVwsgKzOTydNeJGzPezOZBoF9OLKNFjKplXX7p6cmViinr/hbVdungg2C07
         KjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3x1+aQZ2JJskWF5Dy3Ro193oUmFpOWT/5QaeAnilmJs=;
        b=dM+0hu/G4odcpG5gXNTjt4nrk8BS0caACI32emJ0vNlqeZiuXo8Y+U5llgYW1PkItW
         hfxBWLPOIWZmjoYhoFPWFyjS5/Q7YNrG1AqOr3nk3dpDpHttZJo72M9/waP/snnHnp7z
         1DAnfvWXbdAMAJBJtvfaGI2HSOhiuY/BB4Ce4PXbx7FVRBn2yIFFgX7QK2QUXz7EV9rz
         EPP04yJZFZoAXGxv7BgNtKyX/vKdf94lADtIOn2uChavMNfNg/TDljZWBLtsX5eEuVqv
         U0daoXq7K4dPa5bQKZ/x/v2jTA+A9el5cmL97izcu1XMRsF87+g6GZSv5REDSfcQyE9t
         fwnA==
X-Gm-Message-State: AOAM531Bg/VAn8YspgyUP9Z/dhjt2NkeBjyQ3GssumnKFG0L+99LMJA6
        un5NsDY87hMo+B1UN0NgMkc=
X-Google-Smtp-Source: ABdhPJyU562UW4voIqISRPpraGqE8lbf5MgTx3dsukUBDg78MJB8MHX7UJSGEDMtF1IASN/MdumqNw==
X-Received: by 2002:a05:600c:2216:: with SMTP id z22mr836221wml.66.1622807522122;
        Fri, 04 Jun 2021 04:52:02 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id v10sm6924530wre.33.2021.06.04.04.52.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jun 2021 04:52:01 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     john@phrozen.org
Cc:     linus.walleij@linaro.org, tsbogend@alpha.franken.de,
        linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, neil@brown.name
Subject: [PATCH 1/6] pinctrl: ralink: move ralink architecture pinmux header into the driver
Date:   Fri,  4 Jun 2021 13:51:54 +0200
Message-Id: <20210604115159.8834-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
References: <20210604115159.8834-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ralink architecture is making use of the header located in
'arch/mips/include/asm/mach-ralink/pinmux.h' to stablish the
mechanisms to make derived SoCs to set its pin functions and
groups. In order to move all architecture pinmux into a more
accurate place which is 'drivers/pinctrl/ralink' we have to
first of all move this file also there with a small modification
which creates 'rt2880_pinmux_init' function to allow SoCs pinctrl
drivers to pass its configuration to the common code located in
'pinctrl-rt2880.c' file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/prom.c                       |  1 -
 drivers/pinctrl/ralink/pinctrl-rt2880.c       | 30 ++++---------------
 .../pinctrl/ralink}/pinmux.h                  |  3 +-
 3 files changed, 7 insertions(+), 27 deletions(-)
 rename {arch/mips/include/asm/mach-ralink => drivers/pinctrl/ralink}/pinmux.h (91%)

diff --git a/arch/mips/ralink/prom.c b/arch/mips/ralink/prom.c
index 25728def3503..aaac1e6ec7d9 100644
--- a/arch/mips/ralink/prom.c
+++ b/arch/mips/ralink/prom.c
@@ -18,7 +18,6 @@
 #include "common.h"
 
 struct ralink_soc_info soc_info;
-struct rt2880_pmx_group *rt2880_pinmux_data = NULL;
 
 enum ralink_soc_type ralink_soc;
 EXPORT_SYMBOL_GPL(ralink_soc);
diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 1f4bca854add..abe31d4d448e 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -17,9 +17,9 @@
 #include <linux/pinctrl/machine.h>
 
 #include <asm/mach-ralink/ralink_regs.h>
-#include <asm/mach-ralink/pinmux.h>
 #include <asm/mach-ralink/mt7620.h>
 
+#include "pinmux.h"
 #include "../core.h"
 #include "../pinctrl-utils.h"
 
@@ -311,13 +311,14 @@ static int rt2880_pinmux_pins(struct rt2880_priv *p)
 	return 0;
 }
 
-static int rt2880_pinmux_probe(struct platform_device *pdev)
+int rt2880_pinmux_init(struct platform_device *pdev,
+		       struct rt2880_pmx_group *data)
 {
 	struct rt2880_priv *p;
 	struct pinctrl_dev *dev;
 	int err;
 
-	if (!rt2880_pinmux_data)
+	if (!data)
 		return -ENOTSUPP;
 
 	/* setup the private data */
@@ -327,7 +328,7 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 
 	p->dev = &pdev->dev;
 	p->desc = &rt2880_pctrl_desc;
-	p->groups = rt2880_pinmux_data;
+	p->groups = data;
 	platform_set_drvdata(pdev, p);
 
 	/* init the device */
@@ -346,24 +347,3 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 
 	return PTR_ERR_OR_ZERO(dev);
 }
-
-static const struct of_device_id rt2880_pinmux_match[] = {
-	{ .compatible = "ralink,rt2880-pinmux" },
-	{},
-};
-MODULE_DEVICE_TABLE(of, rt2880_pinmux_match);
-
-static struct platform_driver rt2880_pinmux_driver = {
-	.probe = rt2880_pinmux_probe,
-	.driver = {
-		.name = "rt2880-pinmux",
-		.of_match_table = rt2880_pinmux_match,
-	},
-};
-
-static int __init rt2880_pinmux_init(void)
-{
-	return platform_driver_register(&rt2880_pinmux_driver);
-}
-
-core_initcall_sync(rt2880_pinmux_init);
diff --git a/arch/mips/include/asm/mach-ralink/pinmux.h b/drivers/pinctrl/ralink/pinmux.h
similarity index 91%
rename from arch/mips/include/asm/mach-ralink/pinmux.h
rename to drivers/pinctrl/ralink/pinmux.h
index 048309348be0..0046abe3bcc7 100644
--- a/arch/mips/include/asm/mach-ralink/pinmux.h
+++ b/drivers/pinctrl/ralink/pinmux.h
@@ -47,6 +47,7 @@ struct rt2880_pmx_group {
 	int func_count;
 };
 
-extern struct rt2880_pmx_group *rt2880_pinmux_data;
+int rt2880_pinmux_init(struct platform_device *pdev,
+		       struct rt2880_pmx_group *data);
 
 #endif
-- 
2.25.1

