Return-Path: <linux-mips+bounces-14093-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEZqAdGl2GkhgggAu9opvQ
	(envelope-from <linux-mips+bounces-14093-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 09:25:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00A3D34A0
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 09:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 849663012BE9
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2026 07:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312BE3A0EAB;
	Fri, 10 Apr 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2/IJa6Ai";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZgqeBpjS"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD7833F58B;
	Fri, 10 Apr 2026 07:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775805903; cv=none; b=usYeCdBCtmJ4EPYcRzCgK6mRdKQsT6zWu7GmDcS7/HohOktbfa+/jlQePX/X64VkF1MDO7+f/G5L2+fA9gTWflOYkp0aXI0ekMtf1j8sAGKj6mNai5OLoAIxwWVsUOs/DIyt/cC3QKp1DouPV5MWhdI0CxehiTX8g39nUxEqxJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775805903; c=relaxed/simple;
	bh=nF/QJ3+pNHjwRoaOY9D92D1JSHoUxABQv7SqyNpvQ9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6C96XYgu4VA6dnVxwJjCzlQTkC3kt6UZvW4L66+qH+CgzC67Fm3/0mRxmPkGHN9UDjmzDRKc9CNiKgbchjRw1fFryhxBJ8Uwtj8TXhugMoVFdhtVNPXw4R9LchKTy+Y1satqi7Y0vbq2vYv/e0Hxw0HeYD2jZJvq0BaB3H70c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2/IJa6Ai; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZgqeBpjS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 10 Apr 2026 09:24:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775805899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcWWgAkaawlRZJPPVtqSkGlhDZHKznfQKlRnA0c5Grg=;
	b=2/IJa6AigsLTvo0bFTGC10WodpRLk8D/N7yIF4mk2hA0ic4uGfAfWjwTdg8E3Nlvtj2Lcs
	zUJp97laoQ7CRjYNtXcqrcN5fesVUCoUTHK9oEAkQLTjs5LDANQANe67xcylvjxcoOv7E5
	eDKnPcTyqgGMYYqyi/DFDQYfE2xe27tDKd0TrEyTes2t3NwXyMBw/gN5qP5Xipok4cZa19
	JmOfy8zJY8p9bTmBgL6Ouwuv+fZenOL0faKHsL3WbwGKwMVtW4TWiwBb4VX2pquCJ4GiPt
	2TWv/6h7txXmhveenNET8ahEPXsqpd+QkJw1NX7NDma4Qo7TFml40MkDAUuZvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775805899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcWWgAkaawlRZJPPVtqSkGlhDZHKznfQKlRnA0c5Grg=;
	b=ZgqeBpjS2tQJJXjyUQm4vLhm1bLgw03s/xJ7/GPJfbak2qtTH8uDf4tZtuj4uuIZ044A61
	lpzZZ99OEq3Ku5CA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14093-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[zytor.com,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Queue-Id: 8E00A3D34A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 03, 2026 at 09:50:33PM +0100, Arnd Bergmann wrote:
> On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
> > On 2026-02-27 01:34, Thomas Weißschuh wrote:
> >>>>
> >>> The thing about gettimeofday() and time() is that they don't have
> >>> a 64-bit version and libc implementations are expected to call
> >>> clock_gettime() instead. The result was that there was never a
> >>> patch to turn the off either.
> >> 
> >> gettimeofday() is currently the only way to get the timezone of the kernel.
> >> But I guess this is a legacy thing anyways. If you say we should drop it,
> >> let's drop it.
> >> 
> >
> > The time zone in the kernel has never worked anyway, as it would require the
> > kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> > order to actually work correctly. The only plausible use of it would be for
> > local time-based filesystems like FAT, but I don't think we bother.
> >
> > A bigger question is whether or not we should omit these from the vDSO
> > completely (potentially causing link failures) or replace them with stubs
> > returning -ENOSYS.
> 
> I see no harm in keeping gettimeofday() in the vdso when
> COMPAT_32BIT_TIME is turned on, as existing code will call it
> no matter whether it's in the vdso or the syscall.

We would still always keep them for 64-bit ABIs, right?

> Equally, I see no point in having either version of
> gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
> disabled, as clearly anything calling it would pass incorrect
> data for times past 2038.

Should we also drop the syscalls in these cases?
We will need to keep settimeofday() in some form to support the
timewarping call done by init.

Recap/Proposal:

* Keep the gettimeofday()/time() syscalls when they are y2038 safe or
  CONFIG_COMPAT_32BIT_TIME is set.
* Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
  set, reject passing any 'tv' argument where it may not be y2038 safe.
* The vDSO functions always mirror the systemcall availability.


Thomas

