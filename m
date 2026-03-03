Return-Path: <linux-mips+bounces-13334-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOv+Ni1Mp2l2ggAAu9opvQ
	(envelope-from <linux-mips+bounces-13334-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:01:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7032B1F70CD
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B6383105615
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 21:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A533637EFF5;
	Tue,  3 Mar 2026 21:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="J04tWHXJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B23909B1;
	Tue,  3 Mar 2026 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571672; cv=none; b=SMEvVbKz6ca5x/FJnbs9njOYSgegYvk9zp/cS6exio3a4BiFgCjAg5oSXeQznkqZ6DKER55KBSjWshLylKuuk3nAYKzxVfnXdtQBrvtdJ7KBHeWZIoI6OqYIIrIj09810RsDVDAd6EkwOMsD9rdU+dVecnkYde4JksTgwZqrupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571672; c=relaxed/simple;
	bh=1JgQKFUWBFsevgqY9BYGhEwyzA6HIKY2Be8Kv6HLmoI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZrBNLoegOCpekszpxznFSeubyaNACU0AUP2sYTuGGlr15EBp3zvLGIQHYgOGApd0YJTZXNNsX/Dh0B+mKpkv3ImV0oMK/y4koYIC2ZKLeIDuOORFASMwdUFEErYU//YR82fqgoIr8k9YmwFh3I/vcb39yURD6qb8/s2/nsIYpb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=J04tWHXJ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 623L07cW3276874
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 3 Mar 2026 13:00:08 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 623L07cW3276874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772571609;
	bh=VYCoMox874UkG41AFwcqLA/NfPlaOlGxygnVG+NrNEI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=J04tWHXJRQ4G1vgUJxAr5RbvTbGLR/cHWVslG2ysvgZVqum75IEoDC6dtGc3RlEKN
	 gUgGPOAd9MXe8CpG/crlLctiNQxJBMOT+cXYXjrFtYd/ntsm2/P8UIzdSo2DMS6ark
	 Vu3+lFth/GOPA8muhWjcE1ynqs1UpAoaFJpUajmj+BiMnuK0U4mSRCtSZ1GIIeuvIa
	 mZ97PzkWn/kLprWX0cl5Mi4+xj7F5yQHjWd+WIjcipqFzUiIDQhiPDGeAseJOqICmR
	 WDrvasLJ1NsDoRQE3mNCnwQHbwWCc38WW8I2ZcCDD1Zk0XtigDVyZiABIDdAPpUE/W
	 EQp9NarHAcRQQ==
Date: Tue, 03 Mar 2026 13:00:02 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
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
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
User-Agent: K-9 Mail for Android
In-Reply-To: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de> <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de> <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com> <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com> <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de> <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com> <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
Message-ID: <56591FD5-0DD0-4117-BC7B-4565E3F6512E@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7032B1F70CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13334-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:dkim,zytor.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On March 3, 2026 12:50:33 PM PST, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Tue, Mar 3, 2026, at 19:11, H=2E Peter Anvin wrote:
>> On 2026-02-27 01:34, Thomas Wei=C3=9Fschuh wrote:
>>>>>
>>>> The thing about gettimeofday() and time() is that they don't have
>>>> a 64-bit version and libc implementations are expected to call
>>>> clock_gettime() instead=2E The result was that there was never a
>>>> patch to turn the off either=2E
>>>=20
>>> gettimeofday() is currently the only way to get the timezone of the ke=
rnel=2E
>>> But I guess this is a legacy thing anyways=2E If you say we should dro=
p it,
>>> let's drop it=2E
>>>=20
>>
>> The time zone in the kernel has never worked anyway, as it would requir=
e the
>> kernel to contain at least the forward portion of the zoneinfo/tzdata t=
able in
>> order to actually work correctly=2E The only plausible use of it would =
be for
>> local time-based filesystems like FAT, but I don't think we bother=2E
>>
>> A bigger question is whether or not we should omit these from the vDSO
>> completely (potentially causing link failures) or replace them with stu=
bs
>> returning -ENOSYS=2E
>
>I see no harm in keeping gettimeofday() in the vdso when
>COMPAT_32BIT_TIME is turned on, as existing code will call it
>no matter whether it's in the vdso or the syscall=2E
>
>Equally, I see no point in having either version of
>gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
>disabled, as clearly anything calling it would pass incorrect
>data for times past 2038=2E
>
>Neither glibc nor musl support actually returning the kernel
>timezone to callers of gettimeofday in modern versions that
>support time64 syscalls=2E
>
>      Arnd
>

That wasn't the point=2E The point was what kind of error behavior we want=
=2E

