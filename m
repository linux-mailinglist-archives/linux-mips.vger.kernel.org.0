Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 838E21992C7
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 11:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbgCaJ61 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 05:58:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35100 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729997AbgCaJ61 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 05:58:27 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxP+g6FINeEg8iAA--.70S3;
        Tue, 31 Mar 2020 17:58:19 +0800 (CST)
Subject: Re: [PATCH v2 2/3] MIPS: Loongson: Add DMA support for 7A1000
To:     Christoph Hellwig <hch@infradead.org>
References: <1584932355-3642-1-git-send-email-yangtiezhu@loongson.cn>
 <1584932355-3642-3-git-send-email-yangtiezhu@loongson.cn>
 <20200325132756.GA13750@infradead.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jianmin Lv <lvjianmin@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8ac84cd0-d6a5-6029-1c67-992399064f67@loongson.cn>
Date:   Tue, 31 Mar 2020 17:58:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200325132756.GA13750@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9AxP+g6FINeEg8iAA--.70S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4xuryftF4kZw1DAF4xZwb_yoW8Zw17pF
        10gr4fGr4qgr429397Zw4kXryrAFs8Cry5GrWDGr90kF90gr90y340ya1jga93Wr1kAw4x
        ZrWqgrWxZF15u3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
        1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
        14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
        IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUSsjbUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 03/25/2020 09:27 PM, Christoph Hellwig wrote:
> On Mon, Mar 23, 2020 at 10:59:14AM +0800, Tiezhu Yang wrote:
>> Implement __phys_to_dma() and __dma_to_phys() according to the
>> node id offset in the 7A1000 DMA route config register.
> Can you please try to just use the dma_pfn_offset field in struct device
> for all loongson platforms?  I'm pretty sure I asked for that last time
> around..

Hi Christoph,

In the current market, the most used bridge chip on the Loongson platform
are AMD RS780E and Loongson 7A1000, the AMD RS780E is already supported by
the mainline kernel.

If use the default implementation of __phys_to_dma() and __dma_to_phys()
in dma-direct.h when CONFIG_ARCH_HAS_PHYS_TO_DMA is not set, it works
well used with 7A1000 on the Loongson single-way and multi-way platform,
and also works well used with RS780E on the Loongson single-way platform,
but the DMA address will be wrong on the non-node0 used with RS780E on
the Loongson multi-way platform.

Just as the description in the code comment, the devices get node id from
40 bit of HyperTransport bus, so we extract 2 bit node id (bit 44~45) from
48 bit address space of Loongson CPU and embed it into HyperTransport bus
(bit 37-38), this operation can be done only at the software level used
with RS780E on the Loongson multi-way platform, because it has no hardware
function to translate address of node id, this is a hardware compatibility
problem.

Device
     |
     | DMA address
     |
Host Bridge
     |
     | HT bus address (40 bit)
     |
    CPU
     |
     | physical address (48 bit)
     |
    RAM

The Loongson 7A1000 has dma_node_id_offset field in the DMA route config
register, the hardware can use the dma_node_id_offset to translate address
of node id automatically, so we can get correct address when just use the
dma_pfn_offset field in struct device.

For the above reasons, in order to maintain downward compatibility to
support the AMD RS780E bridge chip, it is better to use the platform
dependent implementation of __phys_to_dma() and __dma_to_phys().

Thanks,

Tiezhu Yang

