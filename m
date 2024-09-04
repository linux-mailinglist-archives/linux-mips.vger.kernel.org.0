Return-Path: <linux-mips+bounces-5325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062996B379
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 09:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0EE31F2668E
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 07:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C2F16E886;
	Wed,  4 Sep 2024 07:51:08 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDF155C96;
	Wed,  4 Sep 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725436268; cv=none; b=F4r2ouTk1QusKNucHqyuJjMF1h3S0JrSgouFRMThELWyh9EyFNY0xu/TpOEVnA0z0QbWxghGUpPdXJDrpwbo1XmPe4Z431TxULi1bMhPd1b4vtWcZ8SF6PVOf0MzH7t+x4hvkweTAG3uQxXKKhOKA0OGvOGkzOj5hDWULN2nuAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725436268; c=relaxed/simple;
	bh=VbH+uuzHIKkUDK9nfnyaqfHG1YqgtauHPGQsXtiUDDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYu2iUZH7AmCfLGdepGO3a0dC4688flXDFzRUBKbIIdedq1yvAH/bKc/qgfHYVb0zXLbHKnsLA+RA9fTLrIUye1XXUyUWpDxo7nqTK76OXaQ/R/faQFLPiXMRHNSmSgP0M9kvh+JosXBhLAee3cRvW1vIRKQGTo+7dfB74Unst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WzF6T6FRvz9sSC;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyT5AqoNw1ah; Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WzF6T53SRz9sS7;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7618B77A;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XVy8Rvp824KA; Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from [192.168.234.246] (unknown [192.168.234.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC5188B778;
	Wed,  4 Sep 2024 09:50:56 +0200 (CEST)
Message-ID: <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>
Date: Wed, 4 Sep 2024 09:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Gray <bgray@linux.ibm.com>,
 "Christopher M. Riedl" <cmr@bluescreens.de>
Cc: Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
 <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Omar Sandoval <osandov@fb.com>
> 
> I found that on x86, copy_to_kernel_nofault() still faults on addresses
> outside of the kernel address range (including NULL):
> 
>    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
>    # echo g > /proc/sysrq-trigger
>    ...
>    [15]kdb> mm 0 1234
>    [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
...
> 
> Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
> still faults. This is because with Supervisor Mode Access Prevention
> (SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
> address from kernel space _before_ checking faulthandler_disabled().
> 
> copy_from_kernel_nofault() avoids this by checking that the address is
> in the kernel before doing the actual memory access. Do the same in
> copy_to_kernel_nofault() so that we get an error as expected:
> 
>    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
>    # echo g > /proc/sysrq-trigger
>    ...
>    [17]kdb> mm 0 1234
>    kdb_putarea_size: Bad address 0x0
>    diag: -21: Invalid address
> 
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
>   mm/maccess.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/mm/maccess.c b/mm/maccess.c
> index 72e9c03ea37f..d67dee51a1cc 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
>          if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>                  align = (unsigned long)dst | (unsigned long)src;
> 
> +       if (!copy_kernel_nofault_allowed(dst, size))
> +               return -ERANGE;
> +
>          pagefault_disable();
>          if (!(align & 7))
>                  copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> --
> 2.46.0
> 

This patch leads to the following errors on ppc64le_defconfig:

[    2.423930][    T1] Running code patching self-tests ...
[    2.428912][    T1] code-patching: test failed at line 395
[    2.429085][    T1] code-patching: test failed at line 398
[    2.429561][    T1] code-patching: test failed at line 432
[    2.429679][    T1] code-patching: test failed at line 435

This seems to be linked to commit c28c15b6d28a ("powerpc/code-patching: 
Use temporary mm for Radix MMU"), copy_from_kernel_nofault_allowed() 
returns false for the patching area.

Christophe

