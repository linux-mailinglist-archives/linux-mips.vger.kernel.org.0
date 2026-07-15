Return-Path: <linux-mips+bounces-15909-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Lq5CPwlV2q/FwEAu9opvQ
	(envelope-from <linux-mips+bounces-15909-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:17:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0B75AE6A
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:17:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=Br8RyOFd;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="j V2/fhH";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15909-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15909-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434D3300FC64
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 06:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62865225413;
	Wed, 15 Jul 2026 06:17:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C611DF261;
	Wed, 15 Jul 2026 06:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096248; cv=none; b=nrSZQ72Wxmma332YIbMTL+NWx9zY6d/c1ZXsfumGVa3/rMvsfzvlFIaGGHRyFpq3AVA2Kcc8OAyDs+YhRd4TRZ+7vrp67iF3hHd4u/1KBiOBnWXNDm8npmakhVKaIOZgV54SbhjqECMig0l8X0rQ8ZWX/nb174yqjn+3+jhPkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096248; c=relaxed/simple;
	bh=R7w8WDf0IA0/2pr5cbO928qK57kdMAshIWAldrpTyJA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eLyipwwiop4Y0Af9GsM0HWGyvOIxgl3IEsqj0KepZ2aH9ryHf1ZZPsBygr78lXs1zbI7xnxTUnBI8TolduPMy3XQGmWK3ZjlPX/JgTi/mimyYxr0I+/4QCs1zUQDX8ZMZpnkPld2mwiMa/2soaHReDkTelo6PzzUzJvuEtIfdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Br8RyOFd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jV2/fhH4; arc=none smtp.client-ip=103.168.172.141
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9E02C13801A5;
	Wed, 15 Jul 2026 02:17:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 02:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784096245;
	 x=1784103445; bh=9Zlh+AwrrnJNWN6iwdGzo8tmzqBKgmHLc8ZF5j+zMvU=; b=
	Br8RyOFdUU94WhnEqNGK6OUInEwtt42ECqpexhjmCAEtiEUbqF92211n+hxOfHMY
	ZEPZNepS6e+8b5e4Ny5oNgceLgGc5c3vLc4r+DxSTddj5qKK/VlPhAtv8gfyZypL
	VVhwha6CAnSjH23ukVh31ZHnKeJrBbcBfjdhjsA9Erz1NcVRn2D/aBT/96seeB84
	mf6GR4E2aXL75RlOqM5NPBrQmUNI68q5OUxqVV6/teUfiDYxF6d+zdYjKSFjb+t/
	9oYJ2Of3oxf9sYaet24kMDOpkQ0wPNWNbMYpn9a2NRPuxt6xLMqZoYqcOnUh59a+
	+snQXzLC6ACje/o05mzrQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784096245; x=
	1784103445; bh=9Zlh+AwrrnJNWN6iwdGzo8tmzqBKgmHLc8ZF5j+zMvU=; b=j
	V2/fhH4BpAIEas3AbTCLp5pwaexaM4H3pU2w1JHxfB3jtl6WngmQSemystLzp9qI
	kWMQ7JWcKJGnDPx9mRGLn2Umfn2cnwb+LWXFjfwmECSbyQFoqIFE+5Gcz+QZtLcx
	Djt/VFfBgZ9Z9KOK+Kt5sy4Ld9PfnVTM7DBVfQSUP1gznaJuyEygTd4hE0ubvkLV
	tMDqFvTinCd/9JEtBjD6pEIlpFu20QTtfHQkEtiZ6kv/55h7sInOkbaxpre8Snr4
	67P24aRTv0Jy//R76n3QrS+jXmY8Vxky/K4Wx6HmYkHx5dmdzwGsfrttZe7l/jMe
	5/Z9GWv/msY8WPAe60zAQ==
X-ME-Sender: <xms:9CVXainnxMtoA9WomfkvTWtGS0gs7bLSo00FlLyMY1H-JWdtdxrNhw>
    <xme:9CVXakoW4C3nQ9zyEuECqPuFxXYetF31e_FoGsrh6tB6lWfigrViHutFLvUHessFR
    piUbutdBQ-Th0L0YlgUUjLO99TO-3z4t7GIE2PZ5zOv0GyY84P61lk>
X-ME-Proxy-Cause: dmFkZTGkwoR0hlFQFm+73y1mguWnuh+qc3yybVVSFAuoDmPngFYjOIr0Zb9hX5c2qcCVvn
    sI1HXzG2bPbm7F/c+6YwzDUd5Ig/e1VsbxdAbFwgFKlMGi6ZWtvUVGPs4BD4qR21Gx2FgY
    EtkDPkZr2rPSNRzPvoEgLUgekSzaH0MaFl5YTqFpgdt7nbdd0Gr9D2hY5jjAVLBGjROutK
    3Te1HF7xnfK0lu7kPD/DEMvn0oDGfUjAou46olhYK2/TlIpolme0vRNz8fZXLnF+UFTqfA
    NrNuIYP+bMmZiOZ4/s235Gl05UEeW0+kr+DcX0HurL5HoblvsKRQW0en2vUrNDn/cfo8eM
    exj9pqaZGMevjLWoRPwN9dSbRRNGcxRkfpJT/FYjGh0L6fAUl6AQwMFen3HgF4pXyziFj5
    /S9FXxpGcks2/CkdMnCH3B76v2+TiHSLO+QchtDMmxtuw2ui7BdR5Glgc9xh9TAtT1ohxu
    MfBnF/qHM+b0mENiWUSBQbYQ3b9EZU+Kn1zB1QA8bKonaOqdvl96RV/Fo+8h99Z580HSaU
    rCtQOfLPHYRo7gxQPxYCOGfwJFFODA80tAc+IOlK9AzN5HVV/7ithUEhkK2Kafx3mlEywN
    TjGeOlAui3leqCQavfLsLa6Bdl0Ntd5Y70kbqbLghPHduKu5sNeG6daRUv7A
X-ME-Proxy: <xmx:9CVXamTS_Lhaint5DUHBdUZEtxYNB-HSfIXxjasq4DRxQ0ZzmiwQnQ>
    <xmx:9CVXai-ytlfd-5wXglShUGyU2nhzt-PPuvo1QSHSJm0YdKIH9BLuMw>
    <xmx:9CVXaoMOkyqoX4affuo8pkHyFPYU5s_-A1SBrmLhKQhJQn3FU_0hmw>
    <xmx:9CVXaqtJ7VQ4-VLSF9ISdlKWFfQyA29rjfU-TEE0Xb_61iMVCkr_pA>
    <xmx:9SVXatvjP514hx98-inUvTjSygpQ4_uDBf1DEi6JA-S80eWlqZCeXxVH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B53161820086; Wed, 15 Jul 2026 02:17:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Wed, 15 Jul 2026 08:15:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "Mike Rapoport" <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Klara Modin" <klarasmodin@gmail.com>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Kirill A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn,
 wangyuli@aosc.io, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Tejun Heo" <tj@kernel.org>, "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Anup Patel" <anup@brainfault.org>, atish.patra@linux.dev,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>,
 "Michal Hocko" <mhocko@kernel.org>, qi.zheng@linux.dev,
 "Shakeel Butt" <shakeel.butt@linux.dev>,
 "Kairui Song" <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>,
 "Axel Rasmussen" <axelrasmussen@google.com>,
 "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>,
 "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>,
 "Dmitry Vyukov" <dvyukov@google.com>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Yang Shi" <yang@os.amperecomputing.com>, chaitanyas.prakash@arm.com,
 "Ard Biesheuvel" <ardb@kernel.org>, guoren <guoren@kernel.org>,
 yang.li85200@gmail.com, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech,
 "Muchun Song" <muchun.song@linux.dev>,
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 "Nam Cao" <namcao@linutronix.de>, "Pavel Machek" <pavel@kernel.org>,
 djbw@kernel.org, yu-cheng.yu@intel.com,
 "Baolu Lu" <baolu.lu@linux.intel.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "Coiby Xu" <coxu@redhat.com>, "Andreas Larsson" <andreas@gaisler.com>,
 "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>
Message-Id: <4a0f9161-961e-47f9-8672-9a06e52fefea@app.fastmail.com>
In-Reply-To: <20260713135614.1618183-3-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15909-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:at
 ish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com
 ,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCPT_COUNT_GT_50(0.00)[94];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:from_mime,arndb.de:dkim,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0F0B75AE6A

On Mon, Jul 13, 2026, at 15:55, Yeoreum Yun wrote:

>  typedef pteval_t pte_t;
>  typedef pmdval_t pmd_t;
> -typedef pmdval_t pgd_t[2];
> +typedef pgdval_t pgd_t;
>  typedef pteval_t pgprot_t;
> 

Just noticed one more issue here, I think this will break these
two macros that now access four entries instead of two:

#define copy_pmd(pmdpd,pmdps)           \
        do {                            \
                pmdpd[0] = pmdps[0];    \
                pmdpd[1] = pmdps[1];    \
                flush_pmd_entry(pmdpd); \
        } while (0)

#define pmd_clear(pmdp)                 \
        do {                            \
                pmdp[0] = __pmd(0);     \
                pmdp[1] = __pmd(0);     \
                clean_pmd_entry(pmdp);  \
        } while (0)

    Arnd

