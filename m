Return-Path: <linux-mips+bounces-13385-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA6DBRCiqmlLUgEAu9opvQ
	(envelope-from <linux-mips+bounces-13385-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 10:44:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288B21E262
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 10:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D27A3079E04
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C2133DEFC;
	Fri,  6 Mar 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TM4Rdzu3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oyC+xISo"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CCD346A1F;
	Fri,  6 Mar 2026 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790149; cv=none; b=savcRgxf9Ugj89j7ZN1jRgnCd6OZWe1O4YVstwiNq4oeEh3txWkQwUMzYXHUBi6U1A0MCQ9WE7pnNewt9TiFEOQM90H2O6VRyoET2SDu0jxtsVB7bS+3gAbzibpbit+cq1GrsD7Jm5q4LNGcPORrtPde4AhraS/2txFddfg33ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790149; c=relaxed/simple;
	bh=l6/+FLfbq6/klEmgA7dAJy4HabCQKDwdeXH2tR6UEwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwanlCakSQ4P9KIgCNjR9hEZrAUylwRiUbppI00ZGyLJ6DQNtaRQM5UGkQV4ubKxiVAy+xp6m8VLid6niOTqPaAwNzF+IczlVEvuRwuWUIM7JTeiusza8KNE+gFBcgsmkJwww4IbKO6Qo1jTvFXpby0IBx/53WfJv5SjmxDhaa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TM4Rdzu3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oyC+xISo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 6 Mar 2026 10:42:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=TM4Rdzu39Bd9EAADRCXrB648dHPFDbYqmHJbCPos+LO9cH+N8pmFEyN+hOFtV9Kt8vFREp
	Vz2d+r04CS5ZPWOfQLcxGiyBvVHBxYRUtF0f1J9roudzSb1xR2chbQbxJSmHaEE+zr5Dkh
	L980N3PTaFG/bNJvDDtnHT5s+qCpSi2kJ0polx7Ls3enbAQiD1TTXRK44vYDO2YjkASHPU
	NcseRSNfevWaqtFyIOePiKkptS7YvDO+KHjX9sQrWXgbEsq3RysABGWDsVTq2zH0syqzaW
	c2ZSYUco1APMwU44ZlLCRzJW8URBj5+vvYNvPlfpPRcw72zg8BDv8lqMl8a+Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772790145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5VUW8trjR/pt+wAGhG4nPXpBxsgItrdqPqtSJUhNGo=;
	b=oyC+xISo6E2zXVjIcJcEaqD5pbEEgZsXJW0zYYh1sU9SGKFdilGyiunD6wDIAtY/VR2cdj
	CPkN1r8IejPumgBA==
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
Message-ID: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
 <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
X-Rspamd-Queue-Id: 8288B21E262
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13385-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 03:57:59PM -0800, H. Peter Anvin wrote:
> On 2026-03-05 01:24, Thomas Weißschuh wrote:
> > 
> >> Weak references would be a way to work around the link failures. 
> > 
> > I am still not sure where "the link failures" should be coming from.
> > The only sense I can make out of it, is if somebody manually and directly links
> > to vdso.so. Like in the following example:

(...)

> > This actually works on glibc (not on musl). But it is highly non-standard and
> > relies on multiple implementation details. Furthermore it can fail to run on
> > systems without a vDSO, as mentioned before.
> > 
> > Is this the usage pattern you have in mind?
> > Do you know of anybody doing things this way?
> > 
> 
> Yes, and yes, I do.

Thanks.

Do you know why it is done this way? Are these applications public and
if so, could you point me to them?
In case we stub out the vDSO functions with ENOSYS, would these
applications be able to handle that error gracefully?

Personally I am still in favor of removing these functions completely
when !COMPAT_32BIT_TIME.


Thomas

