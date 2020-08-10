Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F72240091
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 02:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbgHJA61 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 20:58:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726335AbgHJA61 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 9 Aug 2020 20:58:27 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMWlmzBfhZcGAA--.2846S3;
        Mon, 10 Aug 2020 08:58:14 +0800 (CST)
Subject: Re: [PATCH] gpu/drm: Remove TTM_PL_FLAG_WC of VRAM to fix
 writecombine issue for Loongson64
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1596871502-3432-1-git-send-email-yangtiezhu@loongson.cn>
 <20200808134147.GA5772@alpha.franken.de>
 <b7b16df1-d661-d59a-005b-da594ce9fc95@flygoat.com>
 <38857c24-25c4-cff3-569e-5bcb773bfae6@amd.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <fb68c6ee-d455-24a0-524e-9b8a5033becd@loongson.cn>
Date:   Mon, 10 Aug 2020 08:58:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <38857c24-25c4-cff3-569e-5bcb773bfae6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMWlmzBfhZcGAA--.2846S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyUur48Zw1DtrWrJw4DXFb_yoW8tF4kpF
        ZxKa1SgF4DJr4jyFnFqwn3XrWjkws5trW7Krn5CrWDu3sxtrnYgFyxKFWqvFWDur1fX3Wj
        vF47WFyrua4ruFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
        02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_
        GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        xUcPfHUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/09/2020 08:13 PM, Christian König wrote:
> Am 08.08.20 um 15:50 schrieb Jiaxun Yang:
>>
>>
>> 在 2020/8/8 下午9:41, Thomas Bogendoerfer 写道:
>>> On Sat, Aug 08, 2020 at 03:25:02PM +0800, Tiezhu Yang wrote:
>>>> Loongson processors have a writecombine issue that maybe failed to
>>>> write back framebuffer used with ATI Radeon or AMD GPU at times,
>>>> after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
>>>> mapping for MIPS"), there exists some errors such as blurred screen
>>>> and lockup, and so on.
>>>>
>>>> Remove the flag TTM_PL_FLAG_WC of VRAM to fix writecombine issue for
>>>> Loongson64 to work well with ATI Radeon or AMD GPU, and it has no any
>>>> influence on the other platforms.
>>> well it's not my call to take or reject this patch, but I already
>>> indicated it might be better to disable writecombine on the CPU
>>> detection side (or do you have other devices where writecombining
>>> works ?). Something like below will disbale it for all loongson64 CPUs.
>>> If you now find out where it works and where it doesn't, you can even
>>> reduce it to the required minium of affected CPUs.
>> Hi Tiezhu, Thomas,
>>
>> Yes, writecombine works well on LS7A's internal GPU....
>> And even works well with some AMD GPUs (in my case, RX550).
>
> In this case the patch is a clear NAK since you haven't root caused 
> the issue and are just working around it in a very questionable manner.
>
>>
>> Tiezhu, is it possible to investigate the issue deeper in Loongson?
>> Probably we just need to add some barrier to maintain the data 
>> coherency,
>> or disable writecombine for AMD GPU's command buffer and leave 
>> texture/frame
>> buffer wc accelerated.
>
> Have you moved any buffer to VRAM and forgot to add an HDP 
> flush/invalidate?
>
> The acceleration is not much of a problem, but if WC doesn't work in 
> general you need to disable it for the whole CPU and not for 
> individual drivers.

Hi Thomas, Jiaxun and Christian,

Thank you very much for your suggestions.

Actually, this patch is a temporary solution to just make it work well,
it is not a proper and final solution.

I understand your opinions, it will take some time to find the root cause.

Thanks,
Tiezhu

>
> Regards,
> Christian.
>
>>
>> Thanks.
>>
>> - Jiaxun

