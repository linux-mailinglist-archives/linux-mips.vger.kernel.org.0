Return-Path: <linux-mips+bounces-7648-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B785BA2386A
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 02:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEEBA167730
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 01:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270FA17BB6;
	Fri, 31 Jan 2025 01:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ofqHM4Sg"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCF14AA9
	for <linux-mips@vger.kernel.org>; Fri, 31 Jan 2025 01:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285341; cv=none; b=TqqxgtxXu0zznyJf8vQj/5IECG8/SxDjpC5rwdArH1HBrCH9PQ7pCkIJYRwYdrr0WGJrOPTD0OOjDQ1BR3xDsjm54FTUVBbU4BJGmCMm3md3z4cPVG70z56lzrz48LMvWa3AWW3wOTangFbZ8xC19rjw2DbPWVY6ESimbIdB/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285341; c=relaxed/simple;
	bh=d2wKSEeWewk6g4bDBe2uzf7OZrUTeYp64dG6x8IlA8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdywrftrg1UdqqTBkYxNn25CxLAMyxIBq1jjDPGnQYc0NkYz5jPAttBmxLhg/MkR3q7FDVtKAZ9fZs9Ck2UPUmkkgP40BfGCbWqg/vdvzfEyzxQ+HqVF/WlDEe70eI9MGz5Qi/968BUwNRxeUa1hmc0usiyESUEV75Kkgq5kp38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ofqHM4Sg; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5C93B2C04F7;
	Fri, 31 Jan 2025 14:02:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738285338;
	bh=EKzvpsoDaI7GwROe8AQQQwzhJuWCG6DLEw5f+BD4PvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofqHM4SgiG2THNZYegE+UtZbPK8WvgxGwoAkTQivGkLJAtoQiJH6OtFLgx5HUo+vH
	 jkhY164AVrcqYVnX0YDuLlv8kd+aKdU7Iz3yij5/MbpgeFWG7RusOiyQKUffpyMv9B
	 K/A/DV/DShXEdrg8T1/jW+6yLC7GjK7lgXzaflLQaRKhmH0sksCXeYYACnhXC+BaxS
	 g6d9LdeqjX4rMQGOUKisKJYwSXdV5o6+kRRp5oZL9kNmsY6Jq3Jdv0IH2nX8i2cHDw
	 GUqg0L0pw+Ac0VaUJn8hzRtccvJUU9gyfBypxSAXIne/2e1Ef0g3XQuHX7tPeVVl9Y
	 aCAneM+cz+UOQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B679c211a0000>; Fri, 31 Jan 2025 14:02:18 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 391B713EE2B;
	Fri, 31 Jan 2025 14:02:18 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 37BA72809C0; Fri, 31 Jan 2025 14:02:18 +1300 (NZDT)
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
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 2/4] dt-bindings: mfd: Add MDIO interface to rtl9301-switch
Date: Fri, 31 Jan 2025 14:01:49 +1300
Message-ID: <20250131010151.2527688-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=679c211a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=5cQCLpD8v2SGHUEG_dEA:9 a=3ZKOabzyN94A:10
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
    Changes in v5:
    - Note dependency on realtek,rtl9301-mdio.yaml patch
    - Add back reg property to the mdio-controller node.
    Changes in v4:
    - There is a single MDIO controller that has MDIO buses as children
    Changes in v3:
    - None
    Changes in v2:
    - None

 .../bindings/mfd/realtek,rtl9301-switch.yaml  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
index f053303ab1e6..89e10213a4ee 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
=20
+  mdio-controller:
+    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
+
   '#address-cells':
     const: 1
=20
@@ -41,6 +44,10 @@ patternProperties:
   'i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
=20
+  'mdio-controller@[0-9a-f]+$':
+    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
+
+
 required:
   - compatible
   - reg
@@ -110,5 +117,27 @@ examples:
           };
         };
       };
+
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
+          ethernet-phy@0 {
+            reg =3D <0>;
+            realtek,port =3D <1>;
+          };
+          ethernet-phy@1 {
+            reg =3D <1>;
+            realtek,port =3D <0>;
+          };
+        };
+      };
     };
=20
--=20
2.48.1


