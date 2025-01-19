Return-Path: <linux-mips+bounces-7512-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A558DA162B7
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 16:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09293A53B3
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 15:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34EA1DF975;
	Sun, 19 Jan 2025 15:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buUMqEHl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C71DED4F;
	Sun, 19 Jan 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737301497; cv=none; b=FWE5ha1MgLxlnpnt8Z6FYRmCyRes43jA2w5FkYCNAOPoyrLPSuleMeClUcj4+r+M7uZo/kJs+gz1igODWFEmKYcbm5h9DI0aj0Z0FP7zC5vzApGgcrWHt2PJJTpMFoEkV6HenrXiZdWlqKgSDWB9iZ1i3b6vnVVG+y1W4R3r/Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737301497; c=relaxed/simple;
	bh=Ep96jUMsztncXZUEOefoNDyLWDduRgGtDWaLhe4PRZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oZmRCXv06ESeSHtjeW/p90EUbxHgv87kyyuqVHCLBVlSpxYtTfHKAEuogdsBAkj/ON6kNNtSjEkkLF1KQpA0LYBx1hTMVunoRWV6o2xr1TfmGldvaR76A778LRO9I6O8RdIfRG8UsAfaGmEyNfouy2eaupowg0Fw9NT13AMl2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buUMqEHl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361f664af5so41826265e9.1;
        Sun, 19 Jan 2025 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301493; x=1737906293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIk9dNDM0y1fGHAFjJiPmiekeu53KNHHoqoGWF4LqU0=;
        b=buUMqEHlEjKS2EVUjiPrLeJLfRUHnk44Z9N18aHLSdggRSVV/jlFg1gK8nlDSAMlTX
         hhCI46z4Bul+F6tVqWRROP8Ym3ZeQMoacyZqJ+WioM+FC0oL5cP5apwwRMRxk+uBLyf3
         5t2WrAEyKhLoGbi5qJZVtsyK9ngi3gUHQXqdk0MRzECnloKZ4EV9xqO63ELsQAnX6U/X
         QWiTbSvF36LHnB9PGy1cLTBBLwR8zjj7lJVOPoJA/5JMPrUV+D9ebcIlSFZY+hXGGSTO
         KjQXPcWDEtj220pe0pW8h1DtNdYiR/p9OQgi/IXQT7THC6LKEnFKH9h6hpA4r9j+R4ZJ
         j42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301493; x=1737906293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIk9dNDM0y1fGHAFjJiPmiekeu53KNHHoqoGWF4LqU0=;
        b=fqpqn6Ue9NhEc/DI8p9x6UtUUvc6NDK/gx6swGkV4rGKG860P0VdcTHMO7nW1WxfWz
         KBqLvI/VYlrtMns1LSCCe/NeGkbRVNW5XaFC90dsXNjc+kjU7xxqwCvPaNzW5gAV4DXV
         D1+iMHlMWiocjI6fWwjGnvkJgdP0aSfUF2QZ8zZfVahJlM71MKCuPNn7Imnoqr3WLCx6
         aCyefnXUBTsT3NEMW3vujUV5rj9UjlKG64Mqs/BM4TmDuH6Tgdk5lH+QSCLZStZB9A/w
         iz0KrcuH9rMvM2SFViDpYo7qaPoX4qWjnWaSONJRsq/HgvbauHJN/qXZAxDb0U9AABOc
         Uj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl5HXxQ7CKzjf0pPKfwOTuf/0hqeUJkB9PmocpY/IWb7UKVRmYiyf9hqD1Jci7tAO3sBY6fiqq735CPQ==@vger.kernel.org, AJvYcCWz8h5otjUrJMOv0zhMZbY0mWNxcHe4ZZlKWp0f5wvursDZqzwqMioCuW+PMZiUJw6W1jJ4Hdymm9CzirA7@vger.kernel.org, AJvYcCXUdGwFsBkQfwuRsACF4MhlLZ2APSR0ifGjobtObwBgBnZjBNFX0RXlvm9Y3/MVmEOX2A05KMSVhC4e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0PtdhQdapyAnWuKDS+ixXsbJ8egULbmb9eKLy9QwDutApG1NY
	8a3FWOH6GxnDQ9j5FcHHX3eFKAyRfmGbwoFVvZkzCPjbnvJOsINGXWBdCA==
