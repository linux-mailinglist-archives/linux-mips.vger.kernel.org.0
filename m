Return-Path: <linux-mips+bounces-15908-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +zG2KLwkV2p5FwEAu9opvQ
	(envelope-from <linux-mips+bounces-15908-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:12:12 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2075ADDD
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=a8RAtuNH;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="J r1iBAn";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15908-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15908-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A980301A7F9
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 06:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CFE39CCEC;
	Wed, 15 Jul 2026 06:12:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F0436E46F;
	Wed, 15 Jul 2026 06:12:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095927; cv=none; b=GCuba8a/ZruyB+Nxwmby3UAmQrTMCFrDL8PKO/YitsnjtWYFLGE54Vp3aaINHCrVr1TQRWIPSDfBSe/Cs/7e2KJsRSZRdLMlL9DdIz02jZT4UTSMey33yXrK6ftJ6aPaV0Ed6EV3qNpAZrkRV8HO7hmRXUgL8n57YvunOdmugOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095927; c=relaxed/simple;
	bh=/NwvcGOFd2qRl7ff0UZ/P5oojljx0vFAqe2dxfnyqx4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uEK3U97cfg/MYUZ38oBb4ordTttRmzM0YDDpqUSznVIaeullbXIOYigok2AuGBVKIrGOOUStunZho6Cf4D5nZOYp7i//Uuta+BQki6/nuGnesvkdPMSS6UlGz8QvTDANDQ5YgTTMRfmzgDQ29ywEXrn61KgtCyuMuad7852aHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=a8RAtuNH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jr1iBAn+; arc=none smtp.client-ip=103.168.172.141
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id B2B0C1380119;
	Wed, 15 Jul 2026 02:12:04 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 02:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784095924;
	 x=1784103124; bh=EUNLiWQIu7iTIlSyfAVZR84DufWom2g2RocOGGt7G9c=; b=
	a8RAtuNHzJgQpRc7/V/O9hKgDUcjQuU4FAYwrHP9pWXQ1LGjnWdufjScf0CPwLXl
	ebuDD6/m8uMBMtjsmLyRxDwVm1W5D0UJ0qFrV0ql5UaaznPi/OAuQsTYCEfebhpp
	JHIhGETCVDZx0JCaK9T9XiGI+2yaxkBs8jBbV10wvybX7j6xe0sWdssCQibesp9r
	8ZMwvxPimz5JxUH87zSSHB/s3y19KyXU5yXlSf0yZzwka5szmKRHrUeXKTOPvbxu
	8UFr61JQoQs0kR0U0732WlMu3psRIJPB7il4skw3eB3PnoehddPNJJ7Z6aIeeXcJ
	ul6zn0HGzKLpoMSy/XjsvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784095924; x=
	1784103124; bh=EUNLiWQIu7iTIlSyfAVZR84DufWom2g2RocOGGt7G9c=; b=J
	r1iBAn+v7XqSR2sRD6G+XUnRGoxSwquZxwHfJPlKD5bUqHSELpk97BYD0EI7qYuB
	tWPI68KHKqboodxMu2iPmU+7Uedw5ij7bDSpzusWe1PzwiizuSoR7PsPJkwFOAQr
	7TPp2tbWpukaZ8XIir6cdpKNlalTJRq9E4cNzSIIAGTgF6mrZH25az8g3Hd2T4NB
	azOIXT0CQfO2WJ/tJg/fW7aTy/7uAKCIs9WoNMGmYLB1hshS6J5WksM8AcR43gHn
	Snwxa1Y/HFo9DknVQUJNoJ9eaM7isTSaAOA9nPwbhGSy8SQYoHrXcnJDBDL/x/Yy
	PUj7y749VmENuoYCyqf4w==
X-ME-Sender: <xms:ryRXamxegDT7PDmJNNPgLswItiV1L0wADqQ55UdRMZ1ltF3sBg21_w>
    <xme:ryRXatEPnD47JuD9gtMrdA80Zx5AuYb_KJjzokHu0vEJRORd3VW5eC0IF6w3LN35z
    51IafVJylssdT0E2yYiYe0hVEKysEzyz3cHKOnAoA9mfqtNj47zCyiI>
X-ME-Proxy-Cause: dmFkZTGFJUT9q0RQslH+2LbGJNpjb93/J6MhXke5wQ0bwjzy+neOq13hjf56wjlruzpSKf
    YmQ8WX1FNCCuKclqu4rBYjdK+D9Fgwgeg5Cv9tvMeiYLsueu8zGPzHHzgdW8nhVvRSu7sd
    Adqa+XD8nn68rTK01FmplsUZnMHbxOBRt/Onegc1p4/ensfrizVXWshbh6naWEPhzyQb/h
    ZU3V0wHuBvzTGhcjIY7HBhH4r1pbDyidwblxIuDazjX/A64isrjWWp33IvQYz2XBSkFm2z
    vXCH/0NzPAchHQOC4XNZPKm1lTi0avCvBxltVxR8oZ5vaE5uQ/r8uxDe6hFyc5XAHHPMP1
    Ca3gLCSlhDaJMXMB/cNV90FOM/5FsDVccx+UMiFyGSSOCZH1gLSBoeRsW+OB8cS8yHkX9P
    0oxzCUds8E++pvQSsElVI1d6rJw7dSCHBSo1I+Ra1KDy2P7SgXUbS1AsPzIUBbxY8XxaDX
    rJt/bMPTYoQte8pVgPCNmTjaADKFnid+D+Hi9XFCuMQdsX8uYEx6JY/ru3lwl4mxF/21O4
    1LJGVV+PHrWsBtp6R6m3VX9gyDeiH/sJW2YGARSv6w1T0Vp3iqzKE58cKA467FvKs/R1MT
    QFAnYmCsN4PVXVZLmJvc0YtS1dw86/rcfWf9MV22qTW9UKDOpN9kexkBYKKQ
X-ME-Proxy: <xmx:sCRXahm_eEKhKv0bT_bm3ckpgyWzIY0tMOn02kO6iYQkbS1lslkAHg>
    <xmx:sCRXaqizgUvqruPJ3B5irYcNhpEnpTDlGmnQKfe63XHaekM5e1IlaQ>
    <xmx:sCRXavtVEWvBAmUP25RuhVS1F5dVNlz5NZeNWYAatfQ0I-E2bXxEDQ>
    <xmx:sCRXap8AdlLW1OLuSsMNrFn9w4kjhfhTG_k4v-qvGOs35ggJ6BXMJw>
    <xmx:tCRXanaMRI-1Cl0xSo1dwVai7gVVaK0YQWMAziD5wV1tzfGL7RowtiwY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DA915182007E; Wed, 15 Jul 2026 02:11:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASU80-mPZ9gg
Date: Wed, 15 Jul 2026 08:11:39 +0200
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
Message-Id: <d0b34b90-fb12-4579-a965-ea5b90284f18@app.fastmail.com>
In-Reply-To: <20260714224553.583c8445@pumpkin>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-3-yeoreum.yun@arm.com> <alYL7B0HAvmLVHGU@pedro-suse>
 <b7dbc476-1477-4004-93b3-c5e667e24df8@app.fastmail.com>
 <20260714143450.61a94085@pumpkin>
 <aceb8582-bafa-41b3-8f56-77fec89a4d90@app.fastmail.com>
 <20260714224553.583c8445@pumpkin>
Subject: Re: [RFC PATCH 02/34] ARM: mm: make 2-level pgd_t a scalar
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15908-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:pfalcato@suse.de,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:david@kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,
 m:kevin.brodsky@arm.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,
 m:yu-cheng.yu@intel.com,m:baolu.lu@linux.intel.com,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:geert@linux-m68k.org,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:from_mime,arndb.de:email,arndb.de:dkim,app.fastmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59D2075ADDD

On Tue, Jul 14, 2026, at 23:45, David Laight wrote:
> On Tue, 14 Jul 2026 17:06:00 +0200
> "Arnd Bergmann" <arnd@arndb.de> wrote:
> > For the 2-level page table, this only concerns pgd_t, which is
> > rarely passed around or returned by value. The 3-level page
> > table has a 64-bit pte_t, which means we probably won't
> > want STRICT_MM_TYPECHECKS there.
>
> Is the 64bit pte_t needed to get the extra modified and accessed
> flags there aren't free bits for in the hardware pte?
> Would it have been possible to use bits that are fixed in the hardware
> pte for the extra bits and write the value to pte[0] and pte[256] fixing
> up the value written to pte[0] (that the hardware reads).

The 64-bit pte_t for 3-level tables (armv7ve/lpae) is the hardware
table entry, following the same format as arm64, and similar to
how x86/pae works.

The special cases with double pmd_t entries four 1024 byte tables to
hold hardware and software entries that David Hildenbrand cited
is only for the old 2-level tables (armv3 through armv7-a).
The Linux pte_t is only 32-bit wide here, and gets copied into
the CPU specific hardware pte in the cpu_*_set_pte_ext() function.

    Arnd

