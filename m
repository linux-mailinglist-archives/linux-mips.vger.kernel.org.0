Return-Path: <linux-mips+bounces-7676-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD0A26A79
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A34CA3A735D
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417CD15A868;
	Tue,  4 Feb 2025 03:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Ykeg0JA6"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941781632DD
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638217; cv=none; b=MxJ7a1BJqV9w+pjq8h6CigBAai/1PnUo69ILyTog5JMONqOupbIVAV4s+EwSIpdDm+C2+KHtW8/0dR+T4Ty9Lpynjvka7j5nppAZwvWxshFRHz6QGU4QOWptsj/GPK+WB+hn9MEpcvM0XZt8shTe5m6Sy78Oxg2qWWb3F0MFPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638217; c=relaxed/simple;
	bh=t4LfaX3CkasCiB8shsAKsuF3aUvx+SQvcPch27gP2pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnJ3QuBOjTYCwfJMR5IxnDSSVuWlP8YyQp/YVkLh1pfNkn7jJq6eadRRq6VUZKLF/w7zD8dQlGbSqqWLMXx5DSxteZmv02yzSYiN+KZMxJT5WWPvXkoEj356IoJrbUHOtO0ig3bSvmUlQek8tQzTHrUIZsW2duHsfhEugvRS26k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Ykeg0JA6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 264392C022F;
	Tue,  4 Feb 2025 16:03:34 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638214;
	bh=gq1Ia62W3STA/wuPVKuerKNFHpoRmtL8AcD76Hwures=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ykeg0JA63eWmIRmLxnYoMkNEB6t5Z51HUaovvsQxuKVe+DEbBQMieQINTIjtSLWFg
	 coYG1cf2LDidyvfjV7ZWZwWOWqJfPwOHotM0ME2fWPYOMUC4VnvSbL0BMG6tHxUL/b
	 QiH1T0SsxvtThF7p6n4OjUUVgARoQqIvQZooYkpvx+1eC97ITDjv1zY9XT6/amMqKK
	 gKEoYScWoEWYH1s3tvBPHO+kRQJFeIoDM37HTa+fJ7Dz+AFQ0Sq2hmHOwd4RUkfIHz
	 tjMqtjjbddOO+USxleUOhng0MtET2Taby5LBbay0eaeiLb7Z7EcpE+aBst9kPFw9Oj
	 GydmV51x2Qbyg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a183850000>; Tue, 04 Feb 2025 16:03:33 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id EE0AE13EE36;
	Tue,  4 Feb 2025 16:03:33 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id E98722804B6; Tue,  4 Feb 2025 16:03:33 +1300 (NZDT)
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
Subject: [PATCH net-next v6 5/6] mips: dts: realtek: Add MDIO controller
Date: Tue,  4 Feb 2025 16:02:48 +1300
Message-ID: <20250204030249.1965444-6-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a18385 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=Vd_wJYyKU8c0xNhbhIwA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a device tree node for the MDIO controller on the RTL9300 chips.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
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


