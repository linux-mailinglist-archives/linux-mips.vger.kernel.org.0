Return-Path: <linux-mips+bounces-13323-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKfvHMssp2mbfgAAu9opvQ
	(envelope-from <linux-mips+bounces-13323-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 19:47:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6341F5712
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 19:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CB69300A639
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 18:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301DC377EAB;
	Tue,  3 Mar 2026 18:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="UDipitNJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976693C2777;
	Tue,  3 Mar 2026 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563657; cv=none; b=PIj64Y00GNpwyCgjPbwuYxHatibSAYFpEl+ENIbi9lXcC6MiD8CpWK9U6JH5Rl4MH6Y3Nb/3a61ylO4mxPkBcG7cTL+U2+x8V6LRJ2c1qyPHUkSNWtdMgLgNvF0y6R4Ib675u9ZBQQtXijVki6ilG/VPOWNNZfra0dtFkA+BGcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563657; c=relaxed/simple;
	bh=3PofZTAvVQAv4OAWJVKhH176jHRRXNqNT56zXvZKpNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPCC2ZrDURUljHLJeDEDTAV1JXQywpIZPid+IXPxsHkhGtQ525eyNvC2pYctsyYwhlDcplFA0HqWjUEsoJMFKVMRrAGQrxpqynkpZOYg8Lxpa/hRUL6+BC83k6BLSjRdV9XpHrXEB7CooOKz06dd6i1UfvQu/KwORB0ZKmqRlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=UDipitNJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9481:7d9f:6fce:330c:4416] ([IPv6:2601:646:8081:9481:7d9f:6fce:330c:4416])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623IBwxb3007270
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 10:12:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623IBwxb3007270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772561541;
	bh=+zVA5SdbXqXmCBN/Z5gDUy/tneGY24otJLTMGQOtDJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDipitNJ+TnURncz+4axXj5t727f1dxWqKkdtf58mQoedGdBe2o6JBVgdoP8CO7Ry
	 9CB3uFtQMRRW/yGu8Wm5Nr3ezlS0W7fWzd4ec6e+CvnVrSml2ZkMkpW+vdbh8cdE4A
	 UWnWgRW5FF9zmA6VgvCm+uj0SnRi673RqA2gPwRn/NJknbzRxdD/hYAo9y3Ucezhr6
	 yRzBTg3CHgnlPltD5GKLMqCzYLrOu80yOIJAODFtsiiesImNH+wMjPboHoThWc7fx9
	 1tt7EA7eKrLMpdA0tuDDV81GNoJTInNE2aLg9ZprcxHpNhQk18AhMWWmmMkbRDsUvm
	 OxPHbOmqHIh2g==
Message-ID: <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
Date: Tue, 3 Mar 2026 10:11:52 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD6341F5712
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13323-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-02-27 01:34, Thomas Weißschuh wrote:
>>>
>> The thing about gettimeofday() and time() is that they don't have
>> a 64-bit version and libc implementations are expected to call
>> clock_gettime() instead. The result was that there was never a
>> patch to turn the off either.
> 
> gettimeofday() is currently the only way to get the timezone of the kernel.
> But I guess this is a legacy thing anyways. If you say we should drop it,
> let's drop it.
> 

The time zone in the kernel has never worked anyway, as it would require the
kernel to contain at least the forward portion of the zoneinfo/tzdata table in
order to actually work correctly. The only plausible use of it would be for
local time-based filesystems like FAT, but I don't think we bother.

A bigger question is whether or not we should omit these from the vDSO
completely (potentially causing link failures) or replace them with stubs
returning -ENOSYS.

	-hpa


