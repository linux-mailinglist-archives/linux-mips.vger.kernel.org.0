Return-Path: <linux-mips+bounces-9408-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A438ADFA8B
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 03:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5121BC0A0A
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 01:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4900F19E992;
	Thu, 19 Jun 2025 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tLCLqUjU"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62067175D53
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295284; cv=none; b=MieeB832agy81RF85snkWIxf90UqbJhgWgISKyFTlr9cQ/ezd2S0/8WQdNtYIJ25NHuALf7c06gab5oxrG/qVhqkbqOQLyc0F/lidZfAcxqt45lSt8+T21VLjgyuB+cCFkHb9Ucv3g9PcVfJAExW38qMWbWl6e+yw11AcAbZ1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295284; c=relaxed/simple;
	bh=XVB9thgNi1didXz5aWGiHjLjyRTPcEHJKWRSyNTp4fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVQztuUCR36rZeUzBGJGagbqw5/dY6tGrVqBi0D5M0/h/wodY+erzNO73h2WQB0GmvM57uxVsZj+QR3rphON+8cOhE1iWUp8a9iveiQNWDlk2RfQQJKUNWg4QGgaJXnzVl9aMErPIbucOGclGoxnWnrCncEW18R1roj+9NvTEnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=tLCLqUjU; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6F9B62C0BC6;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1750295278;
	bh=7UmSMxZInk7rBl0e8y0lvWe7dE2+hkbf4Sw2iH0CEmM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLCLqUjUtkvjGJBnnBji7/Rz6W8XqEczkKobhBEp4ZcB35PeIvia+4PqwXmGQAODL
	 tHDgdkbST8j2H3ZvPt3PvXiy2/tS2s3BFLBJtBvoZ6rn7KurSVXXtkdnWORMJH1J9d
	 zUkgCxac5nizBvGvB2lVYw61RlFc8WrFHTVxs8iQ1fvD4vqnLHODcChzGE5McZSgH2
	 prwJplZylR8LlbmR3ZYRT4dcAc8hWMboHgDNaFfG9rcUW4zUs72r+LVr5qUhCKSeO3
	 h1WiagGJrdPtGsU2S3/ZcfOSwJyUKMNtS7zZWMQtgQMmMeb+pfNpoo/hCCcSXozmSF
	 cLfYF/nV71+eQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B685362ee0004>; Thu, 19 Jun 2025 13:07:58 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0B30913EEA1;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0BD95280993; Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
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
Subject: [PATCH 4/4] mips: dts: realtek: Add gpio block
Date: Thu, 19 Jun 2025 13:07:54 +1200
Message-ID: <20250619010754.3760612-5-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F7/0dbhN c=1 sm=1 tr=0 ts=685362ee a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=6IFa9wvqVegA:10 a=jdP34snFAAAA:8 a=GAZJBr5AWi_iGCRPYoMA:9 a=3ZKOabzyN94A:10 a=LeixItDrjNxFEfIwcpfa:22 a=jlphF6vWLdwq7oh3TaWq:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The RTL9300 has a block of GPIOs included in the SoC. Add these to the
devicetree.

This is taken from openwrt[1] the differences are removing the
unnecessary second cell from the interrupt and removing the -controller
from the node name to conform to the dtschema.

[1] - https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dtarge=
t/linux/realtek/dts/rtl930x.dtsi

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 77a854034aba..24e262e2dc2a 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -156,6 +156,19 @@ watchdog0: watchdog@3260 {
 			interrupts =3D <5>, <6>;
 		};
=20
+		gpio0: gpio@3300 {
+			compatible =3D "realtek,rtl9300-gpio", "realtek,otto-gpio";
+			reg =3D <0x3300 0x1c>, <0x3338 0x8>;
+			gpio-controller;
+			#gpio-cells =3D <2>;
+			ngpios =3D <24>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+			interrupt-parent =3D <&intc>;
+			interrupts =3D <13>;
+		};
+
 		snand: spi@1a400 {
 			compatible =3D "realtek,rtl9301-snand";
 			reg =3D <0x1a400 0x44>;
--=20
2.49.0


