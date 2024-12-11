Return-Path: <linux-mips+bounces-6959-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 460029EDC51
	for <lists+linux-mips@lfdr.de>; Thu, 12 Dec 2024 00:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3A4188A75D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Dec 2024 23:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A91F63CE;
	Wed, 11 Dec 2024 23:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nAleCdE+"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBDD17838C
	for <linux-mips@vger.kernel.org>; Wed, 11 Dec 2024 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733961243; cv=none; b=svl+oGNHTyO8WA9ew/SFHSqENOeKauWWCSp3YoL7YRq9mqnEr0H9GiHajbLBSuMYEvjJj05Cdn9I2BwKH9YGo/85pJo2dlPPLj+dScu0mxXbOGITyvRqYVZMrTVr+VxLLemeCNqA7/jhKlLhoLXTLwbdJHEz99cNToEFUbea/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733961243; c=relaxed/simple;
	bh=jiXhH9kxXSn2Nw0H+KTvppAK2X+q60j+e8YmqY9FWOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwV2bjp+bg4/cWIBENAWDktJfq4jRbwrYbynTBsHVdorJPSV7/crG7klsLf5jg50p/nlbpYD5gnxjOXI+nx9kZiNb8WnHozGD+MRUbRImVN36LAnx0tWboF9Jd7xVvPTNW7QDNBIdfox60yn9QZQhh88IlLR6Z8lUyfwEcjn+Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nAleCdE+; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 85FD32C04D0;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1733961231;
	bh=YYpbsxw/IWs9rcS8rKosIOXg91vbXIdTiqCuBpMbmaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nAleCdE+4mBvOqZCsJtD9e/FtImUNu7U1cWCTJCNchoWuu9Jbv8vmmg2J3F/w/m7i
	 JW4sRz2EZXKgQyselHquY9ZP6ArTC8dnbl9UGJYXbZikEaElF2OruttDiGjA/JjGAa
	 b05KIxdckCDOuueCBVrZ8qCCnERYzOR8IcOdMSD153uBMgJdOZP5fy/z5S5dXBf0GH
	 OWbcrgFLl544zQQJI5ORsGcmpGjUUT4RaHyOJLpJx8NokihI0t8ltk+94hOlDkBh8i
	 CGgVD3lO4ZdIND/UF6E9clb9DYhJCXL6A4KC1w1pqnVkPRsmNeGE0QCIAuoW3sfwaL
	 G7GDPiRb9BaUA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675a260f0002>; Thu, 12 Dec 2024 12:53:51 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 24DEF13EE8E;
	Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2175A280964; Thu, 12 Dec 2024 12:53:51 +1300 (NZDT)
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
Subject: [PATCH 2/4] dt-bindings: mfd: Add MDIO interface to rtl9301-switch
Date: Thu, 12 Dec 2024 12:53:40 +1300
Message-ID: <20241211235342.1573926-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
References: <20241211235342.1573926-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675a260f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=0DcZ6JciK6r0_laEW2MA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The MDIO controller is part of the switch on the RTL9300 family of
devices. Add a $ref to the mfd binding for these devices.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/mfd/realtek,rtl9301-switch.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
index f053303ab1e6..eeb08e7435fa 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9301-switch.yaml
@@ -41,6 +41,9 @@ patternProperties:
   'i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
=20
+  'mdio@[0-9a-f]+$':
+    $ref: /schemas/net/realtek,rtl9301-mdio.yaml#
+
 required:
   - compatible
   - reg
@@ -110,5 +113,17 @@ examples:
           };
         };
       };
+
+      mdio0: mdio@ca00 {
+        compatible =3D "realtek,rtl9301-mdio";
+        reg =3D <0xca00 0x200>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ethernet-phy@0 {
+          reg =3D <0>;
+          realtek,smi-address =3D <0 1>;
+        };
+      };
     };
=20
--=20
2.47.1


