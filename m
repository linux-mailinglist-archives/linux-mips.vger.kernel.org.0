Return-Path: <linux-mips+bounces-7677-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C2A26A7C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585843A7A6A
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5351220125D;
	Tue,  4 Feb 2025 03:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="iSG+MrxL"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F517E00E
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638227; cv=none; b=m4viWXuxNy7LdFyc8wQnUR9blRDB4Vs9ASWy0x0PfpIXZ2FbyVBtWtdelSVyZWv/u//0f+SAAEmfezySYRLKuYDO9qz3wmxMBWwLHN3+Lt6Qanezh0dW+RlYIu+8q7cOJGcRSABTBJLiNdcVVe6ixAbbJc7GHDYk950Mc3jDYa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638227; c=relaxed/simple;
	bh=ayBIXbeoO+bcNseOdW5iN3U/7YIqlyA3LzBqND89pXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djN8Kzead9W524rVzsrKTRAkupfBQncuVsx/9TApJLrbGfCMVlNKnDgC+gQXf+66nMpe8Zk2ph12JMWGbNniGkvLNZaX2tXouheS7MmpcxePr1ns3LCK+H/fc0sUU1rRvvfRsX+dqd0ZrS77eZrMOBMurKtBTxzQTr22l/6M9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=iSG+MrxL; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6E8BD2C022F;
	Tue,  4 Feb 2025 16:03:44 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638224;
	bh=q84Fy4g6qKHM8sKjt/XoJeIMA8/NoGzGazA/6/MaXwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSG+MrxLfdqn+GYIMMnd4jlkCi8X4eOYIlQsLrP3X+12sr4tDOxCVgIke874X+OJ6
	 W/42nWmJSTKZ1qXTBf/U7pL04vR8gfT7IzHBoNk9gbcOJQV7DL5IIqp+tKXlbs1wuI
	 9y+mFAI/9mB26DlFu+9dw43GIhWE4q7P9/fIqgHCsLMLlAf6t/0HMUfROvCmWH3zDl
	 UcpJkU6jIQzXLLsNkKQjz7K0cjVFQTCI8jr9pukAYaA9aTeA14Isg3WtE3Cv+IkGW+
	 UhPPLGnb+HAswvfFJ5f/n0rLEkw0HbxanapIxUuVtkVpdoz6U48L3xEnmXCLX33ggi
	 uiejDVBnW08SA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a183900000>; Tue, 04 Feb 2025 16:03:44 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3473213EE36;
	Tue,  4 Feb 2025 16:03:44 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 300082804B6; Tue,  4 Feb 2025 16:03:44 +1300 (NZDT)
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
Subject: [PATCH net-next v6 6/6] mips: dts: cameo-rtl9302c: Add switch block
Date: Tue,  4 Feb 2025 16:02:49 +1300
Message-ID: <20250204030249.1965444-7-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a18390 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=FnvEQtqmOLBUJeBfsr8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the switch port and phys to the cameo-rtl9302c-2x-rtl8224-2xge
board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v6:
    - New. This is needed to comply with the updated bindings. It could
      possibly be split to add the ports then the PHYs. Technically the
      ports are the required property that dtbs_check will complain about
      but it didn't seem worth separating out the PHYs.

 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dt=
s b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
index 6789bf374044..28ab2442b37a 100644
--- a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
+++ b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
@@ -71,3 +71,99 @@ partition@1180000 {
 		};
 	};
 };
+
+&mdio0 {
+	/* External RTL8224 */
+	phy0: ethernet-phy@0 {
+		reg =3D <0>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy1: ethernet-phy@1 {
+		reg =3D <1>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy2: ethernet-phy@2 {
+		reg =3D <2>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy3: ethernet-phy@3 {
+		reg =3D <3>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+};
+
+&mdio1 {
+	/* External RTL8224 */
+	phy4: ethernet-phy@0 {
+		reg =3D <0>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy5: ethernet-phy@1 {
+		reg =3D <1>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy6: ethernet-phy@2 {
+		reg =3D <2>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+	phy7: ethernet-phy@3 {
+		reg =3D <3>;
+		compatible =3D "ethernet-phy-ieee802.3-c45";
+	};
+};
+
+&switch0 {
+	ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		port@0 {
+			reg =3D <0>;
+			phy-handle =3D <&phy0>;
+			phy-mode =3D "usxgmii";
+		};
+		port@1 {
+			reg =3D <1>;
+			phy-handle =3D <&phy1>;
+			phy-mode =3D "usxgmii";
+		};
+		port@2 {
+			reg =3D <2>;
+			phy-handle =3D <&phy2>;
+			phy-mode =3D "usxgmii";
+		};
+		port@3 {
+			reg =3D <3>;
+			phy-handle =3D <&phy3>;
+			phy-mode =3D "usxgmii";
+		};
+		port@16 {
+			reg =3D <16>;
+			phy-handle =3D <&phy4>;
+			phy-mode =3D "usxgmii";
+		};
+		port@17 {
+			reg =3D <17>;
+			phy-handle =3D <&phy5>;
+			phy-mode =3D "usxgmii";
+		};
+		port@18 {
+			reg =3D <18>;
+			phy-handle =3D <&phy6>;
+			phy-mode =3D "usxgmii";
+		};
+		port@19 {
+			reg =3D <19>;
+			phy-handle =3D <&phy7>;
+			phy-mode =3D "usxgmii";
+		};
+		port@24{
+			reg =3D <24>;
+			phy-mode =3D "10gbase-r";
+		};
+		port@25{
+			reg =3D <25>;
+			phy-mode =3D "10gbase-r";
+		};
+	};
+};
--=20
2.48.1


