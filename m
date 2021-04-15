Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1EA35FF28
	for <lists+linux-mips@lfdr.de>; Thu, 15 Apr 2021 03:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhDOBPa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Apr 2021 21:15:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49304 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229436AbhDOBP3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 14 Apr 2021 21:15:29 -0400
Received: from [10.130.0.98] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxicmSk3dgUhwIAA--.15079S3;
        Thu, 15 Apr 2021 09:14:58 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Add Loongson-2K1000 reset support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>
References: <20210414012622.23610-1-zhangqing@loongson.cn>
 <3947384b-37dd-436a-8cda-2391e49a94d2@www.fastmail.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <daae5221-79e8-4787-8f92-61d0ec2cb46b@loongson.cn>
Date:   Thu, 15 Apr 2021 09:14:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3947384b-37dd-436a-8cda-2391e49a94d2@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9CxicmSk3dgUhwIAA--.15079S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYs7k0a2IF6F1UM7kC6x804xWl14x267AK
        xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
        A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
        6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F
        4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY
        62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
        C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0
        c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
        sGvfC2KfnxnUUI43ZEXa7xRtJ5rUUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 04/14/2021 08:17 PM, Jiaxun Yang wrote:
>
> On Wed, Apr 14, 2021, at 9:26 AM, Qing Zhang wrote:
>> Add power management register operations to support reboot and poweroff.
>>
>> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> No that's not what we intended to do.
> Please add a devicetree node for pm block.
Hi, jiaxun

Thanks for your reply, I will do it and send v2 .

-Qing

