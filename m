Return-Path: <linux-mips+bounces-9407-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D11ADFA92
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 03:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D34CC3B6729
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 01:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFC119D06B;
	Thu, 19 Jun 2025 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="CjARtoS8"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F242BCF5
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295283; cv=none; b=EKM/uKl84kOfnu+7GahuOhyPrSfEAy0yTSH9sKSMtnY3KS7nV/smG3vgGtUCUKs1NiR41z1I0fj4gSMzNIbcUj7gwrpegHnibJWYMas+JVSzwolurM0CB8cjIqVz3F22jL7GeXqZSjX8WtRSCfgxaoTu/nfIN99jLznLCyebzXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295283; c=relaxed/simple;
	bh=ibaKhB5YmmT3G3ZHP3hQ+kQQqz/x9EUHJ4qbPd5cYu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b40dakB1PosFjEKnGlTGnIx8IPlsF4/+rEBZh0aP29SZPWnfIlj5jt9+4wSf9Pay984h0p8gKAJiHaOSwhJ8HRrM1uSS3mp1Xva9hjJFIR7kakX3AhoQ5SVghKvWhE18R+LNcmN1xk3B19tkrOtbn5hTV+xSEIpXLuan39gfcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=CjARtoS8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A94E2C08A8;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1750295278;
	bh=n9KSnwt/xG0Ye97lEmULVi96VTWD0tUurSJYArV76TA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjARtoS8h68LoYOlBOVeiEiPGtjLkOjGdruNoHh6YaRcq+4j+qWjXGEAcdzAsN/5e
	 KoxwlcLWoguMJcGw2Lh8/RF0qMQ6O+GSfKeTR7Z980AtY2PKju8RnlXlgLay/Y1GrB
	 gAZSeDORgKHAZEE6v0Q2ThS7EhGsqgPPWnqh67F2WtfPaEEuHca8m4N+ccj+QWwfyo
	 tPkguZpsWztfFTzvTtB86PLvHhS/IhXlCy/qE/u53APfe+G6LVwXGA7U7oM1Vfzqts
	 7jdjl9jl704oysFoiX9f76K/RYGOrlH4Ej8hOL6q7VCQAE0OtwuY3xXtJyInRist79
	 YvVULIJOU2qDg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B685362ee0001>; Thu, 19 Jun 2025 13:07:58 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 032E713EE52;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 02670280758; Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/4] mips: dts: cameo-rtl9302c: Add switch block
Date: Thu, 19 Jun 2025 13:07:51 +1200
Message-ID: <20250619010754.3760612-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619010754.3760612-1-chris.packham@alliedtelesis.co.nz>
References: <20250619010754.3760612-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F7/0dbhN c=1 sm=1 tr=0 ts=685362ee a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=rmSqGifbc3GDBumfcZAA:9 a=3ZKOabzyN94A:10 a=vHt_3_20o5QrCHLhktil:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the switch port and phys to the cameo-rtl9302c-2x-rtl8224-2xge
board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This was originally part of the series adding the MDIO driver[1] howe=
ver
    the mips specific part wasn't picked up for net-next so I've rolled i=
t
    into this series of changes for linux-mips.
   =20
    This is needed to comply with the updated bindings. It could
    possibly be split to add the ports then the PHYs. Technically the
    ports are the required property that dtbs_check will complain about
    but it didn't seem worth separating out the PHYs.
   =20
    [1] - https://lore.kernel.org/all/20250204030249.1965444-7-chris.pack=
ham@alliedtelesis.co.nz/

 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dt=
s b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
index 6789bf374044..6f6a05d4088e 100644
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
+	ethernet-ports {
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
2.49.0


