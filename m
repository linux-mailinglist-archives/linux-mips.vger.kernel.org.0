Return-Path: <linux-mips+bounces-13283-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNA2Gi5loWnIsQQAu9opvQ
	(envelope-from <linux-mips+bounces-13283-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:34:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C001D1B5650
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 10:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3388A301AB94
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 09:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797953815D6;
	Fri, 27 Feb 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CGeabxmB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RkiVfxGB"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEF35A3A4;
	Fri, 27 Feb 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184875; cv=none; b=hL0CMSoHjlh3ZFfnkVVMmR/T0phs+bMKMRJWMqJnOYcvPL6spHl/jJ7cgdwGlfeivyMlv4Te8R+euur9ILQVBtQvkg+HElfevBALN84LSyEbDZphEsPxUri2tMmDfsZF4E2hLaBU2Pfjhf8pwpfI9awNiWXL1BYz7Iv+TLldo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184875; c=relaxed/simple;
	bh=OjcYlcUdSSOT+GJl+QXSpQVGYqVbffu6Czd14ZiY4YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNzJoy5T1tf+EIpFJ5PbeYeDs50jQm5rTJMe7SX7fQoR7l80eXSVp63crKljX2TfXF+q5KbakqUbWcqc3cIpjoTG/v1UYs84xPsewg67gql1OoRv764068EEJg+CSCV5dJd1w1U7osX6KH1I4doZemkFps1B0/wJuuFNp9ZwQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CGeabxmB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RkiVfxGB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 27 Feb 2026 10:34:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=CGeabxmBw+/AZ7oTl4E2tz8AJVILisXZZ+HNXpb2gagxjIcuU2+QlmjVTBAFP3VTpXMqr+
	W4LZp+Y98Z5CymhdlUDmIV64Kea7ln250JaQXXgOvmXr0ziVAGXOUhHjOQPW37tYikya19
	ijGc3SnCUR0mMJA6wDzyZy7kzqN1z3+BsFswojH/kuj7OSLMqwIFbK91Wgzv2r0KNkXIpa
	QVzGpfZ54UM3MZbDS6QpSoIR/3BuCpDmd6uAIGVpBtOFvmw2nxGO5fRDlL8UZCBRpaYRoy
	sNf035yrsMm4QtLm60j1cvAUFKhO2cM/+nIq1+vGI+k7FW6Uj8XN0kGtxPVlVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=RkiVfxGB7rsEx+NudL1Y/YXS7uzosxv9jyyl7qgxbgo9VIT5IDWFrH11EpmknzII7KIYCe
	b8t8QbY2jBr8fVBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13283-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: C001D1B5650
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 09:58:35AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> > On Fri, Feb 27, 2026, at 07:57, Thomas Weiﬂschuh wrote:
> >> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> >> provide any 32-bit time related functionality. This is the intended
> >> effect of the kconfig option and also the fallback system calls would
> >> also not be implemented.
> >>
> >> Currently the kconfig option does not affect the gettimeofday() syscall,
> >> so also keep that in the vDSO.
> >>
> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Actually, I need to revise that. I think gettimeofday() should be
> guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
> vdso. Looking back at the history, I see that we added the #ifdef
> for each syscall we modified to have both time32 and time64 version.
> 
> The thing about gettimeofday() and time() is that they don't have
> a 64-bit version and libc implementations are expected to call
> clock_gettime() instead. The result was that there was never a
> patch to turn the off either.

gettimeofday() is currently the only way to get the timezone of the kernel.
But I guess this is a legacy thing anyways. If you say we should drop it,
let's drop it.


Thomas

