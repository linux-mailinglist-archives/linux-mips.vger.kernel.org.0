Return-Path: <linux-mips+bounces-7716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEC3A2E1A0
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 00:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8C8B1887301
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 23:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B041B6525;
	Sun,  9 Feb 2025 23:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Nr8JU9xO"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9571B4154
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 23:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144898; cv=none; b=ekxDqSLv6HWt58OzzmgqmmJrd+gbVKFtrs38t3Kp9BdE8TZOpgCKVQdQqCf4bLtVv5yAXVj0AnuQdrrp3VmoiLkZPsG5rrwPXn0/sbyOjptuKtkaGoSuXKe/e4b7vvpbW9qgLCATHs3IWy3oOyq3t9AHJlmAuLDehA37inyRWDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144898; c=relaxed/simple;
	bh=ruLYddTOT07Jf51VjD0tiKsSuUPQNuBrVQvIum8QX0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhtdWIq29xnb5kjwJ4dQg5kZM21fGHHxJS8gTuqfJY8s6rhwgeY5Z+sST3j3kod/AwHSpS80AVTAkILvvg1c6ax+fzixmOwkGNKEX1SM0m2iCsr9Q4HZtL7NlCPKYBHqUJTY47zF3tRttZZJuW1BmFVXnk0XDx/MPIagNZCm/I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Nr8JU9xO; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5A2C92C03DE;
	Mon, 10 Feb 2025 12:48:15 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739144895;
	bh=7Hz9wEMK0CGbnko5fjaTgnXMWOgCcf1nXU3UkRtjmGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nr8JU9xOG6paHdZVK5h+K4ypmlsMtZQMmYSjARJX3emNmzQeB9nBhYtj5rzlrQFo+
	 OW3bvnvc8QBcV81GeYlOav8Fo6oC1R0uBIOqu+GkcXuzNWAucuMApdDL6Kb6KiPK5y
	 TNgAKrfvRDkM6TPdssvXCBDS/oiBEfNs8URcNSaLaV24dLmp5pcmCX6HoHPXH6zX6E
	 FoO0n+GVDkoo7QM96k0O8fwd2ifmaIpUsgaQBTPkq457I9KKRdmA5/7uIdKLWvDTd1
	 8aDt0sFwq9rRk2F8sGJdYCKwGWUBnkq3KOoWsVg5WTO5iWvOVGENoPIdJznicQjXx9
	 Phln7ykzvVePw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a93ebf0000>; Mon, 10 Feb 2025 12:48:15 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2C6C813ED4A;
	Mon, 10 Feb 2025 12:48:15 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1B8A4280789; Mon, 10 Feb 2025 12:48:15 +1300 (NZDT)
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
Subject: [PATCH net-next 4/5] mips: dts: realtek: Add switch interrupts
Date: Mon, 10 Feb 2025 12:47:50 +1300
Message-ID: <20250209234751.460404-5-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a93ebf a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=UJtzyOLMF9nqRlb5STYA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add interrupts for the rtl9301-switch.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
index 17577457d159..beb5ab41cb64 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -33,6 +33,9 @@ lx_clk: clock-175mhz {
 	switch0: switch@1b000000 {
 		compatible =3D "realtek,rtl9301-switch", "syscon", "simple-mfd";
 		reg =3D <0x1b000000 0x10000>;
+		interrupt-parent =3D <&intc>;
+		interrupts =3D <23>, <24>;
+		interrupt-names =3D "switch", "nic";
 		#address-cells =3D <1>;
 		#size-cells =3D <1>;
=20
--=20
2.48.1


