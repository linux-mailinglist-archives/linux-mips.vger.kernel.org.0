Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C0E3338FA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 10:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhCJJjs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 04:39:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56546 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232608AbhCJJjd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 04:39:33 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9fLk0hg37EXAA--.13060S3;
        Wed, 10 Mar 2021 17:39:24 +0800 (CST)
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     Marc Zyngier <maz@kernel.org>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-6-zhangqing@loongson.cn> <87wnugy9oe.wl-maz@kernel.org>
 <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
 <87blbrxsnw.wl-maz@kernel.org>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <bc15d18e-d535-5657-d485-7801623615a2@loongson.cn>
Date:   Wed, 10 Mar 2021 17:39:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <87blbrxsnw.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj9fLk0hg37EXAA--.13060S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY-7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
        IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
        5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeV
        CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2
        V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4I
        kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
        WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
        0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3
        JVWrJr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
        1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsTmhUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> I really don't care about whatever arbitrary limit people think there
> is. Please put it on a single line.
Hi,Marc

Thank you for your reply, I saw it
my $max_line_length = 100;
So already fixed it in v4:).

Thanks,
Qing
>
> Thanks,
>
> 	M.
>

