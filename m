Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1416B4D3CDD
	for <lists+linux-mips@lfdr.de>; Wed,  9 Mar 2022 23:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbiCIWYR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Mar 2022 17:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbiCIWYR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Mar 2022 17:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DD326A072
        for <linux-mips@vger.kernel.org>; Wed,  9 Mar 2022 14:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646864596;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
        b=hkfonK07hSmiABCUkk4gzYRDNh8y1UEcWphWshxGKxvP3B0BpdG5k/+liXiMj4sGTEIgRb
        fuJgmzaNYdd2FeqEURCH59aqyhaX7Kvdlcd7bzEkccr81xb3TDJgyTAk5ERtID+89ZiYN9
        ea7i6V5XBlpXi5xjUimC5zhrmOsXiSM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-Gnts6AVbP_yLEtt8IOc6GA-1; Wed, 09 Mar 2022 17:23:14 -0500
X-MC-Unique: Gnts6AVbP_yLEtt8IOc6GA-1
Received: by mail-ot1-f69.google.com with SMTP id o17-20020a9d5c11000000b005b24a70c275so2583280otk.10
        for <linux-mips@vger.kernel.org>; Wed, 09 Mar 2022 14:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
        b=Zo+NArjzWmKCvyjnmphSH8xokiqRR8jeQD77yY5fyS4fci0LnDSgvnFoN181pEAGvB
         Owrsb4PYtx4W+sAzrKv4xs2yO9HzjHdQFxI2ATqQe0Bk0uoagdPAEshi/dv0vsoSzAqX
         n7wCP3sg2UZecNofDqRb/YT5sFlUu58wdNgT5+hqgHkO3uaQ31a+9a7hRROLrBLrzbzN
         XcsyBJQurwg0rbGBeO2gtzwtRYELSDpOqKHC+3yzErrjABp0pF9/edPY/ZgYKahC+n5P
         nG+bkqKEVJ8TTwxTvTZ/radiglBlWGY+j+20SMxp4ypKPUiaz7+oG5Urf/fPoaWSs3xF
         cRBA==
X-Gm-Message-State: AOAM533sOHKT/Jo9I2R8YhKxHmHFN2V1mxk+sT4j/4JIfv9ZghjzgJx9
        Mry/JzJx6laWi09kw2JaDH0gfN9cnsWbvhP2En20lXig4t/Uc63WUTMGrrqv3b+qOpBBnPXEcI3
        nYqYvUnvU/JNHwXhqDSQyCA==
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id y2-20020a056870458200b000da0b3f3221mr1019129oao.209.1646864591953;
        Wed, 09 Mar 2022 14:23:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6yYPMYox15vablq5HrgmBlUFo96cy1+xfMCp1uiwN8WKVvpaQrgY1X2l8RSy/eS72PRmQVw==
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id y2-20020a056870458200b000da0b3f3221mr1019105oao.209.1646864591691;
        Wed, 09 Mar 2022 14:23:11 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id k13-20020a056830150d00b005af8c9f399esm1533712otp.50.2022.03.09.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:23:11 -0800 (PST)
From:   trix@redhat.com
To:     robh+dt@kernel.org, krzk+dt@kernel.org, paulburton@kernel.org,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] dt-bindings: clk: cleanup comments
Date:   Wed,  9 Mar 2022 14:23:02 -0800
Message-Id: <20220309222302.1114561-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tom Rix <trix@redhat.com>

For spdx, first line /* */ for *.h, change tab to space

Replacements
devider to divider
Comunications to Communications
periphrals to peripherals
supportted to supported
wich to which
Documentatoin to Documentation

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/dt-bindings/clock/alphascale,asm9260.h    | 2 +-
 include/dt-bindings/clock/axis,artpec6-clkctrl.h  | 2 +-
 include/dt-bindings/clock/boston-clock.h          | 3 +--
 include/dt-bindings/clock/marvell,mmp2.h          | 4 ++--
 include/dt-bindings/clock/marvell,pxa168.h        | 4 ++--
 include/dt-bindings/clock/marvell,pxa910.h        | 4 ++--
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 2 +-
 include/dt-bindings/clock/stm32fx-clock.h         | 4 ++--
 include/dt-bindings/clock/stratix10-clock.h       | 2 +-
 9 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/dt-bindings/clock/alphascale,asm9260.h b/include/dt-bindings/clock/alphascale,asm9260.h
