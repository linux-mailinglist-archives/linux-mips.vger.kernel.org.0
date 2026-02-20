Return-Path: <linux-mips+bounces-13186-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLrCOTTgl2ne9gIAu9opvQ
	(envelope-from <linux-mips+bounces-13186-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:16:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A022C164A62
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 05:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A771830B8AC3
	for <lists+linux-mips@lfdr.de>; Fri, 20 Feb 2026 04:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E520432C939;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1VrZuK9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5932B9AC;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771560654; cv=none; b=O2M98dtiOjFjn6gWK90AqGKI0dTwIHw5XwGyCazEDpfdnhe3DkotMQvSRjyhIXnx3BQfiUeBuB9kSNo7B2FNx3/rgDmDrLdapa4uWN0V2vG+fjKPUH1KqFe+4Z+2sN+1cpua1GRimrSaYcctFvid753Fua4UckpQvXNXvVcBKrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771560654; c=relaxed/simple;
	bh=Wl/q2I9MW4EAYAIqkkPs9cMuPySyeP7Ys0yLcRoxiik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sWrcsNMX8CCeDPiwtCNI6d/bzG5pwSTgZyiwzTkp9o5PQsqTYBFxJPjNPxAUZxiNpBSlBDvjkrJ1dAr8mbAFhmoWIQwwnREQOgbBUAJwObyN76NTufuBt8R5Fbf6Lj8QYOWWdFxeSZ6ItzoFE4r7Q/2lY9LJE0QczEr82Zb3AV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1VrZuK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDE6C19425;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560654;
	bh=Wl/q2I9MW4EAYAIqkkPs9cMuPySyeP7Ys0yLcRoxiik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N1VrZuK9lrvi+0jv5UrnpCwpMzW70T8EtjcsHnyvYb/C3ysXhXnwcXh0J1BUrz/fQ
	 FXvJgc0MX5grtuvCDCjFOveYmh43k7YKrhJKjA6KNPY5GbthY3tSAB5Rd8DWyI60O4
	 60LGpZhdpz2TPplFhz9GOt22IkO9j9SafKfb23NhzY6Pqtbyy2AyC4nRduEnajg21H
	 pPrMunHoqFuSELpIJz/FNzbQUBVTQ/4/r5X9keCr5k8mekJQPLFSEN/1VTk4FKKX96
	 mGvQFqOn+07PQ7stZW8usaIlrYxFaew9yX4CoBIDJ2elY6T+mswJuAAcc8jX+e9rPf
	 2Anz+jmhWYL+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEBA3809A88;
	Fri, 20 Feb 2026 04:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent of
 the
 memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of
 nodes, zones and memory map)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156066278.189817.13783312336351868850.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:02 +0000
References: <aVpWpLV4Dut5Muo2@kernel.org>
In-Reply-To: <aVpWpLV4Dut5Muo2@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, klarasmodin@gmail.com,
 akpm@linux-foundation.org, alexs@kernel.org, agordeev@linux.ibm.com,
 andreas@gaisler.com, bp@alien8.de, bcain@kernel.org, chleroy@kernel.org,
 catalin.marinas@arm.com, davem@davemloft.net, dave.hansen@linux.intel.com,
 david@kernel.org, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org,
 mingo@redhat.com, johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 corbet@lwn.net, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, muchun.song@linux.dev,
 osalvador@suse.de, palmer@dabbelt.com, pratyush@kernel.org, richard@nod.at,
 linux@armlinux.org.uk, shorne@gmail.com, surenb@google.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, vbabka@suse.cz, will@kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13186-lists,linux-mips=lfdr.de,linux-riscv];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A022C164A62
X-Rspamd-Action: no action

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 4 Jan 2026 14:01:40 +0200 you wrote:
> Andrew,
> 
> Can you please stick this between patch 3 (arm: introduce
> arch_zone_limits_init()) and patch 4 (arm64: introduce
> arch_zone_limits_init())?
> 
> From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> From: Klara Modin <klarasmodin@gmail.com>
> Date: Sat, 3 Jan 2026 20:40:09 +0200
> Subject: [PATCH] arm: make initialization of zero page independent of the
>  memory map
> 
> [...]

Here is the summary with links:
  - [3.5] arm: make initialization of zero page independent of the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes, zones and memory map)
    https://git.kernel.org/riscv/c/18b7cc70dea8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



