Return-Path: <linux-mips+bounces-5618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62B9839FE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 01:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52CB81F22FE1
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2024 23:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3449912C81F;
	Mon, 23 Sep 2024 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="y8+j2qGo"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4899126C0A
	for <linux-mips@vger.kernel.org>; Mon, 23 Sep 2024 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132560; cv=none; b=VBSFY9Gn0Pc+Cyp7lqACZBxRpp2uo9Z52CZJaTfvDZcd5WOyiTbTM1g6j8U4TOIJaDHZ/GrhVxtEu+MQuC1Ra9PhgMX0lbYM/H2Fk9uXGXz4urgi5EwNSd87XzHsS/biNFcp9S63DhLOnl3zPsmvbvrueS0ey2Ykvm/rlAS5aFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132560; c=relaxed/simple;
	bh=kb+FOPL0rVZM1kDeaqCOMHkMt+9wNGouZDUALNbJokk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYFA9jLZH8lDb7z1jgXkW+cXc0tHRwzbfppm/0J7FrR2GLqACZNobfksAe+kvSS9WSzwHfawTWklbZ/7Le6c0sH0ponSA0EMzJGkzYJVEWUrS20LEB9u6jYFicQzJOGddwdnbE5Gxo0S4uucHIB0UgIKAheThu0Io8knEWWr9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=y8+j2qGo; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DCC502C0613;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727132554;
	bh=ssv1KJPv6dWn/2WAVO6iLtBa790Hqw+lnh3qp5W5NL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y8+j2qGoXf8ulvwRtRgivHf3XUNFQ5nvx69ThhXGcT/JAFRJ6tF5ZgnJ3VgRgUJGl
	 qWFlkzVm5BR7BQaw4vCFuwG2NcWgd8XyrIIy1BNBhh6nql7Achzy+X5KM8bm4BoIxn
	 Ub672rlvtKH/LdOZs+TrDkIcI12rwSkusc5uvoz5zka/mB1gxb17p19Bl8gA3ez1m0
	 Px6TsCQAmHTTG6fuRv7Sxh7U4IpNa1dn7YRn7knRHSWpx7UUv0r5ZrLkWQedFO5OVG
	 +oU6FSDeLOFTNB9NVyMZKULDYsDgk/MUNhcZF8YMIPEUTGsfa5oCbohSkRwUGI7zo/
	 ClOWuhC1uTWug==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1f38a0003>; Tue, 24 Sep 2024 11:02:34 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9DCCD13EE36;
	Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9A4FE28044A; Tue, 24 Sep 2024 11:02:34 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/3] mips: dts: realtek: Add I2C controllers
Date: Tue, 24 Sep 2024 11:02:30 +1200
Message-ID: <20240923230230.3001657-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1f38a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=fm45MGwkAfgIEXGqLe4A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Use reg property

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index cf1b38b6c353..cc43025cd46c 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -33,12 +33,30 @@ lx_clk: clock-175mhz {
 	switch0: switch@1b000000 {
 		compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
 		reg =3D <0x1b000000 0x10000>;
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
=20
 		reboot {
 			compatible =3D "syscon-reboot";
 			offset =3D <0x0c>;
 			value =3D <0x01>;
 		};
+
+		i2c0: i2c@36c {
+			compatible =3D "realtek,rtl9300-i2c";
+			reg =3D <0x36c 0x14>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
+
+		i2c1: i2c@388 {
+			compatible =3D "realtek,rtl9300-i2c";
+			reg =3D <0x388 0x14>;
+			status =3D "disabled";
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+		};
 	};
 };
=20
--=20
2.46.1


