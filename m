Return-Path: <linux-mips+bounces-5434-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0435970B75
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 03:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0951C218AD
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 01:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10E311711;
	Mon,  9 Sep 2024 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eETF3mLZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03011CA1
	for <linux-mips@vger.kernel.org>; Mon,  9 Sep 2024 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725846446; cv=none; b=qxQ5FnY7RnvYjFM7RgfkqwNsxeHGVI4S9I7sfalTml+msNFhIdnLAsNzOUNN2i5+CUq76eHjQL13y2rWwftsv4mDLCdzmY0DqyjkW0cSJhCwPRRQHDIsrzJuNoVdbzibE6G5urOWGUAz5nq15wO8El9d1+ch0vmmdrOG+bJ93Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725846446; c=relaxed/simple;
	bh=+aoFoOM56dVAPgrGpnd/j/lHdz7Si4yDqNJxwC+lZzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lg8osn8yjF6jQRKuSp0VxhNjKv7h5foMsgXVD9wuwfDOETmrVgmnoZ2eyZDXPQ9YvS8av5M1/czsXYlBMTAaMmxluaifvcA/+X2L65AMO9kRvZqqmeYQIlFAPVz6zvyqK4cC64ZiUEo2FfTaH31OUe3T/xACBd3Gk5hcFS8/rWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eETF3mLZ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 80BF12C02A5;
	Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1725846436;
	bh=+zog77n3+6cdHWXMsHomzjiH+/wTr0SUd1Y1NuyMJGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eETF3mLZQ82BBxLGzgvy6ndpU6lkgwWFerCJndxafprzL2bwOCFUo+OCniIV8O+yp
	 u7/l+NjADDGC6zGH4pHfH6ckRQrz1ep6QF7rpXsXIerrCHtEHfBTibZI9P7s7GZ+K4
	 Dn09yihN6IgSRhw+I9+vMUc0G33Nw9sK/B7d0VbnP7jV6WctyLh818CXT5gzon9GDx
	 rwpDDsQ2BeyTX27wg1EF2uJ0cPRBtf0a/Q7EnFGA58Ph5Hvip3GG/5AxqHFNn5DIL+
	 xrZ2l9ulg8bLITAGwSb9f4XlqcrtcHNLWYkpSJU8p6DuK8R7pmVgLeOlOIT8/Qxljk
	 ZDvOyXP9DCjbg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66de53a40001>; Mon, 09 Sep 2024 13:47:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4385D13EE4F;
	Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 4062528031B; Mon,  9 Sep 2024 13:47:16 +1200 (NZST)
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
Date: Mon,  9 Sep 2024 13:47:06 +1200
Message-ID: <20240909014707.2003091-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
References: <20240909014707.2003091-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KIj5D0Fo c=1 sm=1 tr=0 ts=66de53a4 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=bBF1cVFT1NsCJIh9SSUA:9 a=3ZKOabzyN94A:10 a=lodiqALd0UDFbPdo5Gsx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek switch. Currently the only
supported feature is the syscon-reboot which is needed to be able to
reboot the board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/mfd/realtek,switch.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,switch.=
yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,switch.yaml b/=
Documentation/devicetree/bindings/mfd/realtek,switch.yaml
new file mode 100644
index 000000000000..84b57f87bd3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,switch.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Switch with Internal CPU
+
+description:
+  The RTL9302 ethernet switch has an internal CPU. The switch is a multi=
-port
+  networking switch that supports many interfaces. Additionally, the dev=
ice can
+  support MDIO, SPI and I2C busses.
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
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
+    switch0: ethernet-switch@1b000000 {
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
2.46.0


