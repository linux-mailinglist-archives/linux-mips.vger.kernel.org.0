Return-Path: <linux-mips+bounces-7672-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3EA26A6B
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 377CC7A2786
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51038137C37;
	Tue,  4 Feb 2025 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="fDrffdl/"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789041552FA
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638185; cv=none; b=CUc4pUxjZovZRrqI/dH5TqlZQKXSOhbNix5EnyGxTUFPK+V8M2wNPWmWNbkdxMDi3/3BaVf0UQogz+4Uyon/Z2YGViExhKsGmYKghy+ihckUT4knH601OmCfgen5mIWYIUuYcMmZw59zcj0bqfqfLha4Kme0hqqidhfqz7g8WZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638185; c=relaxed/simple;
	bh=4NVEG24S4MtnR561mcuGQPAwmnJeTKnXo93/3XsAu0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGFyVTG3XIYFPOlpMFf+jnn5CV6rSfExI/DdRTVi2B3Fa4Vgvd8lFCaRKsjFE5sDrfmYRbwHraW+6E5YrnTerCnn8/YLZsTEJrY55PaQf0+SQGW3SD9jBGyZi12srxJauFxNHskeMrMxj1pvABzk6LxMWsdRF298w9bgyIxkulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=fDrffdl/; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3EE642C0452;
	Tue,  4 Feb 2025 16:03:02 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638182;
	bh=u64i3jFqbMHZWq2p115UYRUBBE2H5S+EJln0sSX5xb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDrffdl/57DWKFxD2Hs8WmJUH8pqzX+kPp42pQmaVrgI5igBX3UirkmUF8pMAjPD5
	 /pG7K126cdpDJdDKLuMDKQAWOuJNSNEO2y7mryVu7xQti9RbnXwPpVfZm2l5NuAFY7
	 eug60AmKVTqSV/EHjrV0YZGt65aYUdA3C+AKCJpGoFcgLqz9yGsnEhtiBo160hSR90
	 FEMb9YBLxX/QJxKZ13N2eZuGA8TVrz6+42+cD+b5I1xPDHZzdPHi6wLAhVlL25R7xX
	 cS1mNkEhtJqzVlFyEqBcZQc6aDConOZ95T8m/6ld2w8bTrDwgqW8LKUw1lhsS9Oiqe
	 DYfZPJrfU4Gmw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a183660000>; Tue, 04 Feb 2025 16:03:02 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1238513EE36;
	Tue,  4 Feb 2025 16:03:02 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0D0682804B6; Tue,  4 Feb 2025 16:03:02 +1300 (NZDT)
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
Subject: [PATCH net-next v6 1/6] dt-bindings: mfd: Add switch to RTL9300
Date: Tue,  4 Feb 2025 16:02:44 +1300
Message-ID: <20250204030249.1965444-2-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a18366 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=LEuThzscFrWOTlmK_W8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add bindings for the ethernet-switch portion of the RTL9300.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v6:
    - New
    - I'd like to enforce the property being "ethernet-ports" but I see t=
he
      generic binding allows "ports" as well. Can I just add ethernet-por=
ts:
      type: object here or does by driver need to handle both "ports" and
      "ethernet-ports" (I see some do and some don't).

 .../bindings/mfd/realtek,rtl9301-switch.yaml     | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
index f053303ab1e6..cb54abda5e6a 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
@@ -14,6 +14,8 @@ description:
   number of different peripherals are accessed through a common register=
 block,
   represented here as a syscon node.
=20
+$ref: /schemas/net/ethernet-switch.yaml#
+
 properties:
   compatible:
     items:
@@ -45,7 +47,7 @@ required:
   - compatible
   - reg
=20
-additionalProperties: false
+unevaluatedProperties: false
=20
 examples:
   - |
@@ -110,5 +112,17 @@ examples:
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