index d3871c63308be..f53f8b16883d6 100644
--- a/include/dt-bindings/clock/alphascale,asm9260.h
+++ b/include/dt-bindings/clock/alphascale,asm9260.h
@@ -55,7 +55,7 @@
 #define CLKID_AHB_I2S1		45
 #define CLKID_AHB_MAC1		46
 
-/* devider */
+/* divider */
 #define CLKID_SYS_CPU		47
 #define CLKID_SYS_AHB		48
 #define CLKID_SYS_I2S0M		49
diff --git a/include/dt-bindings/clock/axis,artpec6-clkctrl.h b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
index b1f4971642e6f..14e424a7c08c2 100644
--- a/include/dt-bindings/clock/axis,artpec6-clkctrl.h
+++ b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
@@ -2,7 +2,7 @@
 /*
  * ARTPEC-6 clock controller indexes
  *
- * Copyright 2016 Axis Comunications AB.
+ * Copyright 2016 Axis Communications AB.
  */
 
 #ifndef DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
diff --git a/include/dt-bindings/clock/boston-clock.h b/include/dt-bindings/clock/boston-clock.h
index a6f0098211378..38140fa87b09d 100644
--- a/include/dt-bindings/clock/boston-clock.h
+++ b/include/dt-bindings/clock/boston-clock.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2016 Imagination Technologies
- *
- * SPDX-License-Identifier:	GPL-2.0
  */
 
 #ifndef __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
diff --git a/include/dt-bindings/clock/marvell,mmp2.h b/include/dt-bindings/clock/marvell,mmp2.h
index 87f5ad5df72f4..f0819d66b2306 100644
--- a/include/dt-bindings/clock/marvell,mmp2.h
+++ b/include/dt-bindings/clock/marvell,mmp2.h
@@ -32,7 +32,7 @@
 #define MMP2_CLK_I2S0			31
 #define MMP2_CLK_I2S1			32
 
-/* apb periphrals */
+/* apb peripherals */
 #define MMP2_CLK_TWSI0			60
 #define MMP2_CLK_TWSI1			61
 #define MMP2_CLK_TWSI2			62
@@ -60,7 +60,7 @@
 #define MMP3_CLK_THERMAL2		84
 #define MMP3_CLK_THERMAL3		85
 
-/* axi periphrals */
+/* axi peripherals */
 #define MMP2_CLK_SDH0			101
 #define MMP2_CLK_SDH1			102
 #define MMP2_CLK_SDH2			103
diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index caf90436b8483..db2b41f1b1272 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -23,7 +23,7 @@
 #define PXA168_CLK_UART_PLL		27
 #define PXA168_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA168_CLK_TWSI0		60
 #define PXA168_CLK_TWSI1		61
 #define PXA168_CLK_TWSI2		62
@@ -45,7 +45,7 @@
 #define PXA168_CLK_SSP4			78
 #define PXA168_CLK_TIMER		79
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA168_CLK_DFC			100
 #define PXA168_CLK_SDH0			101
 #define PXA168_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/marvell,pxa910.h b/include/dt-bindings/clock/marvell,pxa910.h
index 7bf46238946eb..c9018ab354d06 100644
--- a/include/dt-bindings/clock/marvell,pxa910.h
+++ b/include/dt-bindings/clock/marvell,pxa910.h
@@ -23,7 +23,7 @@
 #define PXA910_CLK_UART_PLL		27
 #define PXA910_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA910_CLK_TWSI0		60
 #define PXA910_CLK_TWSI1		61
 #define PXA910_CLK_TWSI2		62
@@ -43,7 +43,7 @@
 #define PXA910_CLK_TIMER0		76
 #define PXA910_CLK_TIMER1		77
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA910_CLK_DFC			100
 #define PXA910_CLK_SDH0			101
 #define PXA910_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
index f21522605b94b..3e0a9b68933df 100644
--- a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Nuvoton NPCM7xx Clock Generator binding
- * clock binding number for all clocks supportted by nuvoton,npcm7xx-clk
+ * clock binding number for all clocks supported by nuvoton,npcm7xx-clk
  *
  * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
  *
diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index 1cc89c548578b..e5dad050d518a 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -7,10 +7,10 @@
  */
 
 /*
- * List of clocks wich are not derived from system clock (SYSCLOCK)
+ * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentatoin/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
diff --git a/include/dt-bindings/clock/stratix10-clock.h b/include/dt-bindings/clock/stratix10-clock.h
index 08b98e20b7cc7..636498f9e08ee 100644
--- a/include/dt-bindings/clock/stratix10-clock.h
+++ b/include/dt-bindings/clock/stratix10-clock.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier:	GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3

