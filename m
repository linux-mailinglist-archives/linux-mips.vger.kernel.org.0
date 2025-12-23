Return-Path: <linux-mips+bounces-12573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 706ADCD8ED3
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 885033024AD9
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD113346A0;
	Tue, 23 Dec 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iperW+lT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5E331A57;
	Tue, 23 Dec 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484177; cv=none; b=ShKrdODVR2weUsQwTvHVtO7byAFGNqvgSucMpjx7imG4sD8QKd05ojpgPs2JNbEJh3ZGlxHTt1ie0ulo82ZjWkodcmw4t31m5FHZmT4P62GmE1eFBiyMXW6fcYttUMKLBdtfduAdn2x/xsBuUYQUh52YtdylDG7cYk/2CfU+jCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484177; c=relaxed/simple;
	bh=q7RdnZDNGPdtLUkMHbdf2etWGBw+6gEHaQHRAO6tsTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utiQVkWRN0S/Nr/Fq4hs1xz+MqbCM46nvQoZpPCcazjHe1URvIMVqghbaAjLUEi/HW9vBgixqZkaeU8GCY4+DoQ+p9KfweL6Z5NadvMKI3SXfki37ElcnpdvBnT56FhagfxF+5PkJYEgYq//32T16Dpe064yKP2rrIptrnGrEGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iperW+lT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41345C1AE20;
	Tue, 23 Dec 2025 10:02:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5426C60716;
	Tue, 23 Dec 2025 10:02:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C17A610AB09C3;
	Tue, 23 Dec 2025 11:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zj8tUwaHgZcNcI4ZMG5AlwOf0TWVox9yuCZkaI8PKLw=;
	b=iperW+lT+bxOtp+pbMTpdlv1C4f/llWL27AuPbmxYqPCwSdVwpkI017LC9XNSuceIZB8QU
	Epegt0djokgacWjkedqdE50Jt8ek+UpY7i4eH10lIjifBBnhwLOvkL7Fj1ujtoGMoG1Gef
	Au4hxR9fU0UUjXLfRbXWWf1x/b9Uv/vVxpAwriERbrdq69k5dixKcxExx15vFNds7cGx1/
	caW/dSltw0KCVYR7fjZDm8JSmrFeINqR5SFFY3xCp7Gd5ESpdt72r/wRhdQZkzUafkAWQa
	cycVrt/SBsIN6MTdvDL5/+V+kmAv26zt9/9XuzTp+H0wvrQ2Xtty7S06LwS8Jg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:28 +0100
Subject: [PATCH v2 13/13] MAINTAINERS: Mobileye: Add EyeQ6Lplus files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-13-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Use wildcard to match all EyeQ defconfigs under arch/mips. This covers
the newly added defconfig, and the EyeQ5 and EyeQ6H ones. Add an entry
for the dt-bindings header of the EyeQ6Lplus clocks.

While at it, add myself to the maintainers of Mobileye MIPS SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..670e93ddf2f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17595,6 +17595,7 @@ F:	drivers/media/dvb-frontends/mn88473*
 
 MOBILEYE MIPS SOCS
 M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Benoît Monin <benoit.monin@bootlin.com>
 M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
@@ -17602,12 +17603,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
 F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
-F:	arch/mips/configs/eyeq5_defconfig
+F:	arch/mips/configs/eyeq*_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
 F:	drivers/clk/clk-eyeq.c
 F:	drivers/pinctrl/pinctrl-eyeq5.c
 F:	drivers/reset/reset-eyeq.c
 F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
+F:	include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>

-- 
2.52.0


