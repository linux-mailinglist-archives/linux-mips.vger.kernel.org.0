Return-Path: <linux-mips+bounces-6673-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 615F49BCE9A
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 15:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2492A283723
	for <lists+linux-mips@lfdr.de>; Tue,  5 Nov 2024 14:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FAB1D86C0;
	Tue,  5 Nov 2024 14:04:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D618C034;
	Tue,  5 Nov 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815482; cv=none; b=uXy586Ki5eLQvwi4v3KAjcYw2E8S/f7bEN7VFx/JToCKkvsiccj5wL06D2qng2ZtqW8Ego+/y400kWFHjjN9IVKeWeYnJvmPWJ+ZkoEgdrSL71SL9uhqXXYm0q3V8CJal1vF0Sq88WyOz6pXSujInS7itbQkjgn6ddWKLA+jbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815482; c=relaxed/simple;
	bh=wX4RhkffqqyHBWYHxMHCAnNlIesTtbQYCSJ6R15iazA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsPzgUGVByGtQqIit6wrGQovc2uxyTrnI04iNwyMsCowN1BAqaZbcFdwOnyO1uIH2x3qKwq6+ceuDLTYTVqLYb91MPbcAzwPpuhiGdOVpvbigCuBFIZKOwqLrfvTPZOkdLQptwWc86/JWoW0e/qrsbRfege7WTiXW0O40GDJEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjVT20D0Vz9sRr;
	Tue,  5 Nov 2024 15:04:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoXpUD9JBUwx; Tue,  5 Nov 2024 15:04:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjVSw68fmz9rvV;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC0698B763;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DUJhllzpqdGg; Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 228F48B770;
	Tue,  5 Nov 2024 15:04:32 +0100 (CET)
Message-ID: <e33569c8-1591-462c-9388-4a514e156bfa@csgroup.eu>
Date: Tue, 5 Nov 2024 15:04:31 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
To: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nam Cao <namcao@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <871pzxzuny.ffs@tglx>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <871pzxzuny.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/10/2024 à 12:39, Thomas Gleixner a écrit :
> Folks!
> 
> On Thu, Oct 10 2024 at 09:01, Thomas Weißschuh wrote:
>> Historically each architecture defined their own datapage to store the
>> VDSO data. This stands in contrast to the generic nature of the VDSO
>> code itself.
>> We plan to introduce a generic framework for the management of the VDSO
>> data storage that can be used by all architectures and which works
>> together with the existing generic VDSO code.
>>
>> Before that is possible align the different architectures by
>> standardizing on the existing generic infrastructure and moving things
>> out of the VDSO data page which does not belong there.
>>
>> Patches	 1- 2:	csky
>> Patch	    3:	s390
>> Patches	 4- 5:	arm64
>> Patch	    6:	riscv
>> Patch	    7:	arm
>> Patch	    8:	LoongArch
>> Patch	    9:	MIPS
>> Patches 10-20:	x86
>> Patches 21-27:	powerpc
>> Patch      28: 	Renamings to avoid a name clash with the new code.
> 
> As this has been sitting for two weeks now without major comments, I'm
> planning to merge that through the tip tree tomorrow.

To avoid any future conflicts with powerpc tree, I suggest you merge 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git 
topic/vdso into your tree before applying this series.

Christophe

