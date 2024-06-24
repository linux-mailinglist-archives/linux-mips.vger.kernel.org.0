Return-Path: <linux-mips+bounces-3874-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4859E913FC7
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1581F215B5
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29569107A0;
	Mon, 24 Jun 2024 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="x3DfDFHQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4638BF0
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192197; cv=none; b=sJyq8BjH9h5PmNvaFayIqZZHZULbaQ6hYbr7qvGAe5Vp/CebVYa1cQqTv29ItDsbm63Ro3Xt74z+np7Dl3gWmAEmkqva4C7gYuHHBdzdDMpScAAxqADmmTTtO+09sY9Ug2OKHsKWFnLpUqBSx0ghlcWd06nMh7kzl0FyhawJm4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192197; c=relaxed/simple;
	bh=PK2W04ll2hb3v5bvKi3h167n4UeVm/19716wzgjOpak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBq+r5xQn1s7XpJFLor9elKhWjG5B/cJ0cJ2xIvqEdfCbOWk4/lg3B7/jJhktyOxS8BxCT7TUjknfjSvhAGFkIozM8uvjhIAvVCRjJaUcMA5kQwS9z0FDcUfI1zTVLagMslEDaQTski53mdHl7Qg01E9z65SsRqCWgIicFhRxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=x3DfDFHQ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BA6152C0659;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192189;
	bh=7RK4VpqVUUaL3B9RJ09rDSqQRUnNry1hz3tgFTTAcV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x3DfDFHQ9LmfgtxgvpYcBES6K0ez/tg/NRHwFSu9+jQm3D4HJebPmTDjsyZbNslss
	 AoLXhYEsPj66i0eMrrQqSTDd5uhIrgZVEADfVyt4/BZkZbvvRYCJaFWwPvIYQ5jBUC
	 fW8GO3t0c0v6E5dbLaOay+yRiHpGQWhguOw+vDDrPv/vIYAB6erhZ7WtbdDYdgSiRr
	 9Va1ljM+q4rHL47rZWz37GQotU5cRtWBzcEge4PQbBMGZnLxwMgaKIhlsKQn3bhFZ9
	 0c7c75YigBUo2HN8fW4O7MnrXmbwEzYrDTtH8wX3MI+vzw3pcK4F0vI9lxl7+J3jB1
	 5B17iaK8Q/LAQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0001>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2F7C113EE6D;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2933728058C; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/8] mips: dts: realtek: use "serial" instead of "uart" in node name
Date: Mon, 24 Jun 2024 13:22:53 +1200
Message-ID: <20240624012300.1713290-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=fO4XG2tHwy1-jxZR0dsA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Update the node name for the UARTs to resolve the following dtbs_check
complaints:

  uart@2000: $nodename:0: 'uart@2000' does not match '^serial(@.*)?$'
  uart@2100: $nodename:0: 'uart@2100' does not match '^serial(@.*)?$'

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - New

 arch/mips/boot/dts/realtek/rtl83xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts=
/realtek/rtl83xx.dtsi
index de65a111b626..03ddc61f7c9e 100644
--- a/arch/mips/boot/dts/realtek/rtl83xx.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
@@ -22,7 +22,7 @@ soc: soc {
 		#size-cells =3D <1>;
 		ranges =3D <0x0 0x18000000 0x10000>;
=20
-		uart0: uart@2000 {
+		uart0: serial@2000 {
 			compatible =3D "ns16550a";
 			reg =3D <0x2000 0x100>;
=20
@@ -39,7 +39,7 @@ uart0: uart@2000 {
 			status =3D "disabled";
 		};
=20
-		uart1: uart@2100 {
+		uart1: serial@2100 {
 			compatible =3D "ns16550a";
 			reg =3D <0x2100 0x100>;
=20
--=20
2.45.2


