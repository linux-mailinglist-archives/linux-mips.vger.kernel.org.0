Return-Path: <linux-mips+bounces-13687-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMDyAFkhuGmdZQEAu9opvQ
	(envelope-from <linux-mips+bounces-13687-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:27:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B438629C502
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 66D4230349B2
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5E93A2577;
	Mon, 16 Mar 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FE8z8+83"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3543A1D10;
	Mon, 16 Mar 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674758; cv=none; b=PqE+Hof7HPyieZFJWJLFFpRzUvCclDWjU+oVTVpVkEBMubfp4hNjV7FsYytelkuzF9irSDwH6LMAuZPGyr37Jeyo4QIhUKX9wNlySUfPzBpqU35F3hKagW3Unt6yQOqfDds1qbuln/L/iAYYL5loAooKEcFRCmgOSWLJvGly2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674758; c=relaxed/simple;
	bh=lxC7MoL5UQaC1HHed2m8XdzgEVxRLG3xEMoXukRUs4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATqXsZmu3oimGzC0onpoYtielqxKETRfbxWWj386KH13j0vaWX+sQS3ZEoj6sSZbpYhJn7W2zpGoyCsXmfPoAlR4EIt+eSfFyrSQEPMX1Ix1k0vQL8hblgUe+J6RXbJo1gRQJBPzru6s/9svi7eLTzi7nZjnCDQWqK0rrKD1vaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FE8z8+83; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4C25FC55053;
	Mon, 16 Mar 2026 15:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA1925FC4A;
	Mon, 16 Mar 2026 15:25:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 742FE103721D8;
	Mon, 16 Mar 2026 16:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZVsM7cOjX5aDJbulYzzyMObqmeiRrsk50vVV83iK4c=;
	b=FE8z8+832N7U5ZkENIVRSq42j/XkI9fAi+pZd0z39G/dFCmrV3f5HutJqmsDA2e5JN4vCT
	ewj6Xjn/pyO7hwKyHBoh8F5cfv1aoJoDvBIGSEsB5IHi1hM+bpnaLXyTHiWy70RK0F+VXQ
	uTICy4HoaBRwZ0h9r01a2HRZFa8JX+e9JYoIREZVX+Rh3+4S3EcRUTkKcSY62Ydi7QaTNp
	88soEfw7W7VDidk5I+2KBP7jfROh+Dv3WTtB6PA0QmBS7MO5lr9NoMeyMtwwLsa4Y/PZgw
	icEj8+l0AZAniesyKthd0r+uzeBpeQVF96DnKgsJwBk028aTDrbwlbtqElD7Sg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:40 +0100
Subject: [PATCH v4 03/13] MIPS: Add Mobileye EyeQ6Lplus support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-3-bf44dfc7a261@bootlin.com>
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
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13687-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: B438629C502
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the EyeQ6Lplus to the group of choices for Mobileye SoC
and set the kernel load address specific to this SoC.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/mobileye/Kconfig  | 3 +++
 arch/mips/mobileye/Platform | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
index f9abb2d6e178..8a4868d2e28f 100644
--- a/arch/mips/mobileye/Kconfig
+++ b/arch/mips/mobileye/Kconfig
@@ -12,6 +12,9 @@ choice
 
 	config MACH_EYEQ6H
 		bool "Mobileye EyeQ6H SoC"
+
+	config MACH_EYEQ6LPLUS
+		bool "Mobileye EyeQ6Lplus SoC"
 endchoice
 
 config FIT_IMAGE_FDT_EPM5
diff --git a/arch/mips/mobileye/Platform b/arch/mips/mobileye/Platform
index 69f775bbbb1e..93b533492b58 100644
--- a/arch/mips/mobileye/Platform
+++ b/arch/mips/mobileye/Platform
@@ -10,6 +10,7 @@
 
 load-$(CONFIG_MACH_EYEQ5)	= 0xa800000808000000
 load-$(CONFIG_MACH_EYEQ6H)	= 0xa800000100800000
+load-$(CONFIG_MACH_EYEQ6LPLUS)	= 0xa800000108800000
 all-$(CONFIG_MACH_EYEQ5)	+= vmlinux.gz.itb
 
 its-y					:= vmlinux.its.S

-- 
2.53.0


