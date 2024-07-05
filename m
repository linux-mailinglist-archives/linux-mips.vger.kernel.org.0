Return-Path: <linux-mips+bounces-4140-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F439928027
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA3D1C21A57
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A051E171B0;
	Fri,  5 Jul 2024 02:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MawbdCNY"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24B14286
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145737; cv=none; b=qkrdImgfuKF2Ag0QTw0rRfHOB48ToHtNmrBiQMUDuKoSsPPjorJXvbzVtegSO/K2y+3CeOsNXNDXnmHTSHnhYtP3pFoZml87TXCFr6Rfn1FFPllARpyu/IXxxt+CpuqvjJVI/0bKq/jmYYm5inQ88KMebnd0dp0YYYJThh+MxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145737; c=relaxed/simple;
	bh=qne5pkOqpJo4+L1qvR0fKmleTZrqPkJ784D+SCQmblw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AphHR9iQpFUiV+ipLARaeVlv/XA3Z7sWQ4StRdR8I6/MWX2LckvlsFB7vjMz6I7I+bTc+4zaL/8Sool8yiiIWkq/KugWhqiZyGrfsawcBhVMGomt1hQV8T2lATWQxT3HKyuhQNh6fa1VybaIRqoILFCLf2UEEaAt8kiklNM4QG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MawbdCNY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 29AF52C05E1;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=pwUN5lYMsmvuVpK7tHjZdOJjDehz/TxwOscJJ7zxGmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MawbdCNY+bOz031/n7ESn3SOYLzWrnqbKa0dWhrzHrwTKOclIV3fJVBEWJTWbr4Ty
	 poK1Hw1M62jix6FiPF1rxa30578eKRrSS/TUCmVy5Nm4ItQsMwUhC66s3mYl1845Co
	 Eto6byAHG/Q5C/gY2N6RQvpByFxDZOQZ45VDY2EC13z29k+DQQBunbFD2JgtmheDhp
	 QODOtgiS1br4yZO+oiH+xsEJmDTkgxuuVfNgTRucpAlULJfRfcDGE8HstjgWlOSvGD
	 wQZ8gYrFGLq8I1C1xwDc2YXcddbQ6jpH6hJ660mVhqRJ+WCuJDju4rGlhiZ3USgT/u
	 aLVvnmyfI0tKg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0002>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 76F2F13EE52;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7157E280018; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
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
Subject: [PATCH v4 1/9] mips: dts: realtek: use "serial" instead of "uart" in node name
Date: Fri,  5 Jul 2024 14:15:12 +1200
Message-ID: <20240705021520.2737568-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=fO4XG2tHwy1-jxZR0dsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBONLeOcVZgRSqRidLXE:22 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Update the node name for the UARTs to resolve the following dtbs_check
complaints:

  uart@2000: $nodename:0: 'uart@2000' does not match '^serial(@.*)?$'
  uart@2100: $nodename:0: 'uart@2100' does not match '^serial(@.*)?$'

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
---

Notes:
    Changes in v4:
    - Add r-by from Marek
    Changes in v3:
    - None
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


