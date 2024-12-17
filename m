Return-Path: <linux-mips+bounces-7070-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A49F59CD
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 23:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73E51892271
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 22:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767121FAC3D;
	Tue, 17 Dec 2024 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="KtPu9wWe"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901521DFE16
	for <linux-mips@vger.kernel.org>; Tue, 17 Dec 2024 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734475510; cv=none; b=kpK8/rqTCVlG47iYwobh+BYcONh58l0ptY6lhxJVQIrGPkq4MQuChyZpEdb6fDpNEmcHy3/7QMv5VNmZe/S+Smbji6snz/u8okQ17xlsx3RXlf9QPfke0tkcR6/b2i55DrwfOJXloStrJXPV5foF1+2VpqmGXDl1hpQY1FIHjTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734475510; c=relaxed/simple;
	bh=8lT1ahxONqOGJZ2W/7meo3rIE0R6SKGMTP0GkGMmi70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBFeuPQkTDATlPoSWAWJVqLlkWOkA5s+27ns6+Qr9RtO8YONDWdup07S7g+kke2ONKSvf+hLSl6adLTkPWnFfLwkEJIUOi4TJeMvMQNmbAFG6M835w/+eDyYZacEUpd8uY5LMhrWteFfmpDlYt9Nxjdiedla9Gs99JytugZSJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=KtPu9wWe; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6B5F42C0BEC;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734475503;
	bh=re4odSfMbmvsC6H+xv5AIf+hkSUf3b+E22ZdTYieO0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtPu9wWeVAS2Bqq5OLql0QLo0ZfjHvUZ4INsiIltv1gbvcI+kHizs+H9sgUYtHjPm
	 J4FE8JlOnCbk+0ie5t7TSiB6yUxN4c0Yhi7GWDc8j2b0USdIGzmzkJ7flUxpIkBEPH
	 lgPVHRSvU55YLlTx5SWNzrjK8BrvyFQXTX0ggg2RcYfVCkyqkXHyWX6VaiaJYTMz9E
	 oPOW7SYFihLY7YXgwtJIKAlEiKYSG0NsB/FKJPpmx/V0ESGFRe/j3IjJ+BwCu22HoX
	 YFF27lhpn/CLa/ML13SjbZkL3CpNc68+8f78ffkqdPgK5PXfQZ9IseMigOcON6Q55W
	 Hdsii2OooCpKQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6761feef0001>; Wed, 18 Dec 2024 11:45:03 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0ADA213EE56;
	Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 059C72803EA; Wed, 18 Dec 2024 11:45:03 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tsbogend@alpha.franken.de,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 1/3] dt-bindings: net: Add Realtek MDIO controller
Date: Wed, 18 Dec 2024 11:44:59 +1300
Message-ID: <20241217224501.398039-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
References: <20241217224501.398039-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=6761feef a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=5T6DpigFOSMmFzbSVwsA:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
controller is slightly unusual in that direct MDIO communication is not
possible. Instead, the SMI bus and PHY address are associated with a
switch port and the port number is used when talking to the PHY.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---

Notes:
    Changes in v3:
    - Add r-by from Connor
    Changes in v2:
    - None

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
new file mode 100644
index 000000000000..95ed77ff8dcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/realtek,rtl9301-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL9300 MDIO Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+allOf:
+  - $ref: mdio.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl9302b-mdio
+              - realtek,rtl9302c-mdio
+              - realtek,rtl9303-mdio
+          - const: realtek,rtl9301-mdio
+      - const: realtek,rtl9301-mdio
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^ethernet-phy(@[a-f0-9]+)?':
+    type: object
+    $ref: ethernet-phy.yaml#
+
+    properties:
+      reg:
+        description:
+          The MDIO communication on the RTL9300 is abstracted by the swi=
tch. At
+          the software level communication uses the switch port to addre=
ss the
+          PHY with the actual MDIO bus and address having been setup via=
 the
+          realtek,smi-address property.
+
+      realtek,smi-address:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: SMI interface and address for the connected PHY
+        items:
+          - description: SMI interface number associated with the port.
+          - description: SMI address of the PHY for the port.
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@ca00 {
+        compatible =3D "realtek,rtl9301-mdio";
+        reg =3D <0xca00 0x200>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ethernet-phy@0 {
+            compatible =3D "ethernet-phy-ieee802.3-c45";
+            reg =3D <0>;
+            realtek,smi-address =3D <0 1>;
+        };
+
+        ethernet-phy@8 {
+            compatible =3D "ethernet-phy-ieee802.3-c45";
+            reg =3D <8>;
+            realtek,smi-address =3D <1 1>;
+        };
+    };
--=20
2.47.1


