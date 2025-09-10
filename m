Return-Path: <linux-mips+bounces-11203-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEFBB51EC0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 19:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC547189B722
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 17:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CE727990B;
	Wed, 10 Sep 2025 17:20:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9881A26F2AA;
	Wed, 10 Sep 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524837; cv=none; b=oahTLGcYYiAeovcoAvNx75aCeuvCmsKV2XYfuDIuymECNrFErOkkHk51yOU9os9qor23/6Q7y/91R044ZPv0x/ZU1x9HPptUwznVi+0+X0tOSJSF+QJKwRhUtQRDb62Ej2lnZqCY+KVRyOaiHK2U2BMLs/F855jkhbD2OVVY9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524837; c=relaxed/simple;
	bh=Y0vM/C+i7FrhaWc22NPICuucZw/FXOkJVrmqKIyqWFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+1koEQOuKB3SxuZ5XT09qNtGyXU/LeTSbaU7geoHlqoCG9RB9rtKjnl2Yf/pX4E8XOstBrOoFbrsfOC/TddK1BllyxVqoEpoajn3nePpQk1LZuVcYRKMTqKCq5pUmKWcaM+ySLGn2hH4YXPW/8DC/+tBtzmIqBHXhGK5f6jdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cMS006bWmz9sj9;
	Wed, 10 Sep 2025 19:11:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnbxQRtTxTSD; Wed, 10 Sep 2025 19:11:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cMS005XY2z9sj8;
	Wed, 10 Sep 2025 19:11:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8550B8B7A7;
	Wed, 10 Sep 2025 19:11:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tVGSEt2GMt0K; Wed, 10 Sep 2025 19:11:28 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C99E88B764;
	Wed, 10 Sep 2025 19:11:26 +0200 (CEST)
Message-ID: <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
Date: Wed, 10 Sep 2025 19:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev,
 Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>,
 Nishanth Menon <nm@ti.com>, heiko <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andreas Larsson <andreas@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

Le 10/09/2025 à 16:04, Richard Weinberger a écrit :
> Arnd,
> 
> ----- Ursprüngliche Mail -----
>> Von: "Arnd Bergmann" <arnd@arndb.de>
>> High memory is one of the least popular features of the Linux kernel.
>> Added in 1999 for linux-2.3.16 to support large x86 machines, there
>> are very few systems that still need it. I talked about about this
>> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
>> and there were a few older discussions before[4][5][6].
>>
>> While removing a feature that is actively used is clearly a regression
>> and not normally done, I expect removing highmem is going to happen
>> at some point anyway when there are few enough users, but the question
>> is when that time will be.
>>
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason. Some
>> users obviously are alarmed about potentially losing this ability,
>> so I hope to get a broad consensus on a specific timeline for how long
>> we plan to support highmem in the page cache and to give every user
>> sufficient time to migrate to a well-tested alternative setup if that
>> is possible, or stay on a highmem-enabled LTS kernel for as long
>> as necessary.
> 
> I am part of a team responsible for products based on various 32-bit SoCs,
> so I'm alarmed.
> These products, which include ARMv7 and PPC32 architectures with up to 2 GiB of RAM,
> are communication systems with five-figure deployments worldwide.
> 
> Removing high memory will have an impact on these systems.
> The oldest kernel version they run is 4.19 LTS, with upgrades to a more recent
> LTS release currently in progress.
> We typically upgrade the kernel every few years and will continue to support
> these systems for at least the next 10 years.
> 
> Even with a new memory split, which could utilize most of the available memory,
> I expect there to be issues with various applications and FPGA device drivers.

Can you tell which PPC32 model/family you are using ? Is it mpc85xx or 
and/or other variants ? Maybe we can look at keeping CONFIG_HIGHMEM or 
find alternatives for that subset of PPC32 only.

Could you also elaborate a bit on the kind of issues you forsee or fear 
with applications and FPGA device drivers.

FWIW I sent out today a patch that removes CONFIG_HIGHMEM complely on 
powerpc in order to get a better view of the impacted areas and allow 
people to test what it looks like on their system without 
CONFIG_HIGHMEM. See [1].

Christophe

[1] 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/28d908b95fe358129db18f69b30891788e15ada0.1757512010.git.christophe.leroy@csgroup.eu/


