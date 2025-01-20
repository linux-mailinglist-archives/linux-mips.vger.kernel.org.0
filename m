Return-Path: <linux-mips+bounces-7537-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D84A165FF
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 05:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 035FE3A894B
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 04:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4689B185924;
	Mon, 20 Jan 2025 04:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="v3TkMVcE"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803514A4C6
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 04:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345752; cv=none; b=IczRrsay6HPel9uqY0H6Eo3O6ztLBlpc5mfDkrDIpJ9sKTnztK1XQRwFNtSqsA+B4UtA5m5hOIkdZqYh23N/K2Ka/f180FwPRPsRyK+bdPhuPL401sSKWoheVR1CcCM6BPVKHLEMKK1j+X8GSFbygTnXAxIqTH6BfWjbryz1XwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345752; c=relaxed/simple;
	bh=VD6imiT5FXVt7uRzdx15NgMsCbcZlIJDvlR1GwWIyMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIiuKzu5oJo5Raj8nBEskzZzHaxA8EfOaBBtPYAiplftMVbD233b7xIQpavuDvX2VSvOtozKysbx+T6NUxMWY5T3dpe9MZWs2KfnebiLQA5EkqRw3nklbjf0Ps2SD2Ae7CHiLD8+L+5WwFvT/USuI1sVGCvy5EVR0ZMBcZVYXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=v3TkMVcE; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4B1552C0A03;
	Mon, 20 Jan 2025 17:02:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737345747;
	bh=ZtcSOSWYGN71FDIeCDMTSwJXcVqykFy5QRQNex4r2wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v3TkMVcEHARoMDyF39s13Uh/sVch+ExDEjDu67L/4UOlV6x6Abx9dOIFXzY49oWAD
	 UbejTmMoVriKkrqmvMBj4tzZqvNJvRlqjDRZg1oH7mshjFulOPOfoROVs1WCR9vDkI
	 Ac1AMmdMLzILUol/hM/1HG62Ivm/gGItY4cqt3nB2NWvaYbnjISxgZtPVxx0FrGhSd
	 SdB+PMDF7ITvLS6yM5LfsN/VsGN+CQ6XxdVtVKQEjopJhaOSvzasA542ra3RgjqmEi
	 JMOqHuSKtfbDve3iWjtmgj3BoWn+4oaYDHFQCTSoCbWI0YfqWlVTVlwe1IFsEq6/5M
	 CL/kAMqPrPzDA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678dcac80003>; Mon, 20 Jan 2025 17:02:16 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8CB3C13EE9B;
	Mon, 20 Jan 2025 17:02:16 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 884F52801C5; Mon, 20 Jan 2025 17:02:16 +1300 (NZDT)
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
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 3/4] mips: dts: realtek: Add MDIO controller
Date: Mon, 20 Jan 2025 17:02:13 +1300
Message-ID: <20250120040214.2538839-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678dcac8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=eNu-1RZL59X_yhr0BEUA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a device tree node for the MDIO controller on the RTL9300 chips.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v4:
    - Have a single mdio-controller with the individual buses as child
      nodes
    Changes in v3:
    - None
    Changes in v2:
    - None

 arch/mips/boot/dts/realtek/rtl930x.dtsi | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index f2e57ea3a60c..8410411fbba6 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -69,6 +69,38 @@ i2c1: i2c@388 {
 			#size-cells =3D <0>;
 			status =3D "disabled";
 		};
+
+		mdio_controller: mdio-controller {
+			compatible =3D "realtek,rtl9301-mdio";
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
2.47.1


