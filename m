Return-Path: <linux-mips+bounces-15904-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfYRM2CuVmpSAAEAu9opvQ
	(envelope-from <linux-mips+bounces-15904-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 23:47:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE357590D3
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 23:47:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KkjWbcaa;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15904-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15904-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B82A300D85E
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2026 21:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D3342B326;
	Tue, 14 Jul 2026 21:45:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104533EDE59
	for <linux-mips@vger.kernel.org>; Tue, 14 Jul 2026 21:45:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065559; cv=none; b=S/Aonvsi7vySBlZUZqrU3BrI7Vys8X0J5c8uOb7JkJb8rt6meL5rlHia3vAroDpy6CaGqYBSGhFgW8SBsBHAJDPl0bxIr1d9gwJmvTZc1oiBzOW/vPum5r2UwmqGC2Uz2kQm8C+71TYCzHlAI1GmCiDZZgbYvXDjybnxk8+L+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065559; c=relaxed/simple;
	bh=cAVW45uqQg2SRPEYKmKtszJRvMO//7p4A7xPCiBzVyY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnP6cQ271+YGv9XrJ+L69oWAfbfo0vS9a2ElcsEy84LSge37Lo/KLXvsCJp8YyXqd3vGowNj90gAuuEwn4QXVNk11lUhNl36HsF7a7KQPD5DbB83IlDfNo77oWErFNPpGD8UDTBkfxFCSDToPoElh/ubHuobqjSRYqCaDjYJMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkjWbcaa; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso36559625e9.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Jul 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784065556; x=1784670356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=KkjWbcaazAke3wXuU80om0NUqMSXZObBDwLbhD/9EV5XAxe3Xq6GRLNsM8aoBv3HdJ
         dW6MdyWIupPBH2Pyr/S2bwdL+ClHqaQ+LVgx1JLKA3G7ASLVatx3lX6lE9fjL0rnJHk0
         mgr8pokiOu++KxonyRuT5nChTpiJjJJvrt+8/3YGXm2owcmxJq+uLW6Nb7l9ECyS/Orx
         st30PZQ9xPol8bl0v8EPr0EvpfEw9W1w9i/+AKCg+uiX6MGJUTK5ZR2y4OdhKvq767CH
         o1bGfs4S9DJxz9Enexow/bW+AjFBUIAXPf1g9uElm0dnJZz8kvTDpQjfcUuTr/+eMVO5
         mVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784065556; x=1784670356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lsgDUhCPZi1cUpPkNQ/I7/JmqQLLDAJpIhlyKeHE0tE=;
        b=E/rZheBZQHGSbzXLATzmYrJpujBaTM7UMLv16PY56E1+b/GEUKlGXMwXw5iAaEsrQI
         WL7eCwjc4mGV/SM3tNn0gnHMMxkAPNKClrOhw5656O/3KEuAGH3Va1fYsxf4VZVq6xmk
         90/0nU2hkwRmh6T0lb0nyJOOaDR827uoFRxq+Xme8rqFoOpyvWwhHM48c/m9BxMhmH/R
         T3w88R8MBrqb4dHktjLa0iN74k2aC8WkTVtZZoc0O+IMm58wi8VaT4tg4iPvfSBph6oy
         omKiLo0fAeWFuPtqNW+iQkgvjFXfeIl2pL0MoVVKWjJauXfp+H3FdVkuVEjUhmYIO+oa
         KazQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNY6IWYPMQPZF36kmjxbgpGOKkdrFY+wNJoJl4hO4uTApmQCjja7eEwm3GYnN2JJsNzck6dAJxeFuH@vger.kernel.org
X-Gm-Message-State: AOJu0YwGESAfNNXM4cZ/OTW6q45vsswxM4yu6/59eJdPn36UD4J3Oxqe
	P/SAFswLI9Aew8jxtxh+gqZ9HwQ35DLFD8eyktwWjLd1cO757jA4OVcL
X-Gm-Gg: AfdE7cmtyb6iDV/xMTZQx54HLKvNvKNfk7g+BBPb5Br9+BebshscvTajNcuv5lkLr4d
	bhgauDqfEnmE/lvKjr7JqXMZ3h05H8l9Wuh8yOy7isIrz1FqG0zJ9kg1706YyPhgTxnPMTkvZJ5
	Db/0+wTwNVVeWLsRFWCXm8di+cNfr11pp4u7nchKnOY2zyW87wvq0VKmd7EvZSrlxU11khi0O83
	5e5fjG84HqgrcXwaD0wI9c9fHruGmBs2oHszRc4EKwvC77rP5Z5dfR5vsQBNpreYZy5KAEWR5T2
	G96aOIymktIGFpz8+TmNa9iRkptxaP8KAlcqQN5iZ60jQOmWkuh7tFCo1HFuk1oNosXf3i4fR8R
	BsIYLhW60ZZx5pHxIU4Yy3YlhqZq41XbBpj9Kjt2vUeDEAuheH0y8kWyBLTXe8VgG3Y3HrGC54J
	co2Ar14o/HjyxAjVBc0VovtgIRFOunYCNObL9TujIccxpIhUKyTw==
X-Received: by 2002:a05:600c:4e8f:b0:493:b307:6777 with SMTP id 5b1f17b1804b1-4953c273de7mr4061435e9.22.1784065556082;
        Tue, 14 Jul 2026 14:45:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm118533945e9.13.2026.07.14.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:45:55 -0700 (PDT)
Date: Tue, 14 Jul 2026 22:45:53 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Pedro Falcato" <pfalcato@suse.de>, "Yeoreum Yun" <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Linux-Arch
 <linux-arch@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "David
 Hildenbrand (Red Hat)" <david@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Ankur Arora" <ankur.a.arora@oracle.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Magnus Lindholm" <linmag7@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Klara Modin" <klarasmodin@gmail.com>, "Huacai
 Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>, "Kirill
 A. Shutemov" <kas@kernel.org>, zhangtianyang@loongson.cn, wangyuli@aosc.io,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Pasha Tatashin" <pasha.tatashin@soleen.com>,
 "Rohan McLure" <rmclure@linux.ibm.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Tejun Heo" <tj@kernel.org>, "Kevin
 Brodsky" <kevin.brodsky@arm.com>, "Anup Patel" <anup@brainfault.org>,
 atish.patra@linux.dev, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Dave Hansen" <dave.hansen@linux.intel.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Michal Hocko" <mhocko@kernel.org>,
 qi.zheng@linux.dev, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui Song"
 <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>, "Axel Rasmussen"
 <axelrasmussen@google.com>, "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu"
 <weixugc@google.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Anshuman Khandual"
 <anshuman.khandual@arm.com>, "Yang Shi" <yang@os.amperecomputing.com>,
 chaitanyas.prakash@arm.com, "Ard Biesheuvel" <ardb@kernel.org>, guoren
 <guoren@kernel.org>, yang.li85200@gmail.com, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Vivian Wang" <wangruikang@iscas.ac.cn>, junhui.liu@pigmoral.tech, "Muchun
 Song" <muchun.song@linux.dev>, "Vishal Moola (Oracle)"
 <vishal.moola@gmail.com>, "Nam Cao" <namcao@linutronix.de>, "Pavel Machek"
 <pavel@kernel.org>, djbw@kernel.org, yu-cheng.yu@intel.com, "Baolu Lu"
 <baolu.lu@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Coiby Xu" <coxu@redhat.com>, "Andreas
 Larsson" <andreas@gaisler.com>, "Liam R. Howlett" <liam@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>, "Stafford Horne" <shorne@gmail.com>, "Jonas Bonn"
 <jonas@southpole.se>, "Stefan Kristiansson"
 <stefan.kristiansson@saunalahti.fi>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Message-ID: <20260714224553.583c8445@pumpkin>
In-Reply-To: <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
	<20260713135614.1618183-3-yeoreum.yun@arm.com>
	<alYL7B0HAvmLVHGU@pedro-suse>
	<b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
	<20260714143450.61a94085@pumpkin>
	<aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15904-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:pfalcato@suse.de,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.brodsky
 @arm.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng.yu@i
 ntel.com,m:baolu.lu@linux.intel.com,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[suse.de,arm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,kernel.org,kvack.org,googlegroups.com,lists.linux-m68k.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[96];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[godbolt.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CE357590D3

On Tue, 14 Jul 2026 17:06:00 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Jul 14, 2026, at 15:34, David Laight wrote:
> > On Tue, 14 Jul 2026 13:55:18 +0200
> > "Arnd Bergmann" <arnd@arndb.de> wrote:  
> >> > I see the compiler has an awkward time returning a u64 struct (see
> >> > https://godbolt.org/z/qejbv6j9a), but if this doesn't work maybe we should
> >> > get rid of the STRICT_MM_TYPECHECKS stuff? I seriously doubt anyone is
> >> > purposefully toggling it on for testing from time to time.    
> >> 
> >> As far as I can tell, the #ifdef was originally in i386 and
> >> got copied to all other architectures at the time, but was
> >> removed in linux-2.3.23 from the original copy when CONFIG_X86_PAE
> >> was introduced.  
> >
> > For x86-32 the makefiles request 64bit structures be returned in registers
> > (at the same place regparm=3 is set - probably added at the same time
> > between 2.4 and 2.6).
> >
> > Note that arm32 can will return a 32bit struct in a register and
> > arm64 will return a 128bit struct in two registers.
> >
> > The only problem is returning a 64bit struct in 32bit mode.
> >
> > I'm sure this code is arm64 only.  
> 
> The file we are talking about is arch/arm/include/asm/pgtable-2level-types.h,
> which is definitely 32-bit only and force a 64-bit struct return
> on the stack.

I've clearly failed to detect the environment :-(
The 'struct return by reference' is part of the ABI.

> I checked some trivial tests that show that arm-linux-gnueabihf-gcc-16
> also still produces badly optimized object code with structures
> passed by value, and will spill those to the stack for no apparent
> reason. clang handles those just fine as a pair of registers.

I'd have thought it would be ok if the structure had two 32bit values
and they were directly accessed.
The silly test I did earlier didn't spill.
Taking the address could easily force a spill in the function itself.
So that ((int (*)[2])&var)[0] (which is just ((int *)&var)[0]) is likely
to be problematic - or certainly heading in that direction.

> For the 2-level page table, this only concerns pgd_t, which is
> rarely passed around or returned by value. The 3-level page
> table has a 64-bit pte_t, which means we probably won't
> want STRICT_MM_TYPECHECKS there.

I did do some mmu setup for a strongarm a long time ago.
I do remember in being odd.
But I was only moving the software frame buffer away from the physical
frame buffer to steal a load of screen rows for a keyboard.

Is the 64bit pte_t needed to get the extra modified and accessed
flags there aren't free bits for in the hardware pte?
Would it have been possible to use bits that are fixed in the hardware
pte for the extra bits and write the value to pte[0] and pte[256] fixing
up the value written to pte[0] (that the hardware reads).

The arm docs seem hard to read...
(the left-right scroll doesn't help!)

	David

> 
>       Arnd