X-Gm-Gg: ASbGncs8gjzEucem+tIA3tUkGaE1wfGQIWEchEsOjTWoa963eRzy8p5RvW2jrjqqzQx
	psBuiUUpOlzPF3XdGJey4/COcVEKuX5Iia7yPRBB8tbsZvFLPOoSz8p+6VM9CAfVJb+GToHkA9I
	s42N6McR2YTVJiJi949TSMa64QtB05TDQPIemyb738yfHRxA8nQT+k/5n6/DGqIzchL3u8KOilg
	BhyIEACDR2LQ2pX389APX7zftilGHdUgyj0OBQlNyTQOWu9xV0wDlzsODQ/z6YyRQ55yuAqQyfe
	adElhoFRS7UDJtvBn/ceLIBfvrFYgqHd40Q9uYJImREb/hhZVathVFmgHfRH
X-Google-Smtp-Source: AGHT+IFvDubY+lyc6bh5Y08rtlRV2TjQ9zfEoykPw7Yd6krOqYsaG2WHjMCeJ3VitiNwGRZT1bF6+A==
X-Received: by 2002:a7b:cbda:0:b0:438:a240:c55 with SMTP id 5b1f17b1804b1-438a2400f62mr34814585e9.1.1737301493105;
        Sun, 19 Jan 2025 07:44:53 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046885esm104532655e9.36.2025.01.19.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:44:52 -0800 (PST)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-clk@vger.kernel.org
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	yangshiji66@outlook.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: clock: add clock and reset definitions for Ralink SoCs
Date: Sun, 19 Jan 2025 16:44:42 +0100
Message-Id: <20250119154447.462857-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
References: <20250119154447.462857-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock and reset missing definitions for RT2880, RT305X, RT3352, RT3383,
RT5350, MT7620 and MT76X8 Ralink SoCs. Update bindings to clarify clock and
reset cells depending on these new introduced constants so consumer nodes
can easily use the correct one in DTS files matching properly what is
being used in driver code (clock IDs and reset bits are implicitly used
there).

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mtmips-sysc.yaml  |  18 ++-
 .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 +++++++++++++++
 .../dt-bindings/reset/mediatek,mtmips-sysc.h  | 152 ++++++++++++++++++
 3 files changed, 298 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h
 create mode 100644 include/dt-bindings/reset/mediatek,mtmips-sysc.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
index ba7ffc5b16a0..3d60e65836ed 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -18,6 +18,15 @@ description: |
   These SoCs have an XTAL from where the cpu clock is
   provided as well as derived clocks for the bus and the peripherals.
 
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mediatek,mtmips-sysc.h>.
+
+  Reset related bits are defined in:
+  [2]: <include/dt-bindings/reset/mediatek,mtmips-sysc.h>.
+
 properties:
   compatible:
     items:
@@ -38,12 +47,14 @@ properties:
 
   '#clock-cells':
     description:
-      The first cell indicates the clock number.
+      The first cell indicates the clock number, see [1] for available
+      clocks.
     const: 1
 
   '#reset-cells':
     description:
-      The first cell indicates the reset bit within the register.
+      The first cell indicates the reset bit within the register, see
+      [2] for available resets.
     const: 1
 
 required:
