Return-Path: <linux-mips+bounces-13382-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCvDKyGhqWnGAwEAu9opvQ
	(envelope-from <linux-mips+bounces-13382-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 16:28:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D064214857
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 16:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8AC33019FEE
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2026 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5E13A1CFE;
	Thu,  5 Mar 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="j93PyeIa";
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="j93PyeIa";
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b="j6HEjp58"
X-Original-To: linux-mips@vger.kernel.org
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [45.32.188.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE137BE99;
	Thu,  5 Mar 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.32.188.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724342; cv=none; b=l4+wipB9lVpDJfHdBCXds7Z8s6ZnvLimM8DQXRWmQvkUUv3xLCAlcltVo2+0j+QeDPpw1Yyjh1V64TsTf+1vQFhkf4Xvhac8kFdvJsK3LxwdehClYtUJU4sSwu5eW8Q+ISeOnu1bk7EIZrx3EDl3Yw8J4qAYoHtFNFAMOkJeXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724342; c=relaxed/simple;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtCXEyOEcsivj9Wc/3NtWbU4hWCBsZGW7Vfeov0lD8wl54uB9j7BFpuL4UhxJeg+7rmf6SWohvzrRDzzUpCI5RWVB3MahuMi78G1cMtM7cDrORYbPYKR8sRteqMm8wWqwyhnWP0WHvrzS4/cVbjpaNbijTho+VGEOPp/XA3nc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au; spf=pass smtp.mailfrom=nroach44.id.au; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=j93PyeIa; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=j93PyeIa; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.b=j6HEjp58; arc=none smtp.client-ip=45.32.188.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nroach44.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723874;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j93PyeIa/hxoYbwJlySesQT/hFW0bGnjxUp7PlaU1q9wLYvh5tZuSAvv70c9Xo97V
	 i0SruMJ0Aqkg6uWPmI7WYOVKXJenYEdOYIWKtc3Spc7eBvxarkFKh8KHnB/tYFYWv/
	 Ky/buNeoRpU30D5NW43F3c0QCIXrhM61fBeEYHJLtLW+stjkIaV5Bo7a70j6qppEuJ
	 qVEGMPUNxHVlhOOTVilrGfhIJQxOi6A3uGZ/iNbaeysJGcCvVcpTvdwJm08RifXh5y
	 DTErYcQmsuHkJKTw5r7BOKvp96+v/VzByzoz0Aj2h0iHWH+P5DdEAvAUFhJKsvWQ91
	 NX9T1XyUjt9dQ==
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPS id 969113115A;
	Thu,  5 Mar 2026 23:17:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723874;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j93PyeIa/hxoYbwJlySesQT/hFW0bGnjxUp7PlaU1q9wLYvh5tZuSAvv70c9Xo97V
	 i0SruMJ0Aqkg6uWPmI7WYOVKXJenYEdOYIWKtc3Spc7eBvxarkFKh8KHnB/tYFYWv/
	 Ky/buNeoRpU30D5NW43F3c0QCIXrhM61fBeEYHJLtLW+stjkIaV5Bo7a70j6qppEuJ
	 qVEGMPUNxHVlhOOTVilrGfhIJQxOi6A3uGZ/iNbaeysJGcCvVcpTvdwJm08RifXh5y
	 DTErYcQmsuHkJKTw5r7BOKvp96+v/VzByzoz0Aj2h0iHWH+P5DdEAvAUFhJKsvWQ91
	 NX9T1XyUjt9dQ==
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
	id 7C45E31155; Thu,  5 Mar 2026 23:17:54 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1772723852;
	bh=YYARtrHKCTb0FOK3T5y+Ihj4HwkDUufhHFrwTteinjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6HEjp58CAncqr+uwXPGkZ8lbR369/LG+98D/0XTHkVG3l29sNkU52WgCB9M9dhew
	 gfYeHT+jf9fW3OfG/GF2ck8167gHXSBgmfi6zT9ikR3LMg0qsPoY8nZSWjrMI8OJMj
	 kMd1y8ytlCPRepikIB3G0QISj/p2xbEqBa0pK59UYEzty8JgqZBIuj16Yj6eh2Rwin
	 RqmxUyGdqP+iWTSqkWn4TEleHa5tBEEY1MFUvIEGuDv8GfTrCrGQcMjfyPuSXM+3gd
	 YedViadoD7BXyM4xh27Cob7Y7tDuZ5rBOkg4Zdw1yQSY4SCVwDPQ2Y427CbPT0C5YX
	 UV5C2DMMj3FPw==
Received: from [IPV6:2403:5814:4228:10:6097:a659:11f5:50c] (unknown [IPv6:2403:5814:4228:10:6097:a659:11f5:50c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 3DB73308D6;
	Thu,  5 Mar 2026 23:17:30 +0800 (AWST)
Message-ID: <9dfc93b5-8269-4c72-aedc-2a1d5311b4a5@nroach44.id.au>
Date: Thu, 5 Mar 2026 23:17:28 +0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] sparc64: vdso: Switch to the generic vDSO
 library
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
Content-Language: en-US
From: Nathaniel Roach <nroach44@nroach44.id.au>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1D064214857
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nroach44.id.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nroach44.id.au:s=dYX2HNEqNNRL];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13382-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nroach44.id.au:+];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nroach44@nroach44.id.au,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nroach44.id.au:dkim,nroach44.id.au:email,nroach44.id.au:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:email]
X-Rspamd-Action: no action

