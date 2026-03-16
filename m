Return-Path: <linux-mips+bounces-13697-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI6bI1QiuGmdZQEAu9opvQ
	(envelope-from <linux-mips+bounces-13697-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:31:32 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E2C29C691
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DEBE3051050
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA673A9618;
	Mon, 16 Mar 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g7wEu8wM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8DE3A2541;
	Mon, 16 Mar 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674776; cv=none; b=lkGZKiCMIdZ5hVJ+u5zxQj1kNoPog4OId8c3tpDmyhtAMzLfWBkvS9jzGlAspPcfJ/e38sglYMaTIndGm+H8IvVFsENu244oZhlg+MjXRJaT9dkObrR8E09NGJCbWYoAU65B+xJuMR1Kryd+kXSo0D1IrVA7lYob5CZwQ6SBN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674776; c=relaxed/simple;
	bh=HiF5B4Bc73eHsZAl9unZvix8uUjE2fsep39CeE6Z6ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGR4YRqSfGA7YabQjYvL78Qe5fwnKGFSvrwNbsZ2h9jbzT39tshnccU2Fo099JKrUZ/xp/PYnhgOAA2t58xg7C24kOuzBoIv2XKrcmj2wN8w07HiuIxt7tBfpW0EI6GcFv3ol4j9dCYOj3ulyWD85WtMhpLz8vNTv56PCenuATs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g7wEu8wM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED4CD4E40B37;
	Mon, 16 Mar 2026 15:26:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39045FC4A;
	Mon, 16 Mar 2026 15:26:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66969103721F8;
	Mon, 16 Mar 2026 16:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t13fTL38ybBnjcJkpfx+K3cUGVZwn08bqofOvp3rY/E=;
	b=g7wEu8wMxX14MPtuGpZ3ujPtebXwaYKya4BVSMUMXY6d2jmNLwfi4RsmVX1UH28Smz24ax
	7TqPs8xLfeEfQZMrZ1ORToYJgtJttR+2wfDycflPSIrX7m94pPIH4ADkroO5TC5PaxIAQR
	iTvbfvRa+zOxQaKSHvc3GnfBr3qNDB+MrLuqLLdAxjEDmuWmC6rOwHuFQkN1QTsj/hT7nD
	E3Ixl5ChZDd553sn+onzq581qTC0yunPSUfOn/kuia+eQ3RCavKnT0ibkNBJfon5A2xjmb
	DbvmB816++87ULv9YHpBPNzn/cb4hhtMAHXPgIe3y9r+8YYlLNjtfF8Ld5mxkA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:50 +0100
Subject: [PATCH v4 13/13] MAINTAINERS: Mobileye: Add EyeQ6Lplus files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-13-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13697-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 31E2C29C691
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use wildcard to match all EyeQ defconfigs under arch/mips. This covers
the newly added defconfig, and the EyeQ5 and EyeQ6H ones. Add an entry
for the dt-bindings header of the EyeQ6Lplus clocks.

While at it, add myself to the maintainers of Mobileye MIPS SoCs.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..63048d5ede7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17802,6 +17802,7 @@ F:	drivers/media/dvb-frontends/mn88473*
 
 MOBILEYE MIPS SOCS
 M:	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+M:	Benoît Monin <benoit.monin@bootlin.com>
 M:	Gregory CLEMENT <gregory.clement@bootlin.com>
 M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
@@ -17809,12 +17810,13 @@ S:	Maintained
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
2.53.0


