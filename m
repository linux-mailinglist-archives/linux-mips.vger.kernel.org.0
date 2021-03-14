Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C0F33A677
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 17:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhCNQfe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Mar 2021 12:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234111AbhCNQex (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Mar 2021 12:34:53 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B6AC061763;
        Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a18so7450231wrc.13;
        Sun, 14 Mar 2021 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuT5VsbT1XGZlBuSRTVfvPqDGzQ8TwuOuNgGTDNgoVM=;
        b=LrtesDCMSBSj+fLmZD/pZn0KeyoxWK4z0G/jjbJ/Fx/f1m2O5v0d6nOHy2iEa3lXEF
         I6fla+bKanEiXjSKLglsnaxhQK2rlPlGbeylns+luwwVgQgn+3l7KeQ6iXXD5dGVqWyK
         gUsnJrFzF1EeRQrdxl/i+XU3ipmEo1Hi63fW7Zz4jK4VFjyVpbmDfw/12wJ6TSZfEE2J
         BJ9PJz7YFbHY1q9XCeV6HGQs5mPfRyGFbirhKpAp+1yT+nYwTaIyz8TjMskMXXnyCH0+
         od5lioI9Uky+dtVPwvz8a/7SOmq9smmgLjpLPcw9LKWxwyjGIidDJlzjNifRXy7tzwwd
         yRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuT5VsbT1XGZlBuSRTVfvPqDGzQ8TwuOuNgGTDNgoVM=;
        b=gWHwyvxKWPZGWQjvBnXuBk3lOXjzp/gOhcJCtAiI6AbyHaHe1chRtnuWNqbRK36jNI
         +jsIV1dqmV6YdXEEjR63zHyhkGnD7cSOFkS2Kw1wlV9dVBa6xGAzcy6YPsoqisJVfJJQ
         vzrd0rZdIlb0o7ME0RgJm++IJwlqQb6doeq9FTO5AD4u2UiSIHueOCe0FsJwXWNTVNQx
         VG840P+r67mDSNOJ+DIQbSStYoOq4VQhCn5w17KVtuctcO3DXT+yJmK4AH6m/Y1YkBTK
         ZVZtQWwYSdKin2qrb/fEqEstL07QjMp+ak+ilhS7PztsLc8SlaKBZqVpgNZq2GlOLZbO
         dyLw==
X-Gm-Message-State: AOAM530DK3bXjc7xENNNmqempYMIOwGT7Mm5/cBsaJAirPgDxhd7WenL
        krQFLkb/lLSH1YRHj08ymBg=
X-Google-Smtp-Source: ABdhPJxPZxW5eX1KbEVKMSvxTlMSUXVM2Geo+ctUXwFcac+VczEUizqc85OgIdfYkR3Hjpa+DlhypQ==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr23232338wrs.135.1615739691444;
        Sun, 14 Mar 2021 09:34:51 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id h62sm10547804wmf.37.2021.03.14.09.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:34:51 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 4/5] mips: bmips: bcm6362: populate device tree nodes
Date:   Sun, 14 Mar 2021 17:34:44 +0100
Message-Id: <20210314163445.6976-5-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210314163445.6976-1-noltari@gmail.com>
References: <20210314163445.6976-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

- Rename periph_clk to periph_osc.
- Rename clkctl to periph_clk.
- Move syscon-reboot to subnode.
- Add hsspi-osc clock.
- Add watchdog.
- Add SPI controller.
- Add HS SPI controller.
- Add NAND controller.
- Add USBH PHY.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6362.dtsi | 127 ++++++++++++++++++++++++---
 1 file changed, 116 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/brcm/bcm6362.dtsi
