Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BEC1F5A6B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbgFJR3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgFJR3L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:29:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E42DC03E96B;
        Wed, 10 Jun 2020 10:29:10 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so3179525wrm.13;
        Wed, 10 Jun 2020 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOvu8beBJGK/JahpCRgxUyQ8oG0frW6Mm4eaPBq6QJU=;
        b=lwnPRc9ByrTd4fG87nUGr8Toknv7QAdoxkhFu2hr4MHoWgIlUNTrXlN8uIqU22jnk1
         ImY6WyCuG8+WpBF/qXmM6mBXZv6gyJ/cRfsvCLA7LHaFf2Y+NmZzy0OA0ydu2bI/mmKc
         4KUoNEHMw2LcJi1m+1DFy5pKqDJxX3Sjb6WaKKPUtfHZt/tFSRCmELl3s5g2iY0NEhTy
         J5xI+7DOH4nTFtXupcXn3sEFbLPSlM9Px+gIxmFaBGk0+F81bSJOxpqNnTC+czJAE8Q2
         fzgugSXCpax5oNJY2LkzxDNt/5YglrmxesgmqqYyXxy1CA/0dXkAUzyu6xa18LTK4FzL
         E/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOvu8beBJGK/JahpCRgxUyQ8oG0frW6Mm4eaPBq6QJU=;
        b=CDUD4vSdMK5uzLsuKV2FPVdVsWPdbfESt2LXmIjaz8C4Aa/TZfk5A+LN2onBJBUgGo
         tNu6kzsW7bvc55s9vCjWZx6yJEtSXwieCOWMycaL6HMqBVDISAE1EzLM8ZZMmPu6UqBO
         YhXT4A20Eb2JbhhuCSGoO8DdNSjv/aRDdEsfXnp/9U6nz3YzEm75cpI2Iq6zKUJzRSlY
         lMpIao5wvMCKHZkbib02wfkEu2EkFRR5vgKZWJqbn3DSto1fvk3CzABXlj+EPKMPeQSh
         k6ZSI4chYO40TcWBqrd818RBkkFg6nJIjLIyeuMT2q9Mvz+HGRFFtv8Ma42mRpgClc2J
         DKCA==
X-Gm-Message-State: AOAM5330p8RpFvV7wKJbqDcTMi0oVzjHCF4tbn/2pNACsj/nf5GB0tR6
        EBh9tSKYIK7DQwNWLpo9BUg=
X-Google-Smtp-Source: ABdhPJx8CtlQvmU6NcigRgIK/f3ArO+XjqFNFpjOtHnflbbZary13ohD5Nw9KtjN3qhGzkN7dcnUXQ==
X-Received: by 2002:adf:91c2:: with SMTP id 60mr5197187wri.41.1591810149177;
        Wed, 10 Jun 2020 10:29:09 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id h188sm568551wmh.2.2020.06.10.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:29:08 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 6/9] mips: bmips: dts: add BCM6362 reset controller support
Date:   Wed, 10 Jun 2020 19:28:56 +0200
Message-Id: <20200610172859.466334-7-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610172859.466334-1-noltari@gmail.com>
References: <20200609160244.4139366-1-noltari@gmail.com>
 <20200610172859.466334-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6362 SoCs have a reset controller for certain components.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: add reset controller definitions header file.
 v2: no changes.

 arch/mips/boot/dts/brcm/bcm6362.dtsi      |  6 ++++++
 include/dt-bindings/reset/bcm6362-reset.h | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/reset/bcm6362-reset.h

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 8ae6981735b8..443af6b4c838 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -70,6 +70,12 @@ reboot: syscon-reboot@10000008 {
 			mask = <0x1>;
 		};
 
+		periph_rst: reset-controller@10000010 {
+			compatible = "brcm,bcm6345-reset";
+			reg = <0x10000010 0x4>;
+			#reset-cells = <1>;
+		};
+
 		periph_intc: interrupt-controller@10000020 {
 			compatible = "brcm,bcm6345-l1-intc";
 			reg = <0x10000020 0x10>,
diff --git a/include/dt-bindings/reset/bcm6362-reset.h b/include/dt-bindings/reset/bcm6362-reset.h
new file mode 100644
index 000000000000..7ebb0546e0ab
--- /dev/null
+++ b/include/dt-bindings/reset/bcm6362-reset.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef __DT_BINDINGS_RESET_BCM6362_H
+#define __DT_BINDINGS_RESET_BCM6362_H
+
+#define BCM6362_RST_SPI		0
+#define BCM6362_RST_IPSEC	1
+#define BCM6362_RST_EPHY	2
+#define BCM6362_RST_SAR		3
+#define BCM6362_RST_ENETSW	4
+#define BCM6362_RST_USBD	5
+#define BCM6362_RST_USBH	6
+#define BCM6362_RST_PCM		7
+#define BCM6362_RST_PCIE_CORE	8
+#define BCM6362_RST_PCIE	9
+#define BCM6362_RST_PCIE_EXT	10
+#define BCM6362_RST_WLAN_SHIM	11
+#define BCM6362_RST_DDR_PHY	12
+#define BCM6362_RST_FAP		13
+#define BCM6362_RST_WLAN_UBUS	14
+
+#endif /* __DT_BINDINGS_RESET_BCM6362_H */
-- 
2.26.2

