Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C39460CD9
	for <lists+linux-mips@lfdr.de>; Mon, 29 Nov 2021 03:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343948AbhK2C5D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 21:57:03 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:28185 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239438AbhK2CzC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Nov 2021 21:55:02 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J2VF7406Dz8vgD;
        Mon, 29 Nov 2021 10:49:47 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 10:51:20 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 10:51:19 +0800
Message-ID: <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
Date:   Mon, 29 Nov 2021 10:51:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Content-Language: en-US
To:     <dennis@kernel.org>, <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC:     <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-ia64@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
        <sparclinux@vger.kernel.org>, <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Dennis and all maintainers, any comments about the changes, many thanks.

On 2021/11/21 17:35, Kefeng Wang wrote:
> When support page mapping percpu first chunk allocator on arm64, we
> found there are lots of duplicated codes in percpu embed/page first
> chunk allocator. This patchset is aimed to cleanup them and should
> no funciton change, only test on arm64.
>
> Kefeng Wang (4):
>    mm: percpu: Generalize percpu related config
>    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>    mm: percpu: Add generic pcpu_fc_alloc/free funciton
>    mm: percpu: Add generic pcpu_populate_pte() function
>
>   arch/arm64/Kconfig             |  20 +----
>   arch/ia64/Kconfig              |   9 +--
>   arch/mips/Kconfig              |  10 +--
>   arch/mips/mm/init.c            |  14 +---
>   arch/powerpc/Kconfig           |  17 +---
>   arch/powerpc/kernel/setup_64.c |  92 +--------------------
>   arch/riscv/Kconfig             |  10 +--
>   arch/sparc/Kconfig             |  12 +--
>   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>   arch/x86/Kconfig               |  17 +---
>   arch/x86/kernel/setup_percpu.c |  66 ++-------------
>   drivers/base/arch_numa.c       |  68 +---------------
>   include/linux/percpu.h         |  13 +--
>   mm/Kconfig                     |  12 +++
>   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>   15 files changed, 165 insertions(+), 443 deletions(-)
>