index 50c287bedc37..d74021925c53 100644
--- a/arch/mips/boot/dts/brcm/bcm6362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -29,16 +29,29 @@
 	};
 
 	clocks {
-		periph_clk: periph-clk {
+		periph_osc: periph-osc {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <50000000>;
+			clock-output-names = "periph";
+		};
+
+		hsspi_osc: hsspi-osc {
+			compatible = "fixed-clock";
+
+			#clock-cells = <0>;
+
+			clock-frequency = <400000000>;
+			clock-output-names = "hsspi_osc";
 		};
 	};
 
 	aliases {
+		nflash = &nflash;
 		serial0 = &uart0;
 		serial1 = &uart1;
+		spi0 = &lsspi;
+		spi1 = &hsspi;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -56,23 +69,22 @@
 		compatible = "simple-bus";
 		ranges;
 
-		clkctl: clock-controller@10000004 {
+		periph_clk: clock-controller@10000004 {
 			compatible = "brcm,bcm6362-clocks";
 			reg = <0x10000004 0x4>;
 			#clock-cells = <1>;
 		};
 
-		periph_cntl: syscon@10000008 {
+		pll_cntl: syscon@10000008 {
 			compatible = "syscon";
 			reg = <0x10000008 0x4>;
 			native-endian;
-		};
 
-		reboot: syscon-reboot@10000008 {
-			compatible = "syscon-reboot";
-			regmap = <&periph_cntl>;
-			offset = <0x0>;
-			mask = <0x1>;
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x0>;
+				mask = <0x1>;
+			};
 		};
 
 		periph_rst: reset-controller@10000010 {
@@ -93,6 +105,16 @@
 			interrupts = <2>, <3>;
 		};
 
+		wdt: watchdog@1000005c {
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x1000005c 0xc>;
+
+			clocks = <&periph_osc>;
+			clock-names = "refclk";
+
+			timeout-sec = <30>;
+		};
+
 		uart0: serial@10000100 {
 			compatible = "brcm,bcm6345-uart";
 			reg = <0x10000100 0x18>;
@@ -100,7 +122,7 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <3>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
@@ -113,12 +135,72 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <4>;
 
-			clocks = <&periph_clk>;
+			clocks = <&periph_osc>;
 			clock-names = "refclk";
 
 			status = "disabled";
 		};
 
+		nflash: nand@10000200 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm6368",
+				     "brcm,brcmnand-v2.2",
+				     "brcm,brcmnand";
+			reg = <0x10000200 0x180>,
+			      <0x10000600 0x200>,
+			      <0x10000070 0x10>;
+			reg-names = "nand",
+				    "nand-cache",
+				    "nand-int-base";
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <12>;
+
+			clocks = <&periph_clk BCM6362_CLK_NAND>;
+			clock-names = "nand";
+
+			status = "disabled";
+		};
+
+		lsspi: spi@10000800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6358-spi";
+			reg = <0x10000800 0x70c>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <2>;
+
+			clocks = <&periph_clk BCM6362_CLK_SPI>;
+			clock-names = "spi";
+
+			resets = <&periph_rst BCM6362_RST_SPI>;
+			reset-names = "spi";
+
+			status = "disabled";
+		};
+
+		hsspi: spi@10001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,bcm6328-hsspi";
+			reg = <0x10001000 0x600>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <5>;
+
+			clocks = <&periph_clk BCM6362_CLK_HSSPI>,
+				 <&hsspi_osc>;
+			clock-names = "hsspi",
+				      "pll";
+
+			resets = <&periph_rst BCM6362_RST_SPI>;
+			reset-names = "hsspi";
+
+			status = "disabled";
+		};
+
 		periph_pwr: power-controller@10001848 {
 			compatible = "brcm,bcm6362-power-controller";
 			reg = <0x10001848 0x4>;
@@ -142,6 +224,9 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <10>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
 			status = "disabled";
 		};
 
@@ -154,6 +239,26 @@
 			interrupt-parent = <&periph_intc>;
 			interrupts = <9>;
 
+			phys = <&usbh 0>;
+			phy-names = "usb";
+
+			status = "disabled";
+		};
+
+		usbh: usb-phy@10002700 {
+			compatible = "brcm,bcm6362-usbh-phy";
+			reg = <0x10002700 0x38>;
+
+			#phy-cells = <1>;
+
+			clocks = <&periph_clk BCM6362_CLK_USBH>;
+			clock-names = "usbh";
+
+			power-domains = <&periph_pwr BCM6362_POWER_DOMAIN_USBH>;
+
+			resets = <&periph_rst BCM6362_RST_USBH>;
+			reset-names = "usbh";
+
 			status = "disabled";
 		};
 	};
-- 
2.20.1

