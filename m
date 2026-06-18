Return-Path: <linux-mips+bounces-15145-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FsQmO+sYNGrDOQYAu9opvQ
	(envelope-from <linux-mips+bounces-15145-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 18:12:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 847856A1821
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 18:12:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=mail202007.waldi.user header.b=Hjn7cGqn;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15145-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15145-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2AB03009CDF
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 16:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E043019A9;
	Thu, 18 Jun 2026 16:12:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.thinkmo.de (s3.thinkmo.de [162.55.237.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F132F6591;
	Thu, 18 Jun 2026 16:12:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781799145; cv=none; b=jEhrfMFM4vzqyB7sB55YxZqP1qwABx04DF7FQPLeNzBjQMfBH7DgAbSEFS8mA+TEPhyIwQ3KYcRLEIO65aTKRXpL/tpqiL58kessMrc39jkrw2ZHwJjDDW7LbzJd1U5GAm/zHThlZUCGxfzXLg8prOjH+YuHVKXx0kEnBIm0MXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781799145; c=relaxed/simple;
	bh=H0fMQslKULuahBdlXccqfIVbWgjm12IpjuICNMIJwHI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upFSr4mOoFbqNeMk8AvzGnFuE2ifdatMCe7QiHLwbCO3DHxRTkwc/xqhlaFhhO+6mQlZdvsZZaiT2LghOiyJytGeJudAoSRZkvV2h19czyt2QQtDe2Yo67X9pFx5lzMokhAAQvMwW//LVqhJh9XDvw8FEOstobzprNwKuCf2Jqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=fail smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Hjn7cGqn; arc=none smtp.client-ip=162.55.237.202
Received: from localhost (localhost [127.0.0.1])
	by mail.thinkmo.de (Postfix) with ESMTP id 4gh5N671DQzylW;
	Thu, 18 Jun 2026 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debian.org; h=
	content-disposition:content-type:content-type:mime-version
	:message-id:subject:subject:from:from:date:date:received
	:received; s=mail202007.waldi.user; t=1781799142; bh=D3etuLXTjoY
	YlagV0Jflc69fZwKdpI3Z2t9QhZokv4w=; b=Hjn7cGqnyUpS/iHoWulnftmvm57
	zTBd4VCNNrfzPLHHSs/SCOriNJK3RbO3thRSPBsUKunMYqztcguGi/UoW6nVYj7C
	wbwMKpZRpv3IWFbtmiAJENyZkOIy8vrfnhkoXgCLWlQifAPTU3LeIEAWJtnnmFgH
	xVQkLzqKGuyocdbPt7UwCDrQA2ppr2es8zflFD0LQ1i2a4FgeM0+910Q5DioCCSJ
	1iMRo8hPtBX3/oshSNL0waLnyWA6e77WW0JAqqw99tmlohrM1cmUg4Sx4ey3tMhD
	y/wFaUAWnKk58X2V50XZwoC06zRhFE1HmRnpVIEanWCfCVhLy71dxol7Lbg==
X-Virus-Scanned: Debian amavis at 
Received: from mail.thinkmo.de ([127.0.0.1])
 by localhost (mail.thinkmo.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GBzsPFsGVh1; Thu, 18 Jun 2026 16:12:22 +0000 (UTC)
Received: from steamhammer.waldi.eu.org (unknown [IPv6:2a02:8071:5af1:6518:ad11:fa76:980a:620e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.thinkmo.de (Postfix) with ESMTPSA id 4gh5N65qmQzyg6;
	Thu, 18 Jun 2026 16:12:22 +0000 (UTC)
Date: Thu, 18 Jun 2026 18:12:21 +0200
From: Bastian Blank <waldi@debian.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: Add build salt to the vDSO
Message-ID: <ajQY5adFB_yOfIl5@steamhammer.waldi.eu.org>
Mail-Followup-To: Bastian Blank <waldi@debian.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=mail202007.waldi.user];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15145-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[waldi@debian.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[waldi@debian.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 847856A1821

The vDSO needs to have a unique build id in a similar manner
to the kernel and modules. Use the build salt macro.

Signed-off-by: Bastian Blank <waldi@debian.org>
---
I was not able to properly test this change, due to unavailable
toolchain.

 arch/mips/vdso/elf.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/vdso/elf.S b/arch/mips/vdso/elf.S
index a25cb147f1ca..821fcffe7655 100644
--- a/arch/mips/vdso/elf.S
+++ b/arch/mips/vdso/elf.S
@@ -8,6 +8,7 @@
 
 #include <asm/isa-rev.h>
 
+#include <linux/build-salt.h>
 #include <linux/elfnote.h>
 #include <linux/version.h>
 
@@ -15,6 +16,8 @@ ELFNOTE_START(Linux, 0, "a")
 	.long LINUX_VERSION_CODE
 ELFNOTE_END
 
+BUILD_SALT
+
 /*
  * The .MIPS.abiflags section must be defined with the FP ABI flags set
  * to 'any' to be able to link with both old and new libraries.
-- 
2.53.0

