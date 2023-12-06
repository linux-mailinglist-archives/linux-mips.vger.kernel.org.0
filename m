Return-Path: <linux-mips+bounces-565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 273AC807694
	for <lists+linux-mips@lfdr.de>; Wed,  6 Dec 2023 18:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D37061F2109E
	for <lists+linux-mips@lfdr.de>; Wed,  6 Dec 2023 17:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C889463DF8;
	Wed,  6 Dec 2023 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IBkeXZF1"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9311711F;
	Wed,  6 Dec 2023 09:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=zaZMCfpXWHDewSKfYQmdUR7glYYV0yHmqBv04S10bVk=; b=IBkeXZF15BDRNRFf9NMuJ/0yUO
	qdy1IhDZ+H3egZn8hxUb4s5eJuCWOyvPy80Y9UjXaKMONiMfQIu3NePzrtpjUqCgs+hD/exMKD6Hu
	+feC0hk4/mH+e2Id1sCR4ptvm40J8VJzdyWqrqCTLb8V+ZCMPSLzob5atCI3TK57Q0h7ErbsRhUOB
	vydFCGEL2ZvQilLozlkxSW6Fifv/icDIdrQuD42COGiA3wwr/ILWWu80gLENtHg9DGQcHdMS6pN+N
	kFH6JFsPFSaMgjSXucdcDxj90cy0IwcRAWcDOihSDLq/VP8mj9ei7Bwekh39zBp/M+u0F/VtycciH
	2zBD6xZw==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvew-00Astm-1O;
	Wed, 06 Dec 2023 17:26:06 +0000
Message-ID: <c10194f2-097f-4455-9932-19961edbf990@infradead.org>
Date: Wed, 6 Dec 2023 09:26:06 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pm.c:undefined reference to `i8042_command'
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nicolas Schier <nicolas@fjasle.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mips@vger.kernel.org
References: <202312041909.lwhcU35R-lkp@intel.com>
 <5f1caaf8-1edf-444a-b017-c4d08e52213b@infradead.org>
 <f712a65b-4984-46e8-bd43-1309b5cd41f0@app.fastmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f712a65b-4984-46e8-bd43-1309b5cd41f0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/5/23 22:52, Arnd Bergmann wrote:
> On Wed, Dec 6, 2023, at 06:24, Randy Dunlap wrote:
>>> All errors (new ones prefixed by >>):
>>>
>>>    mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `setup_wakeup_events':
>>>>> pm.c:(.text+0x118): undefined reference to `i8042_command'
>>>>> mips64el-linux-ld: pm.c:(.text+0x154): undefined reference to `i8042_command'
>>
>>
>> How do we feel about this?
>> I suppose that an ARCH or mach or board should know what it requires.
>>
>>
>> ---
>>  arch/mips/loongson2ef/Kconfig |    3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff -- a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
>> --- a/arch/mips/loongson2ef/Kconfig
>> +++ b/arch/mips/loongson2ef/Kconfig
>> @@ -40,6 +40,9 @@ config LEMOTE_MACH2F
>>  	select ARCH_HAS_PHYS_TO_DMA
>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>>  	select ARCH_MIGHT_HAVE_PC_SERIO
>> +	select INPUT
>> +	select SERIO
>> +	select SERIO_I8042
>>  	select BOARD_SCACHE
>>  	select BOOT_ELF32
> 
> I think it's bad style to force-select an optional subsystem.
> How about making the entire file optional? It seems that there
> are already __weak functions in its place.

Yes, I agree in general.

Hopefully the maintainer will opine your suggestion.
Jiaxun?

Thanks.

> 
> --- a/arch/mips/loongson2ef/lemote-2f/Makefile
> +++ b/arch/mips/loongson2ef/lemote-2f/Makefile
> @@ -8,5 +8,6 @@ obj-y += clock.o machtype.o irq.o reset.o dma.o ec_kb3310b.o
>  #
>  # Suspend Support
>  #
> -
> +ifdef CONFIG_SERIO_I8042
>  obj-$(CONFIG_SUSPEND) += pm.o
> +endif
> 
>      Arnd

-- 
~Randy

