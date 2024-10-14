Return-Path: <linux-mips+bounces-6020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 018EA99BD7D
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 03:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332E11C21B0C
	for <lists+linux-mips@lfdr.de>; Mon, 14 Oct 2024 01:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7111D3BBF2;
	Mon, 14 Oct 2024 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rjhTLPfL"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BDF9DA
	for <linux-mips@vger.kernel.org>; Mon, 14 Oct 2024 01:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728870778; cv=none; b=neMylsyjm1FUaWxH/hSVHIRSZ2M9KXVg5pP1H/grJo/DlAq/M1oJPkZz3/paWrXhu3Q+HaECjwyaKCmRPgqEyNgH4AOXEqjZZLjyjdJo24iNsTmTNslMZpZVN8fF9G21OHbTT2ypzqVm63En6xAvQSXtLxJ+cLfxn1WbffWAgDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728870778; c=relaxed/simple;
	bh=mFeyav5QddduTYIUvFeiLPSQs1Gt0Ly4xwRgt5dqZqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O65xAOXsH5j334Dd4ZhS6J7dZUcjYe2xfOF9q8FmoHf2EV0aGYchZzLn0/HqVpd0AGZ2HvHYbX/mnsA8Hfdrq3ySM55S8wsz+oQMZBxK27GnBuD5IsknU/tbLQPXXA8c3yZIlB9jbwPzmuQLRaW9rycy30pBYnRV1pAcrhhs4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rjhTLPfL; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0D0FB2C06C5;
	Mon, 14 Oct 2024 14:52:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1728870772;
	bh=cqj3hdXBlO1Y2UUkU9a3psR9aKY4yQajoN2+PShqqVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjhTLPfLFLpyWjVRLiLnl0a/FO0QYw2NJEyzfCy/zQoYPeeY/PGk08Jj52Nd+ca6Y
	 CzA1NRo/WKqueHJ3cLgHvmwqJRgLQQwhDIzCwZw637va+LJaSuHV35yJp7RnJatVZM
	 uZGGdvz+bzn4r2xHk43Z5ik+uWa3ZH3Mt++Bcm5U5J2nmPOG0Ng2cmE+GAuvn70Jif
	 mVUh/icoY8oPhxL+MoBKGfxtDWNpob3DtqiSyIpMCGiFMCGlG+1sIZQ9+30HRrdgp2
	 8KHvMiXOO3bx0L+iTMBm225LtbjxpH1420hBRTZfQGMfXF4lnuiUl0G/cg5Zsd1ax5
	 Gkz8MBiLzZqJA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670c79730002>; Mon, 14 Oct 2024 14:52:51 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8BC7C13EE9B;
	Mon, 14 Oct 2024 14:52:51 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 8CF34280090; Mon, 14 Oct 2024 14:52:51 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 2/3] mips: dts: realtek: Add SPI NAND controller
Date: Mon, 14 Oct 2024 14:52:44 +1300
Message-ID: <20241014015245.2513738-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014015245.2513738-1-chris.packham@alliedtelesis.co.nz>
References: <20241014015245.2513738-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670c7973 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=8sy3EPFDi6gx0CG-VEIA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the SPI-NAND controller on the RTL9300 family of devices. This
supports serial/dual/quad data width and DMA for read/program
operations.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - drop wildcard rtl9300-snand compatible
    - drop clock-names
    Changes in v2:
    - Add clocks

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f271940f82be..b01a40ec3064 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -32,6 +32,8 @@ lx_clk: clock-175mhz {
 };
=20
 &soc {
+	ranges =3D <0x0 0x18000000 0x20000>;
+
 	intc: interrupt-controller@3000 {
 		compatible =3D "realtek,rtl9300-intc", "realtek,rtl-intc";
 		reg =3D <0x3000 0x18>, <0x3018 0x18>;
@@ -59,6 +61,17 @@ timer0: timer@3200 {
 		interrupts =3D <7>, <8>, <9>, <10>, <11>;
 		clocks =3D <&lx_clk>;
 	};
+
+	snand: spi@1a400 {
+		compatible =3D "realtek,rtl9301-snand";
+		reg =3D <0x1a400 0x44>;
+		interrupt-parent =3D <&intc>;
+		interrupts =3D <19>;
+		clocks =3D <&lx_clk>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		status =3D "disabled";
+	};
 };
=20
 &uart0 {
--=20
2.47.0


