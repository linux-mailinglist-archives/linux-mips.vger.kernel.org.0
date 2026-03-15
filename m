Return-Path: <linux-mips+bounces-13650-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJY6AtH9tmkrLQEAu9opvQ
	(envelope-from <linux-mips+bounces-13650-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30B291F83
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CD2F301628F
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 18:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E25B37BE65;
	Sun, 15 Mar 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="Stv1qOaN"
X-Original-To: linux-mips@vger.kernel.org
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D833537B003
	for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600194; cv=none; b=mZSenhkKUFHj88RYZJx6K+yr1Qy2FUPLkEnj/MLDPadUMS0tUx+YmihjR0L1hzVtaSriIf4MaES6bOQKqD2vjE1H6Cz1fnfCZIjCRflFVpEQZtRR0V5xikD00oJmfzSZBD+iRmxLLeW7Skla6XEJt5XSEdcUQ/H18DUHqEa7npI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600194; c=relaxed/simple;
	bh=jbTjQzTzKLODEEV96JhJ4cxD23a4Xp2o5KR4Cttb9Y0=;
	h=Content-Type:Message-Id:To:Cc:Date:From:Subject:Mime-Version:
	 In-Reply-To:References; b=XAEXWm/UeauSc2tC3aw7+wlCYxskFkqh7+7NDtEF9VVlNlYYQcrDVmmfgsVlfF3kxU1k9CDcDskGTehY+tCAB1bNQrWzNYHImy/VukficL1dCbMeKbeb4gdWLSr6lfyKTE0sLAJLCWt7HfReLXmRvwj/krf0NrqDdDGcwnFSFjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=Stv1qOaN; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773600188;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=qjwiWQK9ND0M8GvhVewD7xqCAHpseSipYcAsLmniDM0=;
 b=Stv1qOaN5xlMtVE95n9ewVAkOyOckf7UbG6KCDO2lIN8IuwyUfWZWFUv0G2yl5HByYI3en
 9GfaAJhFl4DYKE3z93tcGqlHZ1RIFBCaF1o/LHDoSvQE+STdjug3/PRWQXDa72q5mPpxCl
 FysC0gw8n9A1e5OKl+wvW31CKV6WJVD9AZA4y1s6scNe5p1FuMiXH5K5RwCBCcTvdgleVU
 c1xQkckdDcSONEmDcrvBSu2zf4YZ7bv2rlXUzjVDj0MTTvbEYYXC5qXN0NORetnSKJqT0f
 jt2dnjLfS1+yhi6i0L5KS8RIF7o4ml/5MFOXFb+fo+1wmVOKEDRIyzQ3G6PyeA==
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260315184301.412844-3-rongrong@oss.cipunited.com>
X-Lms-Return-Path: <lba+269b6fdba+233427+vger.kernel.org+rongrong@oss.cipunited.com>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>
Date: Mon, 16 Mar 2026 02:42:57 +0800
X-Mailer: git-send-email 2.53.0
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Mon, 16 Mar 2026 02:43:05 +0800
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 2/2] serial: 8250: loongson: Enable building on MIPS Loongson64
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260315184301.412844-1-rongrong@oss.cipunited.com>
References: <20260315184301.412844-1-rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13650-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BE30B291F83
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

