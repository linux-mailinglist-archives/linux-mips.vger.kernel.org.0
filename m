Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1147B735E41
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jun 2023 22:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjFSUOl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jun 2023 16:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjFSUOk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Jun 2023 16:14:40 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19403E65
        for <linux-mips@vger.kernel.org>; Mon, 19 Jun 2023 13:14:38 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id BLGmqArN7v5uIBLGnqiBUb; Mon, 19 Jun 2023 22:14:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205677; bh=S79Q1AzT3zmNec/Vp638pmXD7E3sQyzBN3nKezHuQE0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=0PUxHHojJmE0m/qfxAFhNlQTJJ0WUa4BvhQmg/HaK6/RLBVyzGcXtrKK6HmZCm4xz
         iS+d1d7xCLVF2fBu4Zl6olKmkzbtFcNqvGZcKlRY+mSfHWLfkFtOkvYwQ1SynHRDnr
         QLsYZFAQgzHALyG38AzP+ERG2ztla/35WFpEGrbpMUMWaAovxjLdZiwLw/C+2jtpst
         ZB7z/1hZ9Ti2gJ09F4eC+dmMvsvUa5YPdPKQMy24UaY9tJUEa7pH/H0YgTjYv7PzTj
         a9lDcGZyesR/j3WhkMPchsRtUo8t8lkQm7+wIayRHEZEQPX1hjOJ3awIQfGrffhM2K
         IK1NL09HBuoWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687205677; bh=S79Q1AzT3zmNec/Vp638pmXD7E3sQyzBN3nKezHuQE0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=0PUxHHojJmE0m/qfxAFhNlQTJJ0WUa4BvhQmg/HaK6/RLBVyzGcXtrKK6HmZCm4xz
         iS+d1d7xCLVF2fBu4Zl6olKmkzbtFcNqvGZcKlRY+mSfHWLfkFtOkvYwQ1SynHRDnr
         QLsYZFAQgzHALyG38AzP+ERG2ztla/35WFpEGrbpMUMWaAovxjLdZiwLw/C+2jtpst
         ZB7z/1hZ9Ti2gJ09F4eC+dmMvsvUa5YPdPKQMy24UaY9tJUEa7pH/H0YgTjYv7PzTj
         a9lDcGZyesR/j3WhkMPchsRtUo8t8lkQm7+wIayRHEZEQPX1hjOJ3awIQfGrffhM2K
         IK1NL09HBuoWw==
Date:   Mon, 19 Jun 2023 22:14:36 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 08/11] usb: dwc3: Move Octeon glue code from arch/mips
Message-ID: <ZJC3LLpUlatnLdnv@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
X-CMAE-Envelope: MS4wfLVNMqCzFDWyvZFUcgMmG/XXz0DNGTs4zXP19WofCqFuPW9ChA2kqx7ZOXqM4tOqxSSfBW6sijhduTAeIxAA4OUxkkItKswf6RNskyInr5VlFnn5z5UN
 RHQ5BYeUECrqQ9BeN3qU49yPBvNXRGXIoVUIC5Hq5iCdn0ZY+/YsjO9zgktZIpOfS9kGZk+qJ1HQqsymAPbM4CAAuNXEoJ03Hj+Y+K4SLU9qEUcp/J+TEHLl
 tFABXKtItGBygSpUcw7B8Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>

Octeon DWC3 glue code now compiles on all platforms, so move
it to drivers/usb/dwc3. No functional changes.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 arch/mips/cavium-octeon/Makefile                         | 1 -
 drivers/usb/dwc3/Kconfig                                 | 9 +++++++++
 drivers/usb/dwc3/Makefile                                | 1 +
 .../octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c       | 0
 4 files changed, 10 insertions(+), 1 deletion(-)
 rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (100%)

diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index 7c02e542959a..2a5926578841 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -18,4 +18,3 @@ obj-y += crypto/
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
-obj-$(CONFIG_USB)		      += octeon-usb.o
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index be954a9abbe0..8fc7b7ff7f16 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -168,4 +168,13 @@ config USB_DWC3_AM62
 	  The Designware Core USB3 IP is programmed to operate in
 	  in USB 2.0 mode only.
 	  Say 'Y' or 'M' here if you have one such device
+
+config USB_DWC3_OCTEON
+	tristate "Cavium Octeon Platforms"
+	depends on CAVIUM_OCTEON_SOC || COMPILE_TEST
+	default USB_DWC3
+	help
+	  Support Cavium Octeon platforms with DesignWare Core USB3 IP.
+	  Say 'Y' or 'M' here if you have one such device.
+
 endif
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 9f66bd82b639..fe1493d4bbe5 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -54,3 +54,4 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
+obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/drivers/usb/dwc3/dwc3-octeon.c
similarity index 100%
rename from arch/mips/cavium-octeon/octeon-usb.c
rename to drivers/usb/dwc3/dwc3-octeon.c
-- 
2.39.2

