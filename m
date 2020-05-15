Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1927C1D48EF
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgEOI6j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:58:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49776 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727050AbgEOI6j (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:58:39 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL9+4Wb5eaA41AA--.11S3;
        Fri, 15 May 2020 16:58:33 +0800 (CST)
Subject: Re: [PATCH 1/2] MIPS: Loongson: Fix fatal error during GPU init
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1589508901-18077-1-git-send-email-yangtiezhu@loongson.cn>
 <1264becb-44aa-9e29-4e67-d1b5fbc0b56c@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <9472816e-f97f-349b-2f7c-6c6c636f5fec@loongson.cn>
Date:   Fri, 15 May 2020 16:58:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1264becb-44aa-9e29-4e67-d1b5fbc0b56c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxL9+4Wb5eaA41AA--.11S3
X-Coremail-Antispam: 1UD129KBjvJXoWrZry5Zw45ur18uF1xJFy7KFg_yoW8Jry5pF
        W5Gan3KrWkJrZ5Kasrt3y7u34Y9an5XFy5Cw40kr1xCrsxur1kA3yUXw4DCFW8Gr4xKa4I
        yFZ7G34F93WDZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r4j6F4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkrcfUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/15/2020 04:51 PM, Sergei Shtylyov wrote:
> Hello!
>
> On 15.05.2020 5:15, Tiezhu Yang wrote:
>
>> When ATI Radeon graphics card has been compiled directly into the kernel
>                                ^ driver

Hi Sergei,

Thanks for your review, I have been sent v2 with the updated commit message:
https://lore.kernel.org/patchwork/patch/1242218/

Thanks,
Tiezhu Yang

>
>> instead of as a module, we should make sure the firmware for the model
>> (check available ones in /lib/firmware/radeon) is built-in to the kernel
>> as well, otherwise there exists the following fatal error during GPU 
>> init,
>> change CONFIG_DRM_RADEON=y to CONFIG_DRM_RADEON=m to fix it.
>>
>> [    1.900997] [drm] Loading RS780 Microcode
>> [    1.905077] radeon 0000:01:05.0: Direct firmware load for 
>> radeon/RS780_pfp.bin failed with error -2
>> [    1.914140] r600_cp: Failed to load firmware "radeon/RS780_pfp.bin"
>> [    1.920405] [drm:r600_init] *ERROR* Failed to load firmware!
>> [    1.926069] radeon 0000:01:05.0: Fatal error during GPU init
>> [    1.931729] [drm] radeon: finishing device.
>>
>> Fixes: 024e6a8b5bb1 ("MIPS: Loongson: Add a Loongson-3 default config 
>> file")
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> [...]
>
> MBR, Sergei

