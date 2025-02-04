Return-Path: <linux-mips+bounces-7674-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D950EA26A70
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 177AB166253
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140A01547E0;
	Tue,  4 Feb 2025 03:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CX2VrDh1"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65599153828
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638198; cv=none; b=qi/Cd3tE35LPGk9fSZEwjtWmXS6AHIer7jounAX0/i12ZZzE2PQa7D4Jl1mj9PGWeCEWL29UcfOsEiLrqI3Efg2XSGAhdBGtEnov1vAkVsfQuzR4VvQkVLFkhEEwaMHO12+UxIfFWeV6IGcOqAC6RpQiWkFnIIzIHwbNbi0NG1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638198; c=relaxed/simple;
	bh=N+a3DuHfCv0TS8UCtJAPb3qNmDiJqlPUXVW3aGDVgWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTkQpFHoFWn0yakZFfcQ0SGu7gT0hEMAvRTYCLxRJan/0Su2R7slc9A7MsKxWLKjmhSpsGz57AZTM+kBvUq/ouSfOx7jHNiQ1/fQ2oBWFMng+6/vuizloPQ/fDC2FIg68bpy8Kl2ilIjKyUzDH97MSJbpk4xPOW4APil0uuFnQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CX2VrDh1; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2E81D2C047F;
	Tue,  4 Feb 2025 16:03:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638196;
	bh=9EHrD9kV/69Up1jT2dF8LXwgTVXgnSyjYGIkM/TNGaQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CX2VrDh10nd4porvvj/knTwp+EpEAx98dCU6uoCtASorOP9GAYJnK/07ix7jwlWL6
	 5sKc0/hN+z+NjilxdXILaBX6yGtRVdkO2P/Bl7A/aEuM+S9XFgtyyyU5V/M1nsuLnA
	 H+tU8mv4A2M2TvagZLAkHkyv2KnmovBxaO8o22uTLzCbEi2FrmZLYOok1S60RJ7Zu7
	 /KHXecdJPmoo/I/IH6xT5Sggd904ngJ7ExcqxRmKs0AswznNJ9nBWHHw8mLN7pEVrS
	 vrkaMjdNu0WzT++qHcHoehjT632qz7XO5FeihjIcMnVVdc8AbTKfBQaMGL299UMYSu
	 1VPai9PTo6pvg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a183730000>; Tue, 04 Feb 2025 16:03:16 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 019BA13EE36;
	Tue,  4 Feb 2025 16:03:16 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id F141E2804B6; Tue,  4 Feb 2025 16:03:15 +1300 (NZDT)
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
	sander@svanheule.net,
	daniel@makrotopia.org,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next v6 3/6] dt-bindings: mfd: Add MDIO interface to rtl9301-switch
Date: Tue,  4 Feb 2025 16:02:46 +1300
Message-ID: <20250204030249.1965444-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a18374 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=5cQCLpD8v2SGHUEG_dEA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The MDIO controller is part of the switch on the RTL9300 family of
devices. Add a $ref to the mfd binding for these devices.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This patch is dependent on "dt-bindings: net: Add Realtek MDIO
    controller" which adds the realtek,rtl9301-mdio.yaml binding.
   =20
    Changes in v6:
    - Remove realtek,port property
    - Remove leftover mdio-controller node.
    - Fix some style issues.
    - Fuller example including the port to phy-handle mapping
    Changes in v5:
    - Note dependency on realtek,rtl9301-mdio.yaml patch
    - Add back reg property to the mdio-controller node.
    Changes in v4:
    - There is a single MDIO controller that has MDIO buses as children
    Changes in v3:
    - None
    Changes in v2:
    - None

 .../bindings/mfd/realtek,rtl9301-switch.yaml  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
index cb54abda5e6a..587fc3cf2524 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
@@ -43,6 +43,9 @@ patternProperties:
   'i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
=20
+  'mdio-controller@[0-9a-f]+$':
+    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
+
 required:
   - compatible
   - reg
@@ -113,15 +116,43 @@ examples:
         };
       };
=20
+      mdio-controller@ca00 {
+        compatible =3D "realtek,rtl9301-mdio";
+        reg =3D <0xca00 0x200>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        mdio-bus@0 {
+          reg =3D <0>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          phy1: ethernet-phy@0 {
+            reg =3D <0>;
+          };
+        };
+        mdio-bus@1 {
+          reg =3D <1>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          phy2: ethernet-phy@0 {
+            reg =3D <0>;
+          };
+        };
+      };
+
       ethernet-ports {
         #address-cells =3D <1>;
         #size-cells =3D <0>;
=20
         port@0 {
           reg =3D <0>;
+          phy-handle =3D <&phy1>;
         };
         port@1 {
           reg =3D <1>;
+          phy-handle =3D <&phy2>;
         };
       };
     };
--=20
2.48.1


