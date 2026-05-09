Return-Path: <linux-mips+bounces-14522-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jkg+DrUn/2nK2wAAu9opvQ
	(envelope-from <linux-mips+bounces-14522-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 09 May 2026 14:25:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6634FF961
	for <lists+linux-mips@lfdr.de>; Sat, 09 May 2026 14:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E669B301724B
	for <lists+linux-mips@lfdr.de>; Sat,  9 May 2026 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EC2338910;
	Sat,  9 May 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr8UfFv3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04938800
	for <linux-mips@vger.kernel.org>; Sat,  9 May 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778329522; cv=none; b=feWOSmqHFivzfO+QDsSTvGdr2WKZOLwABNEc44fO0P4EEI8iarJnNsmkRIzrZB+7mXRlVZvdcUi0KxtksazIzPQWS6e9OsoGTMJ+bnBggbcNJMdT/oy2oIQl7epmPD7raqenfIzs2qss1oLovEIAILXE6OeRNxhYizsPZ3uT2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778329522; c=relaxed/simple;
	bh=V6lIm8TG4wI1VlxtsvtG3pO/n7/B+3xEbxRhLivsiGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXbIc87w6svcU4dO6lfl3+kCio+/QIJf7/reGJWiXrOyACRRXi0ED5DktxF/cZ99/+b1AqrV05lTt52ca8fzOorUd8LQR+cmvdZsvTWvpamjyi5OeV1Nd+YktaC4qSZkE2qVomJAncMQ9qlstsIUADunI97zV5Y7IfU+GtdlyR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr8UfFv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17CBC2BCB2;
	Sat,  9 May 2026 12:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778329521;
	bh=V6lIm8TG4wI1VlxtsvtG3pO/n7/B+3xEbxRhLivsiGo=;
	h=Date:From:To:Cc:Subject:From;
	b=Cr8UfFv37eODQTEKDuWR3NscMBHrPtqcly6kQn8XdOktkklRTLtj+H3fIyh+gy2mY
	 KbpWEhBiYETLGUrxjP1vFrBUs2NAvny9HSCHeEA8LSqRHPKVAB1MnW4tHigCbBRD/T
	 iJo79gurJ9WWWMJVhEtwvQ+HwGY9cqOHd0onFOTYKSw7b9YGSLg9qUjwgsDT3JaMAV
	 W/LlYpLnOc0KzwsO7/FjKcD3Qvt47FC+FiSzsfPLhr3VkH2vrz0b8pQCRJ2gREfgve
	 8N/ZqB/dFWDdrvbInlmYhsd4F/gHOkPw07XiAFLstXnCKqITO34H7wYIxP5N2Xu2Fj
	 MbwWAK0d3Glbw==
Date: Sat, 9 May 2026 20:25:17 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Subject: MIPS: non-default visibility warnings from tip of tree binutils
 around __memcpy / __memset
Message-ID: <20260509122517.GA1108596@ax162>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 9A6634FF961
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-14522-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sourceware.org:url]
X-Rspamd-Action: no action

Hi,

After binutils commit c4150acbda1 ("gas/ELF: warn upon non-default
visibility of local symbols") [1], I am seeing the following warnings:

  $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- mrproper defconfig arch/mips/lib/
  Assembler messages:
  {standard input}: Warning: local symbol `__memset' has non-default visibility
  Assembler messages:
  {standard input}: Warning: local symbol `__memcpy' has non-default visibility

Should the '.hidden' directive for these symbols be removed, as it seems
unnecessary for local symbols? Or is there a different fix for this?
This resolves the warnings for me but I figured I would ask before
sending it as a formal patch.

diff --git a/arch/mips/lib/memcpy.S b/arch/mips/lib/memcpy.S
index a4b4e805ff13..84f85aba6f4b 100644
--- a/arch/mips/lib/memcpy.S
+++ b/arch/mips/lib/memcpy.S
@@ -274,7 +274,6 @@
 	/* initialize __memcpy if this the first time we execute this macro */
 	.ifnotdef __memcpy
 	.set __memcpy, 1
-	.hidden __memcpy /* make sure it does not leak */
 	.endif
 
 	/*
@@ -538,7 +537,6 @@
 	.if __memcpy == 1
 	END(memcpy)
 	.set __memcpy, 0
-	.hidden __memcpy
 	.endif
 
 .Ll_exc_copy\@:
diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 79405c32cc85..ab087406da66 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -89,7 +89,6 @@
 	/* Initialize __memset if this is the first time we call this macro */
 	.ifnotdef __memset
 	.set __memset, 1
-	.hidden __memset /* Make sure it does not leak */
 	.endif
 
 	sltiu		t0, a2, STORSIZE	/* very small region? */
@@ -231,7 +230,6 @@
 	.if __memset == 1
 	END(memset)
 	.set __memset, 0
-	.hidden __memset
 	.endif
 
 #ifdef CONFIG_CPU_NO_LOAD_STORE_LR
--

[1]: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c4150acbda1b3ce0602f79cbb7700b39e577be7e

-- 
Cheers,
Nathan

