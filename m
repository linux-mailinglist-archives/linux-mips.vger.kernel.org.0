Return-Path: <linux-mips+bounces-8031-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851B0A48A91
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 22:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A948F7A746A
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 21:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7C1271830;
	Thu, 27 Feb 2025 21:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rv40QSHI"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447B3271286
	for <linux-mips@vger.kernel.org>; Thu, 27 Feb 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740691984; cv=none; b=mcNNXMp7uYtWxo1bh+6WOUirPnLwCxDF6E2xKmAZkJPqXteZXwifNMx8IypbySNQBN3PPRldrQ0fKxSyJtPEPNXZhQvBEoXAH57ryNpNpSG+T1DBJ8/R8EuFrx7RrV+rS1Wi2ET6+FI3AK+CzJgqFokEgzHigbEYaovXXZbBKGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740691984; c=relaxed/simple;
	bh=O78laQRCugQQJVm33qwQw6Vm1O71zPoAwdwqZY3zw2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifT32LiUl2IR9HBNv1p5hTcTu1CZ1RAQfcrYvoeuQvxmH/2qTMZu7l4+/Yxae8ztemTYDDMOuDRXdVpc+lofKvq4BwMlA30f8nNhOxBwu1IGw8sR2ZmMKxsQiKq1k0vYuYA5/lCECu43ldlszDdZtglsYawxFxon0Mv6Royr79g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rv40QSHI; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 17F3D2C066F;
	Fri, 28 Feb 2025 10:32:55 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1740691975;
	bh=cU5KnnGteSBBNh2MJua3cK4JTvnCQNhda1NWxrZBi1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rv40QSHIm6CXLc0HWvjwWiGhQKKL4uEGiaH+MSmEsgsLTRCl/Mye1fxfojYebNTXp
	 PS1if9IU4jH8A1qkgMc1ppDU8Udy/yOsiouWz88r6L4J0y1rqlAG6cp8Zr4sMhvnxV
	 MkrLe4IPVSKWXWxiX0bsORmEu/H8//u6YCTkcTxFtzmql46DlAO23AALRywYmW1Q9M
	 Ee8OFPyCi8cykxL8/a565igqqimvrsck/4wlnYtBHIEvCEEXQh1+EQgBbUakSklRS4
	 l1ZhiguU0EGrrcXLOJfu87QEkx4NqpwWQ0FMDlsDQWtM/KSuYanZ6t9d64waPMg7cn
	 5/Tg45I3IyGIw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67c0da060000>; Fri, 28 Feb 2025 10:32:54 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id DE7B113ED4A;
	Fri, 28 Feb 2025 10:32:54 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id DC257280AFD; Fri, 28 Feb 2025 10:32:54 +1300 (NZDT)
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
Subject: [PATCH net-next v8 2/2] mips: dts: realtek: Add MDIO controller
Date: Fri, 28 Feb 2025 10:32:48 +1300
Message-ID: <20250227213248.2010986-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227213248.2010986-1-chris.packham@alliedtelesis.co.nz>
References: <20250227213248.2010986-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67c0da06 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=Vd_wJYyKU8c0xNhbhIwA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a device tree node for the MDIO controller on the RTL9300 chips.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v8:
    - None
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


