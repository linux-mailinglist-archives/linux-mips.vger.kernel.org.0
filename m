Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7451F2552A5
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 03:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgH1Bmo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 21:42:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51042 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1Bmn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Aug 2020 21:42:43 -0400
Received: from [10.130.0.60] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxyMQNYUhf_8gOAA--.234S3;
        Fri, 28 Aug 2020 09:42:38 +0800 (CST)
Subject: Re: [PATCH] MIPS: CPU_P5600: Cleanup unused code
To:     Serge Semin <fancer.lancer@gmail.com>
References: <1598533517-13491-1-git-send-email-hejinyang@loongson.cn>
 <20200827152858.ug65tmemto5h76ob@mobilestation>
Cc:     linux-mips@vger.kernel.org
From:   Jinyang He <hejinyang@loongson.cn>
Message-ID: <6c7502c1-da92-79ae-6641-d637ccb76218@loongson.cn>
Date:   Fri, 28 Aug 2020 09:42:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200827152858.ug65tmemto5h76ob@mobilestation>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxyMQNYUhf_8gOAA--.234S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKw17XFWxJr17WF4ktryxKrg_yoWDAFX_Gw
        sIka18AFn3X3s3uFyDWrWFyr1qya4Uu34xZr9Ivryavw4fA3W7J3y5JF9xXrn8Ga12k3yr
        ZryrZry29FnxAjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x07brAp5UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 08/27/2020 11:28 PM, Serge Semin wrote:
> Hello Jinyang,
>
> Thanks for the patch. Although the commit message doesn't reflect the essence
> of the patch. Perhaps "mips: p5600: Discard UCA config selection" ?
I'll send v2 later. Thanks.
>
> On Thu, Aug 27, 2020 at 09:05:17PM +0800, Jinyang He wrote:
>> $ grep "CPU_SUPPORTS_UNCACHED_ACCELERATED" -nR
>> arch/mips/Kconfig:1591:	select \
>> CPU_SUPPORTS_UNCACHED_ACCELERATED
>>
>> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
>> ---
>>   arch/mips/Kconfig | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index 99220e7..6ee4488 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -1589,7 +1589,6 @@ config CPU_P5600
>>   	select CPU_SUPPORTS_32BIT_KERNEL
>>   	select CPU_SUPPORTS_HIGHMEM
>>   	select CPU_SUPPORTS_MSA
>> -	select CPU_SUPPORTS_UNCACHED_ACCELERATED
>>   	select CPU_SUPPORTS_CPUFREQ
>>   	select CPU_MIPSR2_IRQ_VI
>>   	select CPU_MIPSR2_IRQ_EI
>> -- 
>> 2.1.0
>>

