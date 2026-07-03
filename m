Return-Path: <linux-mips+bounces-15487-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AywpOtAnSGrlmwAAu9opvQ
	(envelope-from <linux-mips+bounces-15487-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 23:21:20 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B10705B70
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 23:21:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=XsI115ZB;
	dmarc=pass (policy=none) header.from=zytor.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15487-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15487-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4AC3020A68
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 21:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BC033D6C0;
	Fri,  3 Jul 2026 21:21:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E393629B200;
	Fri,  3 Jul 2026 21:21:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113672; cv=none; b=cEN/+SyZVrgD5fAuD+GoNUmMbQliiKQFsnzb0M/Djw7LVz1/76SnqquRdVOzbfzDDSCKD9hZFNoBS0wKq/2Mjkvk0EO40aQUxXBcLgUHsITFUfeSEo4BMN4WoPt9g935AWkLUVUdrAU3TLniSKxaJeTMAC0sf7recs/B1dB3JWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113672; c=relaxed/simple;
	bh=tnwqzMzxl/iPNhZNYMHSJYulZBpsI/AmANK9b+RXSDw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Rf9XrGeY5WbqfNXXd8T6wCI7c6QV7+6j1utuI7sRQwxNNnPubjYiRKSUj9kKVtpnZP1vbC/aIUazBj6DckisBFQXFMumjwCHuAilqhXaBLqIfQaw01IuEEnmD3tlMpWnv5PSuewyUFgUL/fwobpjQlx+az3F6KWgl4yVW8ZY1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=XsI115ZB; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 663L1ZSA3634717
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 3 Jul 2026 14:01:35 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 663L1ZSA3634717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783112500;
	bh=GmRpAk0oLfd0gWfVh+rqnEOK9BfphxBIPqfUy4WToJg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XsI115ZBOQE6RF8kLr3qg2nWr/ZTSr4Cc85qgkCOplrXGEthFkxyO4lr4Oxope3Ei
	 uXNwCi3aZ7FCtu+IMJnAqz2+ucRqWMj1Z7USJtc8sJ3JeZ97gpLik9L3v7EKJiITZs
	 v3dorB7yOn0T5r2CkG54hpyoXlryh4wtyjAKA2DelYGyZEF7zAgS971DjfDngm3ESi
	 xNG5a833nv7cyD8PK/+FW1vBKez1uSFK+Mw4JZVnFQTsSNU/45Xgc7/odbqex1xmxx
	 hXA4rZMcbl0HR+NkDB+kp5lErI+aTQzy/C6IBW2f20LsUByG25W5uHpF7doGhQ6iHG
	 wsGBsVIphvsfg==
Date: Fri, 03 Jul 2026 14:01:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Mark Rutland <mark.rutland@arm.com>
CC: Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
        richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        luto@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, chris@zankel.net, jcmvbkbc@gmail.com,
        peterz@infradead.org, wad@chromium.org, thuth@redhat.com,
        ada.coupriediaz@arm.com, linusw@kernel.org, yeoreum.yun@arm.com,
        song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com,
        broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn,
        ryan.roberts@arm.com, yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
        mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
        arnd@arndb.de, thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
        andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v16_01/18=5D_seccomp=3A_Convert?=
 =?US-ASCII?Q?_=5F=5Fsecure=5Fcomputing=28=29_to_return_boolean?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87echjlrs4.ffs@fw13>
References: <20260629130616.642022-1-ruanjinjie@huawei.com> <20260629130616.642022-2-ruanjinjie@huawei.com> <akdp6GAu77-ipsXA@kunlun.suse.cz> <87cxx4mmim.ffs@fw13> <akeIK5TRCjlKbzbp@J2N7QTR9R3> <akeOjqMy7HVgRRCr@kunlun.suse.cz> <fa1f5b39-2703-40a1-81d6-3feba87e19b0@arm.com> <87echjlrs4.ffs@fw13>
Message-ID: <F0993CE8-27EB-42D9-80F7-04A7A73C2395@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15487-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[huawei.com,redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:kevin.brodsky@arm.com,m:msuchanek@suse.de,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m
 :chris@zankel.net,m:jcmvbkbc@gmail.com,m:peterz@infradead.org,m:wad@chromium.org,m:thuth@redhat.com,m:ada.coupriediaz@arm.com,m:linusw@kernel.org,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@
 lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[zytor.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zytor.com:from_mime,zytor.com:dkim,zytor.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43B10705B70

On July 3, 2026 1:52:43 PM PDT, Thomas Gleixner <tglx@kernel=2Eorg> wrote:
>On Fri, Jul 03 2026 at 13:59, Kevin Brodsky wrote:
>> On 03/07/2026 12:27, Michal Such=C3=A1nek wrote:
>>>> If we're changing the return type, it might be worth renaming the
>>>> function something like:
>>>>
>>>> 	seccomp_permits_syscall()
>>> Then not only it is clear which way the boolean value should be
>>> interpreted, it also pervents the accidental inversion of existing
>>> calls=2E Overall great=2E
>>
>> Totally agreed, if we have the opportunity to rename a completely
>> undescriptive function name like "secure_computing" we should take it=
=2E
>
>Absolutely no objections from my side on that=2E
>

Hell yes=2E=20

