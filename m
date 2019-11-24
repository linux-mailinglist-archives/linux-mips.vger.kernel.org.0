Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2920D108339
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2019 12:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfKXLlQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Nov 2019 06:41:16 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:22791 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfKXLkl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 24 Nov 2019 06:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574595638;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p1M6fkuAe26I/SlshzldxXtzQYOaMabxzYNQKoP0en4=;
        b=C8EUi4QXr6eMod7h8eR6YjpUH6fC8KqRvZGjClm8dwQBAsEFSfPARJsJUcnlNS0vdC
        EZb/1vX1sWy1+hBhHgOJ2ONm/5ZiMojrHwyibA3CqCon4ujgLXYAkkxZ2hYvb/onicql
        uDbnGcSmaRE55rRl2IQmEzFiQV3STuC4MjOuCjtBf0b4BjxO2PKNWzNfgQ0XYNGPY8ky
        faLUnqGYXrq5zuRqa5vSc+CFiDbLC/dWIxY10TMNcxSmJlnxbsS93EZkdBWJkN1YsAtb
        oX4AR10EhxOTnBATcezA+9Y5V32m08vesu7JhmG++M3rNqcnqyAIyyH2DERSBEMhwBWE
        Ep2Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4HEaKeuIV"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vAOBeTwER
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sun, 24 Nov 2019 12:40:29 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 1/8] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date:   Sun, 24 Nov 2019 12:40:21 +0100
Message-Id: <c93eff41b4a85ec01fa01819af8a380b7465e01c.1574595627.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1574595627.git.hns@goldelico.com>
References: <cover.1574595627.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Imagination PVR/SGX GPU is part of several SoC from
multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo
and others.

With this binding, we describe how the SGX processor is
interfaced to the SoC (registers, interrupt etc.).

In most cases, Clock, Reset and power management is handled
by a parent node or elsewhere.

Tested by make dt_binding_check dtbs_check

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..fe206a53cbe1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination PVR/SGX GPU
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |+
+  This binding describes the Imagination SGX5 series of 3D accelerators which
+  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
+  Allwinner A83, and Intel Poulsbo and CedarView and more.
+
+  For an almost complete list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
+  
+  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by
+  this binding but the extension of the pattern is straightforward.
+  
+  The SGX node is usually a child node of some DT node belonging to the SoC
+  which handles clocks, reset and general address space mapping of the SGX
+  register area.
+
+properties:
+  compatible:
+    enum:
+    # BeagleBoard ABC, OpenPandora 600MHz
+      - ti,omap3-sgx530-121, img,sgx530-121, img,sgx530, img,sgx5
+    # BeagleBoard XM, GTA04, OpenPandora 1GHz
+      - ti,omap3-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
+    # BeagleBone Black
+      - ti,am3352-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
+    # Pandaboard, Pandaboard ES
+      - ti,omap4-sgx540-120, img,sgx540-120, img,sgx540, img,sgx5
+      - ti,omap4-sgx544-112, img,sgx544-112, img,sgx544, img,sgx5
+    # OMAP5 UEVM, Pyra Handheld
+      - ti,omap5-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
+      - ti,dra7-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
+    # CI20
+      - ingenic,jz4780-sgx540-120, img,sgx540-120, img,sgx540, img,sgx5
+    # the following entries are not validated with real hardware
+    # more TI
+      - ti,am3517-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
+      - ti,am4-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
+      - ti,ti81xx-sgx530-125, img,sgx530-125, img,sgx530, img,sgx5
+    # Banana-Pi-M3 (Allwinner A83T)
+      - allwinner,sun8i-a83t-sgx544-116, img,sgx544-116, img,sgx544, img,sgx5
+    # Atom Z5xx
+      - intel,poulsbo-gma500-sgx535, img,sgx535-116, img,sgx535, img,sgx5
+    # Atom Z24xx
+      - intel,medfield-gma-sgx540, img,sgx540-116, img,sgx540, img,sgx5
+    # Atom N2600, D2500
+      - intel,cedarview-gma3600-sgx545, img,sgx545-116, img,sgx545, img,sgx5
+
+  reg:
+    maxItems: 1
+    description: physical base address and length of the register area
+
+  interrupts:
+    maxItems: 1
+    description: interrupt line from SGX subsystem to core processor
+
+  clocks:
+    description: optional clocks
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu@fe00 {
+      compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
+      reg = <0xfe00 0x200>;
+      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.23.0

