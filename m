Return-Path: <linux-mips+bounces-11168-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC95B50813
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 23:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0072B7A5909
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 21:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E2A257ACF;
	Tue,  9 Sep 2025 21:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="S5wTqYtM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CnNoO4VJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232B221F15;
	Tue,  9 Sep 2025 21:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757453091; cv=none; b=XwnZ2JM/7T3C2kHCVSabJYbI1sF+3aiUH4FiqgHQycgO4TXMgW/amMjBEY5Q/uHkMJAwEEFnS+buCfClhx1QLNVOLFtdfmxRV/ucokliT2QvsmaN4D4QDxgfkS16Am57d9jps+gyDqWv3L5DANdNFrvy0fhns6XnzZRT2CqrUCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757453091; c=relaxed/simple;
	bh=mlFK0XXQDuGFAw4opCeOodFgemwUqDJaf+3CNFBfQTU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=TSkgGhWXyz+riacXH0S5Oai5Vc1HaNbhtDL0+iPxxP08F/afb4TjoT1ZuimqCXT3Rc3bSZvIBzp18Dk1QTbhZOrpTZOVj3OIu6CQ5H3wsh2OuFgfzA7Nc+TDvBLtO6A8y+CUd78bDTTMK+viblS2b6W6dTNHXWL/FLQosbN1TWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=S5wTqYtM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CnNoO4VJ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 535E01D0009D;
	Tue,  9 Sep 2025 17:24:47 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 09 Sep 2025 17:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757453087; x=1757539487; bh=Km
	AXv5RN4xzWEkkqE7xhCId8sGR0ZDNZp4Q8OwYi4mM=; b=S5wTqYtMjI5GP+ybjz
	l++URQMVSnvXfm2LVkJwzvT9iWvhlgeNQJIO1R6oZKi2eMjeXdMwltmibDshd7LK
	T6Hk20+klGPnK9s5abxIINZ/10rB4VuCvLCsjYTDRmdIQcIrGfyp86iMa2X8hffD
	6BuMe+NT08tZ/eMBVdj1RbSkp3ce+f6jeZKBMwCS0W1Fvo1lV8HKa1j0mdnsGV/I
	ueKVQHFzmMvq9kZHcCgDoHRKhcutvXF/cnrHqY94Uw25zgRfvEVli4IkNbDnWNl0
	ZlJM2Fnc0OylwbwC0Qt2Y9VmI6AUTL7VBGHhaizOOrpy051Wr7SaQ9p1ar7gV0iZ
	a8iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757453087; x=1757539487; bh=KmAXv5RN4xzWEkkqE7xhCId8sGR0
	ZDNZp4Q8OwYi4mM=; b=CnNoO4VJGS6ZHP/Ka7rEdezOyzdrHY8fuAWzu8X37tr6
	IHHAlPeLFzVY2iuwtEv+RYU3H3SJPMzMETnB+n0JEFhBmGd1zQfI74HQ9WTaPxCV
	FMKzQDPDf02PjHjCallACsg86j/oJfh/85r7CCDSlRLBBFiKVN29hQBM9SbXJQTe
	aYS0nyf7cYv8b9R8g8qhf/1kk1gqOgiKmRn6dNL6z35Y9TpuYvrkOIvbPBanx8Xz
	7Mu9euZ2ULJgmpY4oMyJT3UtflNwnpZ7DvpFKF2SRsU3rpLS6nMJ05mMKsYyTA+b
	OqRoGf62l2o4h5lDE02G3V1qjkCH6mMBRZCiMUoR4Q==
