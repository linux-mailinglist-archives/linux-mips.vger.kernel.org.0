Return-Path: <linux-mips+bounces-12659-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 635C5CED360
	for <lists+linux-mips@lfdr.de>; Thu, 01 Jan 2026 18:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FFD63006F76
	for <lists+linux-mips@lfdr.de>; Thu,  1 Jan 2026 17:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EA02EFD9E;
	Thu,  1 Jan 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="q+c+ZCfM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443F2EF660
	for <linux-mips@vger.kernel.org>; Thu,  1 Jan 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767287542; cv=none; b=ro2Cl0Hb/zF83jizr345q8CZ2BawoP2hR6xKpqinMPuDAqnUfsVDikNgLtez3/VzLOCw4gYMhThRFTJ/va6tuuYPOiBmyNl9AyTR/quVK/8VMev5zXFBZ0VZkv3AqE5bn/50+O3NwyTvosHGQsVYqYaYj83dLIuP4jMbEVLCDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767287542; c=relaxed/simple;
	bh=oR0HUQkJ0g46vbysFl5WWvNBEbq3cfaE+xUpADAqJWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qmnc0GdRfl7nAi8AR9fOU06Okk5Oz2+yTCHeVgnJzHedgv8DpzR1e3LDSeqZocRLe1GC0vdXBHlPT9LBL5sJTTAkBjoog/o29Y8aHL3U3khafXfeWzRT0koytLdvSOHiJrglJvRHKgmzjrXhsClB10PYtCu7vusT+akaoGKERac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=q+c+ZCfM; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 27779 invoked from network); 1 Jan 2026 18:12:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767287537; bh=gELqvaeQlWG+ETN/6/E6ceX26B6xTdepXFs8chq3lOw=;
          h=From:To:Cc:Subject;
          b=q+c+ZCfMwmoMr40O6OZZL4mlaFRc3m1X7Lpsk7bclHMpZAZemj5bK3aJhxlwWiFyF
           fEZt4KhGEQdVyFpZjkIOVO/2sXTQmFhIgd7B2PcM+fFzVNdS91wJrvV8cm8v9zFTHy
           zT3CpBjHjx9+PzaG2LuqzCgyQt+1ltWC69/V6Y0PXyR2ykLEkn0XvnUj3Mu4zWeQNP
           xENaaAbQlIsjHD/4VAGcnQPIDdoCOszlrWonYi6RpEZDF7rj4n3VISq8BZKu9Z/Tkk
           9h0Tk4VUbF6MLn+xdpx1kzMpUYgY341v6cdr8JrE7+wPRQLGBJUuH9EYBYR3XLtW/3
           VZP76n17O0vdg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 1 Jan 2026 18:12:17 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chester.a.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 2/2] mips: dts: ralink: mt7621: add crypto offload support
Date: Thu,  1 Jan 2026 18:12:05 +0100
Message-ID: <20260101171212.1861241-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101171212.1861241-1-olek2@wp.pl>
References: <20260101171212.1861241-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 7243962c3d223ce7c88e29ac0c0c40f2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [wSpU]                               

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC and TLS offload, but this feature isn't
implemented in the driver.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 0704eab4a80b..9ba28fa016fb 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -361,6 +361,14 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
+	crypto@1e004000 {
+		compatible = "mediatek,mt7621-eip93", "inside-secure,safexcel-eip93ies";
+		reg = <0x1e004000 0x1000>;
+
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.47.3


