Return-Path: <linux-mips+bounces-3734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F5390D6D2
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D93961C25104
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E0D13AA41;
	Tue, 18 Jun 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="s+cMBBVN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PEOVA0l6"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83802137757;
	Tue, 18 Jun 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723496; cv=none; b=lXz36h5kG7hbn+GmkOBG40WBS24XE+9eHkKh0B2XEciA+9esv1XtkFZq4wnJB1KChONRaCbNAXFHyxbgI6s3KY2YRayWtArZs4yZutJzyXHTWy624BOrwsXI7Ro2qJt3q0erh5JwrLqirkb/xklWYkiwYwkGkvHx7gT1VpD6PW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723496; c=relaxed/simple;
	bh=HbywrLNjiENzD/e6xffmJVBjKdIskJSRjWMdv+Fu+oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1jVM3KutzDEIkbYjRAgkGd6QndaKfNoH8Il7QwWvFRbadXydkuexJ/hFxyg+ll4mFE2BELziWUFShvmsHWouILadfVwIVW1hHI/wWFJhcmO7JjtvQ0bywnLGpQIyhCWB2N27S2F5QE2KZoAVsiDAh31RxL2UzAmPBlOk8pT3tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=s+cMBBVN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PEOVA0l6; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3939D18000A2;
	Tue, 18 Jun 2024 11:11:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 18 Jun 2024 11:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718723492;
	 x=1718809892; bh=XU+S+B83Z/eXy8X+kkx10rXFqy+1VjvkkGoZYG1E8vY=; b=
	s+cMBBVNQblKBx7ubPA5osIQYblEm3ySGgTqCwhiIAVPteswzLfs+jU0wr1t59L4
	24xT5Gp6AzxNEgXMb6xH8QdS6Wf/2EPIG6j9IP4Y/m+YRDMI7F4SJhjV0l6rlcSV
	ACgiLYujT2drp5IFti4A8PVufSPgmNfnigLjY6BwgqTCh7oaiNlRfc/BjehtFsJ4
	eH78ED/nnOrAtulYIh785V1WhqSJI1a1rzuLpDtPh4Dai5sEDf7zAU59scklvuuU
	RHyZDTvSQCXWYzMf191BtGsaWo5pKGdtXi1FsNq5W6PAQHow4sJuT8yTemCx/VGG
	3jy62vY5AE5o3eUgjp5Agw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718723492; x=
	1718809892; bh=XU+S+B83Z/eXy8X+kkx10rXFqy+1VjvkkGoZYG1E8vY=; b=P
	EOVA0l6pHxEFKP7ddV02Af75DIrzhMjD8hMOXJu/POJLCCz6VnjOKh7+WHVQ+YlT
	DwSG10IRnkqU5rGaz2ouyMwCfii6BL/le91M4Cl9b/Rr7Jq41nquHGsjIH5ib7v+
	6stYfC/UxjjBbTe2B1czz4vIRu/UeNXYhU3+rhq8Pt/jsQS5eMoDK6z1aWz1Fkku
	qemSXQSXRdRtWrFtbQBZoycUfbcfGiifFvJk3sAxf99IKJD5ZTk73NH0rGfMUFDv
	lqrC+XfDZS4X/nCHwHPDiFdEvO0cmu5qj6si4lcXpzmX1J2a8yg9a4fvLSwvDNt3
	C6nKVIn3QmhFpLF95+l2w==
X-ME-Sender: <xms:pKNxZtrzj02hdy2LDi5CtAVrbmHKyZOFzun_zamlfIUFIbjAMpfwEg>
    <xme:pKNxZvrLTnw5nbkqmbBhihGzagicuc1ETTdQnlPhh-HoJkoMAdDyZHdkGB3RtiGlZ
    MO7Vi2rcgZfdu9OxzM>
X-ME-Received: <xmr:pKNxZqPNp4YljfOUafUTH_lweQCsl2NkKEXZrVxAutdlXFzhA9RYnwc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepkeevkeefjeekudejvdeuffeufeeigfegfeekleevffekgeef
    geegtedtjeefffdunecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghdptghrvg
    grthhorhguvghvrdhiohdpphhrphhlfhhouhhnuggrthhiohhnrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrg
    hnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pKNxZo5sWkn_zsVzaR9HzHzHhd8AvzT03EtY_BIdycjTrIKn2vIWfg>
    <xmx:pKNxZs6QM-xUU3Yyat4XvJ6uga_1TIN88IZqutdMbH2BQ21wz0jk7A>
    <xmx:pKNxZghY3IgtapyErPPYEPtyzzYLYYfvEcunc_LYqG7r4KrphxkiBg>
    <xmx:pKNxZu485sbrd0U7T4oPTfc4SSF5eHQFOz7ZT-YauXJU1JgzesrJKQ>
    <xmx:pKNxZpzy981QXOh18c4Z9ytpneCI4f4wH10MlwEPJQwl5qXh9PCUGDuE>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:31 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 18 Jun 2024 16:11:08 +0100
Subject: [PATCH v3 8/8] dt-bindings: mips: img: Add devices binding
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-boston-syscon-v3-8-c47c06647a26@flygoat.com>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
In-Reply-To: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6540;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=HbywrLNjiENzD/e6xffmJVBjKdIskJSRjWMdv+Fu+oY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxb0iWgWrvsRcL3Zyqtg4b+O32BWyfGV/91bprgxrv
 LlL89y2jlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjIyduMDI8dGpx1M4MjnS7W
 Gu+WbnZ7dm2vRDZLQOCUeccb9pa2tzH8z2L+Znbr/v1NlRwHn17yXBplwPJhsvcP9wvHGIsPzdF
 YxwMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Add devices binding for various Imagination Technologies
MIPS based Platforms.