X-ME-Sender: <xms:HZvAaOk80-aIzLlc88R-gJ6Dbsr6p-CSisCWsOKNXn-4RU3c_vM0lg>
    <xme:HZvAaF1hbI34vibTWFPzSWGi4ceFSikwvEhmxaMdzrw7BzZ43MRg_7mxP9P9k_V8R
    MpoIDHe3Q2LTQ-Fo9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    eggeduleellefhteegvdetiefgffejtdfhtdejgfetveekheegtdejfefgteevgfenucff
    ohhmrghinhepshgthhgvugdrtghomhdphihouhhtuhgsvgdrtghomhdplhifnhdrnhgvth
    dpkhgvrhhnvghlrdhorhhgpdhlphgtrdgvvhgvnhhtshenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsg
    gprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvghs
    thgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprhgtphhtthhopegthhhrihhsth
    hophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtoheprghnughrvggr
    shesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghsse
    hglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhn
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggtuhgvlhhloh
    hssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:HZvAaFgoo_DfPwniM_Ba_NRbjr-NAjUpEBl2hgLAezwds8DkZdW4qA>
    <xmx:HZvAaE6lPLn2-QRvMEsIj-X5mf9tu625xuDInoNOznW8W6Zswp5Y8w>
    <xmx:HZvAaGBWRtHuGb-d6P9akzthHK2lFP4CLOwsn4ylVI-r07KO_rit4Q>
    <xmx:HZvAaBRl4yfkgjX-QCNs9pE-_5-4j1CMwgBapEaDS1idWbtZYs0nSg>
    <xmx:H5vAaB_k0psbdKb-XOux5x39l6C7CTGwSMVHGHMsh5hVdXcIdz-BvKYw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 171AC700065; Tue,  9 Sep 2025 17:24:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmcCJOTBQ5ho
Date: Tue, 09 Sep 2025 23:23:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Subject: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

High memory is one of the least popular features of the Linux kernel.
Added in 1999 for linux-2.3.16 to support large x86 machines, there
are very few systems that still need it. I talked about about this
recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
and there were a few older discussions before[4][5][6].

While removing a feature that is actively used is clearly a regression
and not normally done, I expect removing highmem is going to happen
at some point anyway when there are few enough users, but the question
is when that time will be.

I'm still collecting information about which of the remaining highmem
users plan to keep updating their kernels and for what reason. Some
users obviously are alarmed about potentially losing this ability,
so I hope to get a broad consensus on a specific timeline for how long
we plan to support highmem in the page cache and to give every user
sufficient time to migrate to a well-tested alternative setup if that
is possible, or stay on a highmem-enabled LTS kernel for as long
as necessary.

These are the assumptions I'm making, based on both what I have
presented in my talk and feedback I have received so far, let me
know if something is missing here:

- Highmem in new kernels is almost exclusively an embedded Linux
  topic. While there were a few late 32-bit desktop and laptop
  systems that had more than 2GB of RAM, these were fairly short
  lived and have long been unsupported by both the originally
  shipping operating systems and most Linux distros. Notable
  Examples include Pentium 4 "Northwood" desktops (sold 2003-2004),
  Core Duo laptops (2006-2007), and Arm Chromebooks (rk3288,
  Tegra k1, Exynos 5800, sold 2014-2017). Some PowerPC G4 Macs
  and Atom Netbooks could be upgraded to 2GB.
  There are a small number of users, but they really love these
  devices and want to keep them alive, especially since they
  mark the peak of the respective 32-bit product lines.

- Within the embedded market, highmem is mostly used on ARMv7
  based SoCs, but a few others also need it and still get kernel
  updates:
  PowerPC 85xx, 86xx and QoriQ P1/P2/P3/P4 (produced 2003-2021)
  were used in some long-lived embedded systems with 2GB of RAM
  or more. Mediatek MT7621 (MIPS32r3, introduced 2014 but still
  sold) needs highmem to reach the upper 64MB of the 512MB physical
  memory. Ingenic JZ4780 (MIPS32, released 2012) was used in the
  short-lived MIPS Creator CI20 with 1GB of RAM (256MB lowmem)
  and probably othes. Sparc32/LEON seems to be limited to 192MB of
  lowmem as a kernel design choice. Vortex86DX3 supports 2GB
  DDR3 memory.
  The kernel also supports highmem on ARMv4, ARMv5, ARMv6,
  PPC4xx, PPC82xx, PPC83xx, ARC, CSKY, Microblaze and Xtensa,
  as well as additional MIPS SoCs,  but so far I could not find
  any indication of any such machine with more than 1GB that
  keeps getting kernel updates.

- The vast majority of new embedded ARMv7 machines have 1GB of
  RAM or less, which on many SoCs is a physical limitation
  a narrow DDR3 memory interface, as well as a cost tradeoff.
  The 1GB case is interesting because that usually means having
  only 768MB of lowmem plus 256MB of highmem, as well as 3GB
  of virtual addressing. I expect that almost all applications
  on these work just as well with CONFIG_VMSPLIT_3G_OPT, changing
  the limit to 1GB of lowmem and 2816MB of user address space.
  The same thing should work on x86 and powerpc (CONFIG_LOWMEM_SIZE)
  but not on mips and sparc where the limit is not configurable.

