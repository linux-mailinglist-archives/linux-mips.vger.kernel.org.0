Return-Path: <linux-mips+bounces-7842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233AA3A80D
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50651745A0
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255F31F582A;
	Tue, 18 Feb 2025 19:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ANwvycTN"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8424D1EFF8F
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908351; cv=none; b=IG37Gi0Q92p0YTJHvHSZD9toNfOMYDROqb+tZq4C62ewRScESzumdW8b0KyF/UnrEISKEWpFA9J+sLsQwL2f4Kj2tyMAGcEhbp63FdEnrWleSvWy38PqqnEfCP+jSRcOF45bAD2Q40DsFshX2fN9PP36hEWDlNQyR6BykfESl90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908351; c=relaxed/simple;
	bh=RHuOaB7d+UjSjoFMhnWKkDFLOPSIwKQCOC9zA/g1HOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVfBYW2dBkcVp5TOQNJ72onSPVZGid2qf4lnq83giR5Ur2O7LkuAqwJ15uLTSokU1CKnHtgfo7lUP1eKTT2rag1+l8u7PCvuqwj6X/7DWHy0hUTgkwy+bmu1Q6o9jMXBbHsJOw021t9gT0exYqkzCeYgxduDVNR0fFWwLH6+Cs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ANwvycTN; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0EB182C044A;
	Wed, 19 Feb 2025 08:52:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739908348;
	bh=jZNBKo8BJn+Cpmm+/0ORd6aDcui99DR/5RTy8qbveT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANwvycTNGFsVzV8BngrzJ0WSjMq9jfat/xE6yQuWh3jV9oJoUfh/Ke5H9R7z3YGbA
	 zz19x1+SzCVCRXuNzSu+VzoNKtKIhBIXNsVMgAtcl8FDYXmXyLXMrfwJLDZw10dGf3
	 WSHZXpVz51VstWbBQtwu4BRwV/99IkyRzM5BC3dNKKpbmhyrS1yGhljQWNFOQiEbjJ
	 IZBGT7Sxsg1jHOQWY/zvLBcYUoXpgPKHsqu51jcSWrc90zwuwlxjRIZghiJIriFaa2
	 NEAj6hU51TG2cnWoKQv1t2pts2E3yrPQLjt7LZCukfQ0xbmFNvLGN0pyY6QRqIj8Rf
	 L08PRpLXfwJLw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67b4e4fb0000>; Wed, 19 Feb 2025 08:52:27 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id A063713EE36;
	Wed, 19 Feb 2025 08:52:27 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9D10F2804FB; Wed, 19 Feb 2025 08:52:27 +1300 (NZDT)
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
	tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RESEND PATCH net-next 2/5] dt-bindings: net: Add switch ports and interrupts to RTL9300
Date: Wed, 19 Feb 2025 08:52:13 +1300
Message-ID: <20250218195216.1034220-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67b4e4fb a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=ONnuDqgNxj6Q2WPecnAA:9 a=3ZKOabzyN94A:10 a=o4McRIDJWpQDfD5EwD6I:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add bindings for the ethernet-switch and interrupt properties for the
RTL9300.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This is tecnically v7 of [1] changes from that are:
    - Use ethernet-switch.yaml#/$defs/ethernet-ports
    - Enforce "ethernet-ports" be used instead of just "ports"
    - Add interrupts for the switch block
   =20
    [1] - https://lore.kernel.org/lkml/20250204030249.1965444-2-chris.pac=
kham@alliedtelesis.co.nz/

 .../bindings/net/realtek,rtl9301-switch.yaml  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
index d0a93d5f03aa..5d29647bea2d 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
@@ -14,6 +14,8 @@ description:
   number of different peripherals are accessed through a common register=
 block,
   represented here as a syscon node.
=20
+$ref: ethernet-switch.yaml#/$defs/ethernet-ports
+
 properties:
   compatible:
     items:
@@ -28,12 +30,23 @@ properties:
   reg:
     maxItems: 1
=20
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: switch
+      - const: nic
+
   '#address-cells':
     const: 1
=20
   '#size-cells':
     const: 1
=20
+  ethernet-ports:
+    type: object
+
 patternProperties:
   'reboot@[0-9a-f]+$':
     $ref: /schemas/power/reset/syscon-reboot.yaml#
@@ -44,6 +57,8 @@ patternProperties:
 required:
   - compatible
   - reg
+  - interrupts
+  - interrupt-names
=20
 additionalProperties: false
=20
@@ -52,6 +67,9 @@ examples:
     ethernet-switch@1b000000 {
       compatible =3D "realtek,rtl9301-switch", "syscon", "simple-mfd";
       reg =3D <0x1b000000 0x10000>;
+      interrupt-parent =3D <&intc>;
+      interrupts =3D <23>, <24>;
+      interrupt-names =3D "switch", "nic";
       #address-cells =3D <1>;
       #size-cells =3D <1>;
=20
@@ -110,5 +128,17 @@ examples:
           };
         };
       };
+
+      ethernet-ports {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        port@0 {
+          reg =3D <0>;
+        };
+        port@1 {
+          reg =3D <1>;
+        };
+      };
     };
=20
--=20
2.48.1


