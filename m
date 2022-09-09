Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13675B2DFA
	for <lists+linux-mips@lfdr.de>; Fri,  9 Sep 2022 07:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIIFLw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Sep 2022 01:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiIIFLv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Sep 2022 01:11:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE41CEB3C
        for <linux-mips@vger.kernel.org>; Thu,  8 Sep 2022 22:11:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso427003wmq.1
        for <linux-mips@vger.kernel.org>; Thu, 08 Sep 2022 22:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bnhl0Q1+XYxPjs75yjJdAmg4WY07uhIM66gNg9Xd2YM=;
        b=VzX/l2iICjAzqyxFNNpZqotdtnEJ/8oi8+cLmDFmOaEfmbWP29u/1fMfK+foxM/Lot
         L4KrJ7tbUnC4j+emqt86jg6FU4Qm8XoR9CO5peNS228pYHWuzU7bbgOB2/qAKA0uHKlI
         qDx833yko6910zGl3oMgRfM9DeXGL3IUtKAXsXDIOIePld3VFf5Zk3ayvBJk2m8db1Ta
         FANao6cGqbBoSTtH4d0LJ7E2xFmtPoTLo1mAx8sShuS7tWCQwD5fNbS0OO+x3m6yjYWE
         qYEJWmWZVtwozVK/4v2SL3TbyoauG6T8j2xM/8Nr0qbdpT/dGU+aYwE5RTFw/qHg2JKC
         Rgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bnhl0Q1+XYxPjs75yjJdAmg4WY07uhIM66gNg9Xd2YM=;
        b=nZ23u5l8n9ZTHr6LJ7oWiuvhtYh9T5rgmmCaiv+Sgbo7UhGIXFTI+EvB6jDmJaRiNH
         K0yt3LKgLkc3DUnrpchTvSGXXbZwSJ0qhs3xcgLtIIfM0Cur4Sl0RZhyj1hpgKxlD9tb
         Y7ekehzABS4ukHgrYvSYB+Xn6kT6x6qX1NSFx4Iovhe3VbaA35cQlHfJUb2M7Rac9AiN
         pdWz84bBkEaInF8tZ/xXfecOE3ISt+aOB+H3wqy7Pnvj7nx23VeHy3DtJoiPa7y7Eoya
         WfUdOM13sVx/0EzWK0n7KXCePvIW7Y+LaiYTyvFh8X/3Npr0fujeJkAYmBSo/yTU5n9s
         a/wQ==
X-Gm-Message-State: ACgBeo1LayALJSq6RLPSgsRezg9xjsFVcY9QoEivZ0rEX6MrlET7uAhB
        Q7O3xayJyp+ZlmIuDPr3+HDEd9VdVMA0Dg==
X-Google-Smtp-Source: AA6agR5S+Yar9OjOb1s65oardSXrc78QwA3sS+0yDCXUgGpZ/gm/XNJdb/o6ByRZfZ1wg8Ujr7P/XA==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id h8-20020a05600c414800b003a54f94577bmr4256788wmm.167.1662700309099;
        Thu, 08 Sep 2022 22:11:49 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b003a845fa1edfsm12198749wms.3.2022.09.08.22.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 22:11:48 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, john@phrozen.org, arinc.unal@arinc9.com
Subject: [PATCH] mips: ralink: mt7621: add gnubee device trees into the kernel
Date:   Fri,  9 Sep 2022 07:11:47 +0200
Message-Id: <20220909051147.1948425-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Device tree blobs for ralink mt7621 SoCs depends on configuration
CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
builtin into the kernel in order to be able to properly boot the
Gnubee boards. Hence, we need to define specific DTB config options
to know which device tree must be compiled and embeeded into the
kernel for every single board to allow the generated kernel to boot
properly.

Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/Makefile |  6 ++----
 arch/mips/ralink/Kconfig           | 11 ++++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
index 11732b8c8163..b0552bfa555a 100644
--- a/arch/mips/boot/dts/ralink/Makefile
+++ b/arch/mips/boot/dts/ralink/Makefile
@@ -5,9 +5,7 @@ dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
 dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
 dtb-$(CONFIG_DTB_OMEGA2P)	+= omega2p.dtb
 dtb-$(CONFIG_DTB_VOCORE2)	+= vocore2.dtb
-
-dtb-$(CONFIG_SOC_MT7621) += \
-	mt7621-gnubee-gb-pc1.dtb \
-	mt7621-gnubee-gb-pc2.dtb
+dtb-$(CONFIG_DTB_GNUBEE1)	+= mt7621-gnubee-gb-pc1.dtb
+dtb-$(CONFIG_DTB_GNUBEE2)	+= mt7621-gnubee-gb-pc2.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index f9fe15630abb..cf2f5cccd2b3 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -62,7 +62,6 @@ endchoice
 
 choice
 	prompt "Devicetree selection"
-	depends on !SOC_MT7621
 	default DTB_RT_NONE
 	help
 	  Select the devicetree.
@@ -100,6 +99,16 @@ choice
 		depends on SOC_MT7620
 		select BUILTIN_DTB
 
+	config DTB_GNUBEE1
+		bool "GnuBee1 2.5inch NAS"
+		depends on SOC_MT7621
+		select BUILTIN_DTB
+
+	config DTB_GNUBEE2
+		bool "GnuBee2 3.5inch NAS"
+		depends on SOC_MT7621
+		select BUILTIN_DTB
+
 endchoice
 
 endif
-- 
2.25.1

