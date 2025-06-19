Return-Path: <linux-mips+bounces-9410-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF8DADFA95
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 03:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A2E5A0AFD
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 01:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7466B1A23BE;
	Thu, 19 Jun 2025 01:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="j6iOGmh8"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62208189F39
	for <linux-mips@vger.kernel.org>; Thu, 19 Jun 2025 01:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295284; cv=none; b=R+uMzLTIUptj3y6swVgATl8h8QMmZjwNrcZf7xuPHi6d1R7jGf19Erdl0xjuMA/kNYyluI66V6cwJosrZorqwAqXOpIV6JXPF6STH9IfGQo2vOKqnvCjvlMVE9rW2RdJw3P1fJxIJKz/tsn4EBaauf6X7cXBkeeGpTDxgJyuEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295284; c=relaxed/simple;
	bh=LAm8O2wRtElHNPndyisEHT2qEXlshWQSVK//qjeQ3Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h72bofwdAP73bT87gZeil5fIMuSwKsZqWtQjCJc5jhWc3W/WyCANb4JkQqWOXaKMpl8d//nxOcw4bMsRLluKi1Ro+cdv/JOOSX9rck2ymy6qu3N6nHlJ8iv10wN77xjECEOGJ1yFi2cj/sUgGJgg2xq0GG/RVVbcTmVkXo7zl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=j6iOGmh8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 26CC22C03E7;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1750295278;
	bh=um08sUCuz3DfYUzBjfkr36tnudyLBNksIEwQMDoLsTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6iOGmh8/6cAspaaiW/BFRw33cGM5cO/ph/9fICg4ehr/T2LkuCEg2OTTyPJcwMOe
	 2XM1LSAZ6lN6alTi2nHTFpSH3uPSvqtlxhED2ybGGT0KBKhcEGxM0V82VostzhMyPC
	 69CQMzbaSYsWuF3qRDtrW1ttC6MK0GW+MZJLm3dCmaQYwbh37Nlnav5FGu4SCyeAsR
	 vQPcKrCSj3zYkvebsIIOJPzRme4kZ7A1c3Bwb2FFLc2O2VrAt0043oIMx4SidxGn1a
	 i/01nysR2Kk2aLkhkNBInAssOrN2v+SCpRnl50XH/mVEKvfmRfiMRSlr071ao+EV16
	 tEVcl96A6ejmg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B685362ee0002>; Thu, 19 Jun 2025 13:07:58 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 05B3E13EE56;
	Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 05E4C280993; Thu, 19 Jun 2025 13:07:58 +1200 (NZST)
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
Subject: [PATCH 2/4] mips: dts: realtek: Add switch interrupts
Date: Thu, 19 Jun 2025 13:07:52 +1200
Message-ID: <20250619010754.3760612-3-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F7/0dbhN c=1 sm=1 tr=0 ts=685362ee a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=6IFa9wvqVegA:10 a=-PkYcgLZfBtAEEs5c10A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add interrupts for the rtl9301-switch.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 101bab72a95f..74b30704f188 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -48,6 +48,10 @@ switch0: switch@1b000000 {
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
=20
+		interrupt-parent =3D <&intc>;
+		interrupts =3D <23>, <24>;
+		interrupt-names =3D "switch", "nic";
+
 		reboot@c {
 			compatible =3D "syscon-reboot";
 			reg =3D <0x0c 0x4>;
--=20
2.49.0


