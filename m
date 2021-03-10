Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08713338E9
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 10:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhCJJgg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 04:36:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55850 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230466AbhCJJgc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 04:36:32 -0500
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxidUUk0hgwLEXAA--.13580S3;
        Wed, 10 Mar 2021 17:36:21 +0800 (CST)
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Marc Zyngier <maz@kernel.org>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-6-zhangqing@loongson.cn> <87wnugy9oe.wl-maz@kernel.org>
 <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
 <16010cff-0fcb-ade6-1e0c-1a4dbb5a7b2f@gmail.com>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <3dbaad85-ea5a-56d7-41cb-2b8bf85bfdbc@loongson.cn>
Date:   Wed, 10 Mar 2021 17:36:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <16010cff-0fcb-ade6-1e0c-1a4dbb5a7b2f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxidUUk0hgwLEXAA--.13580S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY-7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
        CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
        x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6x
        CaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0S
        jxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
        IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
        MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
        WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWU
        JVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
        1UYxBIdaVFxhVjvjDU0xZFpf9x0JUsTmhUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/10/2021 04:47 PM, Sergei Shtylyov wrote:
> Hello!
>
>    The new line length limit is 100 chars. :-)

Hi,Sergei

Thank you for your reply, I saw it
my $max_line_length = 100;
Soalready fixed it in v4:).

Thanks,
Qing
>
>
> MBR, Sergei

