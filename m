Return-Path: <linux-mips+bounces-3620-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FE9051D0
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B166A2873F8
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 11:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E4117A930;
	Wed, 12 Jun 2024 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="u3G+S7iF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AZDfayA8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37DB172BB4;
	Wed, 12 Jun 2024 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193418; cv=none; b=edRY01zaFcRqA7wm3Qc+NZMxH5Miio1H9VHY8Z7NK1m5AUPOC9M6uGXyMM98ESaIhNZWUn8Klg33UCzgpkgpX5x+ijp0RThzYIqwg8XCZ9AN9HBGpTkHl/iOeTAeLdB8lTpEdO76Y3fSEP1sw7calg+kXCn3NmHRQRW61dmPi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193418; c=relaxed/simple;
	bh=xIKhElFln1GNY1e3nvWaQfw4rZsPQq3ewLLglogAcgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyUkWoDZbM5ruRU8ilsBwtaySo3nmYV/PlOv/HakyjkCm5Y8CwT0YMkiAnKaFYSNwk+W2xuUf3rGjn6s13kARMYFZY+HpPSOGGvGZmJvlvT8c5zyC8xOcNdCHXY/qWpXyLDSjqNmJES9M9Y4eSfAna++LEzvsLWtKdcBfnC4lGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=u3G+S7iF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AZDfayA8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id E18481380125;
	Wed, 12 Jun 2024 07:56:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 12 Jun 2024 07:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718193415;
	 x=1718279815; bh=nXzfjl2EQ86nuLKlCuSCdAS8RjNMqJC4JS4BtvMz088=; b=
	u3G+S7iFKj0/OxBPrJZOlW6kLNF1U1cxgtQXd1btq0cpt4EclV3Sm1WIFEcXYM6P
	xDs8pgJr5UTCivk7hC7SeKyyB0otB6DpMVXw6VpAn/7Bygk/EEl76orQaFXtJRbi
	Dyr2RKIbnwQdz1MGOxRkUNLjdm7okMhuxAwwHg3rpd76dhreQ0oihalCMO9Kr9P4
	noznUNNiqUJL1RQs9j7NrDIRvvcyTC98C0Nnh2cU/+TiQ9oXEpkIZw6FRb1fUYff
	KZcUwiIAOPna1iiyfgy3of+Y9IxQzF65w7K4HPl1tg16x1fPT6IfoIAIRxSC133h
	dIo7wTsrgVeYGsI76sNIMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718193415; x=
	1718279815; bh=nXzfjl2EQ86nuLKlCuSCdAS8RjNMqJC4JS4BtvMz088=; b=A
	ZDfayA8yNWeX5BxIyXNCItSSzevpWrIRJjKUoI2hOao4jZHNM0OT1WrXgQI7mgBn
	/8DksenPX3w5a2qhFw7DjnIPUcsZNzsdZsUbq/liCX4VsrF0HtEhRZTMYG1YLcvL
	mmEjC/GZ8bgX9BQLI+n+yKg4bTUbAU4uqOv5v7XVEimIaVLVNkys60xy1K600pls
	9mJvbM1K9TlkTysV5xs2F5ajH9/wo8OAymCvOE3e/aRP+RP1ASzc12lgtPh8IU0v
	C4WEKJ/f90ebS9yQJQrtlUXFU8BaeQA9jJgFUeXfYc9ijtH8USpoBZAGHWc6qspg
	fSnoUUK3MGNTmvvnSdnTA==
X-ME-Sender: <xms:B41pZugn1bfv4wsLbhhrrr4FFIYo3w_81ObYNVal1bFGDRCehUxvtw>
    <xme:B41pZvCJcgm6VY-pH4HRKFf0LcTQe5ztX75OkzmWQMoteAjdYOd6ysI-cNSU9Kv8i
    Ad8JFpPztp-7SK5C2I>
