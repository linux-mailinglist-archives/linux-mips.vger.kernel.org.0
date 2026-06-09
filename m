Return-Path: <linux-mips+bounces-15006-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r/VWA+WKJ2r0ygIAu9opvQ
	(envelope-from <linux-mips+bounces-15006-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 05:39:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00965C156
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 05:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fFrkJlcm;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15006-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15006-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C563039396
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 03:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEED388371;
	Tue,  9 Jun 2026 03:36:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A837B01F;
	Tue,  9 Jun 2026 03:36:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780976206; cv=none; b=fy7PSA/TMc5uRygQ2bSMZi5gIzjtUE3fXS1s+u/x7cuXDxXYz3HeH+uTBf26KEsG9gn9QybkHzkDpMUgg1yNGODzK1jG+BmD+EsHnKjQhpg33Cl+zNQ2I35FFVpZ23ExYx57a+Sf1cBPsvRkU7U/aXUnqbkbTJdGkAblo5DyQD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780976206; c=relaxed/simple;
	bh=r+YS1CHDUNK081At9TAm/1DmXdbrYyJoSm7qhomw9DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALDOCCt8WQEWZl5sk+t1gyUAj8a0woKWT3LY8jpqXNlw8iqFatPaJIuadlKgsfq0T5cDL3zGuOJYzW72VDYYUla+7nNUYCKlBsj4SWK9Om/eujxvobwKgXmdD7zlonqYZv+Tb+LGgathPOfEkPknpRY+DNaUe/k9qmXg0GZmvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFrkJlcm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789531F00898;
	Tue,  9 Jun 2026 03:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780976202;
	bh=4CLOzIOLGhXYgdiPcP3E1JYIHX7+wyAt7ukZUr45c1k=;
	h=From:Date:Subject:To:Cc;
	b=fFrkJlcmrdq5hip7e82o7uJo+eh0O/0S2sXwyKKUW9ijO1czgxac0v4IScJm9rRis
	 Ug4ImrIsnFl/fSbepcSEF8MPWNfmTA99uG4KD6MNIOQpMAV5lNjGAb9XHgL4oG50st
	 lviwS+R6qftDTs5/ChNJ6BK9tUEchIXUpc2ZAFcS4/0HYLnmAQoSSXhoGd10oHSEHz
	 oPs5pBS8bAcrOoEDyw1kwHj274N5uO7gs+YhX2kaIis6fYGdxim6TBN2856Wk9tebr
	 34x29Jid9e/v8/qWSC1vhzPnKvVHBsN2p0yB7YnojSm48sicyV1gHMiHmRQcOj/LpB
	 w/lt2+v8OIUIg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 08 Jun 2026 20:36:25 -0700
Subject: [PATCH] MIPS: lib: Remove '.hidden' for local symbols
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-mips-fix-binutils-visibility-warning-v1-1-3c809cfb5a9d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBAFf4Xs2U1aDIX4K8YDxQWfwUq6BTWEf
 7focQ4zs5JKhCidipWiLFA8QwZ7KKi7tWEQxjUzlaZ0xpmGH5iUe7zZI8wJo/IueYxIH361MSA
 MXFupjlZc1dcN5dQUJSu/zfnyZ539Xbq0t2nbvop+SOGIAAAA
X-Change-ID: 20260608-mips-fix-binutils-visibility-warning-71e531e65f78
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2199; i=nathan@kernel.org;
 h=from:subject:message-id; bh=r+YS1CHDUNK081At9TAm/1DmXdbrYyJoSm7qhomw9DA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnqXZ7rtHsKGJS63i/9bqS7Ppw/Kq757dMrp3K4neam3
 5Nh+He1o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwkbzkjw81TGhasubf5JvG0
 qM39oCF85HJU4tOMaWFejmoqRpHH7zL8d7t69l/UQ49Ar5Meh/Mu7y0ssPrZtF9Fv0hhueFFnYX
 tXAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15006-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tsbogend@alpha.franken.de,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sourceware.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F00965C156

After a recent change in binutils that warns when local symbols have
non-default visibility [1], there are a couple instances when building
arch/mips:

  Assembler messages:
  {standard input}: Warning: local symbol `__memset' has non-default visibility
  Assembler messages:
  {standard input}: Warning: local symbol `__memcpy' has non-default visibility

Remove the '.hidden' directives for these symbols to clear up the
warnings, as they are pointless with a local symbol, which is by
definition hidden. This results in no changes to these symbols in nm's
output when assembled with various copies of binutils.

Closes: https://lore.kernel.org/20260509122517.GA1108596@ax162/
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c4150acbda1b3ce0602f79cbb7700b39e577be7e [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/mips/lib/memcpy.S | 2 --
 arch/mips/lib/memset.S | 2 --
 2 files changed, 4 deletions(-)

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

---
base-commit: 6d96cc123ce33cd74e799c5434440393ed022bb7
change-id: 20260608-mips-fix-binutils-visibility-warning-71e531e65f78

Best regards,
--  
Cheers,
Nathan


