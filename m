Return-Path: <linux-mips+bounces-7966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF0CA4512E
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 01:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66D913AF193
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 00:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8D9611E;
	Wed, 26 Feb 2025 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eDYCsOZl"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B58DEBE
	for <linux-mips@vger.kernel.org>; Wed, 26 Feb 2025 00:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528484; cv=none; b=kdA5bGfFmyUSDcv2iElksYACK8eGzcfgLAg2a0WgsYO3NPoddKj1/6ahCAzlpJlUjHLOa4XAXefXJHCNH5LIgYuTy3nOYnEehNhpKdshfDbUYi+BOpN4fP2yhjZPeqxWYtHuCG4EH6dNr8IoMFm0CqK4NiikRue2FzB+x92eoV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528484; c=relaxed/simple;
	bh=Zu5Gh9u3vWCOPeyMueyqnevSxVwPXlURSSnX/6Ov2Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6lOGLTqMMZU5uvP1IQcVeNPYqK009Ak+5/pfe01cEHLfx8ux4uqWC95R+PdQ46EvxZN428xB2DpDHoszz55XbkM8Jy+ma1/KEogjvkkRfu6WYnET/WnvIDGg168VpIJwyptYY8nlksNq49DJZL/ESznwxhdXzW3Dl5XkhrJT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eDYCsOZl; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 29C0A2C064D;
	Wed, 26 Feb 2025 13:07:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740528479;
	bh=3GwO7BhrysL3Ix8kE0b5g9JR02RYSx1ZF5aIGqoanH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eDYCsOZl2lC+8B90JQ4J0U0qaohEKGcKY5gM2aTOdMFt3uBiAHB+mOQunGFi8Miv8
	 RNWQsMMUH4Gs71QrAOjrwfFfrtsA44yA3ob0H54ZIT1gep6/vQ6kKxyw1lPmILP5aM
	 Rr39tv5IGLdtl0O2CqyDKGM6PfrZ8kNkx0u8t5lde33yqU9x9Yu+zMjTIAFGi7rQah
	 WeUwiYKKW3GzpOdE/pfBj1DhviR6BameNdvOImey1l400bt9oA/Z8ypsBbLbAYyaRE
	 +1nJsvxEfLCX02/ckpmTLpE3bY19EGH+2MJ2vvV+637MjXMicsCt/74fy0AYr6qoxq
	 jQ1P+X7TVssVQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67be5b5e0000>; Wed, 26 Feb 2025 13:07:59 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id ECF0913EE7A;
	Wed, 26 Feb 2025 13:07:58 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id EAFCA280594; Wed, 26 Feb 2025 13:07:58 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next v7 2/2] mips: dts: realtek: Add MDIO controller
Date: Wed, 26 Feb 2025 13:07:48 +1300
Message-ID: <20250226000748.3979148-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226000748.3979148-1-chris.packham@alliedtelesis.co.nz>
References: <20250226000748.3979148-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67be5b5f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=Vd_wJYyKU8c0xNhbhIwA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a device tree node for the MDIO controller on the RTL9300 chips.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v7:
    - None
    Changes in v6:
    - None
    Changes in v5:
    - Add reg property to mdio-controller
    Changes in v4:
    - Have a single mdio-controller with the individual buses as child
      nodes
    Changes in v3:
    - None
    Changes in v2:
    - None

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f2e57ea3a60c..101bab72a95f 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -69,6 +69,39 @@ i2c1: i2c@388 {
 			#size-cells =3D <0>;
 			status =3D "disabled";
 		};
+
+		mdio_controller: mdio-controller@ca00 {
+			compatible =3D "realtek,rtl9301-mdio";
+			reg =3D <0xca00 0x200>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+
+			mdio0: mdio-bus@0 {
+				reg =3D <0>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				status =3D "disabled";
+			};
+			mdio1: mdio-bus@1 {
+				reg =3D <1>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				status =3D "disabled";
+			};
+			mdio2: mdio-bus@2 {
+				reg =3D <2>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				status =3D "disabled";
+			};
+			mdio3: mdio-bus@3 {
+				reg =3D <3>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				status =3D "disabled";
+			};
+		};
 	};
=20
 	soc: soc@18000000 {
--=20
2.48.1


