Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B589A368B1D
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 04:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbhDWCiK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 22:38:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39052 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230367AbhDWCiJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Apr 2021 22:38:09 -0400
Received: from [10.130.0.98] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX+_lMoJgS7EMAA--.5054S3;
        Fri, 23 Apr 2021 10:37:26 +0800 (CST)
Subject: Re: [PATCH] MIPS:DTS:Fix label name and interrupt number of ohci for
 Loongson-2K
To:     xiaochuan mao <maoxiaochuan@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <1053fddf-479a-6014-ca2c-110c19574f84@loongson.cn>
Date:   Fri, 23 Apr 2021 10:37:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxX+_lMoJgS7EMAA--.5054S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYS7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
        c7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I
        0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
        GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
        0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
        rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
        1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUyxRDUUUUU=
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 04/23/2021 09:52 AM, xiaochuan mao wrote:
> from Loongson-2K1000 user manual know that under pci bus
> the device num is 4, function number is 2 and register is 0x2200
> is ohci. the ohci interrupt number is 51. because Loongson-2K1000 has
> 64 interrupt sources, 0-31 correspond to the device tree liointc0 device
>   node, and the other correspond to liointc1 node. so it should be
> number 19 correspon to liointc1.
>
> Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
>
Hi, xiaozhuan


Thanks for the patch, this is my mistake.

Can you correct the GPL-3.0 of this file to GPL-2.0 by the way?

Thanks

-Qing

