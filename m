Return-Path: <linux-mips+bounces-7717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEDA2E1A7
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 00:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBC5118877B5
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 23:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB181991A9;
	Sun,  9 Feb 2025 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="YZBKIMA4"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B031B85CA
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 23:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144902; cv=none; b=GiPM96MTtlHAtOVLwjFjLdUhmz9Wdp6fNaUUhkYXhD+bQKsbAyCO1zPfGTGbhclnTOkfExg35heNv0TwNEVVJ6sy1q4BwqyNOIi0bwHJyrVWPdlo/3GkyIyZD/SXeRaOArKKkY4WcrRRx4J2zjZhzqPakJ9hgu4IQcxxa25YnFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144902; c=relaxed/simple;
	bh=a6UE8wMAI9FZv9/ryS9Bcv0eROubbnj/uI47miCzcbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXeOlbWaQE5qH3mRf+FU9dyzaQKnBlXsYCDifuSg/N8Qjb+pGkB3arZpGx1KZv1UxhbB0KUFjt2WvgHuNi33IhMddwSFYcGGZMHoUYIqlPPfUcDZQd0QkoathK26HG6pUA2m/qxZi032VlElVxFKDipRKXOFxgQ7OTVkopW+Crw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=YZBKIMA4; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B1F3A2C03DE;
	Mon, 10 Feb 2025 12:48:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739144899;
	bh=l/upjVotxSoO3Ct3ZBm+CDlsrjYDM2i5ETyqoJk0qzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZBKIMA49aPw2Zwiy4uyVrZqabdC6EeVmEfnSsRP70m685bXQL/jEpL/X/jasdwcZ
	 M5sLaAFvrf3A/SI/avxfbWtuzB4Sa+6HgdbqwT/QqzpbjAWORvKAiJd7EY5r8f1YfK
	 sXabkSZtwFxNOXwNy2EJzi3mVIsvPOn8e8sRgwbOoqu32Qhtrq8oaaM4DgvQ4yv180
	 sNAsrpLios1m6gvUiCetrZJMSg+SGo3s/Kr3/kaxv7IQzaYqqHmKmTm3Qq7neU7QA3
	 QpoYSAL/xDk0o4kvgzis4CT4+ioI2IuvFh5C0zvyNRvq5cBfWMUVli7ilqGW7Pqfg9
	 DLTDhxqEjLbww==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a93ec30000>; Mon, 10 Feb 2025 12:48:19 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 63BF813ED4A;
	Mon, 10 Feb 2025 12:48:19 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 53040280789; Mon, 10 Feb 2025 12:48:19 +1300 (NZDT)
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
	tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next 5/5] mips: dts: cameo-rtl9302c: Add switch block
Date: Mon, 10 Feb 2025 12:47:51 +1300
Message-ID: <20250209234751.460404-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
References: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a93ec3 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=PSQZVNSXpqiPPuIuS3oA:9 a=3ZKOabzyN94A:10 a=Ouh7WndvZ0esTx3naE_M:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the switch port and phys to the cameo-rtl9302c-2x-rtl8224-2xge
board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This is technically v7 of [1]. Differences from that are that I've
    omitted the MDIO busses and PHYs while I'm trying to sort out the swi=
tch
    bindings. I'll add these back in a follow up series.
   =20
    [1] - https://lore.kernel.org/lkml/20250204030249.1965444-7-chris.pac=
kham@alliedtelesis.co.nz/

 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dt=
s b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
index 6789bf374044..51306c104b01 100644
--- a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
+++ b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
@@ -71,3 +71,51 @@ partition@1180000 {
 		};
 	};
 };
+
+&switch0 {
+	ethernet-ports {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		port@0 {
+			reg =3D <0>;
+			phy-mode =3D "usxgmii";
+		};
+		port@1 {
+			reg =3D <1>;
+			phy-mode =3D "usxgmii";
+		};
+		port@2 {
+			reg =3D <2>;
+			phy-mode =3D "usxgmii";
+		};
+		port@3 {
+			reg =3D <3>;
+			phy-mode =3D "usxgmii";
+		};
+		port@16 {
+			reg =3D <16>;
+			phy-mode =3D "usxgmii";
+		};
+		port@17 {
+			reg =3D <17>;
+			phy-mode =3D "usxgmii";
+		};
+		port@18 {
+			reg =3D <18>;
+			phy-mode =3D "usxgmii";
+		};
+		port@19 {
+			reg =3D <19>;
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


