Return-Path: <linux-mips+bounces-13970-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCRXM0zVxmmtPAUAu9opvQ
	(envelope-from <linux-mips+bounces-13970-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:06:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF5349C97
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 20:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDF2B307F57F
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 18:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEE037AA9E;
	Fri, 27 Mar 2026 18:57:25 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC86379EE2;
	Fri, 27 Mar 2026 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637845; cv=none; b=NiAcKuh1c9eWcS1PZagSbmxvP2RTrEzLUhlrTUFRnIWFmvnMQFqC7pbd1RpRC78uWDi/pdlortuEpFcxabcfmNjTggfq1EFPtAJ45hRPAqGXjF9NhdW3anBxHFEfGbC1S4f3aeWFpiZb6y81/qgrMKLhaFFlE1Saov1bk3a5wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637845; c=relaxed/simple;
	bh=+q0XuVPjC1nLQoexbjzuxwvSpUwSdKKkYsxsOLE2B3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bdPJ2KRL7sIhHEtqtXDNTkgtWJ8Cx4FQwand+MZe8e4LY65Mr/Wxg5DHhxSo2CR4Ops4jwpEo/qR3iWCbbSK2rL11f9H9PCIkK9vE50tJ4oPngGwReWjRjlhyf2bjeiGtHiiE6K8o5U7gWtJLlGBohDUhr7eP/nBoeadBWcHkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id ACA1B9200B4; Fri, 27 Mar 2026 19:57:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A984C92009B;
	Fri, 27 Mar 2026 18:57:23 +0000 (GMT)
Date: Fri, 27 Mar 2026 18:57:23 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Thomas Huth <thuth@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    Keguang Zhang <keguang.zhang@gmail.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>
cc: Waldemar Brodkorb <wbx@openadk.org>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: mm: Suppress TLB uniquification on EHINV
 hardware
In-Reply-To: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2603271742000.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603271406020.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13970-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	FREEMAIL_TO(0.00)[alpha.franken.de,bootlin.com,redhat.com,linaro.org,gmail.com,flygoat.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orcam.me.uk:email,angie.orcam.me.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73AF5349C97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hardware that supports the EHINV feature, mandatory for R6 ISA and FTLB
implementation, lets software mark TLB entries invalid, which eliminates 
the need to ensure no duplicate matching entries are ever created.  This 
feature is already used by local_flush_tlb_all(), via the UNIQUE_ENTRYHI 
macro, making the preceding call to r4k_tlb_uniquify() superfluous.

The next change will also modify uniquification code such that it'll 
become incompatible with the FTLB and MMID features, as well as MIPSr6 
CPUs that do not implement 4KiB pages.

Therefore prevent r4k_tlb_uniquify() from being used on EHINV hardware, 
as denoted by `cpu_has_tlbinv'.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/mm/tlb-r4k.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

linux-mips-tlb-r4k-uniquify-ehinv.diff
Index: linux-macro/arch/mips/mm/tlb-r4k.c
===================================================================
--- linux-macro.orig/arch/mips/mm/tlb-r4k.c
+++ linux-macro/arch/mips/mm/tlb-r4k.c
@@ -640,7 +640,8 @@ static void r4k_tlb_configure(void)
 	temp_tlb_entry = current_cpu_data.tlbsize - 1;
 
 	/* From this point on the ARC firmware is dead.	 */
-	r4k_tlb_uniquify();
+	if (!cpu_has_tlbinv)
+		r4k_tlb_uniquify();
 	local_flush_tlb_all();
 
 	/* Did I tell you that ARC SUCKS?  */

