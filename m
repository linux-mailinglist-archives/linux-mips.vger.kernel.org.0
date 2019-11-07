Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC15F2D48
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 12:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbfKGLST (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 06:18:19 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:20476 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387964AbfKGLST (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 06:18:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573125495;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=IY6Eulbt2jyl28hkhi/AyASn70Nx6tDbWDifM+F27ZI=;
        b=Ff3gjTt/REZlvxp7RPNUN9/RIc+VokxJ9sINP3shu3m01/V0kvxvzrfiHzrFv2wgfo
        Y7vxLEQ9XrI3LK78ePgbrtO/44sVAg/oOpVAurB6DCP4j2IlZyiwC9RpYeGxbF0WGm2w
        /71kYzSufJLc4zQOmvW82F1BqUiiuUEJWjE/ZSHJCAcfL1mIu93vUAjFkh3c5kigcXL2
        5KwUvVqXM/zme8Kq0gjSJE7lFfNsEhoEFVTqysFRg6WObh6vvXusg0hZnQ9jitinAfQJ
        K7K4HJwW6eTqviCRL3oP4fgAZ71J7gzK3mUvk4VzNIMdZ+ha7M5KIekOtboQLHGQxhE2
        wAKA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Ddgr
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:13 +0100 (CET)
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
Subject: [PATCH v2 1/8] RFC: dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date:   Thu,  7 Nov 2019 12:06:04 +0100
Message-Id: <4292cec1fd82cbd7d42742d749557adb01705574.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
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

Clock, Reset and power management should be handled
by a parent node or elsewhere.

---

I have used the doc2yaml script to get a first veryion
but I am still stuggling with the yaml thing. My impression
is that while it is human readable, it is not very human
writable... Unfortunately I haven't found a good tutorial
for Dummies (like me) for bindings in YAML.

The big problem is not the YAML syntax but what the schema
should contain and how to correctly formulate ideas in this
new language.

Specific questions for this RFC:

* formatting: is space/tab indentation correct?
* are strings with "" correct or without?
* how do I specify that there is a list of compatible strings required in a specific order?
* but there are multiple such lists, and only one of them is to be chosen?
* how can be described in the binding that there should be certain values in
  the parent node (ranges) to make it work?

I was not able to run

	make dt_binding_check dtbs_check

due to some missing dependencies (which I did not want to
invest time to research them) on my build host, so I could
not get automated help from those.
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..b1b021601c47
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: None
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/gpu/img,pvrsgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination PVR/SGX GPU
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+description: |+
+  This binding describes the Imagination SGX5 series of 3D accelerators which
+  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
+  Allwinner A83, and Intel Poulsbo and CedarView.
+
+  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by
+  this binding.
+
+  The SGX node is usually a child node of some DT node belonging to the SoC
+  which handles clocks, reset and general address space mapping of the SGX
+  register area.
+
+properties:
+  compatible:
+    oneOf:
+      - item:
+        # BeagleBoard ABC, OpenPandora 600MHz
+        - const: "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530", "img,sgx5"
+        # BeagleBoard XM, GTA04, OpenPandora 1GHz
+        - const: "ti,omap3-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5"
+        # BeagleBone Black
+        - const: "ti,am335x-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5"
+        # Pandaboard (ES)
+        - const: "ti,omap4-sgx540-120", "img,sgx540-120", "img,sgx540", "img,sgx5"
+        - const "ti,omap4-sgx544-112", "img,sgx544-112", "img,sgx544", "img,sgx5"
+        # OMAP5 UEVM, Pyra Handheld
+        "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5"
+        "ti,dra7-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5"
+        # CI20
+        "ingenic,jz4780-sgx540-120", "img,sgx540-120", "img,sgx540", "img,sgx5";
+
+  reg:
+    items:
+      - description: physical base address and length of the register area
+
+  interrupts:
+     items:
+      - description: interrupt from SGX subsystem to core processor
+
+  clocks:
+     items:
+      - description: optional clocks
+
+  required:
+    - compatible
+    - reg
+    - interrupts
+
+examples: |
+  gpu@fe00 {
+  	compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
+   	reg = <0xfe00 0x200>;
+   	interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+  };
+
+
+historical: |
+  Imagination PVR/SGX GPU
+
+  Only the Imagination SGX530, SGX540 and SGX544 GPUs are currently covered by this binding.
+
+  Required properties:
+  - compatible:	Should be one of
+  		"ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530", "img,sgx5"; - BeagleBoard ABC, OpenPandora 600MHz
+  		"ti,omap3-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5"; - BeagleBoard XM, GTA04, OpenPandora 1GHz
+  		"ti,am3517-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5";
+  		"ti,am335x-sgx530-125", "img,sgx530-125", "img,sgx530", "img,sgx5"; - BeagleBone Black
+  		"ti,omap4-sgx540-120", "img,sgx540-120", "img,sgx540", "img,sgx5"; - Pandaboard (ES)
+  		"ti,omap4-sgx544-112", "img,sgx544-112", "img,sgx544", "img,sgx5";
+  		"ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5"; - OMAP5 UEVM, Pyra Handheld
+  		"ti,dra7-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
+  		"ti,am3517-sgx530-?", "img,sgx530-?", "img,sgx530", "img,sgx5";
+  		"ti,am43xx-sgx530-?", "img,sgx530-?", "img,sgx530", "img,sgx5";
+  		"ti,ti81xx-sgx530-?", "img,sgx530-?", "img,sgx530", "img,sgx5";
+  		"img,jz4780-sgx540-?", "img,sgx540-?", "img,sgx540", "img,sgx5"; - CI20
+  		"allwinner,sun8i-a83t-sgx544-?", "img,sgx544-116", "img,sgx544", "img,sgx5"; - Banana-Pi-M3 (Allwinner A83T)
+  		"intel,poulsbo-gma500-sgx535", "img,sgx535-116", "img,sgx535", "img,sgx5"; - Atom Z5xx
+  		"intel,medfield-gma-sgx540", "img,sgx540-116", "img,sgx540", "img,sgx5"; - Atom Z24xx
+  		"intel,cedarview-gma3600-sgx545", "img,sgx545-116", "img,sgx545", "img,sgx5"; - Atom N2600, D2500
+
+  		The "ti,omap..." entries are needed temporarily to handle SoC
+  		specific builds of the kernel module.
+
+  		In the long run, only the "img,sgx..." entry should suffice
+  		to match a generic driver for all architectures and driver
+  		code can dynamically find out on which SoC it is running.
+
+
+  - reg:		Physical base address and length of the register area.
+  - interrupts:	The interrupt numbers.
+
+  / {
+  	ocp {
+  		sgx_module: target-module@56000000 {
+  			compatible = "ti,sysc-omap4", "ti,sysc";
+  			reg = <0x5600fe00 0x4>,
+  			      <0x5600fe10 0x4>;
+  			reg-names = "rev", "sysc";
+  			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+  					<SYSC_IDLE_NO>,
+  					<SYSC_IDLE_SMART>;
+  			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+  					<SYSC_IDLE_NO>,
+  					<SYSC_IDLE_SMART>;
+  			clocks = <&gpu_clkctrl OMAP5_GPU_CLKCTRL 0>;
+  			clock-names = "fck";
+  			#address-cells = <1>;
+  			#size-cells = <1>;
+  			ranges = <0 0x56000000 0x2000000>;
+
+  			gpu@fe00 {
+  				compatible = "ti,omap-omap5-sgx544-116", "img,sgx544-116", "img,sgx544", "img,sgx5";
+  				reg = <0xfe00 0x200>;
+  				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+  			};
+  		};
+  	};
+  };
-- 
2.23.0

