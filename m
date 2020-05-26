Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E211E1C1A
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 09:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgEZHWv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 03:22:51 -0400
Received: from mail-m972.mail.163.com ([123.126.97.2]:33580 "EHLO
        mail-m972.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgEZHWu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 03:22:50 -0400
X-Greylist: delayed 910 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 May 2020 03:22:50 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=bkSJj
        PRUKYUDwFkyPzThVgbKD1YuAi6I43MZcpH/s8I=; b=Vqh+9szHVRs6SKbD3K4o3
        O11U5YVtsRU8DxAs4N+AHZvRZvG2y1XxuOnULRU5qi0Hh82c2ESl7Ke/DZHYQZfu
        FInuwilB9rNwQOy1wgQcSWsRei6YoZcY3V6bEcPcRqEKjUGGy3oKyWO6kapcfqT3
        Rg4E0uJQYY3VZSNlFFFBoc=
Received: from [172.20.10.2] (unknown [124.64.17.235])
        by smtp2 (Coremail) with SMTP id GtxpCgAXauInwMxeX977Bg--.54S2;
        Tue, 26 May 2020 15:07:28 +0800 (CST)
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe()
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
References: <20200525033123.13114-1-yuanjunqing66@163.com>
 <20200525084234.GA5057@alpha.franken.de>
From:   yuanjunqing <yuanjunqing66@163.com>
Message-ID: <76f2c756-0ae4-83f5-becf-6f1b3319f6fd@163.com>
Date:   Tue, 26 May 2020 15:07:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525084234.GA5057@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: GtxpCgAXauInwMxeX977Bg--.54S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF1ruF4rtw4rJrWkXw4Utwb_yoW8Jw47p3
        y8C3Z5KF4qgrWjvrW7Cwn5GrW5Kw4kArWY9Fs5tay5X3WrXF4ktF4IqwsIgryq9r1kua1f
        KFyqg34j9FsxA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jN739UUUUU=
X-Originating-IP: [124.64.17.235]
X-CM-SenderInfo: h1xd0ypxqtx0rjwwqiywtou0bp/xtbBUQowXFaD7O3HBgABsj
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2020/5/25 下午4:42, Thomas Bogendoerfer 写道:
> On Mon, May 25, 2020 at 11:31:23AM +0800, YuanJunQing wrote:
>>  Register "a1" is unsaved in this function,
>>  when CONFIG_TRACE_IRQFLAGS is enabled,
>>  the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
>>  and this may change register "a1".
>>  The variment of register "a1" may send SIGFPE signal
>>  to task when call do_fpe(),and this may kill the task.
>>
>> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
>> ---
>>  arch/mips/kernel/genex.S | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
>> index 8236fb291e3f..956a76429773 100644
>> --- a/arch/mips/kernel/genex.S
>> +++ b/arch/mips/kernel/genex.S
>> @@ -480,16 +480,18 @@ NESTED(nmi_handler, PT_SIZE, sp)
>>  	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
>>  	.set	mips1
>>  	SET_HARDFLOAT
>> -	cfc1	a1, fcr31
>> +	cfc1	s0, fcr31
>>  	.set	pop
>>  	CLI
>>  	TRACE_IRQS_OFF
>> +	move    a1,s0
>>  	.endm
> do we realy need to read fcr31 that early ? Wouldn't it work to
> just move the cfc1 below TRACE_IRQS_OFF ?
>
> Thomas.


 yes, it can work when we just move the cfc1 below TRACE_IRQS_OFF,
 and the code is written as follows.

 	CLI
 	TRACE_IRQS_OFF
 	.set	mips1
 	SET_HARDFLOAT
	cfc1	a1, fcr31
 	.set	pop
       .endm