@@ -56,6 +67,9 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
+    #include <dt-bindings/reset/mediatek,mtmips-sysc.h>
+
     syscon@0 {
       compatible = "ralink,rt5350-sysc", "syscon";
       reg = <0x0 0x100>;
diff --git a/include/dt-bindings/clock/mediatek,mtmips-sysc.h b/include/dt-bindings/clock/mediatek,mtmips-sysc.h
new file mode 100644
index 000000000000..a03335b0e077
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mtmips-sysc.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MTMIPS_H
+#define _DT_BINDINGS_CLK_MTMIPS_H
+
+/* Ralink RT-2880 clocks */
+
+#define RT2880_CLK_XTAL		0
+#define RT2880_CLK_CPU		1
+#define RT2880_CLK_BUS		2
+#define RT2880_CLK_TIMER	3
+#define RT2880_CLK_WATCHDOG	4
+#define RT2880_CLK_UART		5
+#define RT2880_CLK_I2C		6
+#define RT2880_CLK_UARTLITE	7
+#define RT2880_CLK_ETHERNET	8
+#define RT2880_CLK_WMAC		9
+
+/* Ralink RT-305X clocks */
+
+#define RT305X_CLK_XTAL		0
+#define RT305X_CLK_CPU		1
+#define RT305X_CLK_BUS		2
+#define RT305X_CLK_TIMER	3
+#define RT305X_CLK_WATCHDOG	4
+#define RT305X_CLK_UART		5
+#define RT305X_CLK_I2C		6
+#define RT305X_CLK_I2S		7
+#define RT305X_CLK_SPI1		8
+#define RT305X_CLK_SPI2		9
+#define RT305X_CLK_UARTLITE	10
+#define RT305X_CLK_ETHERNET	11
+#define RT305X_CLK_WMAC		12
+
+/* Ralink RT-3352 clocks */
+
+#define RT3352_CLK_XTAL		0
+#define RT3352_CLK_CPU		1
+#define RT3352_CLK_PERIPH	2
+#define RT3352_CLK_BUS		3
+#define RT3352_CLK_TIMER	4
+#define RT3352_CLK_WATCHDOG	5
+#define RT3352_CLK_UART		6
+#define RT3352_CLK_I2C		7
+#define RT3352_CLK_I2S		8
+#define RT3352_CLK_SPI1		9
+#define RT3352_CLK_SPI2		10
+#define RT3352_CLK_UARTLITE	11
+#define RT3352_CLK_ETHERNET	12
+#define RT3352_CLK_WMAC		13
+
+/* Ralink RT-3883 clocks */
+
+#define RT3883_CLK_XTAL		0
+#define RT3883_CLK_CPU		1
+#define RT3883_CLK_BUS		2
+#define RT3883_CLK_PERIPH	3
+#define RT3883_CLK_TIMER	4
+#define RT3883_CLK_WATCHDOG	5
+#define RT3883_CLK_UART		6
+#define RT3883_CLK_I2C		7
+#define RT3883_CLK_I2S		8
+#define RT3883_CLK_SPI1		9
+#define RT3883_CLK_SPI2		10
+#define RT3883_CLK_UARTLITE	11
+#define RT3883_CLK_ETHERNET	12
+#define RT3883_CLK_WMAC		13
+
+/* Ralink RT-5350 clocks */
+
+#define RT5350_CLK_XTAL		0
+#define RT5350_CLK_CPU		1
+#define RT5350_CLK_BUS		2
+#define RT5350_CLK_PERIPH	3
+#define RT5350_CLK_TIMER	4
+#define RT5350_CLK_WATCHDOG	5
+#define RT5350_CLK_UART		6
+#define RT5350_CLK_I2C		7
+#define RT5350_CLK_I2S		8
+#define RT5350_CLK_SPI1		9
+#define RT5350_CLK_SPI2		10
+#define RT5350_CLK_UARTLITE	11
+#define RT5350_CLK_ETHERNET	12
+#define RT5350_CLK_WMAC		13
+
+/* Ralink MT-7620 clocks */
+
+#define MT7620_CLK_XTAL		0
+#define MT7620_CLK_PLL		1
+#define MT7620_CLK_CPU		2
+#define MT7620_CLK_PERIPH	3
+#define MT7620_CLK_BUS		4
+#define MT7620_CLK_BBPPLL	5
+#define MT7620_CLK_SDHC		6
+#define MT7620_CLK_TIMER	7
+#define MT7620_CLK_WATCHDOG	8
+#define MT7620_CLK_UART		9
+#define MT7620_CLK_I2C		10
+#define MT7620_CLK_I2S		11
+#define MT7620_CLK_SPI1		12
+#define MT7620_CLK_SPI2		13
+#define MT7620_CLK_UARTLITE	14
+#define MT7620_CLK_MMC		15
+#define MT7620_CLK_WMAC		16
+
+/* Ralink MT-76X8 clocks */
+
+#define MT76X8_CLK_XTAL		0
+#define MT76X8_CLK_CPU		1
+#define MT76X8_CLK_BBPPLL	2
+#define MT76X8_CLK_PCMI2S	3
+#define MT76X8_CLK_PERIPH	4
+#define MT76X8_CLK_BUS		5
+#define MT76X8_CLK_SDHC		6
+#define MT76X8_CLK_TIMER	7
+#define MT76X8_CLK_WATCHDOG	8
+#define MT76X8_CLK_I2C		9
+#define MT76X8_CLK_I2S		10
+#define MT76X8_CLK_SPI1		11
+#define MT76X8_CLK_SPI2		12
+#define MT76X8_CLK_UART0	13
+#define MT76X8_CLK_UART1	14
+#define MT76X8_CLK_UART2	15
+#define MT76X8_CLK_MMC		16
+#define MT76X8_CLK_WMAC		17
+
+#endif /* _DT_BINDINGS_CLK_MTMIPS_H */
diff --git a/include/dt-bindings/reset/mediatek,mtmips-sysc.h b/include/dt-bindings/reset/mediatek,mtmips-sysc.h
new file mode 100644
index 000000000000..1bc6024b1f22
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mtmips-sysc.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Sergio Paracuellos <sergio.paracuellos@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RST_MTMIPS_H
+#define _DT_BINDINGS_RST_MTMIPS_H
+
+/* Ralink RT-2880 resets */
+
+#define RT2880_RST_SYS		0
+#define RT2880_RST_I2C		9
+#define RT2880_RST_FE		18
+
+/* Ralink RT-305X resets */
+
+#define RT305X_RST_SYS		0
+#define RT305X_RST_TIMER	8
+#define RT305X_RST_INTC		9
+#define RT305X_RST_MEMC		10
+#define RT305X_RST_PCM		11
+#define RT305X_RST_UART		12
+#define RT305X_RST_PIO		13
+#define RT305X_RST_DMA		14
+#define RT305X_RST_I2C		16
+#define RT305X_RST_I2S		17
+#define RT305X_RST_SPI		18
+#define RT305X_RST_UARTLITE	19
+#define RT305X_RST_WLAN		20
+#define RT305X_RST_FE		21
+#define RT305X_RST_OTG		22
+#define RT305X_RST_SW		23
+
+/* Ralink RT-3352 resets */
+
+#define RT3352_RST_SYS		0
+#define RT3352_RST_TIMER	8
+#define RT3352_RST_INTC		9
+#define RT3352_RST_MEMC		10
+#define RT3352_RST_PCM		11
+#define RT3352_RST_UART		12
+#define RT3352_RST_PIO		13
+#define RT3352_RST_DMA		14
+#define RT3352_RST_I2C		16
+#define RT3352_RST_I2S		17
+#define RT3352_RST_SPI		18
+#define RT3352_RST_UARTLITE	19
+#define RT3352_RST_WLAN		20
+#define RT3352_RST_FE		21
+#define RT3352_RST_UHST		22
+#define RT3352_RST_SW		23
+#define RT3352_RST_EPHY		24
+#define RT3352_RST_UDEV		25
+#define RT3352_RST_MIPS_CNT	28
+
+/* Ralink RT-3883 resets */
+
+#define RT3883_RST_SYS		0
+#define RT3883_RST_TIMER	8
+#define RT3883_RST_INTC		9
+#define RT3883_RST_MEMC		10
+#define RT3883_RST_PCM		11
+#define RT3883_RST_UART		12
+#define RT3883_RST_PIO		13
+#define RT3883_RST_DMA		14
+#define RT3883_RST_I2C		16
+#define RT3883_RST_I2S		17
+#define RT3883_RST_SPI		18
+#define RT3883_RST_UARTLITE	19
+#define RT3883_RST_WLAN		20
+#define RT3883_RST_FE		21
+#define RT3883_RST_UHST		22
+#define RT3883_RST_SW		23
+#define RT3883_RST_EPHY		24
+#define RT3883_RST_UDEV		25
+#define RT3883_RST_MIPS_CNT	28
+
+/* Ralink RT-5350 resets */
+
+#define RT5350_RST_SYS		0
+#define RT5350_RST_TIMER	8
+#define RT5350_RST_INTC		9
+#define RT5350_RST_MEMC		10
+#define RT5350_RST_PCM		11
+#define RT5350_RST_UART		12
+#define RT5350_RST_PIO		13
+#define RT5350_RST_DMA		14
+#define RT5350_RST_I2C		16
+#define RT5350_RST_I2S		17
+#define RT5350_RST_SPI		18
+#define RT5350_RST_UARTLITE	19
+#define RT5350_RST_WLAN		20
+#define RT5350_RST_FE		21
+#define RT5350_RST_UHST		22
+#define RT5350_RST_SW		23
+#define RT5350_RST_EPHY		24
+#define RT5350_RST_UDEV		25
+#define RT5350_RST_MIPS_CNT	28
+
+/* Ralink MT-7620 resets */
+
+#define MT7620_RST_SYS		0
+#define MT7620_RST_TIMER	8
+#define MT7620_RST_INTC		9
+#define MT7620_RST_MEMC		10
+#define MT7620_RST_PCM		11
+#define MT7620_RST_UART		12
+#define MT7620_RST_PIO		13
+#define MT7620_RST_DMA		14
+#define MT7620_RST_NAND		15
+#define MT7620_RST_I2C		16
+#define MT7620_RST_I2S		17
+#define MT7620_RST_SPI		18
+#define MT7620_RST_UARTLITE	19
+#define MT7620_RST_WLAN		20
+#define MT7620_RST_FE		21
+#define MT7620_RST_ESW		23
+#define MT7620_RST_EPHY		24
+#define MT7620_RST_UHST0	25
+#define MT7620_RST_PCIE0	26
+#define MT7620_RST_MIPS_CNT	28
+#define MT7620_RST_SDHC		30
+#define MT7620_RST_PPE		31
+
+/* Ralink MT-76X8 resets */
+
+#define MT76X8_RST_SYS		0
+#define MT76X8_RST_SPIS		3
+#define MT76X8_RST_WIFI		4
+#define MT76X8_RST_HIF		5
+#define MT76X8_RST_TIMER	8
+#define MT76X8_RST_INTC		9
+#define MT76X8_RST_MEMC		10
+#define MT76X8_RST_PCM		11
+#define MT76X8_RST_UART0	12
+#define MT76X8_RST_PIO		13
+#define MT76X8_RST_GDMA		14
+#define MT76X8_RST_I2C		16
+#define MT76X8_RST_I2S		17
+#define MT76X8_RST_SPI		18
+#define MT76X8_RST_UART1	19
+#define MT76X8_RST_UART2	20
+#define MT76X8_RST_UHST		22
+#define MT76X8_RST_ETH		23
+#define MT76X8_RST_EPHY		24
+#define MT76X8_RST_PCIE0	26
+#define MT76X8_RST_AUX_STCK	28
+#define MT76X8_RST_CRYPTO	29
+#define MT76X8_RST_SDXC		30
+#define MT76X8_RST_PWM		31
+
+#endif /* _DT_BINDINGS_RST_MTMIPS_H */
-- 
2.25.1


