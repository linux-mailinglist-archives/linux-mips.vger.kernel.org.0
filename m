Return-Path: <linux-mips+bounces-3733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F790D6CD
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 314DC1C24F08
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CCD139568;
	Tue, 18 Jun 2024 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ipYjZ3gf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TxgO+B4b"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D08120A;
	Tue, 18 Jun 2024 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723492; cv=none; b=VgdC0J+e3jRzJ5Byza7eLPhSNO+YP0PAMQzrz47P1njd+AI5rmi6n1Vebs1usa4XdcSRLYzwn74Q3shplXWpTWOX3pD7ONcLB6kVo+tHtwVlmqEYY+rePpzxnKq8tiCLd+ESA/jfxUSGV9lMvxppOyOiZ2GgHKZn0EwF1Nfv7B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723492; c=relaxed/simple;
	bh=EGs/L0ersYDi7FFZb1HRGrUxBi/oc2LRg13X2yBKvAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aED9p0GOH7tJYcTXsJRHe0CoUCwhr5EayDMlzNcT9TLCTqjekzCb02T18aip/iBEdbfggzrJJuEJBDkrYrbQJuYQen8seonSH977CFKzDZ27Wl7mZQj9uKVdX1fcUWN1B2piqCN1kRO7uRoFRVwxrhfEmpmK50j/xbvOiJ3ckNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ipYjZ3gf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TxgO+B4b; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 4447018000A2;
	Tue, 18 Jun 2024 11:11:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 18 Jun 2024 11:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723489;
	 x=1718809889; bh=6JCCT9vFQjkyT9Y0QaS6AanK/xt+H5liO9Oo/z9aq+Y=; b=
	ipYjZ3gfroSmfr1uWG5fGE5UWl5BIoi+qLNgzto4fI2PUP9OrOrR8i9JcYcGskkS
	nd410fWhXh2BMpmtbaZ1TfOLI7x3WlTGcXNKUOb0VjHN4m62ZauEoidDrYDH57u/
	CVq0ry7Xf4SLfHEOqVmI0P5Cw/Jc6b7JjO2ILzPUhmjLc1eg7htW1yxd9aFECxp0
	0HcZKOlQx12FERW/mSL3nedZjD4dsaEBnZMu4zwGNWkqmZFQ2f0HO933CgTjePc/
	alulh/wo4XiVx4WpOSveKakFUT6Imbfs84veqqVg85Dc2xx8FMstCk1Hra1qur4n
	88UAY84R96jaN75MUjS2PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723489; x=
	1718809889; bh=6JCCT9vFQjkyT9Y0QaS6AanK/xt+H5liO9Oo/z9aq+Y=; b=T
	xgO+B4bJzS+Ig53VI2nZVLfpYBwkETaxxVZW4NHuajpqA4d7dCC4KgBvUikO1gp3
	Ccl03DSxliaL6GkekaQ4IBpHwVZePP/yQk2YIoZAXgGCUkYvNeIZyhxfeoFyAJqN
	7j5pPPFYDKa3VavsOol2sn8gZvLgq4TIaJN6i6SexuswWE3Ghw7zQpNXK20I3+v9
	v3+ZI93tWzfj8aRwsMkH2X8H0Va2UZ1xsi1QLIMmfdIBRzM5uwPprVOVzRU4dgvX
	lkDT2+sC8Hg0liLa13xRODDcByb1BJxTdFselTXvfy4057l4pw6N3Hor4hKKzw/M
	lke6A6lAu9iSUsJOhNTVw==
X-ME-Sender: <xms:oaNxZgm7A9eUbY-Zjb-1YGlw8Tj-xbRAsG8miYRe-0104qQL7Q2Jiw>
    <xme:oaNxZv3U4mhi2_IwsyqzDb-oHEALn9Vr5S2qAPychhXLLvGx1NgszWF8H8ZSgp0vq
    tKCP5dUrZ6Ytol-60k>
X-ME-Received: <xmr:oaNxZupVjCrhlHFboYgJHJPFG2pucbEOpX8xN31_wpFPe0VgoVHc8s4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnheptdffudefteeijeeljedtvdekteduvedtkeetheefkeetkedu
    tdetkefhfeeuffdvnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:oaNxZsk8jJcMcCmpPUqCFGg1ua0L-fygV5mZEbZQtXRbzJDZTlczJg>
    <xmx:oaNxZu074hipfpxTp_6ddEx1SwvR1IIwk6m57JsNJKhXlCPo4s64JQ>
    <xmx:oaNxZjsOjR8jdHZXDnDG9nd_3cscjOPFbzlFoVq-9rAuMCPkRdfKqQ>
    <xmx:oaNxZqWi2eQGj2SdtkWSOP2uWfF5U4Nw3y3XjmOFrCfHB7yp0ke18w>
    <xmx:oaNxZnujs61Vzwr1r65z7YWm74UOpn7n4TuTIXrVC93SIP4Rrgb3mFik>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:27 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:07 +0100
Subject: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3776;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=EGs/L0ersYDi7FFZb1HRGrUxBi/oc2LRg13X2yBKvAE=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb2J96ZYuYhxiB+aYt64znyplliYfnPI1ziFQwfEb
 y3eZ7+ro5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACbSdJnhf6F5ryWrnujfLsYp
 P6bKiZaGH3il+i30/gSHFw+aj2uVLGX4X5kjny45I/bB1rfWuQ80DR5sSrpTo3PnMH+2UpNFluc
 rXgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

This compatible has been used in arch/mips/boot/dts/img/boston.dts
for a while but never documented properly.

Write a new binding for this device.
This also covers old img,boston-clock binding so remove that binding.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Rename clock and reboot node
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
index 000000000000..79cae87c6758
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
+  clock-controller:
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
+  reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+
+required:
+  - compatible
+  - reg
+  - clock-controller
+  - reboot
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
+      clk_boston: clock-controller {
+        compatible = "img,boston-clock";
+        #clock-cells = <1>;
+      };
+
+      reboot: reboot {
+        compatible = "syscon-reboot";
+        regmap = <&plat_regs>;
+        offset = <0x10>;
+        mask = <0x10>;
+      };
+    };

-- 
2.43.0


