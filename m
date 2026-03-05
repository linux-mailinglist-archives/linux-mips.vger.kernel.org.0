Return-Path: <linux-mips+bounces-13383-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG3XFsMYqmlfLAEAu9opvQ
	(envelope-from <linux-mips+bounces-13383-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 00:58:59 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C92221994F
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 00:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88ED83004D2E
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2026 23:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD7135AC23;
	Thu,  5 Mar 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Tvl2j1qU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1641C8604;
	Thu,  5 Mar 2026 23:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755133; cv=none; b=D5l+i0EawE79q3VKc/LV1SfdvJ2aX42twEQYA+CJNH69XX3gk2tNQNjNdIoEsdo9HGMi/4frIuEHA89E+8oG4mHRPsCP8ax++jougCdfKzgX+EzyEDoqPm4mO+n8IQL541NxwFzR/0Tr9pSeGHKQfgO1dUW4Dn1A4O2i65936Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755133; c=relaxed/simple;
	bh=u0ruzJeL3Oj2CLeQWfVQGRmFR0siTaOoU1kaON5tpco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQv3bGOTUi6DwYbJXc9A+Vs1FrYDqosWQ+vo9s6YAa+LG8NMDJcLUE2m5RlwU1HDWUUjFKnuTcysrJjjpXcO3EKk2W+k6KMY0pU4fLECt/Hhq7F5Lf7CJjzEjNad8uq9K0meRAb323dTYaecmXAcPcpuLe79NRBIiow9KmJ/caI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Tvl2j1qU; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Nw4w04152111
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 15:58:06 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Nw4w04152111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772755088;
	bh=qJtO9dV/a12LOlMN5IETBh0hhQHpj32DpsR053nFryw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tvl2j1qUAzEOzpzYcXQS0HDWX3adrrEh8wGU4v6g3BKySEWm3C2C7N7KAEslkCD/E
	 j0mWPPahQcrnUpYonuB/XqRZBRARS5nEmqhvWuzwTipZgTaSbKeFgyWaowiUd42153
	 W7MStsBNkxFELd7Ua0ug4CAdu1aF7aWnHPLKAnKGLgvygP3YPLayYTvsiXAb3FaFZT
	 JKrUtuYJyk4iWE4XrNI9xqZLO4q9kEtp3+p0jqjDQ721IZmuf1wgsaxQhQozEAFd76
	 RGAdRJL6GAk2KUvF8L9JrLDfa7jSFNoyWL3JroGMHmBAm94WVUO71tOQTKh8CZxiYj
	 iqR+oML2O5VlA==
Message-ID: <2e609a1b-62de-4688-b363-58025ab9e703@zytor.com>
Date: Thu, 5 Mar 2026 15:57:59 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
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
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
 <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C92221994F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13383-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-05 01:24, Thomas Weißschuh wrote:
> 
>> Weak references would be a way to work around the link failures. 
> 
> I am still not sure where "the link failures" should be coming from.
> The only sense I can make out of it, is if somebody manually and directly links
> to vdso.so. Like in the following example:
> 
> $ cat test.c 
> #include <stdio.h>
> 
> #include <linux/time.h>
> 
> int __vdso_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts);
> 
> int main(void)
> {
> 	struct __kernel_timespec ts;
> 	int ret;
> 
> 	printf("__vdso_clock_gettime=%p\n", __vdso_clock_gettime);
> 
> 	ret = __vdso_clock_gettime(CLOCK_REALTIME, &ts);
> 	printf("ret=%d\n", ret);
> }
> $ gcc test.c /lib/modules/$(uname -r)/vdso/vdso64.so
> $ ./a.out 
> __vdso_clock_gettime=0x7ff6ba2eeb80
> ret=0
> 
> This actually works on glibc (not on musl). But it is highly non-standard and
> relies on multiple implementation details. Furthermore it can fail to run on
> systems without a vDSO, as mentioned before.
> 
> Is this the usage pattern you have in mind?
> Do you know of anybody doing things this way?
> 

Yes, and yes, I do.

	-hpa


