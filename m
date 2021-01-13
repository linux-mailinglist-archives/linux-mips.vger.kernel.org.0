Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E252F51A6
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 19:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbhAMSEU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 13:04:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2337 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbhAMSEU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Jan 2021 13:04:20 -0500
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.200])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DGFZm1SMRz67Zqr;
        Thu, 14 Jan 2021 01:59:44 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 13 Jan 2021 19:03:38 +0100
Received: from [10.47.0.70] (10.47.0.70) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 13 Jan
 2021 18:03:37 +0000
From:   John Garry <john.garry@huawei.com>
Subject: logical PIO code for mips question (was Re: [PATCH RESEND v3 3/3]
 MIPS: Loongson64: Enable PCI_IO_VMMAP)
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>
CC:     <chenhc@lemote.com>, <tsbogend@alpha.franken.de>
References: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-1-jiaxun.yang@flygoat.com>
 <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
Message-ID: <1a21eaf7-52c0-c032-4405-1b6916628ade@huawei.com>
Date:   Wed, 13 Jan 2021 18:02:28 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200508114438.3092215-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.0.70]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/05/2020 12:44, Jiaxun Yang wrote:

Replying to an old mail ...

> range->fwnode = &of_root->fwnode;
> +	range->size = MMIO_LOWER_RESERVED;
> +	range->hw_start = LOONGSON_PCIIO_BASE;
> +	range->flags = LOGIC_PIO_CPU_MMIO;
> +
> +	if (logic_pio_register_range(range)) {
> +		pr_err("Failed to reserve PIO range for legacy ISA\n");
> +		goto free_range;
> +	}

Hi Jiaxun,

> +
> +	if (WARN(range->io_start != 0,
> +			"Reserved PIO range does not start from 0\n"))

Do the mips code still rely on this check?

I was considering changing the logical PIO code to reserve the first 64K 
of PCI MMIO space, but making that change would break this code as 
things stand.

The motivation is that some drivers, like [0], access IO ports 
unconditionally and can kill systems when no PCI host exists. By 
reserving the first 64K, accesses by those drivers could nullified.

Thanks,
John

[0] 
https://lore.kernel.org/linux-input/20210112055129.7840-1-song.bao.hua@hisilicon.com/T/#t

> +		goto unregister;
> +
> +	/*
> +	 * i8259 would access I/O space, so mapping must be done here.
> +	 * Please remove it when all drivers can be managed by logic_pio.
> +	 */
> +	ioremap_page_range(PCI_IO_START, PCI_IO_START + MMIO_LOWER_RESERVED,
> +				LOONGSON_PCIIO_BASE,
> +				pgprot_device(PAGE_KERNEL));
> +
> +	return;
> +unregister:

