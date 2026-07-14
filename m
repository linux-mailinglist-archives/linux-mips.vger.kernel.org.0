Return-Path: <linux-mips+bounces-15897-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FjF4E2dRVmpD3QAAu9opvQ
	(envelope-from <linux-mips+bounces-15897-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 17:10:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3375642C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 17:10:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b="lC/erCLu";
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="P 2Is429";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15897-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15897-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F5C3119E9D
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 15:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5359D494A08;
	Tue, 14 Jul 2026 15:06:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79A3DB325;
	Tue, 14 Jul 2026 15:06:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041609; cv=none; b=B7LuclGtoubL3LjtZR86ZEuoKpIU1ntgnkDD3n+qNVr34RY59XQEYRgheEGsnxciYgjU6lVOM2H4wcYZPJs52W+e/D1isnL7Xr5oaRp1G+EVCfHTJaKuS7YZ82vHyPObllS/kU1r8SmBTWaXaU275tEMsGJXQ9xZ1INLf7fe8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041609; c=relaxed/simple;
	bh=mA4+7pYMGxjhhfpukSJW9caaxcbx3SxiZGdUMYmSxPQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NKuAR70t57FIBibRF0Bossm6gm6BMjKW2t5aeMQ8ti3WlHeNJGRzfGGuEeM2Cob1Nqvpe7TmpdsBmkLePL6ndL7BdDA8zEvZPGJVZ+HJmKdbvwP5JVrSSB+E/HKyBqFSpAg4SpZLs9vju6aSXgArJrIR0Pg//t8IolYDm5cCVxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lC/erCLu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P2Is4296; arc=none smtp.client-ip=202.12.124.143
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id BA8931300114;
	Tue, 14 Jul 2026 11:06:45 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 14 Jul 2026 11:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784041605;
	 x=1784048805; bh=ZP6AUuW+BQfE8xE/ZQO072//wuV0eV2xjCAbIlgM31o=; b=
	lC/erCLuPnd+85eOUScCipTGeubo7Y+8Nbyh1+57I+6xXdBoDdSehuLIxsmh2HLO
	Gfcr4H+yYUUF0gWhQcZ39olrjXYIB3EH4aVBfx4VLGDeFqPS72zMb3H9d90uNX8k
	zz8lXgdrCqdf/7AuatUtBNhm0NL79Q1d0iqxm33NkPMCzBYPirlWDhMeJRFXXN5v
	savQ552I+f/GXPtvOSZB+KVyiqYz332iX+8b0PkX4coG07s6fH9t6AWiZ70uapNZ
	E3x6bDNKSYPDwKx2XpxIJlbzgz9jNvejiFvyhC2KGvA+lXfnCC/cpKic+23jAvRQ
	d4KWFAzM0IHEpWv+Z06qxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784041605; x=
	1784048805; bh=ZP6AUuW+BQfE8xE/ZQO072//wuV0eV2xjCAbIlgM31o=; b=P
	2Is4296V2D7bPxP4OfD/5D7Kq9QzzJWaEr2ZS8h9n1FC5h3gc44hIRW168MQ1NKz
	cAX3gEU6FcRAtTLUc6oFd1xVk5w33G4tSYXpOUZaBMr+lY0bW+TJ7C1aN/CojXCl
	uLFpR/BAZQwAS/0a6/zl3MT/zyBZ9iI7TSJcDmJxKoRdFW1TzulzSOk/ll4APQKg
	2/yVj7oKtP4EzYL5Un8JK+7aUS2b1iUDiRihfqd39uf1Dt5umjvjdzGgl5BlSKwt
	Y17YDnkqxpArMKtN5T4agfhMpGGh4/XPeBxsyf2+9SU3pPGAgVLD+9kdXmaWjyQI
	7MegV7M/Xa/xRyYanIHKQ==
X-ME-Sender: <xms:gFBWan6SLvS3G1UsqlWzYK9NZyrILu5dTvIg6j8F9C2Dp6C2apFE_Q>
    <xme:gFBWantnKPt4qi5xW2UcG8HU48rywcib7A0xqqjYBBLCWgpkTK5lQDzkq5UhwuSwc
    ugK3br9U6iXyjJ8yVmn2eF1M9-cdv1RQGKVcIv4Kc6TME5SIArjjPC0>
X-ME-Proxy-Cause: dmFkZTGcioZwMwHlgAe1l0bPf8gvE+LKXir3CyHGrFeNW0WDZMIbkar/MIvcDBI3bdb4tn
    TLcOIvj6s5d0LpuhCDRNM9/43oNLyRhEeFYvBVQIhT0xLYynAB1xtO2cewFtb0t6CtzMjX
    xv1R0eBlDof4dBuQ5arMoRTqIZurltnigWrb9ac9eD2HPc/CttnLB9ggEMsrZEqWcCtq83
    6xwm7tIMawSMI0+OL6ui9SlZUBVzg8A1tzzj1Eqbu9g0mrqHl8ho3B9MTaQrnrFpmlPySP
    ctR1qy06L92hBLrpFsYUroefkz63x5l2nxv5qD0VrEvqmjLSOdjN4ImPYaXL/oGoYDNFBs
    3UNDkt74/5VfVa1u/SRQoGn04/4YUxYH/2UmQve3eTutRLopyxE6b8vSHZpEdNYm7mnD7B
    QhnZdEbvTJwC09NdFzQNBKzSxXuA83892lZ7HcL5jlQbYL+PCaxgrFtpOX1Z45KxrBxdz7
    NZiMxfOQQCOlRCa4qxgVD75cBKQI6J6n/qgr0757bn5MDLpvJWetIhWjcAuRHWI9FtpI0X
    1if7Q0uLuUrlWj+WFZvcExqXcYRs1Kz740TGA0BdEZF7hqs1rjgdtu8xuvgNXvL+SwQPz5
    OU+Kp9UGoHJCfh7v41OFx8T3SbkSgGNxkoPcfJimECrLvSmlSsaAWXUENfpA
X-ME-Proxy: <xmx:gFBWahIKrd90bCy2BcNxHfqZqnLnwC9oY2PrX2tkHAkaw3GmI0tD4w>
    <xmx:gFBWah1d4AZS7FaSWpZ_5751gscO9pSn7kUXTTB3b8vX3oa2TeVofA>
    <xmx:gFBWahmWXLnLFgDv9FiNWPkQT70pF1EJmESlHFwlKW4Gk6qxm51d1g>
    <xmx:gFBWamKLBVtdBxN7sP76KlPB3WPpuMmDrdTYCQ4M2cEO5OrFLUC3hg>
    <xmx:hVBWat80Gj-HkinrJhk1p2kSHhh3n5oiP0ZcN5OwvSFz3WbEorTmtDKp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A3DA81820082; Tue, 14 Jul 2026 11:06:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Tue, 14 Jul 2026 17:06:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
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
Message-Id: <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
In-Reply-To: <20260714143450.61a94085@pumpkin>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com> <alYL7B0HAvmLVHGU@pedro-suse>
 <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
 <20260714143450.61a94085@pumpkin>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15897-lists,linux-mips=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:pfalcato@suse.de,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,
 m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,
 m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.de,arm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,kernel.org,kvack.org,googlegroups.com,lists.linux-m68k.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,messagingengine.com:dkim,godbolt.org:url,app.fastmail.com:mid,arndb.de:from_mime,arndb.de:email,arndb.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5D3375642C

On Tue, Jul 14, 2026, at 15:34, David Laight wrote:
> On Tue, 14 Jul 2026 13:55:18 +0200
> "Arnd Bergmann" <arnd@arndb.de> wrote:
>> > I see the compiler has an awkward time returning a u64 struct (see
>> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
>> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
>> > purposefully toggling it on for testing from time to time.  
>> 
>> As far as I can tell, the #ifdef was originally in i386 and
>> got copied to all other architectures at the time, but was
>> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
>> was introduced.
>
> For x86-32 the makefiles request 64bit structures be returned in registers
> (at the same place regparm=3 is set - probably added at the same time
> between 2.4 and 2.6).
>
> Note that arm32 can will return a 32bit struct in a register and
> arm64 will return a 128bit struct in two registers.
>
> The only problem is returning a 64bit struct in 32bit mode.
>
> I'm sure this code is arm64 only.

The file we are talking about is arch/arm/include/asm/pgtable-2level-types.h,
which is definitely 32-bit only and force a 64-bit struct return
on the stack.

I checked some trivial tests that show that arm-linux-gnueabihf-gcc-16
also still produces badly optimized object code with structures
passed by value, and will spill those to the stack for no apparent
reason. clang handles those just fine as a pair of registers.

For the 2-level page table, this only concerns pgd_t, which is
rarely passed around or returned by value. The 3-level page
table has a 64-bit pte_t, which means we probably won't
want STRICT_MM_TYPECHECKS there.

      Arnd

