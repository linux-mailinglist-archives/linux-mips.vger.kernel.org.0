Return-Path: <linux-mips+bounces-5280-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F39967F40
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 08:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34BA1F21A74
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 06:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9729C1547EE;
	Mon,  2 Sep 2024 06:19:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285714A611;
	Mon,  2 Sep 2024 06:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725257980; cv=none; b=Xndu++EaWJxCtMd55mFFFlYoytdjxTHjZ7hCywiam7HXcBposXpjum6UD19GpBGLdOnC6R5XYtBXSkjdiFu3shwhQ2Knl59mgnOH8k1N8OZj+Fl++CMGSabeskJMuyasD08Y5LvweNPKVTysxOS0N1y2Vn+HeExU92ksNtlIDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725257980; c=relaxed/simple;
	bh=67XBHzOk5D5qjbAgaxjj54HcSeehB3J7Kc4PFUNyQKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwfu891kicOMmitB5BzQtST+pAM5p/2z8eotA+D+exhMyx7k4f9Poh857fJ6qgsSTKwlznI8fTVSDvUwiUaagaTq7yfS05dhD7xLvMe8X8UFhk1q4H+o/rZNKe6xVgPODVCdI5oifooichf96NzGZKkAUGnS7Z8kf1Atz6J4u0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wxz9y3zggz9sSN;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oh9ReoBVOWjB; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wxz9y2zjLz9sSH;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50A268B76C;
	Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gAfIussLeGez; Mon,  2 Sep 2024 08:19:34 +0200 (CEST)
Received: from [192.168.234.158] (PO19952.IDSI0.si.c-s.fr [192.168.234.158])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B2F1A8B763;
	Mon,  2 Sep 2024 08:19:33 +0200 (CEST)
Message-ID: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
Date: Mon, 2 Sep 2024 08:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1725223574.git.osandov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Omar Sandoval <osandov@fb.com>
> 
> Hi,
> 
> I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> destination address is in userspace and x86 Supervisor Mode Access
> Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> renames a helper function so that its use in patch 2 makes more sense.
> If the rename is too intrusive, I can drop it.

The name of the function is "copy_to_kernel". If the destination is a 
user address, it is not a copy to kernel but a copy to user and you 
already have the function copy_to_user() for that. copy_to_user() 
properly handles SMAP.

Christophe


> 
> Thanks,
> Omar
> 
> Omar Sandoval (2):
>    mm: rename copy_from_kernel_nofault_allowed() to
>      copy_kernel_nofault_allowed()
>    mm: make copy_to_kernel_nofault() not fault on user addresses
> 
>   arch/arm/mm/fault.c         |  2 +-
>   arch/loongarch/mm/maccess.c |  2 +-
>   arch/mips/mm/maccess.c      |  2 +-
>   arch/parisc/lib/memcpy.c    |  2 +-
>   arch/powerpc/mm/maccess.c   |  2 +-
>   arch/um/kernel/maccess.c    |  2 +-
>   arch/x86/mm/maccess.c       |  4 ++--
>   include/linux/uaccess.h     |  2 +-
>   mm/maccess.c                | 10 ++++++----
>   9 files changed, 15 insertions(+), 13 deletions(-)
> 
> --
> 2.46.0
> 
> 

