Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C690207280
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 13:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389307AbgFXLso (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 07:48:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58512 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388491AbgFXLso (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 07:48:44 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr96PPfNeWj9JAA--.553S3;
        Wed, 24 Jun 2020 19:48:32 +0800 (CST)
Subject: Re: [PATCH v3 00/14 RESEND] irqchip: Fix potential resource leaks
To:     Marc Zyngier <maz@kernel.org>
References: <1592984711-3130-1-git-send-email-yangtiezhu@loongson.cn>
 <e419a2acea6c1977eaef5d049d607749@kernel.org>
 <a10e0f68-7de8-8540-f27e-17fd52216977@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <73b80d45-1300-4dc3-a0d6-2333b79743b2@loongson.cn>
Date:   Wed, 24 Jun 2020 19:48:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a10e0f68-7de8-8540-f27e-17fd52216977@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr96PPfNeWj9JAA--.553S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4DtF4rJw1rAr4UJF1UWrg_yoWDJwb_uF
        4kCrykCw4DAF47Ca4xKay3ArW8X3s2qwn0q34rXr17J347XFZ8JaykKw4fZ3WfJF1xJ3sx
        Kr1Yva40v3yS9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
        z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYxBIdaVFxhVjvj
        DU0xZFpf9x0JUdxhLUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 05:02 PM, Tiezhu Yang wrote:
> On 06/24/2020 04:30 PM, Marc Zyngier wrote:
>> On 2020-06-24 08:44, Tiezhu Yang wrote:
>>> [git send-email failed due to too many commands,
>>>  so only cc the major related email and resend it,
>>>  sorry for that]
>>
>> This is becoming majorly annoying. Please fix your git setup
>> *before* dumping 57 emails for just 14 patches. You have done
>> the same thing yesterday, and I would hope you learned from your
>> mistakes.
>>
>> Also, do not repost a series more than once per week. You have
>> already exceeded your quota by quite a margin.
>
> I am very sorry for that.
> I will wait for some days to resend this patch series.

Hi Marc,

Since each patch of this series is independent, in order to avoid
git send-email failed, I prefer to resend each patch individually
and cc more related maintainer or supporter to review.

If you do not mind, I will resend each patch individually next week.
Sorry for the noisy and inconvenience.

>
>>
>>         M.

