Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDE9374DC9
	for <lists+linux-mips@lfdr.de>; Thu,  6 May 2021 05:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhEFDD1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 May 2021 23:03:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40866 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230495AbhEFDD0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 May 2021 23:03:26 -0400
Received: from [10.130.0.193] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_+4_XJNgzJASAA--.12190S3;
        Thu, 06 May 2021 11:02:24 +0800 (CST)
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args'
 undeclared under !SMP
To:     Jinyang He <hejinyang@loongson.cn>
References: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
 <c3d635ee-2478-c786-59fe-f630e4980a77@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Youling Tang <tangyouling@loongson.cn>
Message-ID: <1d9db325-0c3b-30a4-3501-f195591379ea@loongson.cn>
Date:   Thu, 6 May 2021 11:02:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c3d635ee-2478-c786-59fe-f630e4980a77@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_+4_XJNgzJASAA--.12190S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7KFW3CryDWw1fCw17Jrb_yoW8Zry5pF
        4rGa4UtFWFqr42yrWfZrn8Z34ru393XrW7Jay7C3s8Ka4DWr1UXFyxKF4UXF92vw43KFW8
        XFWagr1DAFnIkrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUUVHq5UUUUU==
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jinyang

On 05/06/2021 10:21 AM, Jinyang He wrote:
> On 05/06/2021 10:02 AM, Youling Tang wrote:
>
>> On the Loongson64 platform, if CONFIG_SMP is not set, the following 
>> build
>> error will occur:
>> arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' 
>> undeclared
>>
>> Because the definition and declaration of secondary_kexec_args are in 
>> the
>> CONFIG_SMP, the secondary_kexec_args variable should be used in 
>> CONFIG_SMP.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
>> ---
>>   arch/mips/loongson64/reset.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
>> index c97bfdc..758d5d2 100644
>> --- a/arch/mips/loongson64/reset.c
>> +++ b/arch/mips/loongson64/reset.c
>> @@ -126,11 +126,12 @@ static void loongson_kexec_shutdown(void)
>>       for_each_possible_cpu(cpu)
>>           if (!cpu_online(cpu))
>>               cpu_device_up(get_cpu_device(cpu));
>> +
>> +    secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>>   #endif
>>       kexec_args[0] = kexec_argc;
>>       kexec_args[1] = fw_arg1;
>>       kexec_args[2] = fw_arg2;
>> -    secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>>       memcpy((void *)fw_arg1, kexec_argv, KEXEC_ARGV_SIZE);
>>       memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>>   }
>> @@ -141,7 +142,9 @@ static void loongson_crash_shutdown(struct 
>> pt_regs *regs)
>>       kexec_args[0] = kdump_argc;
>>       kexec_args[1] = fw_arg1;
>>       kexec_args[2] = fw_arg2;
>> +#ifdef CONFIG_SMP
>>       secondary_kexec_args[0] = TO_UNCAC(0x3ff01000);
>> +#endif
>>       memcpy((void *)fw_arg1, kdump_argv, KEXEC_ARGV_SIZE);
>>       memcpy((void *)fw_arg2, kexec_envp, KEXEC_ENVP_SIZE);
>>   }
>
> Hi, Youling,
>
> The earlier fix is here,
> https://lkml.org/lkml/2021/4/30/874
>
Thank you for reminding me.

Thanks,
Youling.
> Thanks.

