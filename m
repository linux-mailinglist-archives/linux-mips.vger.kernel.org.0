Return-Path: <linux-mips+bounces-7463-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02480A12778
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 16:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D1A618890E9
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jan 2025 15:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864FA15884A;
	Wed, 15 Jan 2025 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d29LB09u"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7515575F;
	Wed, 15 Jan 2025 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955027; cv=none; b=P+m2AifakLO4ug2EZbUJynG9vZygU3AUIsHmE0PVHea3qSRl2KSW3Vh2K6FcG0TE3GdZbgehG/17bkxNBFBlx6mugwwE/lV275a4yk7fEG2pMUIP5c8AHEXNaAb6lkWKf36WcFryMq3TrWwgXASX+qvEhwCRt0wb0nxvFZ+IeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955027; c=relaxed/simple;
	bh=ObHWEl/yLa05sNIQqEqSiRb/9Iy9kwJaYLXfP1QE3FA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RezfzVTdVAyY3rnYXtu3ZKuZnBdlh0zbxXx2a3Jr8XbZzivIJfsSIi43bHqM6W8fMXZvGDyMQamfok/aP9LYrrq4gsrDTeL6t42QWFGn/eXiGY3YOTZtzkdwpJPYNwo1MOce7VZ+nkrTWXEqJCGjncatRo8hz4Bhi0FxhxquoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d29LB09u; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e06af753so3510305f8f.2;
        Wed, 15 Jan 2025 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736955023; x=1737559823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OgjJVkHJ+1aDrFAnkiLcrzU2/n7FQoASHGwaNTQT9I=;
        b=d29LB09ucqHblSLPW67cSIc0UlsB+TbXhv1UG6l+FKuxOGITBGf0frvmchJXMhW3gF
         kcUsImDYJuB1u/WTHT0Z2wsgFool/G99cvPNIPPZhRxfFzdaDmLTGsI6+UfomRG7DnLV
         3vGMnenUoptYAEXRQYcaePq5E/YqUY38YcJBOxs8vcvyqo/LOrPNbkC8LFxSIKylNQE/
         8Rb507+sqPeVdG0pP5FxfZoig9JaqQqWLjWDnAsswwzt22NXH53VzRXrGbf+rsVhFYOd
         De2uqTyZ74M9Y00HMrCshqzHRa0eq2z/dYDsTBDT0ZHqULG9xSwn2M7IbgWi3LoiW9uv
         kgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955023; x=1737559823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OgjJVkHJ+1aDrFAnkiLcrzU2/n7FQoASHGwaNTQT9I=;
        b=PdBuAsUdeghkOj0n0UMnDR1blzu52wCiMh+HujmPI0KZTjnObRVTsHyDzdCwlhItrB
         reolJDsnRfmyc9CIIDZrelUnoj7Xtja0UYgBCK38k7X+D7giZ+zabk3RnqCS3h4IfziU
         17VHMo9LCru1DjC/SiBAc67b34G+k1HKfzxY16L5QcrYkKfH14hT3rIkprhh1JSnXFmn
         urWhqfiw5UEzGqeq8E8D7m64wj9svvs1VNOoXMM+kXBLfKwbbfjNDTQ66TJ4wEFUzGvu
         dvKZS6n5mjzuIQkuqQmRzuxf+Iw+dgX/tOqXPLkbanWW5XYE/dxTHR3zK2WSrUj/ove1
         HyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenCXHoeFjChOjg0iNPJP2wMDmZHjD/kv8MOYnfnI2w5lkws7y+KofYJ4hNY4MnP9EgJiMsjnqH6tubQ==@vger.kernel.org, AJvYcCWqxbvtljfRIgnzWk7rfyfka1bIMRn2zxSwz+VwJmst+8h4Ops2PJIJ6Rl0lnU56kiGcQxl9kJghxJD@vger.kernel.org, AJvYcCXoNCmko53P8sBIjfNim/pH9NBDZ1LAICphDUBOMnx5tZ5/HVGmasio39G/e9+Relg1zH+OB63DSbplBemf@vger.kernel.org
X-Gm-Message-State: AOJu0YwNE1fhtSR9ItKgEQ3T6wwo3xRCKwQTQRc+rG0RpQJZc37ROjV2
	vJXjqyc4PnFa/KBy2pOzLF756HMcyyUnkJrG98rqbH/nH7SOWpTGbS/liQ==
X-Gm-Gg: ASbGncs7huYUSHId5nz5vx0HYuNhMVii0tPQjNiVZMhE9/2gLXfN5CbEpoev6oYFaaI
	tjK6On9GGrhLHlduJ5CxJgaYaSwGsvLjxwhh+Di6xsEhBqRwjGWDHr+eg0sciV8xFlg5/OrBM+v
	RdIkfs/3kh6ghVZNGzM9NgvC45yJrgkRgXK/rw/e7z5hlCqDCAQAaibYgUWN/3g0byF67nPciS7
	1+55et4g8IiNmDz1w7dH2EVwFTOWr/RO+7HThDpzC5dXkKIbck3lDHD7XX+Uq28wSbk8MAnbqUX
	zDXFSrO3Wru2ks/9cwuaIthxDmKo/42QoVr4tI6JzUTnHJE=
X-Google-Smtp-Source: AGHT+IHCzqx+txwvnI6HksRXoWKvDZ2iEiBx7CxMRAUq6vbmnCEEaLqDPdR/arcmW9sogQEBoyPDzw==
X-Received: by 2002:a5d:64e2:0:b0:38b:e32a:10ab with SMTP id ffacd0b85a97d-38be32a13a4mr5604648f8f.9.1736955023181;
        Wed, 15 Jan 2025 07:30:23 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm7440771f8f.43.2025.01.15.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 07:30:22 -0800 (PST)
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
Subject: [PATCH 1/6] dt-bindings: clock: add clock and reset definitions for Ralink SoCs
Date: Wed, 15 Jan 2025 16:30:14 +0100
Message-Id: <20250115153019.407646-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
References: <20250115153019.407646-1-sergio.paracuellos@gmail.com>
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
can easily use the correct one in DTS files.

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


