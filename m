Return-Path: <linux-mips+bounces-6799-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE2F9D8F42
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2024 00:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56763281E0C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 23:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF21196D9D;
	Mon, 25 Nov 2024 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="GXio01ht"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E3195985
	for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732578162; cv=none; b=UEahrZ/wkZh6yoMC3ExiOi10DwoC5KPrkzYPZF9HfqNrTKM8MmJBbQghZgAAjFIr6Gvdau2qxP+eTm3fv3d86ZyJlvtODAwbe9iOzXI7IxvsebTdoucH8lUKcOcKxqXwmiVLBzTYepgLCX7yR0jRJYr7x8FQSLoEGndUlg1Zm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732578162; c=relaxed/simple;
	bh=zgIoM2cQCqvG8J1zUjANPmHbeDMqdfjQm6lIEkAVUz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=odPDVryPRpEGh+tbAcYDbFcxjLKsyQ42DxZO7GOxdWGgT4MoyPZ1im57XhOSTqgw5mB1xxOqfsqFHbadtUh5Gn40htr2ppYDYSoZfCLgZtfRA6t5bU46Og806C7zK0LsrnlTwumBfZelWC84XugDCFpRAY5toVjCvuN9Ku+F5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=GXio01ht; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BACAB2C02E1;
	Tue, 26 Nov 2024 12:42:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1732578151;
	bh=mUKJmR0JfGbxBM7LBtbbbcz8JTQTr4Xcl4ZgJ53UcJo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GXio01htU7WUyfJOT7hGon3sHr+vwb/kEYethhgFK9cn7SElGR61+g9pdixJU6V6R
	 0fYzxlNHWqn/+9V2feck3vxXTVJ3AG+/pglFfkdnaXvld0EDRGJlLgMKLdHVZijNsq
	 DkvNsJSelKnWXdbVBFXJJFhEAz1b/hYvQlA7H51FDMUyZAhKZEJCoyXFW/vmF2b5P1
	 dHbmXwTaXWFS7JzGWsV/wYuJRQjZZWSboPAXYWVudXIrCeMiL37NxIbU23qMfRD7RY
	 yhl8TSPaYQBXtQEZaRYaaM15UV/DXQVmNFeQMk6LHZh/0MA73hwNp3swFpmE83t/xP
	 RYYH9rXsNeWoA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67450b670000>; Tue, 26 Nov 2024 12:42:31 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9B1C313EDFA;
	Tue, 26 Nov 2024 12:42:31 +1300 (NZDT)
Message-ID: <66daf1a8-efb7-4fef-92cd-eb680c7832fa@alliedtelesis.co.nz>
Date: Tue, 26 Nov 2024 12:42:31 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] [MIPS] Place __kernel_entry at the beginning of text
 section
To: Rong Xu <xur@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Klara Modin <klarasmodin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicolas Schier <nicolas@fjasle.eu>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241125230953.3090508-1-xur@google.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20241125230953.3090508-1-xur@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gam0nhXL c=1 sm=1 tr=0 ts=67450b67 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=1XWaLZrsAAAA:8 a=3W2ps74RiJH85kM3-o0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mSD0U8-EzHfD161T-4u9:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 26/11/24 12:09, Rong Xu wrote:
> Mark __kernel_entry as ".head.text" and place HEAD_TEXT before
> TEXT_TEXT in the linker script. This ensures that __kernel_entry
> will be placed at the beginning of text section.
>
> Drop mips from scripts/head-object-list.txt.
>
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Works for me on my RTL9302C based board

Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

> ---
>   arch/mips/kernel/head.S        | 1 +
>   arch/mips/kernel/vmlinux.lds.S | 1 +
>   scripts/head-object-list.txt   | 1 -
>   3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
> index e90695b2b60e..6d5fc498c6f9 100644
> --- a/arch/mips/kernel/head.S
> +++ b/arch/mips/kernel/head.S
> @@ -26,6 +26,7 @@
>   
>   #include <kernel-entry-init.h>
>   
> +	__HEAD

I'm not and expert on any of this but... should this go below the 
setup_c0_status_* macros (just before the CONFIG_NO_EXCEPT_FILL) line? I 
don't think it makes any actual difference but as a reader it feels more 
logical that the __HEAD annotation is applying to the .fill and 
__kernel_entry.

>   	/*
>   	 * For the moment disable interrupts, mark the kernel mode and
>   	 * set ST0_KX so that the CPU does not spit fire when using
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index d575f945d422..c9c1ba85ac7b 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -62,6 +62,7 @@ SECTIONS
>   	_text = .;	/* Text and read-only data */
>   	_stext = .;
>   	.text : {
> +		HEAD_TEXT
>   		TEXT_TEXT
>   		SCHED_TEXT
>   		LOCK_TEXT
> diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
> index fd5d00bac447..f12b4a7b8406 100644
> --- a/scripts/head-object-list.txt
> +++ b/scripts/head-object-list.txt
> @@ -23,7 +23,6 @@ arch/m68k/coldfire/head.o
>   arch/m68k/kernel/head.o
>   arch/m68k/kernel/sun3-head.o
>   arch/microblaze/kernel/head.o
> -arch/mips/kernel/head.o
>   arch/nios2/kernel/head.o
>   arch/openrisc/kernel/head.o
>   arch/parisc/kernel/head.o
>
> base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927

