Return-Path: <linux-mips+bounces-7714-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41900A2E19A
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 00:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A243A5D51
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 23:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B785117B402;
	Sun,  9 Feb 2025 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="XWLopJGM"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661717B50A
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 23:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144889; cv=none; b=eP1hQqrmpD4z+f4HyfgE6IFnrxD4Dk7QTucUFxJ9VWOS4DNGwr4eVGgfglNJ4osp6hy1nvoAOXfMUJbzZwfLozR1hpHihPiSLsesykev5+IAd1XohlciQsD6jN1yEguS/vpDl97h68ABy5pRpilH/beFUDqWvI/1/+P0MVYLKZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144889; c=relaxed/simple;
	bh=RHuOaB7d+UjSjoFMhnWKkDFLOPSIwKQCOC9zA/g1HOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tvf2tETg6ShauTSwy9J9TP6nYyTIP4eJRZsiUDNzy++z0v2jqeDh2i+6Aw9Gx5qSxjfdKP6QwpXzu3b8ZeICfLbQhn+rsW2pLN2igjByhJrHYcW+1Y1JAywDcr8nTdM7OSB1jeOmW4I0y0MKQwPiBRPyc3B0VNqWvtR52BMpb4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=XWLopJGM; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A413B2C045C;
	Mon, 10 Feb 2025 12:48:06 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739144886;
	bh=jZNBKo8BJn+Cpmm+/0ORd6aDcui99DR/5RTy8qbveT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XWLopJGMGrlJcInZzkimYEBZFSeCBIF7gWnR3iaO1eh2qXRrphl7xw9u6T6AGAc7h
	 ekvKmNOG43sI4Y5dMDt2Z467EJ80jKL+/vE2+e+qXcvKolRW6rSpLL9+NW536JUm68
	 l5ji76YIXXpes0WCqMHSEbpZ0nmHTa1DKkbgvX11NH1g4vT9eJnV9x0d8uwHDuHm6V
	 p0rNfo+QXIATmJbcI45NCtqa9CNjNLCeZktbKKmmDOSGX1rKJ4EkyJJj0WAacGuM/I
	 eFatMxrfMoVLZqxo+k2ByCYAlb4BVfR3nu/6MsUR3F2DD0y7ZKZ9hj8DsBDfL5het9
	 4FWeUoRwSthtA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a93eb60000>; Mon, 10 Feb 2025 12:48:06 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4DB3C13ED4A;
	Mon, 10 Feb 2025 12:48:06 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3D028280789; Mon, 10 Feb 2025 12:48:06 +1300 (NZDT)
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
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next 2/5] dt-bindings: net: Add switch ports and interrupts to RTL9300
Date: Mon, 10 Feb 2025 12:47:48 +1300
Message-ID: <20250209234751.460404-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
References: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a93eb6 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=ONnuDqgNxj6Q2WPecnAA:9 a=3ZKOabzyN94A:10 a=o4McRIDJWpQDfD5EwD6I:22
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