X-ME-Received: <xmr:B41pZmGzUi4WOPxBax4R6OWQLaYH_mhb1tJqkufvY3gBQAHi1DJIca4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdffudefteeijeeljedtvdekteduvedtkeetheefkeetkedu
    tdetkefhfeeuffdvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:B41pZnTyrsZWU8wNVccIbQwYzezrP-JcWEa83ZZoSxlWz0fEJd6TIg>
    <xmx:B41pZrw3hR1ExaCITRPpviWTotTlnfjI1rrGWOi0RnZw_qnXSwWpzQ>
    <xmx:B41pZl4_AizWVBDANlqFyz-oYp18Jm19cG13rumHyQWU6i0w6D3K2Q>
    <xmx:B41pZowAKSNn32JwNSYqgq4ozehzzMyhs7ulVXN8cBFZ4ybj0E1_Xw>
    <xmx:B41pZgox2dptEIoMb-_6Y9r99v_3LRf-2UytNfkHA2Dq7Gt1Z-j8GZmQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 07:56:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 12 Jun 2024 12:56:25 +0100
Subject: [PATCH v2 6/8] dt-bindings: mfd: Add img,boston-platform-regs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-boston-syscon-v2-6-9f8e1a07fa63@flygoat.com>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
In-Reply-To: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=xIKhElFln1GNY1e3nvWaQfw4rZsPQq3ewLLglogAcgM=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTMnj+f/f5lOsYUmc54GfR64ZUdx36duNZmsrCJsdHp+
 jKRZ/NWdpSyMIhxMciKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEIt0YGS5OyDXiVlt5kqfy
 T9iey4ss9lqvSs/c9q3gae7Zg83OT20Y/gq9+tDX+CjBqepxbj6fjf4hWymP/7evTK/N6Wp80vj
 hExMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This compatible has been used in arch/mips/boot/dts/img/boston.dts
for a while but never documented properly.

Write a new binding for this device.
This also covers old img,boston-clock binding so remove that binding.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../devicetree/bindings/clock/img,boston-clock.txt | 31 ---------
 .../bindings/mfd/img,boston-platform-regs.yaml     | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/img,boston-clock.txt b/Documentation/devicetree/bindings/clock/img,boston-clock.txt
deleted file mode 100644
index 7bc5e9ffb624..000000000000
--- a/Documentation/devicetree/bindings/clock/img,boston-clock.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-Binding for Imagination Technologies MIPS Boston clock sources.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The device node must be a child node of the syscon node corresponding to the
-Boston system's platform registers.
-
-Required properties:
-- compatible : Should be "img,boston-clock".
-- #clock-cells : Should be set to 1.
-  Values available for clock consumers can be found in the header file:
-    <dt-bindings/clock/boston-clock.h>
-
-Example:
-
-	system-controller@17ffd000 {
-		compatible = "img,boston-platform-regs", "syscon";
-		reg = <0x17ffd000 0x1000>;
-
-		clk_boston: clock {
-			compatible = "img,boston-clock";
-			#clock-cells = <1>;
-		};
-	};
-
-	uart0: uart@17ffe000 {
-		/* ... */
-		clocks = <&clk_boston BOSTON_CLK_SYS>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
new file mode 100644
index 000000000000..bf94de38a89f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/img,boston-platform-regs.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/img,boston-platform-regs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies Boston Platform Registers
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+properties:
+  compatible:
+    items:
+      - const: img,boston-platform-regs
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock:
+    type: object
+
+    description: Boston Clock Controller Device Node
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/boston-clock.h for the full list of boston
+      clock IDs.
+
+    properties:
+      "#clock-cells":
+        const: 1
+
+      compatible:
+        const: img,boston-clock
+
+    required:
+      - "#clock-cells"
+      - compatible
+
+    additionalProperties: false
+
+  syscon-reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+
+required:
+  - compatible
+  - reg
+  - clock
+  - syscon-reboot
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/boston-clock.h>
+
+    plat_regs: system-controller@17ffd000 {
+      compatible = "img,boston-platform-regs", "syscon", "simple-mfd";
+      reg = <0x17ffd000 0x1000>;
+
+      clk_boston: clock {
+        compatible = "img,boston-clock";
+        #clock-cells = <1>;
+      };
+
+      reboot: syscon-reboot {
+        compatible = "syscon-reboot";
+        regmap = <&plat_regs>;
+        offset = <0x10>;
+        mask = <0x10>;
+      };
+    };

-- 
2.43.0


