Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B943A4F0E
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 08:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfIBGJO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 02:09:14 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50448 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725839AbfIBGJN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Sep 2019 02:09:13 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DA43FADD0A20B83956FB;
        Mon,  2 Sep 2019 14:09:09 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Sep 2019
 14:09:00 +0800
Subject: Re: [PATCH v2 7/9] sparc64: numa: check the node id consistently for
 sparc64
To:     David Miller <davem@davemloft.net>
CC:     <catalin.marinas@arm.com>, <will@kernel.org>, <mingo@redhat.com>,
        <bp@alien8.de>, <rth@twiddle.net>, <ink@jurassic.park.msu.ru>,
        <mattst88@gmail.com>, <benh@kernel.crashing.org>,
        <paulus@samba.org>, <mpe@ellerman.id.au>,
        <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
        <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>,
        <dalias@libc.org>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
        <jhogan@kernel.org>, <jiaxun.yang@flygoat.com>,
        <chenhc@lemote.com>, <akpm@linux-foundation.org>,
        <rppt@linux.ibm.com>, <anshuman.khandual@arm.com>,
        <tglx@linutronix.de>, <cai@lca.pw>, <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <hpa@zytor.com>, <x86@kernel.org>,
        <dave.hansen@linux.intel.com>, <luto@kernel.org>,
        <peterz@infradead.org>, <len.brown@intel.com>, <axboe@kernel.dk>,
        <dledford@redhat.com>, <jeffrey.t.kirsher@intel.com>,
        <linux-alpha@vger.kernel.org>, <nfont@linux.vnet.ibm.com>,
        <naveen.n.rao@linux.vnet.ibm.com>, <mwb@linux.vnet.ibm.com>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>,
        <linux-sh@vger.kernel.org>, <sparclinux@vger.kernel.org>,
        <tbogendoerfer@suse.de>, <linux-mips@vger.kernel.org>,
        <linuxarm@huawei.com>
References: <1567231103-13237-8-git-send-email-linyunsheng@huawei.com>
 <20190830.235337.570776316111294728.davem@davemloft.net>
 <0195eb73-99ae-fec2-3e11-2cb9e6677926@huawei.com>
 <20190831.130250.1236116087422472663.davem@davemloft.net>
From:   Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <1e128e33-427f-19a2-0e13-95a9c0656ab1@huawei.com>
Date:   Mon, 2 Sep 2019 14:08:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20190831.130250.1236116087422472663.davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2019/9/1 4:02, David Miller wrote:
> From: Yunsheng Lin <linyunsheng@huawei.com>
> Date: Sat, 31 Aug 2019 16:57:04 +0800
> 
>> Did you mean sparc64 system does not has ACPI, the device's node id will
>> not specified by ACPI, so the ACPI is unrelated here?
> 
> Yes, sparc64 never has and never will have ACPI.
> 
> This is also true for several other platforms where you have made this
> change.
> 
> The assumption of your entire patch set is that the semantics of the
> NUMA node ID are somehow completely defined by ACPI semantics.  Which
> is not true.

Thanks for pointing out.

The NUMA node id in sparc64 system is defined by DT semantics?

> 
> .
> 

