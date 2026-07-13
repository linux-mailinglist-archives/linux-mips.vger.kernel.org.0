Return-Path: <linux-mips+bounces-15862-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o3iJKlYHVWqFjAAAu9opvQ
	(envelope-from <linux-mips+bounces-15862-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 17:42:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8385574D2F6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 17:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=iW4sWePT;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="U LQnKlU";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15862-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15862-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DF5E30292D9
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873E33DE425;
	Mon, 13 Jul 2026 15:40:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A62EA468;
	Mon, 13 Jul 2026 15:40:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783957216; cv=none; b=igy6m2TuZZm2TUvoCUpZdOnqHo3OQ693TdxOLuQqiWXQKafXPeDETSaqLhHhyNcCBjOKYygXPO0cCz1q+JdI+QamKIhE3HW/BQVFJTbOweDFwqpUNrQ2abh0/y7nlDWcfphbHwU2oKJJnZma7mlwtb9n2x8Qmqpa3p3knT3Qb+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783957216; c=relaxed/simple;
	bh=ShbWXJMsmb8dn/0HEdqhOGvBnjyFF1+YaJlMyjAKgVc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cI1KLoPsV1/ZQNfMAYaj0JQaDSGaHwXJiCTa13c5IrxQM98u+sDIq8+2/forqIx4BlDl9ifgVUnWfIRDHLyp9iQZaHpgPiszxxdhwNuj2N8B63qI8glp05gavpb/AezBni4OivDSg4zQQOauFAkMYO/NNervAHS2xEk632O8A7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=iW4sWePT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ULQnKlUI; arc=none smtp.client-ip=202.12.124.137
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 1564713001CE;
	Mon, 13 Jul 2026 11:40:13 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 13 Jul 2026 11:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783957212;
	 x=1783964412; bh=63sZ2jVYn8LdZA7gH95m3khl+qIGq2b3k4vaJqArUP4=; b=
	iW4sWePT3v5RuiExrfF6A/7tVQ1jM80vt6+qaUuiSXX3xzi8TcKDoEMcLpC1Wycj
	YLGNDisot0aKbYabG11AiSqgAcEv+hchD7ePUn3Q7QegSB63SFitKnIvf8Ti5kJx
	Ow6wHq6FRA8HlIDy3+vSZ+o5LqkVyEACeWvE2KeOw18SdWdmOSIo/GUwP5W4SA6K
	mKTyKFVlWjx8My63P00L4s3EMdG8oh9p/ofSZoJXBBP4mbRVd+E+xZ0mPRjcLmAt
	WVCZZZf+RPZDpr59W8GBdVkmu2RsFbrHEETXg75tSH6h1O4S9IWJHkZnYe4bDtPg
	0VPe9WYzzmoe5YVydhyDvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783957212; x=
	1783964412; bh=63sZ2jVYn8LdZA7gH95m3khl+qIGq2b3k4vaJqArUP4=; b=U
	LQnKlUIywRVFQz2T48udoC33TJAoCXdIAZSeuGP1N0ZPr7fcEG7S0TpEcaVnVn+c
	G/SRa5VYTCQiMflK18sIgpnNhTHIZmCtVUou1s85jLllfrcplhXWmtZKcOfuxqKz
	9OQxUpM9VVkLqu+9JHpcM1AfRqAyklLXOkI+caA/S4eOsPJ5KLTh7w5jSxlilDkX
	8RFtQB2RucnR3YZ8hSAs6eIBOegmwS2ddCbQF+9kknh7pkz44rxlTKTyBe+AZOQ/
	ngdVzQah4hXX7/v48Y2rsKaJyDh0/T4dziQmFdciXJJWCTgGF//fvmhuxjpfTstx
	j1m7omfM4V4qrGYPJq3nw==
X-ME-Sender: <xms:2QZVajyDP5U2h6P0anHj9JfCWAn69RWfRVsmfSB45SDelYt8TMDVvA>
    <xme:2QZVamGc0XqHIvkwMsHO4mWsiOnb7hMXqrIg0Z9S0bntAfwEBmc3umVA2d79R592f
    N_MVD951nak7HALIaxj0ArFMqNFmrR1lPSWSEicJrK--CML9TnjJw>
X-ME-Proxy-Cause: dmFkZTGiBa7nyoJvLHpB9RMkM4BhBJPI163JjTDxEnYj0dxDppPFOS0iQb76r61dIHKZoH
    doew5BVKOzJl0BxEjQHPQAXL339ylWw9vfj91e6+EvGpmugWu4l6FgfHGT8veDQl14YlPk
    azrbgOlYeMoe8q4O6tOdPBWZ3gkfzjXB3MpP5ZSS4pVL3cODDv5o9sdlZZ82AnAYTD4dX1
    ZFEmxiB6y+c1WjQCjWbG2Tuy/F+AydS2qapXYfVj/nzoLQFdxYjff2W121CSyjD96Jqz/I
    RYFG+TB6hnYHG9pcozXzRhRj+7dUC7mbo9HM5um7P+xMaKCVbsxuHzrZLXSTZvkQV2DqfL
    ymeLwexCZPabJK55d5sxK/21hOkUFoUb+ExTnzslr1kLuW1SR9WWu7ZvVZMwIF4IWgoi/o
    j/VpQgVmgwhpVLtp5lgzTBmrTiT5gbnZ7Q7GXYbiO8QeTCwgQIZC6c35txMZjS6TWKAANZ
    lL+3RIdvFvspxp+zwMu1615CC5kCx8DC7tXphYZD0u/gz62IOXC21Cm6XtX7xtSF81yIbe
    SwtTDOBQfx6km50Rqc7jckoTHgvu2LsUahDrxwpgeQTFkFeEql548ztZEJ0FWTv/essIyv
    UwEUdfW3DUphCt4+X7M4Fr0an8HZRkO0QIWnSfi10X3VjRXmi2o6LGa4b21g
X-ME-Proxy: <xmx:2QZVaocb2-tYeEHCaWBxgGheyA65_oTe6yElM-79QvtibuE8CbqF-w>
    <xmx:2QZVahZIVXxuJflYOYjXtypUb3ndXfW6BSq6O-Nx5ec44O4MR9j6JQ>
    <xmx:2QZVat5rur89DlMEW9X7wm3q_ETqCbi-hkT8JmSntCdi1RMWYpE9dw>
    <xmx:2QZVamrLcy7aR6UUg0zEbQdsla3UgqHgVCBl_7RyAYMi3djwF8Z8Jg>
    <xmx:3AZVavasLut-hiuJDfIOSq7WvJC-hw5uzoQuGquD6DedXn23rWIKYKnL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E2258182008C; Mon, 13 Jul 2026 11:40:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Mon, 13 Jul 2026 17:38:53 +0200
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
Message-Id: <d57f5b18-583d-4848-9d74-65b15c93dcf8@app.fastmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15862-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,huawei.com,gaisler.com,suse.com,linux-m68k.org,southpole.se,saunalahti.fi];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:at
 ish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com
 ,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCPT_COUNT_GT_50(0.00)[94];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8385574D2F6

On Mon, Jul 13, 2026, at 15:55, Yeoreum Yun wrote:
> From: "David Hildenbrand (Arm)" <david@kernel.org>
>
> We don't want pgd_t to be an array, as it prohibits returning it from a
> function, like pgdp_get().

What should pgdp_get() return on ARM 2-stage page tables then?
Does it return just the first entry or concatenate the two?

> +typedef u64 pgdval_t;

> +static inline pmdval_t pgd_val(pgd_t pgd)
> +{
> +	return (*(pmdval_t (*)[2])&pgd)[0];
> +}

This could use a comment to explain what this actually
returns and why the second entry is discarded.

      Arnd

