Return-Path: <linux-mips+bounces-13398-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEW5BdQ+q2lnbgEAu9opvQ
	(envelope-from <linux-mips+bounces-13398-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 21:53:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 193BC227A2D
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 21:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 368903009E06
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 20:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62B481641;
	Fri,  6 Mar 2026 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="EQ2m+UyI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5821D371D13;
	Fri,  6 Mar 2026 20:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772830413; cv=none; b=cVKzGUaC6Vz+zi+Kvr9Pfq9gFJXN7PwZnh+BP9TOkHJMAUlO1eT9AT4vOlGk/8aK31rYpQskT8RmcIdvC5UyDLy7TqxNKhTBSPbLfKqyxZNrG+HqgUBDDyUQcUAcOKt+1dkgTIVpSXQLtgs548Fs+CsV+1vGXtGSO1J4l9I/Aek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772830413; c=relaxed/simple;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=CeAjK4256ekRG6WizX3sZxyXcQ0Z0Y5rxObX4ShbfYVhj+sX8d073q1YA4HjZQcdRFxdrkY8USBwUa3ge2bnRJnnGudWl3+Fyodqzf4UzpF9wuGUx+rw9JKfnZAy1iDS2XOLHdCvL8C/vVHjUIop5GpjGfFT18WUOs/73zTaNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=EQ2m+UyI; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 626KqRb51958825
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 6 Mar 2026 12:52:28 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 626KqRb51958825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772830352;
	bh=t5jttNPZKFxy6e3UDlTOBng4frqdcf3GdkXXjwI4w+M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EQ2m+UyIgHt4NPpBkDK9oDRl5sriE4QzwZICCF14NYbr9o9jnA4P5x6Ki7PI/c1Pq
	 MuB2CVSSZ1iN8/dlczEbnC0/V+ODW0STv+tMDFCGAqTNta3kvUwK3wx7igCIxtYepf
	 WP4Xgt2sBbl4oyXlo1NEh/P7iQ1F8nGYKsh0x45/4ix+F4yHgCtkuzJkzYrwYPKOfj
	 ZGBQDFMVCSRv3f1XvPA5D4Ut5gSR5N9/iNyb0omf0tkCFi13Z6kw+SSDHf0RObIZBO
	 eFidDjr3ZT6lb7idOI/GLFTlUAcnpNsbe7YnJMV2SZmCjXKy6cCOrXgsYEUmxi7GJ3
	 06pqSMGXttJhQ==
Date: Fri, 06 Mar 2026 12:52:21 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de> <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com> <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de> <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com> <20260306103113-ae63c668-2921-4ac1-84f6-35fbc8a6397d@linutronix.de>
Message-ID: <F10E5A68-4D63-41A5-B281-3AD52FF6F6D8@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 193BC227A2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13398-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On March 6, 2026 1:42:25 AM PST, "Thomas Wei=C3=9Fschuh" <thomas=2Eweisssch=
uh@linutronix=2Ede> wrote:
>On Thu, Mar 05, 2026 at 03:57:59PM -0800, H=2E Peter Anvin wrote:
>> On 2026-03-05 01:24, Thomas Wei=C3=9Fschuh wrote:
>> >=20
>> >> Weak references would be a way to work around the link failures=2E=
=20
>> >=20
>> > I am still not sure where "the link failures" should be coming from=
=2E
>> > The only sense I can make out of it, is if somebody manually and dire=
ctly links
>> > to vdso=2Eso=2E Like in the following example:
>
>(=2E=2E=2E)
>
>> > This actually works on glibc (not on musl)=2E But it is highly non-st=
andard and
>> > relies on multiple implementation details=2E Furthermore it can fail =
to run on
>> > systems without a vDSO, as mentioned before=2E
>> >=20
>> > Is this the usage pattern you have in mind?
>> > Do you know of anybody doing things this way?
>> >=20
>>=20
>> Yes, and yes, I do=2E
>
>Thanks=2E
>
>Do you know why it is done this way? Are these applications public and
>if so, could you point me to them?
>In case we stub out the vDSO functions with ENOSYS, would these
>applications be able to handle that error gracefully?
>
>Personally I am still in favor of removing these functions completely
>when !COMPAT_32BIT_TIME=2E
>
>
>Thomas

I think I agree with you (and sadly, no, I can't point at them directly=2E=
)

