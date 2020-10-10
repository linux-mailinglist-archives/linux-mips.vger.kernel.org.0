Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B7C28A473
	for <lists+linux-mips@lfdr.de>; Sun, 11 Oct 2020 01:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387494AbgJJXkP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 19:40:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35552 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727274AbgJJXkL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Oct 2020 19:40:11 -0400
Received: from [10.130.0.80] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmMVWRoJfAPobAA--.2986S3;
        Sun, 11 Oct 2020 07:40:06 +0800 (CST)
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add /proc/boardinfo
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
 <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
 <9f0e4f45-dc8b-8351-8a40-8a4b8a86940f@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <786f7ce7-a567-5d85-0946-bab36bbcf84a@loongson.cn>
Date:   Sun, 11 Oct 2020 07:40:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <9f0e4f45-dc8b-8351-8a40-8a4b8a86940f@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxmMVWRoJfAPobAA--.2986S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar43AFW5JFyfCF48AF1kZrb_yoW8WryxpF
        43ta1xCr1rJr17CFn7Wr1xurWSyrZ5WF1qkrsxZ397Cr90kFn3Xr1kuayv9Fn7ur4xGFyj
        qF4xKr43ua4j9aDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVWfMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JUFJP_UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/10/2020 04:01 PM, Jiaxun Yang wrote:
>
>
> 在 2020/10/9 下午6:57, Tiezhu Yang 写道:
>> Add /proc/boardinfo to get mainboard and BIOS info easily on the 
>> Loongson
>> platform, this is useful to point out the current used mainboard type 
>> and
>> BIOS version when there exists problems related with hardware or 
>> firmware.
>
> Hi Tiezhu,
>
> You're touching Kernel userspace API and I believe it should be 
> documented. Also linux-api list
> should be informed.

[RESEND due to the following reason:
Can not connect to recipient's server because of unstable
network or firewall filter. rcpt handle timeout,last handle
info: Host vger.kernel.org(23.128.96.18) command RCPT TO
respond timeout or disconnected]

Hi Jiaxun,

Thanks for your suggestion. I will do it as soon as possible and then 
send v2.

>
> Also I'd like to know if it's really useful for mainline kernel.
> For user who wants to check board information, dmidecode is already 
> useful enough.

There is no SMBIOS and dmidecode can see nothing on some machines, like 
this:
[root@linux loongson]# dmidecode
# dmidecode 2.12
# No SMBIOS nor DMI entry point found, sorry.

So I think it is useful.

Thanks,
Tiezhu Yang

>
> Thanks.
>
> - Jiaxun
>
>>
>> E.g. with this patch:
>>
>> [loongson@linux ~]$ cat /proc/boardinfo
>> Board Info
>> Manufacturer            : LEMOTE
>> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
>> Family                  : LOONGSON3
>>
>> BIOS Info
>> Vendor                  : Kunlun
>> Version                 : Kunlun-A1901-V4.1.3-20200414093938
>> ROM Size                : 4 KB
>> Release Date            : 2020-04-14
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>

