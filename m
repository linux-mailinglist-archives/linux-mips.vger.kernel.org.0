Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BCE2B8EEF
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 10:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgKSJbn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 04:31:43 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56604 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726826AbgKSJbm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 04:31:42 -0500
Received: from [10.130.0.170] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD9N4O7Zfz6kSAA--.38102S3;
        Thu, 19 Nov 2020 17:31:36 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: KASLR: Make relocation_address can be
 configured
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
 <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
 <7e6d428d-cf5d-e2ac-93fa-4996adc2defe@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <4c56a146-211d-e2ba-4a77-96680a6d39bc@loongson.cn>
Date:   Thu, 19 Nov 2020 17:31:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7e6d428d-cf5d-e2ac-93fa-4996adc2defe@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxD9N4O7Zfz6kSAA--.38102S3
X-Coremail-Antispam: 1UD129KBjvdXoWrWF4xtFyfCw1rXF18Cr4DJwb_yoWxWrXEg3
        W7WF1vgrs7Ga4xCr15G3yIqry7uayYva17Gry3JwnF9a40ya47tw18Gr1vvay5A3WUWFy5
        uayfuF1avr9FvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbIkYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
        6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
        9x07j4v3bUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 11/19/2020 04:06 PM, Sergei Shtylyov wrote:
> Hello!
>
> On 19.11.2020 5:29, Jinyang He wrote:
>
>> When CONFIG_RANDOMIZE_BASE is not set, determine_relocation_address()
>> always returns a constant. It is not friendly to users if the address
>> cannot be used. Make it can be configured at Kconfig.
>
>    Make it configurable?
Oh, yes. Sorry for the expression.
0xffffffff81000000 cannot be used on Loongson64 if CONFIG_RANDOMIZE_BASE 
is disabled.
It's lower than address of _end. It makes relocation_addr_valid() return 
0 always.

Thanks!
Jinyang

>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> [...]
>
> MBR, Sergei

