Return-Path: <linux-mips+bounces-8953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39CAAD622
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 08:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00D0E983806
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 06:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B70213E76;
	Wed,  7 May 2025 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTDPSW8X"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DF212FB8;
	Wed,  7 May 2025 06:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599542; cv=none; b=RR2pIe1MEwZ745zEKuzBYO58iJzwMcoAu6NPzvRKxjmQqFH1OstflM1FvGsMDu5XWDhkaUJgtgtum30dbx52f2kuvT/HLk0N/IbQSGfqDKG4MNLWQs8XsfIhb+jiAWqkQZEicBZ15kE0oRPudV673NOS+FhBk59eyP8iEtzC5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599542; c=relaxed/simple;
	bh=gVnr8TnU5oBPUOllfUkHDqgYRsX0nAzlPey3pz8QsSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QasUDT1vK8VkqEtMU40dhGQjAn0Z975l/mi9stsuSFZ8lIN10JEAZN4PKWURWYjk0O9Rz3v/crq1LyIJ3A+OSfM9P+YSvZveAqQK80/7jMMGJLwPQhLUyu4ZA/TgON81FITBNMSoaZekOKm+PGbtec5O3hRoSuR9nRck/Njl9ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTDPSW8X; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22423adf751so73716855ad.2;
        Tue, 06 May 2025 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746599540; x=1747204340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YWstoYnxasTg7tshxJbl1B8GWpQGF7X65mCdPOf1/0=;
        b=CTDPSW8XZD6Be5HIisLjLIaoiMkLL+tFC3VX20M9GpI3SJ4sTDsfGG2F+2eJe39jil
         Kuwqv0YbbIX9xMcjzuDPCybuWdNbY5+k1qwGFFOm7cFb3xJsRjj7m5VbcpVUCeRhJYW1
         nR4EE6cFHwTD9L0HhPoOQ3ULbBZ13deEr9y7fpevOJNXziUMZiy/qa3OvSYifuYCA6u9
         2m1W0FTUUIjP2YtJa1Xy1pBADwLZDRvIE7fyYozCSYGH8b85oKm43TDr4J1oqI9ZGZni
         lX10LqHrdjov8II0//0Ln0pRfqtvrn85aaxbhx5+0Q+agImUNIoSEVqCQLcNi9dOC86C
         2CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599540; x=1747204340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YWstoYnxasTg7tshxJbl1B8GWpQGF7X65mCdPOf1/0=;
        b=Xmra7d4lMoScKSu3/rFpLaw2V8YkaKCR3RCRmc3wOSZxd3IH50ky7oQKiHR6nmRCN5
         /7DD8e/QphKK0855yemNE1CPVhqwLZc2AsUFXML0kFIA1pTWBOHy7frfFRtTyiH7W9Gm
         HEerklEXhvTyvrvJjTHXEBH0UIbWjI41x0VtR3ZKcqyxiqCzLGW2t1RUTTcChbhUZko3
         g9/q51pkIkuue1GQb+QmUHGBpaHud7vZKUsRHOM+Aq7lIw5KCqSDvjQxStrh7o5AAJrj
         Y4CNvIRrgLBYkC/xIQMt4c97dAMrLT9kS//REQOhgldJCbm7yhdBqpIGTxEJtUne+QcU
         l9wg==
X-Forwarded-Encrypted: i=1; AJvYcCUiuDM1SaLiHzsuRUTTW5kBZHt6dCLnXSbRvyIXc9OBwXevHs0Jm5nYfX5x/gyE250cyguEI9UpeNGq@vger.kernel.org, AJvYcCUrYaSoFQYvt8i0VoY4+edgAqILpV+Nt+nWm/c93jOU5CBhJOpvdpOntte1phCQtJYmqK7o829LllG8nQ==@vger.kernel.org, AJvYcCXjlFAiQtHOXG7Q+ZZXRWfUvdXBey8oRcYbP+pCDz6CIUPPHcsIdDeYEtKnYonXOOf+xtEl8qiyLrPqJKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypSrY+x+D4XmHzF2Yrmf3KI3d0NIfbbyWmHej44rPgAdaDvB4t
	SahReigSv940o/+rBTHzfWM2R8CbJZwqD/4ODbGFph4dg+sOKem1
X-Gm-Gg: ASbGncv20WHx/MywniplRnNDO4HdNVIvyQk53hXCRgRtALFba9xHjdImKQev6nvTGuD
	/0m/utw2DD4/upia7NDJnGT0pK07TRTCmp0serW+aaO1Hn2ghhs76ac0wswN7lxcD6cLgPlVgLI
	YAzF/O3fEdSlfmYhJzM06FH/FUl4GufS8u64ouXB2Dis66hWCnaBKLIR3TUjkjZad6mviRjhhtH
	Sv9E/re79+cfQCUHiUgIqBPc3GyMa6jpqB75DsSR8wtsAqSOfioJHxNSQ3eqLokbyAg/LnKVChg
	PtJ5IeRNtWGlt9hNGV4XBKCI92O5L42oJuvRrQACIUt0NKgEPhM=
X-Google-Smtp-Source: AGHT+IGJ/qWe5PPqzuHBICQzeHVIVKp5crJzNNKXqyBfyk7uaOLcOkz/tYZnutpwUCMI1zF55cUgKQ==
X-Received: by 2002:a17:902:e844:b0:22c:3609:97ed with SMTP id d9443c01a7336-22e5ec9e997mr25272325ad.30.1746599540530;
        Tue, 06 May 2025 23:32:20 -0700 (PDT)
Received: from Black-Pearl. ([122.162.204.119])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22e15229384sm85805295ad.206.2025.05.06.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:32:20 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Wed, 07 May 2025 06:29:36 +0000
Subject: [PATCH 2/2] dt-binding: mmc: microchip,sdhci-pic32: convert text
 based binding to json schema
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-mchp-sdhci-v1-2-ed29de05295a@gmail.com>
References: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
In-Reply-To: <20250507-mchp-sdhci-v1-0-ed29de05295a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Update text binding to YAML.
Changes during conversion:
Add appropriate include statements for interrupts and clock-names
to resolve errors identified by `dt_binding_check` and `dtbs_check`.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../bindings/mmc/microchip,sdhci-pic32.txt         | 29 ----------
 .../bindings/mmc/microchip,sdhci-pic32.yaml        | 66 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
deleted file mode 100644
index f064528effed31f30d1d1c6e0b49c02e215d99af..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Microchip PIC32 SDHCI Controller
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the sdhci-pic32 driver.
-
-Required properties:
-- compatible: Should be "microchip,pic32mzda-sdhci"
-- interrupts: Should contain interrupt
-- clock-names: Should be "base_clk", "sys_clk".
-               See: Documentation/devicetree/bindings/resource-names.txt
-- clocks: Phandle to the clock.
-          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
-- pinctrl-names: A pinctrl state names "default" must be defined.
-- pinctrl-0: Phandle referencing pin configuration of the SDHCI controller.
-             See: Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-Example:
-
-	sdhci@1f8ec000 {
-		compatible = "microchip,pic32mzda-sdhci";
-		reg = <0x1f8ec000 0x100>;
-		interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&rootclk REF4CLK>, <&rootclk PB5CLK>;
-		clock-names = "base_clk", "sys_clk";
-		bus-width = <4>;
-		cap-sd-highspeed;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sdhc1>;
-	};
diff --git a/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ca0ca7df9ee991d8402bc4c62b1235ef5db2e85f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/microchip,sdhci-pic32.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PIC32 SDHI Controller
+
+description:
+  The Microchip PIC32 family of microcontrollers (MCUs) includes models with
+  Secure Digital Host Controller Interface (SDHCI) controllers, allowing them
+  to interface with Secure Digital (SD) cards. This interface is used for reading,
+  writing, and managing data on SD cards, enabling storage and data transfer
+  capabilities in embedded systems.
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+properties:
+  compatible:
+    const: microchip,pic32mzda-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: base_clk
+      - const: sys_clk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - pinctrl-names
+  - pinctrl-0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/microchip,pic32-clock.h>
+    mmc@1f8ec000 {
+        compatible = "microchip,pic32mzda-sdhci";
+        reg = <0x1f8ec000 0x100>;
+        interrupts = <191 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&rootclk REF4CLK>, <&rootclk PB5CLK>;
+        clock-names = "base_clk", "sys_clk";
+        bus-width = <4>;
+        cap-sd-highspeed;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_sdhc1>;
+    };
+...

-- 
2.43.0


