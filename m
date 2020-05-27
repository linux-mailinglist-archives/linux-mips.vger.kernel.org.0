Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E381E35D7
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 04:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgE0Cqu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 22:46:50 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:37164 "EHLO
        mail-m975.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgE0Cqu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 22:46:50 -0400
X-Greylist: delayed 906 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 May 2020 22:46:48 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=BNEza
        90c9rHb4GPPlGnzAcd3ROqRnWYmmv4MpZD8lx0=; b=mgUTrkfi2X/SeH3LH+hyj
        e6vrWkhVxadSh3GyZEmyJjYmm4bxrBTKrdwUkfKwXjbh+pOBauGIkNobgv2UsBk7
        EosmrrVZ2tpCUipJ6IYPLKBHOIjHld+m9rMbzEpRChP/saw6oRPopkbk59EGcwjD
        bO7VuKsp68IcmVrVhg+mmA=
Received: from [172.20.10.2] (unknown [124.64.17.235])
        by smtp5 (Coremail) with SMTP id HdxpCgA3SlDz0M1esmokAQ--.63S2;
        Wed, 27 May 2020 10:31:29 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe()
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
References: <20200525033123.13114-1-yuanjunqing66@163.com>
 <20200525084234.GA5057@alpha.franken.de>
 <76f2c756-0ae4-83f5-becf-6f1b3319f6fd@163.com>
 <20200526130441.GB8487@alpha.franken.de>
From:   yuanjunqing <yuanjunqing66@163.com>
Message-ID: <802d9731-9ac9-6f97-fe6d-c815bdcc0684@163.com>
Date:   Wed, 27 May 2020 10:31:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526130441.GB8487@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: HdxpCgA3SlDz0M1esmokAQ--.63S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy3AFy5tFy7CrWrWryfWFg_yoW8WFyxp3
        yUC3Z5KF4qgFWjyr429wn5JrW5Kw4ktrW5uFs5tay3Xas8WFs3tF4Iqw4Y9F929r48GF4f
        KF1jqa4a9F43AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jGGQDUUUUU=
X-Originating-IP: [124.64.17.235]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/xtbBUQExXFaD7PbL0QAAso
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

yes, I will re-send email for this patch.

在 2020/5/26 下午9:04, Thomas Bogendoerfer 写道:
> On Tue, May 26, 2020 at 03:07:16PM +0800, yuanjunqing wrote:
>> 在 2020/5/25 下午4:42, Thomas Bogendoerfer 写道:
>>> On Mon, May 25, 2020 at 11:31:23AM +0800, YuanJunQing wrote:
>>>>  Register "a1" is unsaved in this function,
>>>>  when CONFIG_TRACE_IRQFLAGS is enabled,
>>>>  the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
>>>>  and this may change register "a1".
>>>>  The variment of register "a1" may send SIGFPE signal
>>>>  to task when call do_fpe(),and this may kill the task.
>>>>
>>>> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
>>>> ---
>>>>  arch/mips/kernel/genex.S | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>>>> index 8236fb291e3f..956a76429773 100644
>>>> --- a/arch/mips/kernel/genex.S
>>>> +++ b/arch/mips/kernel/genex.S
>>>> @@ -480,16 +480,18 @@ NESTED(nmi_handler, PT_SIZE, sp)
>>>>  	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
>>>>  	.set	mips1
>>>>  	SET_HARDFLOAT
>>>> -	cfc1	a1, fcr31
>>>> +	cfc1	s0, fcr31
>>>>  	.set	pop
>>>>  	CLI
>>>>  	TRACE_IRQS_OFF
>>>> +	move    a1,s0
>>>>  	.endm
>>> do we realy need to read fcr31 that early ? Wouldn't it work to
>>> just move the cfc1 below TRACE_IRQS_OFF ?
>>>
>>  yes, it can work when we just move the cfc1 below TRACE_IRQS_OFF,
>>  and the code is written as follows.
>>
>>  	CLI
>>  	TRACE_IRQS_OFF
>>  	.set	mips1
>>  	SET_HARDFLOAT
>> 	cfc1	a1, fcr31
>>  	.set	pop
>>        .endm
> good, could we do the same with _cfcmsa	a1, MSA_CSR in the msa case ?
>
> Thomas.
>

