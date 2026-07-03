Return-Path: <linux-mips+bounces-15441-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UWjHMviGR2qFaAAAu9opvQ
	(envelope-from <linux-mips+bounces-15441-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 11:55:04 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4BD700DA9
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 11:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kTHi5+aa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15441-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15441-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B1913020A55
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 09:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193903A9D88;
	Fri,  3 Jul 2026 09:48:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BC30F526;
	Fri,  3 Jul 2026 09:48:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072135; cv=none; b=BX9VmHTZQ0RzPychKaQyMzLJsUgM+avTi34bAgaMqrC5x5+aMrTFmWtKUUyF7SwdUeu/UsiOuX53xSI4m7QkbNMAAyzHoeji9XZ9ASyFsyN7jXAwDRSFqer31JTXCECom49VYhBPFPssS5GY+8+ke21+jIRTixt1UJbcih9OzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072135; c=relaxed/simple;
	bh=8kejrO9LhiPEpTZKQPYpACtGP4GHxTIPVgx0h5k5Qx8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q7QUcNabgRH5O8JFasFQnD4OiMpqEzI7GXx524v57KWVSR2FzZnzAI1w6Jg4JVZa83R4XrXLmHO+jiPveRrdrcMdcxzVvkzNBZUfbZfP35GY5KoPKHYKv+KZi62TWX/oPhoUHSgc4DTwc11WQm6VZEiomm1WDBG8AU4QREiajn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTHi5+aa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F641F000E9;
	Fri,  3 Jul 2026 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072132;
	bh=GU2sQW+BHbRyl8stT+ES8Av3G6KBfsKpnc1VSiXAaH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kTHi5+aaAp/rX4HTakkhjR3bFvlbbboB2hx19Nen/OQCynsTw3x/WIdUXu+frxwFV
	 89SbG0+Shaxd2FOCH4dmgKGnOQNd95ufhEkEGXGpT/32v4K6RPBMgJaLR03++i0XQv
	 HLnWwMqbhfMA9VGMcYWioEN6EpIjQeekAAIeSA8n3p4PU3sGcDhY+SXTEkDi6qWsvN
	 N6ri66YT0BOjRUFOiXivtMgrlnMXxRLN30aljrlnw5thKW/fQEv2TszzuBrW0Uq2oE
	 Hw8BoXQe/baC4Oi3LETFSwEwu7qrQBQfRHShyZgwSnxBg2nijHTJWdtguxJWbMqGZ5
	 OSuwx+53eId9w==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Jinjie Ruan
 <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, richard.henderson@linaro.org, mattst88@gmail.com,
 linmag7@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, kees@kernel.org, guoren@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
 tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
 deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 luto@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net,
 jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org,
 thuth@redhat.com, mark.rutland@arm.com, ada.coupriediaz@arm.com,
 kevin.brodsky@arm.com, linusw@kernel.org, yeoreum.yun@arm.com,
 song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com,
 broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn,
 ryan.roberts@arm.com, yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
 mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
 arnd@arndb.de, thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org,
 x86@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to
 return boolean
In-Reply-To: <akdp6GAu77-ipsXA@kunlun.suse.cz>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz>
Date: Fri, 03 Jul 2026 11:48:49 +0200
Message-ID: <87cxx4mmim.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15441-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:msuchanek@suse.de,m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:peterz@i
 nfradead.org,m:wad@chromium.org,m:thuth@redhat.com,m:mark.rutland@arm.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-
 um@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fw13:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A4BD700DA9

On Fri, Jul 03 2026 at 09:51, Michal Such=C3=A1nek wrote:
> On Mon, Jun 29, 2026 at 09:05:59PM +0800, Jinjie Ruan wrote:
>> -	if (secure_computing())
>> +	if (!secure_computing())
>>  		return -1;
>
> Hello,
>
> I am not fond of this logic inversion. The boolean is meaningless in
> itself.
>
> Previously -1 was used to indicate that the syscall was filtered but you
> chose to invert the logic choosing true to mean syscall was not filtered.
>
> You could choose true to mean that syscall was fitered avoiding this
> inversion.

That's just wrong. Boolean logic makes more sense with having
(!condition()). Just because the old 0/-1 nonsense had it the other way
round does not mean it has to stay that way.

> Sashiko points out some places in existing code where it supposedly
> explodes which might or might not be true

The vsyscall one is correct, but that's a bug like any other one and should
be caught in review.

The blurb about bypass is AI halluzination nonsense.

> but any in-flight patches that use secure_computing would also be
> affected.

Maintainers know how to deal with collisions of that kind. Stop making
problems up.


