Return-Path: <linux-mips+bounces-13240-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EUsFeVMoGnvhwQAu9opvQ
	(envelope-from <linux-mips+bounces-13240-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:38:45 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EF1A6BD7
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E9C3108AC5
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3194F36B04D;
	Thu, 26 Feb 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YJhhWNuz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEB304BB8;
	Thu, 26 Feb 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112860; cv=none; b=TSGy+wvEOmHSqKFfdbochHnsmw10XRqV9P1WLXTsp97Est5Lx1aNja1lg5nEeuW8Ju+Eeiwp8VsOa+4xx/ZAol+tLxvajmad+tmRN8al05S/jkqr/BmmONG7KN99UEpwWnlw6sEfS0Eqggz2t1cdfu1ciP16a8QPe79pIpxj1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112860; c=relaxed/simple;
	bh=lxC7MoL5UQaC1HHed2m8XdzgEVxRLG3xEMoXukRUs4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jy96ZE6fg6XntJtsJ9c9k/ksmBGD/r2SRDyPdxB+i9l/Zuapzw7QmGWb8/jNXnaJJRveiPwMmdo7P4462cXJNEwMu/uI18au5GFAsoJF3NbNk96HOxW+xA9SS/qqtL5l6XzIMjwc/t+z3M0qW31n/+Fuz+elBeoErptk2PEndGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YJhhWNuz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FBE2C40698;
	Thu, 26 Feb 2026 13:34:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEAA05FE46;
	Thu, 26 Feb 2026 13:34:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7806A103691E1;
	Thu, 26 Feb 2026 14:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sZVsM7cOjX5aDJbulYzzyMObqmeiRrsk50vVV83iK4c=;
	b=YJhhWNuzm9vcBJS1aWuTtqwk9iRnAW/o884/uZbuJsVsBSqiHyexCMo+vQEqKg6Bj8sLQf
	rOwj04SlNF5gIFBWvUf8ZB6/riF4B/UgWZWbv3XiZHBLdnbdQchtZCAWQrII0X/Ahv69eU
	2uuJ2YxU5dEyjXsrF/kSBDy7BulgTIcIPuYgW7mJJupH08y/j5JzNIg2zKSdcPo6wDEN1I
	obOPg7CAnlevVbzB6pcMrtuABT6/ivO9BLT/mpwcH3gTZp/FRwum24+DreQR9WJYiXVjdM
	1j+mZNblydDw8KgbecmBdv/RISECtLmJg2EFoYPjQmYhsRVMoaorYiN8Qr4/9Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:47 +0100
Subject: [PATCH v3 03/13] MIPS: Add Mobileye EyeQ6Lplus support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-3-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13240-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF7EF1A6BD7
X-Rspamd-Action: no action

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


