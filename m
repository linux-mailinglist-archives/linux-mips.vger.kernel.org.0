Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E4B1C2295
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 05:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgEBDdX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 23:33:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36864 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgEBDdW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 May 2020 23:33:22 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx32r36axeZjIvAA--.3S3;
        Sat, 02 May 2020 11:33:13 +0800 (CST)
Subject: Re: [PATCH] MIPS: tools: Show result for loongson3-llsc-check
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1588250184-18730-1-git-send-email-yangtiezhu@loongson.cn>
 <b53aef0a-2441-3c4b-ebf0-74d0203eeda0@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4b113657-5d79-4896-58f2-8d73d37dc892@loongson.cn>
Date:   Sat, 2 May 2020 11:33:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b53aef0a-2441-3c4b-ebf0-74d0203eeda0@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx32r36axeZjIvAA--.3S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw13WFWktF4DKrWxGrW7urg_yoW8GFy3pr
        90kayUGr4rWr95JFnagrW5GrySkrZxCF1DArZ2yF1UAr9rX3W3ZryfG3WFvanrAF1DG3WI
        9Fy8GFWUA3W8CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
        4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
        0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
        0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
        WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/01/2020 05:48 PM, Sergei Shtylyov wrote:
> Hello!
>
> On 30.04.2020 15:36, Tiezhu Yang wrote:
>
>> It is better to show the result before loongson3-llsc-check exit,
>> otherwise we can see nothing if the return status is EXIT_SUCCESS,
>> it seems confusing.
>>
>> E.g. without this patch:
>>
>> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
>> [loongson@localhost tools]$
>>
>> With this patch:
>>
>> [loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
>> loongson3-llsc-check returns success
>> [loongson@localhost tools]$
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   arch/mips/tools/loongson3-llsc-check.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/mips/tools/loongson3-llsc-check.c 
>> b/arch/mips/tools/loongson3-llsc-check.c
>> index 0ebddd0..facd016 100644
>> --- a/arch/mips/tools/loongson3-llsc-check.c
>> +++ b/arch/mips/tools/loongson3-llsc-check.c
>> @@ -303,5 +303,7 @@ int main(int argc, char *argv[])
>>   out_close:
>>       close(vmlinux_fd);
>>   out_ret:
>> +    fprintf(stdout, "loongson3-llsc-check %s\n",
>> +        status ? "returns failure" : "returns success");
>
>    Why not "loongson3-llsc-check returns %s\n"?

Hi Sergei,

Sorry for the late reply, thanks for your review, I will send v2.

Thanks,
Tiezhu Yang

>
>>       return status;
>>   }
>>
>
> MBR, Sergei

