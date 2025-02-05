Return-Path: <linux-mips+bounces-7703-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A3A288B9
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2025 12:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C3FC167F03
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2025 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6545122CBF6;
	Wed,  5 Feb 2025 10:54:55 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916822CBC6
	for <linux-mips@vger.kernel.org>; Wed,  5 Feb 2025 10:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752895; cv=none; b=d9a1r5d+VuMUTnY5XlNTWJlNT6zGLQgcxNN9HSS67R9zZbcq+PPducg116iXyWfghpQURziNxd6DSL7prSFfrOd6hVbezMo3Rb2zqtjqpLFng/58YkFklFTo6tTiGNVZ6tQgcRzlzHPKNG+HfX/z6rmgXO3nupqYAM4kVYYVUY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752895; c=relaxed/simple;
	bh=LwB45cQXaV2CP8IGp4bt69pIX5N6Zbuzd2YyNMNRxGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iomn+h2bJW3z5oJanEOiOjT80FPvRrB7VFEhPyW/desLo+AOnINb7fzMEbBuilTgT3Uk96TYUsZHIZ/ttrAsr5imsKHOkCaLWaY7GR/4g9J/sShFPTysszwGmjGs31l90/F6jUUi4VoXicA1xSPZ+LkxPlBbE7E6+WNghnnEIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by michel.telenet-ops.be with cmsmtp
	id 9mur2E00B5P95W306murs9; Wed, 05 Feb 2025 11:54:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfd3H-0000000Fsrv-0YSl;
	Wed, 05 Feb 2025 11:54:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfd3T-00000006Nr0-0qOT;
	Wed, 05 Feb 2025 11:54:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] mips: dts: ingenic: Switch to simple-audio-card,hp-det-gpios
Date: Wed,  5 Feb 2025 11:54:47 +0100
Message-ID: <7a2884f164a9e088769b6e2f0cf11df6ce184514.1738752640.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated "simple-audio-card,hp-det-gpio" property by
"simple-audio-card,hp-det-gpios" in Simple Audio Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v2:
  - Add Reviewed-by.
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
 arch/mips/boot/dts/ingenic/rs90.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index 5d33f26fd28c8bd8..8455778928b71cee 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -91,7 +91,7 @@ sound {
 			"MIC1N", "Built-in Mic";
 		simple-audio-card,pin-switches = "Speaker", "Headphones";
 
-		simple-audio-card,hp-det-gpio = <&gpf 21 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpf 21 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&speaker_amp>, <&headphones_amp>;
 
 		simple-audio-card,bitclock-master = <&dai_codec>;
diff --git a/arch/mips/boot/dts/ingenic/rs90.dts b/arch/mips/boot/dts/ingenic/rs90.dts
index e8df70dd42bf8e4c..6d2c8aea5f499d34 100644
--- a/arch/mips/boot/dts/ingenic/rs90.dts
+++ b/arch/mips/boot/dts/ingenic/rs90.dts
@@ -148,7 +148,7 @@ sound {
 			"Speaker", "OUTR";
 		simple-audio-card,pin-switches = "Speaker";
 
-		simple-audio-card,hp-det-gpio = <&gpd 16 GPIO_ACTIVE_LOW>;
+		simple-audio-card,hp-det-gpios = <&gpd 16 GPIO_ACTIVE_LOW>;
 		simple-audio-card,aux-devs = <&amp>;
 
 		simple-audio-card,bitclock-master = <&dai_codec>;
-- 
2.43.0


