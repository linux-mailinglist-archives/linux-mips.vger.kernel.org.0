Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EAF32F8C2
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 08:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCFH0V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 02:26:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45038 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229714AbhCFHZv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 02:25:51 -0500
Received: from localhost.localdomain (unknown [10.180.13.54])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3_F2LkNg_ToVAA--.10095S3;
        Sat, 06 Mar 2021 15:25:43 +0800 (CST)
Subject: Re: [PATCH v3 3/7] MIPS: Loongson64: Add support for the 2K1000 to
 get cpu_clock_freq
To:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
 <20210306023633.9579-4-zhangqing@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Ming Wang <wangming01@loongson.cn>
Message-ID: <1d018326-7ba3-725b-7b58-ee5ac6dc010d@loongson.cn>
Date:   Sat, 6 Mar 2021 15:25:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210306023633.9579-4-zhangqing@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx3_F2LkNg_ToVAA--.10095S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYP7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
        IEc7CjxVAFwI0_GcCE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAa
        Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4
        A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0
        II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2
        Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
        6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
        vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
        42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbYhF7UUUUU==
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/06/2021 10:36 AM, Qing Zhang wrote:

> Get the fixed-clock from the CPU0 node of the device tree.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Tested-by: Ming Wang <wangming01@loongson.cn>

Thanks,
Ming

