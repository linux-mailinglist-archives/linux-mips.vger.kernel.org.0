Return-Path: <linux-mips+bounces-5599-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF54197CF73
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 02:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 022231C21EEA
	for <lists+linux-mips@lfdr.de>; Fri, 20 Sep 2024 00:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015AD8460;
	Fri, 20 Sep 2024 00:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="kX+yTKl2"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7D510F1
	for <linux-mips@vger.kernel.org>; Fri, 20 Sep 2024 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790506; cv=none; b=uVYm9eU5wNhIG/ZCoo+w7ZZqHgZeIB3rdNsfRcDfr04dr7UY/WN45L5psCWdbKW/r4Nx5M9jtRhVle589fiuVdOGmk7dHqSP3XT9/1WML4zTYreIl4dJ4HF+smqZ1Js6opAcqTyGsykRJIRQlWQjMQhUmyiRSdxu+85QPP3ODLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790506; c=relaxed/simple;
	bh=alzAKM7GjraxAKGNRQzzS1bm3jhDdeY2QlPPbu54nE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Md9MB6EHxvxl+2CvJk+Px3r5SlR8lXXHtrWGODkBY3ij4mMYe7GWAtp/1e66N3zv65K6tZdm3J497gWyJdSC157mprb2qdHAPP6ascnK7N+Tt5NUhgMwc1IrHbXR2UrnerjMOWKPWIchL58guY/hPeZSg1RMtAFhTLj/pnlnhL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=kX+yTKl2; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0DF292C0580;
	Fri, 20 Sep 2024 12:01:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726790501;
	bh=r/SysA06cz+g/+g/douOrBfp/O7mBxLIyC8pNuisR9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kX+yTKl2Jpc/e8KsDuj+838ZWjY3i+4psaax1v61zBncr+jAu4YVvfOVYL2ippWRr
	 k6WFYYsGUlOYv2Lnee7VkYJ/Ov+TRRdNOQlWg8u7YYFjVVafbo27w2PPMmbh4O3gK4
	 AtiQbenZmTus5apaMcXDUcDwHgWNKX9QvjhnXevDI9F5WlBtvRxShcTF4lOgfAdbP7
	 IuI/KiAioEO0C1wg+DRmCDgxHIMcxRlQdbCXcgJTXNaGIp/VyuBbNTqXiiC7vtOIku
	 HB7yGkoNp5FMnledVhcF+Dn4r/GftFVAKrxYo3Gm5EedtWgBHHEyS+cegrcMMxd/YN
	 uZisgvFnP/sVA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ecbb640001>; Fri, 20 Sep 2024 12:01:40 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id BC81113EE6D;
	Fri, 20 Sep 2024 12:01:40 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id B831028044C; Fri, 20 Sep 2024 12:01:40 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/2] dt-bindings: mfd: Add Realtek switch
Date: Fri, 20 Sep 2024 12:01:37 +1200
Message-ID: <20240920000138.1826123-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920000138.1826123-1-chris.packham@alliedtelesis.co.nz>
References: <20240920000138.1826123-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ecbb64 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=RqFMS8Kk0ItR_bseB4sA:9 a=3ZKOabzyN94A:10 a=lodiqALd0UDFbPdo5Gsx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek switch. Currently the only
supported feature is the syscon-reboot which is needed to be able to
reboot the board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - fix schema id to match filename
    Changes in v2:
    - use filename that matches the compatible
    - put maintainers after title
    - remove unnecessary label in example
    - Rework description to focus on what is implemented rather than what
      may be implemented in the future.

 .../bindings/mfd/realtek,rtl9302c-switch.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9302=
c-switch.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switc=
h.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.ya=
ml
new file mode 100644
index 000000000000..2d20dd07a7e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl9302c-switch.yaml#
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
+          - realtek,rtl9302c-switch
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
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
+      compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+
+      reboot {
+        compatible =3D "syscon-reboot";
+        offset =3D <0x0c>;
+        value =3D <0x01>;
+      };
+    };
+
--=20
2.46.1


