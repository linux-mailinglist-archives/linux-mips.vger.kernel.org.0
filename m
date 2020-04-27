Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BFB1BA197
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 12:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgD0Knw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 06:43:52 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2111 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726537AbgD0Knv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 27 Apr 2020 06:43:51 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 1A5E68E417FCE3EC8A7D;
        Mon, 27 Apr 2020 11:43:50 +0100 (IST)
Received: from [127.0.0.1] (10.210.170.137) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 27 Apr
 2020 11:43:47 +0100
Subject: Re: [PATCH 3/4] lib: logic_pio: Introduce MMIO_LOWER_RESERVED
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wei Xu <xuwei5@hisilicon.com>, <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Linuxarm <linuxarm@huawei.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh@kernel.org>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200426114806.1176629-4-jiaxun.yang@flygoat.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <e84f4146-b44f-b009-0dc4-876aa551f44f@huawei.com>
Date:   Mon, 27 Apr 2020 11:43:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200426114806.1176629-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.170.137]
X-ClientProxiedBy: lhreml722-chm.china.huawei.com (10.201.108.73) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 26/04/2020 12:47, Jiaxun Yang wrote:
> That would allow platforms reserve some lower address in PIO MMIO range
> to deal with legacy drivers with hardcoded I/O ports that can't be
> managed by logic_pio.

Hi,

Is there some reason why the logic_pio code cannot be improved to handle 
these devices at these "fixed" addresses? Or do you have a plan to 
improve it? We already support fixed bus address devices in the INDIRECT 
IO region.

Carving out a region of IO space is less than ideal.

Thanks,
John

> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   lib/logic_pio.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/logic_pio.c b/lib/logic_pio.c
> index f511a99bb389..57fff1cb7063 100644
> --- a/lib/logic_pio.c
> +++ b/lib/logic_pio.c
> @@ -20,6 +20,10 @@
>   static LIST_HEAD(io_range_list);
>   static DEFINE_MUTEX(io_range_mutex);
>   
> +#ifndef MMIO_LOWER_RESERVED
> +#define MMIO_LOWER_RESERVED	0
> +#endif
> +
>   /* Consider a kernel general helper for this */
>   #define in_range(b, first, len)        ((b) >= (first) && (b) < (first) + (len))
>   
> @@ -36,7 +40,7 @@ int logic_pio_register_range(struct logic_pio_hwaddr *new_range)
>   	struct logic_pio_hwaddr *range;
>   	resource_size_t start;
>   	resource_size_t end;
> -	resource_size_t mmio_end = 0;
> +	resource_size_t mmio_end = MMIO_LOWER_RESERVED;
>   	resource_size_t iio_sz = MMIO_UPPER_LIMIT;
>   	int ret = 0;
>   
> 

