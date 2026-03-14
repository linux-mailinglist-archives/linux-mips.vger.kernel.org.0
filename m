Return-Path: <linux-mips+bounces-13642-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 162dOhr1tWlf7gAAu9opvQ
	(envelope-from <linux-mips+bounces-13642-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:54:02 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F19E28F943
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B4D9304933B
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 23:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68616FC3;
	Sat, 14 Mar 2026 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="JjsZ2sox"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-12.ptr.blmpb.com (sg-1-12.ptr.blmpb.com [118.26.132.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBA514F9FB
	for <linux-mips@vger.kernel.org>; Sat, 14 Mar 2026 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773532438; cv=none; b=duXONvRdKCnCTSTQMcYP8sNrsr8MEb3wwMvmh7p9jh7MK91ZSKYC08Jg9nmyJNlIMjlXKEMQl7Yed5f03weA1mJ7SolfyUE3YJA56ZFnzugtizxfq1djEGY5Hv/ItcY1GXzuwZKLWSHQO5manhlKG6DygRmQ7g5fgY7MACuAbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773532438; c=relaxed/simple;
	bh=jbTjQzTzKLODEEV96JhJ4cxD23a4Xp2o5KR4Cttb9Y0=;
	h=To:References:From:Subject:Mime-Version:In-Reply-To:Cc:Message-Id:
	 Content-Type:Date; b=a6Qa20RXATKA7ltJJKTt2JI9Cxep9cPK9+nhQOjj+uwVnoTR0ncErLaiuS9/cdOQMYFZZbdUW4aWNvEQMJFpsOwF4CZBiLc+G8vN4JcqGu24UgXWgS/pRwJQdNu37k4EYQBd7LX0S2sxzbTdXbHP0ZYjQ+/ilQ12gW/KQoTrZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=JjsZ2sox; arc=none smtp.client-ip=118.26.132.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773531710;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=qjwiWQK9ND0M8GvhVewD7xqCAHpseSipYcAsLmniDM0=;
 b=JjsZ2soxrm2uT3cQ0RfZzTqf9Z5jZJpknXpTVicIXVB95m9P2ZCTsiXkbtrfpV2rlNZHAU
 3e5S939OxYIZf3HGci9Oeo9l1mcaqP8u5ncOwn/wMQuVs11YrvbZJUm8iOAHUUPipN9XMq
 ig6z+HwiV5mTDv2Wm5DEME31Pya+d++VBaUBbOFfHGC2NrlEhPd2rIjyN9MQ4Edar+edLA
 OsA936Vub6dEenhy3M97Cv/s7ixOEg3XJouYXH72phJt/RUTMfFpW/vX4Jd8JwJxYs8J+2
 E3LUm+suixc1OGrC4n1Wpi10Yae8ZXaRZVE2SZN0LvfsZinLPH5anCHx1uvnng==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Sun, 15 Mar 2026 07:41:48 +0800
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+269b5f23c+edc5c7+vger.kernel.org+rongrong@oss.cipunited.com>
References: <20260314234143.651298-1-rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH 2/3] serial: 8250: loongson: Enable building on MIPS Loongson64
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260314234143.651298-1-rongrong@oss.cipunited.com>
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>
Message-Id: <20260314234143.651298-3-rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 07:41:42 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13642-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.cipunited.com:dkim,oss.cipunited.com:mid,cipunited.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F19E28F943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Loongson 3A4000 is a MIPS-based Loongson64 CPU which also supports
8250_loongson (loongson-uart).

Enable building on MIPS Loongson64 so that Loongson 3A4000 can benefit
from it.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 drivers/tty/serial/8250/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index fd4e8b6ab60d..fc3e58d62233 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -465,11 +465,12 @@ config SERIAL_8250_OMAP_TTYO_FIXUP
 config SERIAL_8250_LOONGSON
 	tristate "Loongson 8250 based serial port"
 	depends on SERIAL_8250
-	depends on LOONGARCH || COMPILE_TEST
+	depends on LOONGARCH || MACH_LOONGSON64 || COMPILE_TEST
 	help
-	  If you have a machine based on LoongArch CPU you can enable
-	  its onboard serial ports by enabling this option. The option
-	  is applicable to both devicetree and ACPI, say Y to this option.
+	  If you have a machine based on LoongArch CPU or MIPS-based Loongson
+	  3A4000 CPU you can enable its onboard serial ports by enabling this
+	  option. The option is applicable to both devicetree and ACPI, say Y
+	  to enable this option.
 	  If unsure, say N.
 
 config SERIAL_8250_LPC18XX
-- 
2.53.0

