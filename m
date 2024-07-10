Return-Path: <linux-mips+bounces-4231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C860A92C9C8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E691B22855
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22D14206C;
	Wed, 10 Jul 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="i0Vbz1VC"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333A642ABE
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586141; cv=none; b=GrOJKl40MCHcgImxvUcAl13tsj5VHRRwYA9lJCCtVDbiosI2aV2SfcHCTwCCGwx4VQz9264cPAWFrbVevkHYATDp14POzgnMnCESP74jFLLkOtN+35OyMWWKa9zdGJ8RDIp8PE0u4qIQIqzvPDpBtb8WthVu368iqfzwPdAYw9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586141; c=relaxed/simple;
	bh=qTYJd2w0i5KAQ2s7Ov2O0mWKJHRIwhtqnGaNmcXmKNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjtlKmBQz3ta3/FdCSveP3cJojpD6zj9Qvw5J1EfrtpInMJQDULa1vnH61YkP6ODzF349FNR1gVeEg81SbkZr5t/0Rhsuq6DjU0XErQmUCK2hJyaa2OJA59dELQ1rMrCZFMpVCm3vTejhV9cHzt0QeBufdALdzvGY4U61qNGoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=i0Vbz1VC; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6B2752C02D1;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=+uOoH5rpYokSgRgcDuG50BcqcOLnHUFomDnjH7J3RZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i0Vbz1VC8J1bj+MucZZe8e+y+5npeMEtLKGZUeFr6tZ47yQSiQyuTyyjGQfsDbfAF
	 4qndiquPeBxIJM5Feju4v84PVRMDcPKArTBj/s3odwsjlVh/IiVD8JkEflzY23vgo4
	 I6OS9DxgNorOUoDtto3TftGTclwygN/NUkRx2FqqtrwlCSbjYGlVQ1kX65B8kU6N6y
	 VSjUjvIOm6xO/LXyZaTsr7dD0f+ThY+ezDGko4Fbnk9iUSjGqCIIdura5AkTPHwSNR
	 jSAJXhgsV4yfB8DYWeftqBKqo1igcoPBtaHSJUBpfHVy+S7GOgKrhZwto7LuMC1rNa
	 QzGw0/nkFtoog==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920001>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 042CF13EE5B;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id F300828034A; Wed, 10 Jul 2024 16:35:29 +1200 (NZST)
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
Subject: [PATCH v5 01/10] mips: dts: realtek: use "serial" instead of "uart" in node name
Date: Wed, 10 Jul 2024 16:35:15 +1200
Message-ID: <20240710043524.1535151-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=VwQbUJbxAAAA:8 a=fO4XG2tHwy1-jxZR0dsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vBONLeOcVZgRSqRidLXE:22 a=AjGcO6oz07-iQ99wixmX:22
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
    Changes in v5:
    - None
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


