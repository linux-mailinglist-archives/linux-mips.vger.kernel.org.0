Return-Path: <linux-mips+bounces-7845-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6480BA3A816
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E31107A4654
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092B41EFF89;
	Tue, 18 Feb 2025 19:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="adf+xkBs"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71541271269
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908360; cv=none; b=FLsUh0gotOBSJ696UkEa/ufQOKnkKZy72Qr9pJ5jDeYsveu8+o2Oii+Pnc8AimpMUTR/9YKpyZpaVlvaYNEo5HaaOQonyE30nqU5zDrh6XF27/JsvR/guJ9JYyvV2Tm/+mQiKAnH5S1OSeuRMTpiwgjC1oxg4M7W+QE3xA8q+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908360; c=relaxed/simple;
	bh=a6UE8wMAI9FZv9/ryS9Bcv0eROubbnj/uI47miCzcbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfR+iaOtGYAKwXXZIjBbz0KSh1RWRJHbs3RU0+au1+CDmUot/PX2AQyo3PgleUvN2YrDC86IUm53v7j9si1sUxwlEFXdu+jjZ1r+iwhPZm/zeQrIMsZPmPfXAUMII3O3jqqR1hHshPK0apez+3z1mTs4Lbp5b324evdux3r/d3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=adf+xkBs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 35F742C00BE;
	Wed, 19 Feb 2025 08:52:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739908358;
	bh=l/upjVotxSoO3Ct3ZBm+CDlsrjYDM2i5ETyqoJk0qzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=adf+xkBsykOLDcipD5TksS5rbomqGs1pRb3Kn4h8zEh08qJFiFyl7z8b0ime1w4Pj
	 eNPUGyJ+NzAW4zkymr0U9AJU/D0BiQ+pZKUw2pdM4gnK42e3q5KATMazF+y/ktsqY9
	 SJWyK7Sybv9sgKKhIwtrsmI/G0MlcQMwrTJDib0zGb2gbpOqCdI72fcu/nwaewHQIL
	 ah1fVKJr5V1sE0vuZfzmzHSbTLZTS7ZtNQruvfJ7Q853MytnlBw0wMmz7KsU7WZlAm
	 MmAfz+YcOLKX6UZNK8v4oV1aQlo4bj5Ve0Xtz/FGSsdSZn4f04oWwIeRDssJ1kFrB7
	 A3Is1uNo8y89A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67b4e5050000>; Wed, 19 Feb 2025 08:52:37 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id C1FD713EE36;
	Wed, 19 Feb 2025 08:52:37 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id BEB022804FB; Wed, 19 Feb 2025 08:52:37 +1300 (NZDT)
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
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RESEND PATCH net-next 5/5] mips: dts: cameo-rtl9302c: Add switch block
Date: Wed, 19 Feb 2025 08:52:16 +1300
Message-ID: <20250218195216.1034220-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67b4e505 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=PSQZVNSXpqiPPuIuS3oA:9 a=3ZKOabzyN94A:10 a=Ouh7WndvZ0esTx3naE_M:22
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


