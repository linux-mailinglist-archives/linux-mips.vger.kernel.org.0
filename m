Return-Path: <linux-mips+bounces-8521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D3A7F5FB
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 09:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45796189AA06
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 07:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047F261593;
	Tue,  8 Apr 2025 07:20:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E623726158B;
	Tue,  8 Apr 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096838; cv=none; b=pr4U1pln6V8f5ZnM+8AnVDA7A832OYJaX5hdUCKzFfi2csSrhJlfii47BYqo7g9ltM1+r1jMgS1f3fOWUZC+m/xQ71G24ytIOLLUP0A1JpIhr7pYgyu/uQpFagfqLO6k7CRTNoit1AooW/mScwlK1As7f1ZtuCd0TXKk9FSlMNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096838; c=relaxed/simple;
	bh=leAZBUvTDieNUCTCUQ6Z093axNVZ+MVhp4DKPjyWQPA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q43beue9AVbejRT1Xp7biP/ZfZsIpDEVWoTOrkB6MIGhTraCCk64yyo5fQisocNpjPjyJbv3OzUjzd5pfjeB519RWpeXKMEN5v0fG9aWzPkZMhVrNMNC2jPHEiCpJxwNAEG9lfnfRl0J2x/HpGL0bQePQEcNZQOBespijRndrEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZWw9N4Zhgz9vkq;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6upf-zRu5gv; Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZWw9N26zXz9vkm;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 320D88B768;
	Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NWUepSYaoFfZ; Tue,  8 Apr 2025 07:48:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC9078B767;
	Tue,  8 Apr 2025 07:48:21 +0200 (CEST)
Message-ID: <ff31c2ff-55be-452e-b94a-6a84c4583258@csgroup.eu>
Date: Tue, 8 Apr 2025 07:48:22 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arch, mm: set max_mapnr when allocating memory
 map for FLATMEM
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-10-rppt@kernel.org>
 <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <4b9627f2-65ff-4baf-931f-4e23b5732e6b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mike,

Le 14/03/2025 à 10:25, Christophe Leroy a écrit :
> 
> 
> Le 13/03/2025 à 14:49, Mike Rapoport a écrit :
>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>
>> max_mapnr is essentially the size of the memory map for systems that use
>> FLATMEM. There is no reason to calculate it in each and every 
>> architecture
>> when it's anyway calculated in alloc_node_mem_map().
>>
>> Drop setting of max_mapnr from architecture code and set it once in
>> alloc_node_mem_map().
> 
> As far as I can see alloc_node_mem_map() is called quite late.
> 
> I fear that it will regress commit daa9ada2093e ("powerpc/mm: Fix boot 
> crash with FLATMEM")
> 
> Can you check ?

I see this patch is now merged into mainline (v6.15-rc1). Have you been 
able to check and/or analyse whether it doesn't regress the fix in 
commit daa9ada2093e ("powerpc/mm: Fix boot crash with FLATMEM") ?

Thanks
Christophe


