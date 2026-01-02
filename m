Return-Path: <linux-mips+bounces-12712-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7FCEEEC3
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 16:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDBD130386BC
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 15:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFE3298CBE;
	Fri,  2 Jan 2026 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="oOYRycXC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37500298991
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767369237; cv=none; b=J4FXz++Pb4/bE14T4damEoquPTV+1/emK7skHDT9DpJNDISlDBciVWkUuk81y+l1b59YvhA02Mx3uLfFIBd4G91uForCOWjnuKDs2/OxihOlcYMjs5GzJLseUf3g3ZzRy37/RnCjLH8LzoCkHuybGoLwSWIHeiP1yW2MmXx2TmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767369237; c=relaxed/simple;
	bh=EAmGXJhS+kV/8kTjvDsx6PH6pL66FGnsepLKxD69+3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKOx/kjaHzUrmZel/GARyjfSUF+jYKljmawv9f1zOGb9U52o86Jy8cuwIzwt+JXMxHBCamT2Ge912q49I9VD6rY+ETrWeK3IVqFzYCVPFakNIkEy5MJFtMLVfFLSfTHsaGCxArvGwmbZOvxol/XajMQ2u89rzwIs2yfdZMbBqWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=oOYRycXC; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 32318 invoked from network); 2 Jan 2026 16:53:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767369227; bh=TTGeIMt25YFQMOKiNe5dlnsk2HQeFBOtHs64bmOahIU=;
          h=From:To:Cc:Subject;
          b=oOYRycXCsRyk+B/Ca18edU2AKKDlzAzcLRAB4fvsVuhdQedWv9wCd2GYSs0z4gdgT
           W0x0l52G/q4Qyx1xulNw3ma7UgLk6emEu7eoQCERSlLVv+VC9/sY6gMjZCluOwnjXO
           lvOaOWapATbMIvat+NpA9EPnyTGuW/DYENZOpGGQfSIxkzK5uTwDY8g16I5TYpGOaZ
           HP5iwuyibqgc6+PQLYSuPxkoFfbO0r1cKqbtE2ilPG/geG0L+eCSh9fuhJO1tShFh8
           RVmszpbUJz5ENLQ0M5X8+0QUMKYLsSpV1peBHCP0PdWSR4slIxQJOY62NZgAmVn7uy
           vCnOipsR4BT2w==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <benjamin.larsson@genexis.eu>; 2 Jan 2026 16:53:47 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: benjamin.larsson@genexis.eu,
	chester.a.unal@arinc9.com,
	davem@davemloft.net,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	conor+dt@kernel.org,
	herbert@gondor.apana.org.au,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 3/3] mips: dts: ralink: mt7621: add crypto offload support
Date: Fri,  2 Jan 2026 16:47:35 +0100
Message-ID: <20260102155341.3682013-3-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102155341.3682013-1-olek2@wp.pl>
References: <20260102155341.3682013-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 7b471dd560ee9b622f99c1c75cb1178e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8SOE]                               

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC, SRTP and TLS offload.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- Add reset line and clock gate
- Change commit description
- Wrap long line
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 0704eab4a80b..e1047dd861c0 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -361,6 +361,19 @@ cdmm: cdmm@1fbf8000 {
 		reg = <0x1fbf8000 0x8000>;
 	};
 
+	crypto@1e004000 {
+		compatible = "mediatek,mt7621-eip93",
+			     "inside-secure,safexcel-eip93ies";
+		reg = <0x1e004000 0x1000>;
+
+		clocks = <&sysc MT7621_CLK_CRYPTO>;
+
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
+
+		resets = <&sysc MT7621_RST_CRYPTO>;
+	};
+
 	ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
-- 
2.47.3


