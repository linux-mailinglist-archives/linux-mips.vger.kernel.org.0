Return-Path: <linux-mips+bounces-11615-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9BBB8A36
	for <lists+linux-mips@lfdr.de>; Sat, 04 Oct 2025 08:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CF1A4E4271
	for <lists+linux-mips@lfdr.de>; Sat,  4 Oct 2025 06:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93275219A8E;
	Sat,  4 Oct 2025 06:50:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465CC17C21E;
	Sat,  4 Oct 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560636; cv=none; b=sy9XkcMQMDmfrPKic207zqqmMTGPwrsJ4trfl11Wm9768LWo9R5ceT8hjYYgn6HQg8QXi7FBq2/Cuo4W017DK6zwC4hHghQS6aykUMuH7+e4oVFBCmkhoTqkJWMiAvUuIr2Y5GnSmZz5ks97qRejHh2N1C7NZ5Wdw3iXtBia6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560636; c=relaxed/simple;
	bh=ZV6AuDykQs1/uRmEpmkhZA9AGRC6FbUqoybHL0tj1rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAWDNtaxoDH5s47+TQPjuPS7G3uBNMY0V4riutzb0O/nJ3VJAkUK30D9uwT48n7wkEGcLapjqBsN4638itVPc32IiSBIYFuSJbtDLk6DGdRSPXftFIeq0MUMBURAJGX72H/HvHTkw0H7SKR+fxUm5Al5u3mv69ylK2oOxjVastU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cdwNt1QHbz9sS7;
	Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_idirMR5ok8; Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cdwNt0Pvmz9sRy;
	Sat,  4 Oct 2025 08:19:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E8E218B768;
	Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FGXi2r7cLeL7; Sat,  4 Oct 2025 08:19:41 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A40F08B766;
	Sat,  4 Oct 2025 08:19:40 +0200 (CEST)
Message-ID: <909c5ab3-b3d3-4b5b-bc64-8b30c220ac92@csgroup.eu>
Date: Sat, 4 Oct 2025 08:19:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Leon Romanovsky <leonro@nvidia.com>, Andreas Larsson <andreas@gaisler.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, Geoff Levand <geoff@infradead.org>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 Magnus Lindholm <linmag7@gmail.com>
References: <cover.1759071169.git.leon@kernel.org>
 <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
 <20251003163505.GI3360665@nvidia.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251003163505.GI3360665@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 03/10/2025 à 18:35, Jason Gunthorpe a écrit :
> On Sun, Sep 28, 2025 at 06:02:24PM +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Adapt PowerPC DMA to use physical addresses in order to prepare code
>> to removal .map_page and .unmap_page.
>>
>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> ---
>>   arch/powerpc/include/asm/iommu.h         |  8 +++---
>>   arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
>>   arch/powerpc/kernel/iommu.c              | 14 +++++-----
>>   arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
>>   arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
>>   arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
>>   6 files changed, 60 insertions(+), 53 deletions(-)
> 
> I think this is good enough for PPC anything more looks quite hard

Can you tell what you have in mind ? What more would be interesting to 
do but looks hard ? Maybe it can be a follow-up change ?

Christophe

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason
> 


