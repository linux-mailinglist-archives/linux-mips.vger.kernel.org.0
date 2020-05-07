Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1491C868B
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 12:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbgEGKXQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 06:23:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46302 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbgEGKXQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 06:23:16 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH9+E4bNeQ6sxAA--.3S3;
        Thu, 07 May 2020 18:23:02 +0800 (CST)
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
To:     Huacai Chen <chenhc@lemote.com>,
        Christoph Hellwig <hch@infradead.org>
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
 <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn>
 <CAAhV-H7jX9uVwb+GnaKXHPBsBQY35YKccbDedLrmfp8-hveVfw@mail.gmail.com>
 <20200506144208.GD27643@infradead.org>
 <CAAhV-H4Mmu2LJx9crUTkOirH2RGr8XfHW7RCUmaT5T4mmYcaKg@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <940d5632-825b-510e-bc4d-1e8de22ccd60@loongson.cn>
Date:   Thu, 7 May 2020 18:23:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4Mmu2LJx9crUTkOirH2RGr8XfHW7RCUmaT5T4mmYcaKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxH9+E4bNeQ6sxAA--.3S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Xw1UCrWUCFyrXry5Jw1xGrg_yoW8Jr1rpa
        yYqa13JF4Dtr10k397Aw18Wr48Zw43Xr9xKrZ8KrWrZasYq3Z8trsxt3WvqF97XFWfGr1j
        vw42yFyIyF1Y9FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
        IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
        v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
        c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
        0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5sjjDU
        UUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/07/2020 09:41 AM, Huacai Chen wrote:
> Hi, Christoph,
>
> On Wed, May 6, 2020 at 10:44 PM Christoph Hellwig <hch@infradead.org> wrote:
>> On Wed, May 06, 2020 at 04:47:30PM +0800, Huacai Chen wrote:
>>>> For the above reasons, I think what you are concerned is not a
>>>> big deal.
>>> I don't think so, this is obviously a regression. If we can accept a
>>> regression of RS780E, why we still maintain Loongson-2EF rather than
>>> simply drop them?
>> While I much prefer to use the default, regression an otherwise
>> working platform seems like a bad idea.  I don't really know much
>> about the Loongson platforms, do they all boot using the same kernel
>> image?
> All Loongson-3 machines (with LS7A bridge or RS780 bridge) use the
> same kernel image.

Hi Christoph, Huacai and Jiaxun,

Thank you very much for your reviews and discussions.

If you agree to use the platform dependent implementation
of __phys_to_dma() and __dma_to_phys(), I will make a slight
modification based on the v4 patch [1] to put ls7a things
before rs780e things, and then send v7 as soon as possible.

If anyone has any objections, please let me know.

[1] https://lore.kernel.org/patchwork/patch/1220010/

Thanks,
Tiezhu Yang