No (new) issues seen on SPARC T5-2.

On 4/3/26 15:48, Thomas Weißschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>
> Make use of the generic infrastructure.
>
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>
> SPARC64 can not map .bss into userspace, so the vDSO datapages are
> switched over to be allocated dynamically.
>
> Tested on a Niagara T4 and QEMU.
>
> This has emantic conflicts with
> * "vdso: Reject absolute relocations during build" [0]
> * "vDSO: Respect COMPAT_32BIT_TIME" [1]
>
> But I expect both other serieses to need more discussions.
>
> [0] https://lore.kernel.org/lkml/20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de/
> [1] https://lore.kernel.org/lkml/20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de/
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au> # SPARC T5-2
> ---
> Changes in v6:
> - Provide statically allocated during early boot to avoid canges to the rng core
> - Use non-compound data pages
> - Reword commit messages
> - Rebase on v7.0-rc1
> - Link to v5: https://lore.kernel.org/r/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de
>
> Changes in v5:
> - Merge the patches for 'struct page' mapping and dynamic allocation
> - Zero out newly-allocated data pages
> - Pick up review tags
> - Link to v4: https://lore.kernel.org/r/20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de
>
> Changes in v4:
> - Rebase on v6.18-rc1.
> - Keep inclusion of asm/clocksource.h from linux/clocksource.h
> - Reword description of "s390/time: Set up vDSO datapage later"
> - Link to v3: https://lore.kernel.org/r/20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de
>
> Changes in v3:
> - Allocate vDSO data pages dynamically (and lots of preparations for that)
> - Drop clock_getres()
> - Fix 32bit clock_gettime() syscall fallback
> - Link to v2: https://lore.kernel.org/r/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de
>
> Changes in v2:
> - Rebase on v6.17-rc1
> - Drop RFC state
> - Fix typo in commit message
> - Drop duplicate 'select GENERIC_TIME_VSYSCALL'
> - Merge "sparc64: time: Remove architecture-specific clocksource data" into the
>    main conversion patch. It violated the check in __clocksource_register_scale()
> - Link to v1: https://lore.kernel.org/r/20250724-vdso-sparc64-generic-2-v1-0-e376a3bd24d1@linutronix.de
>
> ---
> Arnd Bergmann (1):
>        clocksource: remove ARCH_CLOCKSOURCE_DATA
>
> Thomas Weißschuh (13):
>        vdso/datastore: Reduce scope of some variables in vvar_fault()
>        vdso/datastore: Drop inclusion of linux/mmap_lock.h
>        vdso/datastore: Allocate data pages dynamically
>        sparc64: vdso: Link with -z noexecstack
>        sparc64: vdso: Remove obsolete "fake section table" reservation
>        sparc64: vdso: Replace code patching with runtime conditional
>        sparc64: vdso: Move hardware counter read into header
>        sparc64: vdso: Move syscall fallbacks into header
>        sparc64: vdso: Introduce vdso/processor.h
>        sparc64: vdso: Switch to the generic vDSO library
>        sparc64: vdso2c: Drop sym_vvar_start handling
>        sparc64: vdso2c: Remove symbol handling
>        sparc64: vdso: Implement clock_gettime64()
>
>   arch/sparc/Kconfig                         |   3 +-
>   arch/sparc/include/asm/clocksource.h       |   9 -
>   arch/sparc/include/asm/processor.h         |   3 +
>   arch/sparc/include/asm/processor_32.h      |   2 -
>   arch/sparc/include/asm/processor_64.h      |  25 --
>   arch/sparc/include/asm/vdso.h              |   2 -
>   arch/sparc/include/asm/vdso/clocksource.h  |  10 +
>   arch/sparc/include/asm/vdso/gettimeofday.h | 184 ++++++++++++++
>   arch/sparc/include/asm/vdso/processor.h    |  41 ++++
>   arch/sparc/include/asm/vdso/vsyscall.h     |  10 +
>   arch/sparc/include/asm/vvar.h              |  75 ------
>   arch/sparc/kernel/Makefile                 |   1 -
>   arch/sparc/kernel/time_64.c                |   6 +-
>   arch/sparc/kernel/vdso.c                   |  69 ------
>   arch/sparc/vdso/Makefile                   |   8 +-
>   arch/sparc/vdso/vclock_gettime.c           | 380 ++---------------------------
>   arch/sparc/vdso/vdso-layout.lds.S          |  26 +-
>   arch/sparc/vdso/vdso.lds.S                 |   2 -
>   arch/sparc/vdso/vdso2c.c                   |  24 --
>   arch/sparc/vdso/vdso2c.h                   |  45 +---
>   arch/sparc/vdso/vdso32/vdso32.lds.S        |   4 +-
>   arch/sparc/vdso/vma.c                      | 274 ++-------------------
>   include/linux/clocksource.h                |   6 +-
>   include/linux/vdso_datastore.h             |   6 +
>   init/main.c                                |   2 +
>   kernel/time/Kconfig                        |   4 -
>   lib/vdso/datastore.c                       |  97 +++++---
>   27 files changed, 375 insertions(+), 943 deletions(-)
> ---
> base-commit: f02e02079ac56b44ff89d4c2189cf7185ab794f3
> change-id: 20250722-vdso-sparc64-generic-2-25f2e058e92c
>
> Best regards,

