Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FA632E641
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhCEKZC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:25:02 -0500
Received: from 9.mo178.mail-out.ovh.net ([46.105.75.45]:49152 "EHLO
        9.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCEKYs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 05:24:48 -0500
X-Greylist: delayed 156916 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 05:24:48 EST
Received: from player750.ha.ovh.net (unknown [10.108.35.122])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 23AE7C7091
        for <linux-mips@vger.kernel.org>; Fri,  5 Mar 2021 11:24:47 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player750.ha.ovh.net (Postfix) with ESMTPSA id E44FC1BA40728;
        Fri,  5 Mar 2021 10:24:36 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-95G001e4f3bde1-afa5-4127-9562-5a7b4f35abba,
                    4F7D11A3904BD8E553EC742B87CBB6774FEDAA0F) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH 2/2] nvmem: iomap: new driver exposing NVMEM accessible
 using I/O mapping
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
References: <20210304144132.24098-1-zajec5@gmail.com>
 <20210304144132.24098-2-zajec5@gmail.com>
 <047bced8-6c20-4a0a-c7ea-e0ad83318461@linaro.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <93708a21-3444-f68e-c834-a4f769a0acba@milecki.pl>
Date:   Fri, 5 Mar 2021 11:24:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <047bced8-6c20-4a0a-c7ea-e0ad83318461@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 499336608932138519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepkeduheejheffudefhffghfegjeejleetkeevueelveegkefhhfffieehleelgfevnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05.03.2021 11:02, Srinivas Kandagatla wrote:
> On 04/03/2021 14:41, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This is a generic NVMEM access method used e.g. by Broadcom for their
>> NVRAM on MIPS and Northstar devices.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   drivers/nvmem/Kconfig  |  7 +++
>>   drivers/nvmem/Makefile |  2 +
>>   drivers/nvmem/iomap.c  | 99 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 108 insertions(+)
>>   create mode 100644 drivers/nvmem/iomap.c
>>
>> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
>> index 75d2594c16e1..3d5c5684685d 100644
>> --- a/drivers/nvmem/Kconfig
>> +++ b/drivers/nvmem/Kconfig
>> @@ -278,4 +278,11 @@ config NVMEM_RMEM
>>         This driver can also be built as a module. If so, the module
>>         will be called nvmem-rmem.
>> +
>> +config NVMEM_IOMAP
>> +    tristate "I/O mapped NVMEM support"
>> +    depends on HAS_IOMEM
>> +    help
>> +      This driver supports NVMEM that can be accessed using I/O mapping.
>> +
>>   endif
>> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
>> index 5376b8e0dae5..88a3b6979c53 100644
>> --- a/drivers/nvmem/Makefile
>> +++ b/drivers/nvmem/Makefile
>> @@ -57,3 +57,5 @@ obj-$(CONFIG_SPRD_EFUSE)    += nvmem_sprd_efuse.o
>>   nvmem_sprd_efuse-y        := sprd-efuse.o
>>   obj-$(CONFIG_NVMEM_RMEM)     += nvmem-rmem.o
>>   nvmem-rmem-y            := rmem.o
>> +obj-$(CONFIG_NVMEM_IOMAP)    += nvmem_iomap.o
>> +nvmem_iomap-y            := iomap.o
>> diff --git a/drivers/nvmem/iomap.c b/drivers/nvmem/iomap.c
>> new file mode 100644
>> index 000000000000..ab6b40858a64
>> --- /dev/null
>> +++ b/drivers/nvmem/iomap.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/platform_device.h>
>> +
>> +struct iomap {
>> +    struct device *dev;
>> +    void __iomem *base;
>> +};
>> +
>> +static int iomap_read(void *context, unsigned int offset, void *val,
>> +              size_t bytes)
>> +{
>> +    struct iomap *priv = context;
>> +    u8 *src = priv->base + offset;
>> +    u8 *dst = val;
>> +    size_t tmp;
>> +
>> +    tmp = offset % 4;
>> +    memcpy_fromio(dst, src, tmp);
>> +    dst += tmp;
>> +    src += tmp;
>> +    bytes -= tmp;
>> +
>> +    tmp = rounddown(bytes, 4);
>> +    __ioread32_copy(dst, src, tmp / 4);
>> +    dst += tmp;
>> +    src += tmp;
>> +    bytes -= tmp;
>> +
>> +    memcpy_fromio(dst, src, bytes);
>> +
> 
> 
> You could just do this!
> 
>      while (bytes--)
>          *val++ = readb(priv->base + offset + i++);

Do you mean that as replacement for "memcpy_fromio" or the whole
function code?
The reason for using __ioread32_copy() was to improve reading
performance (using aligned 32 bit access where possible). I'm not sure
if that really matters?

P.S.
Please don't yell at me in every sentence :( Makes me a bit sad :(
