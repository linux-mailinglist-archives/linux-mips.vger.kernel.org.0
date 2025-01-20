Return-Path: <linux-mips+bounces-7541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AAA16934
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 10:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D9616835A
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F471AF0A6;
	Mon, 20 Jan 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLjCEVgU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CF19F40B;
	Mon, 20 Jan 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364915; cv=none; b=pYCrPEaECfGYAALj0VlTx1BacKd5B3Kg2L+j5BPN9kvDhAHJ2X4JGwymaungtRI5bhNnHfZoKjntb/SGJdoiaDwIjsYAEuRpmbBH5Owx1APZVKYV9jVlG5/vmTiResLzBEDqlBbZAjHl2kq8qCAyy78A391l6ZG1Zi2Gl/89UzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364915; c=relaxed/simple;
	bh=+vfmmfzai3BUsJ0p2SOOa9HBVLnw6p/QW7a5k4BV2CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RmwMQ9eG77lJ1vD6+ABIbvcuiRyjFQka7JlzVppOOv9oZwzvD1Z4CHrEpWXCzDILbjT8gK61YHCFRiWo31o6lkmH9MYmt9k9THM994mtTE9eAnq6e3EFL7jLANyCL3PSSH12aAQBxF8cThnzeUJ6jTwISMbFWXVuym1LSrFqi4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLjCEVgU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43622267b2eso42031815e9.0;
        Mon, 20 Jan 2025 01:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364911; x=1737969711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSzbbwkX5zb+1VXEmlFF8JkxvF+4BUdLMuFERFZQBLE=;
        b=bLjCEVgUAoIaBRDL/P+RTKJ7H/oaLny57Ee7WwVIeOB7TV2ler4xsX4FXPvZut8zR9
         qaRkPi7TyUqHF5qMLX2s//tz+wNfY7xOu1AIbKg3DP0Ud+Si3kcJ9wavWerHH4gtmbwC
         ukBXDzEJLsoG+YBKzRklusdbmx+1OPvpK90k5Jz75uP2V9FaYvu4pB52o25IQQmwJZx0
         PNskymHYdZbf2tc/0ajPf3ZYbOW5D3vp/q43ueH8UIkc10dpAx1Bcboi8eDF4vANVpww
         gsj1vE/ov0MSMkx/r5z9mmrAz7hSSVH4B6dcjyS0LDqzeOyNgpSgvTd1Uf/W6bAVrWiU
         1wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364911; x=1737969711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSzbbwkX5zb+1VXEmlFF8JkxvF+4BUdLMuFERFZQBLE=;
        b=uFoFE/FWMy7WrbuHa4lFP+63BcnAgDeF6v/HJSB5H/toUczrtWRW/ppD8ZoRIDVXWS
         o8GNRLPFBNZ3Ts0KPLaPKr08uHC4j3/RkRZqgxa1geHdqxBrTBFZbDqS+pBjuKf1qbJP
         jpBwtU01bRhGuPNnZEYlQQYIH4K4dN7mhfXksrt7pGwsnKz/0YecpUUZ7T4uRdm4gQPl
         2wJr/mUvKdhjoKyayh6ZNq8tERX+YHPU8oT5ibUvtyAlQ+9letdyxRcXG83+ge3LKcer
         pHh4gnHukGeaYKZ2GXXrtOCNNGocRTILuZlQHsyVbvorVyh2+zIYwZw+9w8br3tkm8fi
         adgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8FTGc8QZFaG99DgU9eMWcng5TXnElhsTypb0a9LLngzu1RWYERrYJe2fc1S/Fc3dnLIEUDWdLpmqNH2gW@vger.kernel.org, AJvYcCXjqiyKx5DYdlpAMRkXdZAMIQjYgQNqtOgbtYMB9N8isKDo4EqHPDpl5kO86Dipu01FWDgeCgoTOMP1@vger.kernel.org, AJvYcCXy6o42FHU+51Xq3+4inCVQ1N+0ZN4M1oXebYBhdinem0ayrYd3NT6m0qleXqb1X5jbLAOr5dzYV3JZVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaGkisQk8Fu9lfCuCtw5kEsYMeC0oDoKx4eQcJMfuYf8chFXyL
	6+BPuTluVBvHTX4+ZVLCM/7tQ3IGLeV6/79RE3KmDFCegnS65YANd5X+vw==
X-Gm-Gg: ASbGncuveFiOZIeSGSiCYklsiqOGg0wYLV7chlf85xb6as24lbMo5wFHyZwli5P6In3
	BF+hDX2l8gJbU/rTg09HfAWZwwmy6RH6hnbgI0A6F2klGeuiLaNvAzAdGHN/mV8rGf7XH9Pt/fc
	RL95z/PBOAlqsHDMj9a9JpTSM5r2G5+OflQ0XRwKqJT2gm2nGpYSX1/SEWYds7r91MjmPy+nkAg
	EwiGl+NTO7j34p0rnflrWYIAYdV4qxFk4qrWvrheegBhRy8gEvawG/u1YQZoEUrhxUnnu7o9IQk
	K6DmAfG6M/znlt5wTslKuQGVsS139J1sXlkIQwVMpOfzsWkLyjjVd9VPDtl7
X-Google-Smtp-Source: AGHT+IEHGUU4/SV7zhm/eXOQtisgKi5bH8KTP0KuyEdpRiebIDYrCXkiS7BLNEenbFUG09gO1XF1Bg==
X-Received: by 2002:a05:600c:4511:b0:435:9ed3:5698 with SMTP id 5b1f17b1804b1-4389143753bmr102833505e9.24.1737364910905;
        Mon, 20 Jan 2025 01:21:50 -0800 (PST)
Received: from localhost.localdomain (249.red-88-10-54.dynamicip.rima-tde.net. [88.10.54.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a1ec39a3sm80680175e9.16.2025.01.20.01.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:21:50 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: clock: add clock definitions for Ralink SoCs
Date: Mon, 20 Jan 2025 10:21:41 +0100
Message-Id: <20250120092146.471951-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock missing definitions for RT2880, RT305X, RT3352, RT3383, RT5350,
MT7620 and MT76X8 Ralink SoCs. Update bindings to clarify clock depending
on these new introduced constants so consumer nodes can easily use the
correct one in DTS files matching properly what is being used in driver
code (clock IDs are implicitly used there).

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mtmips-sysc.yaml  |  11 +-
 .../dt-bindings/clock/mediatek,mtmips-sysc.h  | 130 ++++++++++++++++++
 2 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mtmips-sysc.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
index ba7ffc5b16a0..83c1803ffd16 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mtmips-sysc.yaml
@@ -18,6 +18,12 @@ description: |
   These SoCs have an XTAL from where the cpu clock is
   provided as well as derived clocks for the bus and the peripherals.
 
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mediatek,mtmips-sysc.h>.
+
 properties:
   compatible:
     items:
@@ -38,7 +44,8 @@ properties:
 
   '#clock-cells':
     description:
-      The first cell indicates the clock number.
+      The first cell indicates the clock number, see [1] for available
+      clocks.
     const: 1
 
   '#reset-cells':
@@ -56,6 +63,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mediatek,mtmips-sysc.h>
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
-- 
2.25.1


