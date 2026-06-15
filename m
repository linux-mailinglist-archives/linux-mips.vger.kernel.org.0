Return-Path: <linux-mips+bounces-15082-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5DCLafXL2otHwUAu9opvQ
	(envelope-from <linux-mips+bounces-15082-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:44:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B366856D5
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 12:44:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15082-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15082-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D91B302C787
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2CE33F5B2;
	Mon, 15 Jun 2026 10:44:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A184F33F394;
	Mon, 15 Jun 2026 10:44:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520246; cv=none; b=A02wICfy4QO29wpEMZLvbGxHIyPYapSSvE5E9Rer2OFDCPSKd8XBVYC2K00nSCsw6dXhNp1nGOJJJbk3+0n/NPpzx7NUWYF8o9cnHdX5GL2uFJf+ENpOqObmpuUmNUTvzsD1c5oofCW0letm2wDqi6eAV7TrDAN2rluOOwCsy6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520246; c=relaxed/simple;
	bh=2QtnL6uBKy5bgWinNJeIB8lXJUmf4FlDyeVxQYCNWLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kww2o87cEryBddaHfVyYz+ySKWqCESmoUlS6ztAR46mD15rmJ65gNPJhmt5af2RBu620gMAgFHbmSt2lheDPd6Zfo7AT4EC95WJAeeoTvvjFRuBHYUESf3dIqphG6pjKEi+DSVn9QB0g4HkQsnrlirRXky5Z/QAO5yNTHGgNmc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1wZ4ey-0000Jb-00; Mon, 15 Jun 2026 12:35:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D9BE6C0732; Mon, 15 Jun 2026 12:29:18 +0200 (CEST)
Date: Mon, 15 Jun 2026 12:29:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: paul@paul-moore.com, ralf@mips.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mips: sched: Fix CPUMASK_OFFSTACK memory corruption
Message-ID: <ai_T_uRkojOsTE-Z@alpha.franken.de>
References: <20260526141651.773306-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526141651.773306-1-atomlin@atomlin.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15082-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:atomlin@atomlin.com,m:paul@paul-moore.com,m:ralf@mips.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,alpha.franken.de:mid,alpha.franken.de:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,atomlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28B366856D5

On Tue, May 26, 2026 at 10:16:51AM -0400, Aaron Tomlin wrote:
> This patch addresses a critical memory management flaw. When
> CONFIG_CPUMASK_OFFSTACK is enabled, cpumask_var_t is a pointer.
> Consequently, sizeof(new_mask) evaluates to the pointer size, causing
> copy_from_user() to clobber the mask pointer. Furthermore, the old
> logic performed copy_from_user() before allocating the mask.
> 
> Fix this by allocating new_mask first. To handle variable-sized user
> masks correctly, use cpumask_size() to truncate overly large user masks
> or pad undersized masks with zeros before copying the data directly into
> the allocated buffer.
> 
> Fixes: 295cbf6d63165 ("[MIPS] Move FPU affinity code into separate file.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
> Changes since v2 [1]:
>  - Dropped patch 1. This is to be addressed by the cgroup cpuset
>    maintainer (Waiman Long)
> 
>  - Dropped patch 3. Will be submitted as a separate patch (Paul Moore)
> 
> Changes since v1 [2]:
>  - Reordered the allocation and user-copy of new_mask in the MIPS
>    architecture's mipsmt_sys_sched_setaffinity() to occur before the
>    LSM hook is invoked. This ensures the security modules evaluate a fully
>    populated mask rather than uninitialised memory, while cleanly handling
>    error unwinding
> 
>  - Updated cpuset_can_fork() to pass the destination cpuset's effective CPU
>    mask instead of NULL
> 
> [1]: https://lore.kernel.org/lkml/20260509213803.968464-1-atomlin@atomlin.com/
> [2]: https://lore.kernel.org/lkml/20260509164847.939294-1-atomlin@atomlin.com/
> ---
>  arch/mips/kernel/mips-mt-fpaff.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

