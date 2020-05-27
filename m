Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBC61E3464
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 03:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgE0BG1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 21:06:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53104 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727852AbgE0BG0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 21:06:26 -0400
Received: from [10.20.42.25] (unknown [10.20.42.25])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2vlvM1eQnI5AA--.327S3;
        Wed, 27 May 2020 09:05:41 +0800 (CST)
Subject: Re: [PATCH v6 3/4] mm/memory.c: Add memory read privilege on page
 fault handling
To:     Andrew Morton <akpm@linux-foundation.org>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
 <1590375160-6997-3-git-send-email-maobibo@loongson.cn>
 <20200525144413.8c13559ec87616aa2c77af41@linux-foundation.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
From:   maobibo <maobibo@loongson.cn>
Message-ID: <4ca3c5b8-f695-c011-7e00-ef884a1c3d84@loongson.cn>
Date:   Wed, 27 May 2020 09:05:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200525144413.8c13559ec87616aa2c77af41@linux-foundation.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr2vlvM1eQnI5AA--.327S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1fWFykAF1kWFy7Cr1rJFb_yoW3JrbE9F
        43Ca93Can5Kr97XayrKw4aqF4fGFyFyw1vqrWUX3ZFyFy8t3yDWa1jkrZxCF18tr9Yyry7
        Arn0qa13Cr4avjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbaAYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
        jI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
        IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
        MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
        WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3
        Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
        UvcSsGvfC2KfnxnUUI43ZEXa7IU5q385UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/26/2020 05:44 AM, Andrew Morton wrote:
> On Mon, 25 May 2020 10:52:39 +0800 Bibo Mao <maobibo@loongson.cn> wrote:
> 
>> Here add pte_sw_mkyoung function to make page readable on MIPS
>> platform during page fault handling. This patch improves page
>> fault latency about 10% on my MIPS machine with lmbench
>> lat_pagefault case.
>>
>> It is noop function on other arches, there is no negative
>> influence on those architectures.
> 
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> 
> Should I take these, or would the mips tree be preferred?  I'm OK
> either way, but probably the MIPS tree would be better?
Thanks for reviewing again and again.
This patch is based on mips-next, maybe MIPS tree will be better.

