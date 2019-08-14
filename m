Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09CD88D53B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Aug 2019 15:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfHNNqD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Aug 2019 09:46:03 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:37184 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727273AbfHNNqC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Aug 2019 09:46:02 -0400
Received: from mxback3o.mail.yandex.net (mxback3o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1d])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id E82253C02E67;
        Wed, 14 Aug 2019 16:45:58 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback3o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id LVxQeHsYXj-jwwa6Xdl;
        Wed, 14 Aug 2019 16:45:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565790358;
        bh=whTeznAqepT8QGNDtHsc3E+ozXp6H4eCWdijgOHsZkc=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=nnJpJMmvGIKMgqoS3zcBH9HvV4qmwlIUr/BLlkMHWf9JNaPVnYyoeE4LTZuZaYs2Q
         VlD6xL5+EtEEjcab8kBiCY9OCnlVRErYvuNAWKvmZsCysdPPHNZ3B+ANH0ceXO2vIc
         r06HsigRtHz4yg1AQfuFPL8uGsEA9KLJgDmlOmuU=
Authentication-Results: mxback3o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id 8rfMhGMmeT-jrYu0V2O;
        Wed, 14 Aug 2019 16:45:56 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 3/7] MIPS: fw: Record prom memory
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        yasha.che3@gmail.com, aurelien@aurel32.net, sfr@canb.auug.org.au,
        matt.redfearn@mips.com, chenhc@lemote.com
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190808075013.4852-4-jiaxun.yang@flygoat.com>
 <20190814120340.oz4kh7cbv653s5rd@mobilestation>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1d77e652-6564-59c6-4d3f-b9b16f7f3722@flygoat.com>
Date:   Wed, 14 Aug 2019 21:45:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814120340.oz4kh7cbv653s5rd@mobilestation>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/14 下午8:03, Serge Semin wrote:
> On Thu, Aug 08, 2019 at 03:50:09PM +0800, Jiaxun Yang wrote:
>> boot_mem_map is nolonger exist so we need to maintain a list
>> of prom memory by ourselves.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   arch/mips/fw/arc/memory.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
>> index 429b7f8d2aeb..02e954b3700e 100644
>> --- a/arch/mips/fw/arc/memory.c
>> +++ b/arch/mips/fw/arc/memory.c
>> @@ -27,6 +27,11 @@
>>   
>>   #undef DEBUG
>>   
>> +#define MAX_PROM_MEM 5
>> +static phys_addr_t prom_mem_base[MAX_PROM_MEM] __initdata;
>> +static phys_addr_t prom_mem_size[MAX_PROM_MEM] __initdata;
>> +static unsigned int nr_prom_mem __initdata;
>> +
>>   /*
>>    * For ARC firmware memory functions the unit of meassuring memory is always
>>    * a 4k page of memory
>> @@ -129,6 +134,7 @@ void __init prom_meminit(void)
>>   	}
>>   #endif
>>   
>> +	nr_prom_mem = 0;
>>   	p = PROM_NULL_MDESC;
>>   	while ((p = ArcGetMemoryDescriptor(p))) {
>>   		unsigned long base, size;
>> @@ -139,6 +145,12 @@ void __init prom_meminit(void)
>>   		type = prom_memtype_classify(p->type);
>>   
>>   		add_memory_region(base, size, type);
>> +
>> +		if (type == BOOT_MEM_ROM_DATA) {
>> +			prom_mem_base[nr_prom_mem] = base;
>> +			prom_mem_size[nr_prom_mem] = size;
>> +			nr_prom_mem++;
> Are you sure, that five prom-mem regions is enough? What about adding
> a sanity check here so no to exceed the array size?

Five should be enough, as far as I know yamon will only allocate one or two.

But you are right, add a sanity check would be better.

- Jiaxun

>
> -Sergey
>
>> +		}
>>   	}
>>   }
>>   
>> @@ -150,12 +162,8 @@ void __init prom_free_prom_memory(void)
>>   	if (prom_flags & PROM_FLAG_DONT_FREE_TEMP)
>>   		return;
>>   
>> -	for (i = 0; i < boot_mem_map.nr_map; i++) {
>> -		if (boot_mem_map.map[i].type != BOOT_MEM_ROM_DATA)
>> -			continue;
>> -
>> -		addr = boot_mem_map.map[i].addr;
>> +	for (i = 0; i < nr_prom_mem; i++) {
>>   		free_init_pages("prom memory",
>> -				addr, addr + boot_mem_map.map[i].size);
>> +			prom_mem_base[i], prom_mem_base[i] + prom_mem_size[i]);
>>   	}
>>   }
>> -- 
>> 2.22.0
>>
