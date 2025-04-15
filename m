Return-Path: <linux-mips+bounces-8609-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DEA8A9A8
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 22:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820D03BC63B
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 20:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06D6256C61;
	Tue, 15 Apr 2025 20:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="IU56kcl8"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D9253937
	for <linux-mips@vger.kernel.org>; Tue, 15 Apr 2025 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744750473; cv=none; b=ZgA8cvBGstd7I4u9WEpa3+uif8DwHDVhUe90RBP/MR8yLohtCgszjGYw9lAO/8blk2LzLJQZdMfy0ukB9VKA2Ye347w7Ztz5MoLZYwjwns0J9g9tMM7uZWnYO/2mmLeAYPq5s8fb0koiiAvwqOz9Bu/Tw/MXK0psn8oQN81rFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744750473; c=relaxed/simple;
	bh=rs7Jtw6f3Bfz8LXeOIlcVNnKXGGiSrBPkr0EaB+/l58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hH59tHyZmIVGcYZI1wDIpFtJpC7/mAtnc+dHsXuGvC/iLQX0alPPJAlTeF3p4HBUGH1c+tClnFAVw72tCLFQl3f/a7+up2k+ymZs8QNJxtwOyCgkYnNXkCF5yuil/rbOSu5axIQG5a/0bZ+OWmlqATpFOM25Qhq/GA/ySco0tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=IU56kcl8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4A75C2C0117;
	Wed, 16 Apr 2025 08:54:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1744750468;
	bh=1YMkTjFWZdA9nR3aSWtqvqZGk8IWr6oCbr19z+jFINk=;
	h=From:To:Cc:Subject:Date:From;
	b=IU56kcl8W1QspNfGDMfsgBJwTeeAwTFK53Mabj1IVY8iG1j3tNpbQxVo4sepBpGKm
	 cRW7BnHWchuD9/he/tTK7lfi4qNbeViFGZROxa79xVBBAFM5beSYFqYZm9kvrtcI9C
	 6/FkRdjl4EZFCeyUx2rR1trRIo8AUKDeuLbRJVFbGLcwhMRUhhWzYjiw6KM5kgb8pR
	 ueuSM0At+5y9a/Iv3gIcZ+Op8igtocL4TjZhKPFR42Uujjixb68DZkNEzQBE6Nc/Ol
	 nurb01DLpBE+Xug9b7/NsWSjg0jRTulOUJSGIcTwGNpFShQEWtt00zewhEf0k6GExk
	 mNl8LCETDff+Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67fec7830000>; Wed, 16 Apr 2025 08:54:27 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id D798C13ED56;
	Wed, 16 Apr 2025 08:54:27 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id D423A280A40; Wed, 16 Apr 2025 08:54:27 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tsbogend@alpha.franken.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sander@svanheule.net,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] mips: dts: realtek: Add MDIO controller
Date: Wed, 16 Apr 2025 08:54:25 +1200
Message-ID: <20250415205425.1491165-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=W+WbVgWk c=1 sm=1 tr=0 ts=67fec783 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=sgiY_DZ3Ly_kI_xlMHAA:9 a=3ZKOabzyN94A:10 a=GD4noUi3QJbYS--_YAA1:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a device tree node for the MDIO controller on the RTL9300 chips.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This was originally part of a series adding the bindings and the
    driver[1]. These were split off and have now been applied via net-nex=
t.
    That just leaves the dts changes to come in via linux-mips.
   =20
    [1] - https://lore.kernel.org/all/20250227213248.2010986-3-chris.pack=
ham@alliedtelesis.co.nz/

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
2.49.0


