Return-Path: <linux-mips+bounces-13918-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBcUFBjFwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13918-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:08:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2E319BAC
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11792317F262
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389B427FD6D;
	Tue, 24 Mar 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdPQijol"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23973115B8;
	Tue, 24 Mar 2026 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371662; cv=none; b=bdnoWWxeXrQzt1FN4n6Qndyco4N/QXkAQ2BP35KTCd5BBQvcbHhTvjdft59uPy42y/+55aEpXGWHe7i4nnBZjCS+cj6qViT7oAtNxZyylUszwaCM5ycpzrGNHc5A12GWIjWoLIMnMDbEhlUPxXxoK+5tjWkyMMX46tSqGZhUfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371662; c=relaxed/simple;
	bh=9odwDAEObJO7qnios8NXzgvO+dTMZAcsFe/K0R+E/MA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dz8buy6NrMvHEuJeaMG8i6+QpWlF0/o6n8B84FoaHtEp+7dfVzE1GQ9OPZR5klMjQ0Pa9dAJDP2hANhrA8/FExiAxUy6lyIMT5vUrF4bAxeLye95fm03bNbtWLGdHMkRwP2wVxBezDJ3upc0Yzgk/c+DuSMN6YdghNt2ykUrl0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdPQijol; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371661; x=1805907661;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9odwDAEObJO7qnios8NXzgvO+dTMZAcsFe/K0R+E/MA=;
  b=fdPQijolZkoXol/SJjY9hE/6J/JsbNRtcOlCVyTorpTSwk4ilWQf/TaX
   4rD2fvqdo6LKiW1t0Ty2ARTtwmKUFFD1y9oK+dgYErHx0/omftpHJ2FBa
   yeAnTfR/4k0PCTtuiQyrSyECYD1njslGbXRuD+Z1mi8o52J5MQFiGbFUt
   +oGJGI9yreoxBbMHs2sZJQX3IS4lBsPpht/SuXgnj4otysdvjWy+9wJ/y
   rOKglWHDPFh0d4OQy7klkNmLT+VjCeNuP1YBnsCGGuZo8dSKDzf7HXgR4
   yhhKnAi21Wt8b6VceHySmB9X0jsoCI91T4JqBQQS/cNuomStObv3HvCld
   Q==;
X-CSE-ConnectionGUID: B8fCFw4oTI2UOKipbgp4Yg==
X-CSE-MsgGUID: fq/wCFxbR5i90z+MO4XFWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78991839"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78991839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:01:00 -0700
X-CSE-ConnectionGUID: hHMisBSDR/+i1mWAm9Fh8g==
X-CSE-MsgGUID: e4f6sgI4SzaAnXpv3WumJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254912161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] PCI: Fix alignment calculation for resource size larger than align
Date: Tue, 24 Mar 2026 18:56:33 +0200
Message-Id: <20260324165633.4583-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13918-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 53A2E319BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit bc75c8e50711 ("PCI: Rewrite bridge window head alignment
function") did not use if (r_size <= align) check from pbus_size_mem()
for the new head alignment bookkeeping structure (aligns2[]). In some
configurations, this can result in producing a gap into the bridge
window which the resource larger than its alignment cannot fill.

The old alignment calculation algorithm was removed by the subsequent
commit 3958bf16e2fe ("PCI: Stop over-estimating bridge window size")
which renamed the aligns2[] array leaving only aligns[] array.

Add the if (r_size <= align) check back to avoid this problem.

Fixes: bc75c8e50711 ("PCI: Rewrite bridge window head alignment function")
Closes: https://lore.kernel.org/all/b05a6f14-979d-42c9-924c-d8408cb12ae7@roeck-us.net/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index edc0d682dcad..e5af8799c36f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1333,7 +1333,14 @@ static void pbus_size_mem(struct pci_bus *bus, struct resource *b_res,
 			r_size = resource_size(r);
 			size += max(r_size, align);
 
-			aligns[order] += align;
+			/*
+			 * If resource's size is larger than its alignment,
+			 * some configurations result in an unwanted gap in
+			 * the head space that the larger resource cannot
+			 * fill.
+			 */
+			if (r_size <= align)
+				aligns[order] += align;
 			if (order > max_order)
 				max_order = order;
 		}
-- 
2.39.5