Remove old documents.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Remove old bindings, they are not relavant any more.
    Booting protocol stuff is covered by spec.
---
 .../devicetree/bindings/mips/img/devices.yaml      | 33 +++++++++
 .../bindings/mips/img/pistachio-marduk.txt         | 10 ---
 .../devicetree/bindings/mips/img/pistachio.txt     | 42 -----------
 .../devicetree/bindings/mips/img/xilfpga.txt       | 83 ----------------------
 4 files changed, 33 insertions(+), 135 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/img/devices.yaml b/Documentation/devicetree/bindings/mips/img/devices.yaml
new file mode 100644
index 000000000000..460ca96577ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/img/devices.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/img/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies MIPS based Platforms
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: IMG Boston
+        const: img,boston
+
+      - description: IMG Marduk (Creator Ci40)
+        items:
+          - const: img,pistachio-marduk
+          - const: img,pistachio
+
+      - description: Imagination University Program MIPSfpga
+        items:
+          - const: img,xilfpga
+          - const: digilent,nexys4ddr
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt b/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
deleted file mode 100644
index 2d5126d529a2..000000000000
--- a/Documentation/devicetree/bindings/mips/img/pistachio-marduk.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Imagination Technologies' Pistachio SoC based Marduk Board
-==========================================================
-
-Compatible string must be "img,pistachio-marduk", "img,pistachio"
-
-Hardware and other related documentation is available at
-https://docs.creatordev.io/ci40/
-
-It is also known as Creator Ci40. Marduk is legacy name and will
-be there for decades.
diff --git a/Documentation/devicetree/bindings/mips/img/pistachio.txt b/Documentation/devicetree/bindings/mips/img/pistachio.txt
deleted file mode 100644
index a736d889c2b8..000000000000
--- a/Documentation/devicetree/bindings/mips/img/pistachio.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Imagination Pistachio SoC
-=========================
-
-Required properties:
---------------------
- - compatible: Must include "img,pistachio".
-
-CPU nodes:
-----------
-A "cpus" node is required.  Required properties:
- - #address-cells: Must be 1.
- - #size-cells: Must be 0.
-A CPU sub-node is also required for at least CPU 0.  Since the topology may
-be probed via CPS, it is not necessary to specify secondary CPUs.  Required
-propertis:
- - device_type: Must be "cpu".
- - compatible: Must be "mti,interaptiv".
- - reg: CPU number.
- - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.txt for
-   details on clock bindings.
-Example:
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "mti,interaptiv";
-			reg = <0>;
-			clocks = <&clk_core CLK_MIPS>;
-		};
-	};
-
-
-Boot protocol:
---------------
-In accordance with the MIPS UHI specification[1], the bootloader must pass the
-following arguments to the kernel:
- - $a0: -2.
- - $a1: KSEG0 address of the flattened device-tree blob.
-
-[1] http://prplfoundation.org/wiki/MIPS_documentation
diff --git a/Documentation/devicetree/bindings/mips/img/xilfpga.txt b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
deleted file mode 100644
index 57e7ee942166..000000000000
--- a/Documentation/devicetree/bindings/mips/img/xilfpga.txt
+++ /dev/null
@@ -1,83 +0,0 @@
-Imagination University Program MIPSfpga
-=======================================
-
-Under the Imagination University Program, a microAptiv UP core has been
-released for academic usage.
-
-As we are dealing with a MIPS core instantiated on an FPGA, specifications
-are fluid and can be varied in RTL.
-
-This binding document is provided as baseline guidance for the example
-project provided by IMG.
-
-The example project runs on the Nexys4DDR board by Digilent powered by
-the ARTIX-7 FPGA by Xilinx.
-
-Relevant details about the example project and the Nexys4DDR board:
-
-- microAptiv UP core m14Kc
-- 50MHz clock speed
-- 128Mbyte DDR RAM	at 0x0000_0000
-- 8Kbyte RAM		at 0x1000_0000
-- axi_intc		at 0x1020_0000
-- axi_uart16550		at 0x1040_0000
-- axi_gpio		at 0x1060_0000
-- axi_i2c		at 0x10A0_0000
-- custom_gpio		at 0x10C0_0000
-- axi_ethernetlite	at 0x10E0_0000
-- 8Kbyte BootRAM	at 0x1FC0_0000
-
-Required properties:
---------------------
- - compatible: Must include "digilent,nexys4ddr","img,xilfpga".
-
-CPU nodes:
-----------
-A "cpus" node is required.  Required properties:
- - #address-cells: Must be 1.
- - #size-cells: Must be 0.
-A CPU sub-node is also required for at least CPU 0. Required properties:
- - device_type: Must be "cpu".
- - compatible: Must be "mips,m14Kc".
- - reg: Must be <0>.
- - clocks: phandle to ext clock for fixed-clock received by MIPS core.
-
-Example:
-
-	compatible = "img,xilfpga","digilent,nexys4ddr";
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "mips,m14Kc";
-			reg = <0>;
-			clocks	= <&ext>;
-		};
-	};
-
-	ext: ext {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <50000000>;
-	};
-
-Boot protocol:
---------------
-
-The BootRAM is a writeable "RAM" in FPGA at 0x1FC0_0000.
-This is for easy reprogrammibility via JTAG.
-
-The BootRAM initializes the cache and the axi_uart peripheral.
-
-DDR initialization is already handled by a HW IP block.
-
-When the example project bitstream is loaded, the cpu_reset button
-needs to be pressed.
-
-The bootram initializes the cache and axi_uart.
-Then outputs MIPSFPGA\n\r on the serial port on the Nexys4DDR board.
-
-At this point, the board is ready to load the Linux kernel
-vmlinux file via JTAG.

-- 
2.43.0


