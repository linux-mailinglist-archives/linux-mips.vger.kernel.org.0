Return-Path: <linux-mips+bounces-13381-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCN3GGdMqWk14AAAu9opvQ
	(envelope-from <linux-mips+bounces-13381-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 10:27:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5F520E5FB
	for <lists+linux-mips@lfdr.de>; Thu, 05 Mar 2026 10:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26F90305F521
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2026 09:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8092B378813;
	Thu,  5 Mar 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="py5S7KZW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HD1bZlJ8"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9259631065B;
	Thu,  5 Mar 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702687; cv=none; b=BzJwsa71FQgLGb+tPE1RCIjXcLO7JikItXZNQ6OOBz8lDrVBKhvPdIbLZS+LMoGV7RCwpUXhweG27cua3B0O7tGb64CvSqwRTdKVvqFE/Xvawj1cBuKCq5gbYt32CKA/vmSgfCt1awRUPvX6qnucycbIF6LwYBFa1Hx+xlOnDRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702687; c=relaxed/simple;
	bh=BqEAQG1bTfFTfidxiDUli1s8c4Gb88MBdQG5Dl3I16g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VICP4UlZEZfedJ1y/J5zTTJP8RJWg5zh1T3ELy2HBMMdwswE/fuYNAL2ZSNn5btYFs7qSchlYNuyYENBMf9OzRxe4hQ0przJo4fgfJYiWrWY9//fiWOOO+VMFJSCG7znFwdfH91N+LQ0AOSHAMeJMBIF+ox8qTXA0UP9UzkIfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=py5S7KZW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HD1bZlJ8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 5 Mar 2026 10:24:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772702683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4GXwYR0kxFYmhDmvijfZa1t58+J78DwaweBUNYvjr8=;
	b=py5S7KZW2CuzZ/LmXiMem3ylvhtEbuj0FCOCKDeq2Wc6KsV9V1LoQg+z36EHUZlGhXHVvo
	BzVtGoa/APPEJHLamSiAHWjfnaS2PYwSSyY9KJGH8siIMCMU9z7t+KAbuX9ueIiDNrZO2s
	WHmly7Y64XGEqu6JM3K46LWANj0hciKhqWcJ6nVQ6n0yyILovPcyBviHdPVzaj/Dww1as9
	3Y7Toc8mdZKrIQfXOYgxWl/t0ZzzO+lDpkNii33/tKYHPGSWQg00cTqL/xrTwM5YUeaLfI
	soWgDtj5zZ5FJO1anB8QntF6rSF8p4qP2gKbCx1Lo+Wt+yWXmdbQOMg06neR1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772702683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4GXwYR0kxFYmhDmvijfZa1t58+J78DwaweBUNYvjr8=;
	b=HD1bZlJ8IllrAB9QnfraiyO9HKNCZUT/73lSmsMraqGtujlap15j78l+ZMQGtyK/1uICTw
	Ty6p2+DloLYM3iCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
X-Rspamd-Queue-Id: BF5F520E5FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13381-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:30:34AM -0800, H. Peter Anvin wrote:
> On March 3, 2026 11:35:52 PM PST, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Tue, Mar 03, 2026 at 10:11:52AM -0800, H. Peter Anvin wrote:
> >> On 2026-02-27 01:34, Thomas Weiﬂschuh wrote:
> >> >>>
> >> >> The thing about gettimeofday() and time() is that they don't have
> >> >> a 64-bit version and libc implementations are expected to call
> >> >> clock_gettime() instead. The result was that there was never a
> >> >> patch to turn the off either.
> >> > 
> >> > gettimeofday() is currently the only way to get the timezone of the kernel.
> >> > But I guess this is a legacy thing anyways. If you say we should drop it,
> >> > let's drop it.
> >> > 
> >> 
> >> The time zone in the kernel has never worked anyway, as it would require the
> >> kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> >> order to actually work correctly. The only plausible use of it would be for
> >> local time-based filesystems like FAT, but I don't think we bother.
> >
> >sys_tz is currently used by a bunch of drivers and filesystems (including FAT).
> >It is also used when writing to the RTC.
> >
> >> A bigger question is whether or not we should omit these from the vDSO
> >> completely (potentially causing link failures) or replace them with stubs
> >> returning -ENOSYS.
> >
> >I am a bit confused here. You mention 'link failures' and in another mail
> >'weak references as fallback'. Both are things that happen during linking
> >('link failures' could also be interpreted as failures during loading).
> >Somewhere else someone also mentioned the vDSO to be 'linkable'.
> >But as far as I understand, only libc interprets the vDSO, it completely
> >bypasses both the linker and the loader. And libc already does graceful
> >fallbacks to the regular systemcalls if the vDSO is missing completely or
> >lacks one of the functions, as both cases may happen on normal systems.
> >
> >What am I missing?

> Weak references would be a way to work around the link failures. 

I am still not sure where "the link failures" should be coming from.
The only sense I can make out of it, is if somebody manually and directly links
to vdso.so. Like in the following example:

$ cat test.c 
#include <stdio.h>

#include <linux/time.h>

int __vdso_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts);

int main(void)
{
	struct __kernel_timespec ts;
	int ret;

	printf("__vdso_clock_gettime=%p\n", __vdso_clock_gettime);

	ret = __vdso_clock_gettime(CLOCK_REALTIME, &ts);
	printf("ret=%d\n", ret);
}
$ gcc test.c /lib/modules/$(uname -r)/vdso/vdso64.so
$ ./a.out 
__vdso_clock_gettime=0x7ff6ba2eeb80
ret=0

This actually works on glibc (not on musl). But it is highly non-standard and
relies on multiple implementation details. Furthermore it can fail to run on
systems without a vDSO, as mentioned before.

Is this the usage pattern you have in mind?
Do you know of anybody doing things this way?


(...)


Thomas

