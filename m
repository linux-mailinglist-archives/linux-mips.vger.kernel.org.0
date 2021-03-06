Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C472932F90C
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 09:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCFI5q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 03:57:46 -0500
Received: from mail.loongson.cn ([114.242.206.163]:60722 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229626AbhCFI5p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 03:57:45 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGdX6Q0NgT0UVAA--.9869S3;
        Sat, 06 Mar 2021 16:57:31 +0800 (CST)
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <dc1a1651-59be-aaae-67cb-4734b4e54b5c@loongson.cn>
Date:   Sat, 6 Mar 2021 16:57:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210306080337.GC4744@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxGdX6Q0NgT0UVAA--.9869S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4rGr4fJFW8Cr13ZFW5ZFb_yoW3Grc_ua
        sFyr4xWw18Xw17J342qrnFyrWIqrW8Xas3ArZ0grn0v3yFvF9xCFWDt34fGr4S9w4DXrn3
        urs5Gw12kwna9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkI
        ecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
        Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE
        14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyT
        uYvjxU4RRRDUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 03/06/2021 04:03 PM, Thomas Bogendoerfer wrote:
> as you are already touching mach-loongson64 files...
>
> Is there a chance you clean up that up even further ? My goal is to
> have only files in mach-<platform> files, which have an mach-generic
> counterpart. Everything else should go to its own directory. So in
> case of loongson something
>
> like
>
> arch/mips/include/asm/loongson		for common stuff
> arch/mips/include/asm/loongson/32
> arch/mips/include/asm/loongson/64
>
> Comments ?

Hi,Thomas

I am very interested in cleaning up.
Can you merge these two patches first?
Submitting the remaining patches after other clean-up work is completed,
it seems that the impact will not be significant.

Thanks
Qing

>
> Thomas.

