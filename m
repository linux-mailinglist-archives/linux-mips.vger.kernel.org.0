Return-Path: <linux-mips+bounces-6682-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EED9BDA24
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 01:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573C32840EA
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 00:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0A5FC1D;
	Wed,  6 Nov 2024 00:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="GL3sTUZC"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5B1E519
	for <linux-mips@vger.kernel.org>; Wed,  6 Nov 2024 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730852325; cv=none; b=r4pMN/8KO2aHH6yKcyBZK8N5ysmMpSc2x1LG/as5Sjik/iiKFMijC11bQiRHyD7XM50tZyKSmV+SPhVl1hOHSy5Em4dtxcEkpj9TZHbTBtEH9VcD116YUEv47dlqLEEJsNDQFUpXbuc8eIT4gfllm+FOCTAioSKE3DANrXMVoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730852325; c=relaxed/simple;
	bh=aYbvhEzKHidgL7zg39NlhCEXWzKLkWmIGXzDZW5Q5DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8Thn+YrHXunQq77/uEQ26CEVbFx75ZchfcUD3SBG1dCM+Y/vhe8+BxCNB78JBNPc+xQKdXIXv8VyjPx9n+FJ+rjoUrhRQINLnP66eeg0C9RSWCRg3d15o7y+RvesE2cZLDqWL22xLuuZmHUJ4U03AYRKD3oqrUQgvVUayyNA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=GL3sTUZC; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 988D32C05E0;
	Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730852320;
	bh=cjXQ/ofKhcPCx8e78DXvcl0SFxgtu1Fy/0D/HL1bwwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GL3sTUZCLmPCgZEux++DRW+tIGrlDlIQqFk2Ph7OejVKgrFsGafgtRpKB3ZXFpD+j
	 KIq4VLwcORzu6xTb0x/GZ0RfndnpGAXZtulc3umSHisXPDLzXINxKQ8Oqzwomo87B5
	 hOCuOok9Oz7g1BJgSxY8ioOtLHOlNB9vVfg3JEux1uHyhUrg0xth/YLF2FOI3Bg/Ro
	 JfMixTs0Wt8r69GxqjxxYFUXZLFcNcK3yce7BMCIF9rBl+5tcq+SwUKCp6pqBt6PCD
	 bW96dCLYaCYgxxolWZoVstexCdRbp6+bLV855xNlXffefsdxGRSETsTdHS/FWPIzlX
	 h5C1cIvLXG8Dw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672ab5e00003>; Wed, 06 Nov 2024 13:18:40 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3C8B713ECC4;
	Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 3A6962804D6; Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andi.shyti@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 3/4] mips: dts: realtek: Add I2C controllers
Date: Wed,  6 Nov 2024 13:18:34 +1300
Message-ID: <20241106001835.2725522-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
References: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=672ab5e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=PxnkKiIr6rJD_3uwCWUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the I2C controllers that are part of the RTL9300 SoC.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v9:
    - None
    Changes in v8:
    - None
    Changes in v7:
    - None
    Changes in v6:
    - Drop wildcard compatible
    - Put status =3D "disabled" at the end
    Changes in v5:
    - Update compatibles
    Changes in v4:
    - Skipped due to combining patch series
    Changes in v3:
    - None
    Changes in v2:
    - Use reg property

 arch/mips/boot/dts/realtek/rtl9302c.dtsi |  8 ++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi  | 16 ++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl9302c.dtsi b/arch/mips/boot/dt=
s/realtek/rtl9302c.dtsi
index ca4d347af8d3..8690433af498 100644
--- a/arch/mips/boot/dts/realtek/rtl9302c.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
@@ -5,3 +5,11 @@
 &switch0 {
 	compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
 };
+
+&i2c0 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9301-i2c";
+};
+
+&i2c1 {
+	compatible =3D "realtek,rtl9302c-i2c", "realtek,rtl9301-i2c";
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 7477fae34987..6a6f3f3fe389 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -41,6 +41,22 @@ reboot@c {
 			reg =3D <0x0c 0x4>;
 			value =3D <0x01>;
 		};
+
+		i2c0: i2c@36c {
+			compatible =3D "realtek,rtl9301-i2c";
+			reg =3D <0x36c 0x14>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
+
+		i2c1: i2c@388 {
+			compatible =3D "realtek,rtl9301-i2c";
+			reg =3D <0x388 0x14>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			status =3D "disabled";
+		};
 	};
 };
=20
--=20
2.47.0