- A few Arm SoCs have sparse physical address ranges for
  their RAM, e.g. range per memory controllers like the Renesas
  R-Car Gen 2 or Broadcom BCM4708. These currently require highmem
  even on configurations with less than 1GB RAM, until we change
  the way that sparsemem is handled to support rearranging the
  linear map to fill all of lowmem. This still needs more work.

- ARMv7 machines with 2GB remain in production, in particular
  with the popular i.MX6Dual/Quad chip that has a 64-bit wide DDR3
  interface and guaranteed manufacturer support until 2035.
  This is the configuration I expect to see struggle the most.
  Setting CONFIG_VMSPLIT_2G or CONFIG_VMSPLIT_2G_OPT should work
  for most of the users but can break if an application runs out
  of virtual address space, so this does require extensive testing,
  and possibly user space changes. An example of possibly affected
  userspace is Firefox, which needs more address space than other
  applications but can perhaps be replaced with another embedded
  browser.
  
- ARMv7 machines with 4GB and more exist and keep getting
  kernel upgrades, but to my knowledge are not in production any
  more. These are mainly 2010-2015 era chips based on rare
  out-of-order cores like A15, A17 or PJ4 that were designed for
  low-end servers, chromebooks and network equipment but replaced
  with 64-bit chips shortly after. We had planned to bring a
  CONFIG_VMSPLIT_4G_4G option to ARMv7VE to keep supporting the full
  memory at a performance penalty, but currently have no plan to
  finish this (volunteers welcome).
  There is still some hope to keep them working with a combination
  of CONFIG_VMSPLIT_2G and a modified ZRAM that can use high
  pages without CONFIG_HIGHMEM, but whether this works depends
  a lot on the application. I expect most of these products to
  stop getting kernel updates in the next few years due to aging
  hardware and increasing cost for updating out-of-tree patches
  on platforms that are not fully upstream. I do not remember any
  such devices with official support beyond 2030.

My proposal based on the above assumptions is to gradually phase
out highmem over the next 2 years for mainline kernels, obviously
both the individual items and the timeline are completely up for
debate:

1. mark CONFIG_HIGHMEM as 'depends on EXPERT', updating the
   Kconfig description to point to the kernel summit discussion
   any any decisions made here.

2. Change the ARMv7 Kconfig defaults to CONFIG_VMSPLIT_3G_OPT
   and HIGHMEM=n, to make it more likely to find possible
   regressions with that, without changing much for users.
   Possibly do the same for x86 and powerpc.

3. Start removing __GFP_HIGHMEM from in-kernel allocations
   other than the page cache, in particular from individual
   device drivers and filesystem metadata where there is
   already little benefit.

4. Remove HIGHMEM as an option from platforms that are thought
   to no longer need it (arc, armv5, ppc4xx, ppc82xx, ppc83xx,
   csky, microblaze, xtensa), mainly to validate the
   assertion that these use only lowmem.

5. Split highmem on zram out into a separate Kconfig option
   that can be enabled without CONFIG_HIGHMEM or CONFIG_EXPERT

6. Finish the "densemem" replacement for sparsemem, ideally
   allowing both very sparse lowmem areas and a boot-time
   vmsplit selection instead of the compile-time one.

7. Finally, remove the highmem pagecache option, leaving only
   zram and custom device drivers as a way to access high
   pages.

That last step should wait for an LTS kernel, ideally a version
that the CIP project's SLTS kernel is planning to keep supporting
for 10 years. The newest SLTS kernel was 6.12 last year, and the
phb-crytal-ball suggests that the next one in December 2026 may
be linux-7.4, the one after that in December 2028 (linux-7.15?)
seems too far out to plan for but would be another option.

Unless there is an easy consensus on this on the mailing list,
I would like to lead a discussion session at the kernel summit
in order to get closer to a decision.

     Arnd 

[1] https://osseu2025.sched.com/event/25VmZ/32-bit-linux-support-now-and-in-the-future-arnd-bergmann-linaro
[2] https://www.youtube.com/watch?v=QiOMiyGCoTw
[3] https://lwn.net/Articles/1035727/
[4] https://lore.kernel.org/all/0047f565-ada4-491a-b157-f2d8dfde0ac0@app.fastmail.com/
[5] https://lwn.net/Articles/813201/
[6] https://lpc.events/event/16/contributions/1183/attachments/1062/2028/highmem-api-2022-09-12.pdf

