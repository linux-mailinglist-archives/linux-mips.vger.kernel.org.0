Return-Path: <linux-mips+bounces-5637-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19395984D7E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Sep 2024 00:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 813AB1F23A53
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 22:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDAA147C79;
	Tue, 24 Sep 2024 22:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="XdWxzd/3"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2F1474A5
	for <linux-mips@vger.kernel.org>; Tue, 24 Sep 2024 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216197; cv=none; b=ONfBy3ZzfjrYH+cUeSpdzg3ZTTX2OSIRNWqYr5jptW2tlELyUlBRjQlhnF4MYODprf8o76SubdcvfTPaWaE7L8jBl8H5do57m3t67Y5tH+7NmJwKj7KvP0aO7haJ1hg38ZXqgZ/lHvKxFM8CB3SB3xNfmMDfNdE3Dxp4t6jxXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216197; c=relaxed/simple;
	bh=vCfyi0P6vJSH18DWHJToP0WIPUQlwghMafMIdKfziVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e61Uzto4tDmX6uGyLjfQfSvumWVvKwbVpKf7lDNrdAKyhxCXF+56uyEs3w/zixUlEhwcMmedrmM+lci6h5x/KRHMxPYhZBfH9ieMcdXH/vap1WKewKppNvgekqpJUB6K/wtjQHgumq4VMtA6PLExTDwZ14ogxPy+cQsutJtkMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=XdWxzd/3; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 375BF2C06C5;
	Wed, 25 Sep 2024 10:16:32 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727216192;
	bh=xaaGUWzgEpub1GOLiM/9iGzVyVMBRJ7/BV3IdzmeQks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdWxzd/3ed6Hqq/TKwM3LdTuHJadN3ZDmLuDZHxLebbjoZP+aHieFpZninPx0tJmH
	 XJC0WFBOk8p/+TKeA+6LmPIWt6Ql+Cn9hcVtHTAZYYOGS5HESAe7pnmNCUwAHVHB7e
	 rGHN+yk+vbOcmmGsIyl3ODiMAkCX+MwLSmxsLK44t23VkEZwGXHr2yilA9jidZIoEA
	 YmnyXXDAuwiSmzxrLFdKIG+RvSYjEVPFVOecQpewtvj5GOJEaqKSxUtO7dqgaGyo6w
	 vn8qFaBRuV5W+5Iue9O9eL8GTsBwk5LKYE2VUEYCTSoRByobY3GGH6xCQ6d36HTTDB
	 RvbS+atXvnL4Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f33a3f0000>; Wed, 25 Sep 2024 10:16:31 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id BF1AF13EDA9;
	Wed, 25 Sep 2024 10:16:31 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id BD0E8280B00; Wed, 25 Sep 2024 10:16:31 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: krzk@kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RFC PATCH v4.5] dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
Date: Wed, 25 Sep 2024 10:16:26 +1200
Message-ID: <20240924221626.3290531-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
References: <9abd5e65-da40-4283-b60e-46be5f89e858@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f33a3f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=KE0q7ISAiYiA7USWQegA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek RTL9300 switches. The RTL9300
family is made up of the RTL9301, RTL9302B, RTL9302C and RTL9303. These
have the same SoC differ in the Ethernet switch/SERDES arrangement.

Currently the only supported features are the syscon-reboot and i2c
controllers. The syscon-reboot is needed to be able to reboot the board.
The I2C controllers are slightly unusual because they each own an SCL
pin (GPIO 8 for the first controller, GPIO 17 for the second) but have 8
common SDA pins which can be assigned to either controller (but not
both).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

This is my initial attempt at addressing Krzysztof's comments from my two
series. I expect there may still be a bit of discussion on the binding so=
 I'm
just sending this on it's own rather than the whole series.

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     |  98 ++++++++++++++++
 .../bindings/mfd/realtek,rtl9300-switch.yaml  | 110 ++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9300=
-switch.yaml

diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
new file mode 100644
index 000000000000..e8cf328b2710
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/realtek,rtl9300-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL I2C Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line=
 (which
+  if not-used for SCL can be a GPIO). There are 8 common SDA lines that =
can be
+  assigned to either I2C controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl9301-i2c
+          - realtek,rtl9302b-i2c
+          - realtek,rtl9302c-i2c
+          - realtek,rtl9303-i2c
+      - const: realtek,rtl9300-i2c
+
+  reg:
+    description: Register offset and size this I2C controller.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  '^i2c@[0-7]$':
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: The SDA pin associated with the I2C bus.
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@36c {
+      compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+      reg =3D <0x36c 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@0 {
+        reg =3D <0>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+
+      i2c@2 {
+        reg =3D <2>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        gpio@20 {
+          compatible =3D "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells =3D <2>;
+          reg =3D <0x20>;
+        };
+      };
+    };
+
+    i2c@388 {
+      compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+      reg =3D <0x388 0x14>;
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      i2c@7 {
+        reg =3D <7>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.yaml
new file mode 100644
index 000000000000..713cf3211569
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9300-switch.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl9300-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Switch with Internal CPU
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9302 is an Ethernet switch with an integrated CPU. A number of
+  different peripherals are accessed through a common register block,
+  represented here as a syscon node.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl9301-switch
+          - realtek,rtl9302b-switch
+          - realtek,rtl9302c-switch
+          - realtek,rtl9303-switch
+      - const: realtek,rtl9300-switch
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+
+  i2c:
+    $ref: /schemas/i2c/realtek,rtl9300-i2c.yaml#
+
+required:
+  - compatible
+  - reg
+  - reboot
+
+additionalProperties: false
+
+examples:
+  - |
+    ethernet-switch@1b000000 {
+      compatible =3D "realtek,rtl9302c-switch", "realtek,rtl9300-switch"=
, "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+      #address-cells =3D <1>;
+      #size-cells =3D <1>;
+
+      reboot@c {
+        compatible =3D "syscon-reboot";
+        reg =3D <0x0c 0x4>;
+        offset =3D <0x0c>;
+        value =3D <0x01>;
+      };
+
+      i2c@36c {
+        compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+        reg =3D <0x36c 0x14>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        i2c@0 {
+          reg =3D <0>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+
+        i2c@2 {
+          reg =3D <2>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+      };
+
+      i2c@388 {
+        compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
+        reg =3D <0x388 0x14>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        i2c@7 {
+          reg =3D <7>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+          gpio@20 {
+            compatible =3D "nxp,pca9555";
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            reg =3D <0x20>;
+          };
+        };
+      };
+    };
+
--=20
2.46.1


