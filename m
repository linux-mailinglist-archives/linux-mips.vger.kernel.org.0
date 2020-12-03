Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B31B2CCDB7
	for <lists+linux-mips@lfdr.de>; Thu,  3 Dec 2020 05:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgLCED7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Dec 2020 23:03:59 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:41775 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgLCED7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Dec 2020 23:03:59 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 58F1D3EDFC;
        Thu,  3 Dec 2020 05:02:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 33C642A6DF;
        Thu,  3 Dec 2020 05:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1606968146;
        bh=5AOVofh/cYL9M8vfr9lXhPIqC4MxGZjG0Y11Wb5YJuc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EscHpXnFXgUlz2C6gFKb2jG8x1nLdIV9tPcWx9ta4prkzM7Wn8tlcj1u3PfmnUEqc
         xEA42sj3G8uTx3+maw1k3U03xdQ9mj0ueFKNX5+Ym1KI1uARpb3hPTKospmDIe8d5B
         wHw/bjQ6r+zI4ldS4ONUR1wadAeAJwjhj05PUuXc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pwv3MgamBQBZ; Thu,  3 Dec 2020 05:02:25 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Thu,  3 Dec 2020 05:02:25 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id CE84A41AAC;
        Thu,  3 Dec 2020 04:02:24 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="FvwmWehy";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1861-199.members.linode.com [172.105.207.199])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 33720400D5;
        Thu,  3 Dec 2020 04:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1606968136;
        bh=5AOVofh/cYL9M8vfr9lXhPIqC4MxGZjG0Y11Wb5YJuc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FvwmWehyRPkPtsk1b/BSNgvJQ+WecA82UiCSoHG/rFrdowx1m3d28vY9zYha+/kvz
         3E8oJ5MxEf4vKeS+FfViKHR6zwDSRsu94MAkwQOWZDYiKhAdlPZ+T/gh/25zY5hEZB
         MTe5veLJHJo1jVgh/u5oFuGVlH1QWtOxiKGsya1I=
Subject: Re: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when
 synci_step is zero
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
 <20201202103943.GA9065@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b6e97d2f-6d5a-1dbb-3701-b238709b7345@flygoat.com>
Date:   Thu, 3 Dec 2020 12:02:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201202103943.GA9065@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: CE84A41AAC
X-Spamd-Result: default: False [2.90 / 10.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.105.207.199:received];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/12/2 ÏÂÎç6:39, Thomas Bogendoerfer Ð´µÀ:
> On Wed, Dec 02, 2020 at 11:00:05AM +0800, Jinyang He wrote:
>> Reading synci_step by using rdhwr instruction may return zero if no cache
>> need be synchronized. On the one hand, to make sure all load operation and
>> store operation finished we do __sync() for every platform. On the other
>> hand, some platform need operate synci one time although step is zero.
> Should this be someting like: Avoid endless loop, if no synci is needed ?
>
>> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
>> index 57bdd276..47aeb33 100644
>> --- a/arch/mips/kernel/relocate.c
>> +++ b/arch/mips/kernel/relocate.c
>> @@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
>>   			: "r" (kbase));
>>   
>>   		kbase += step;
>> -	} while (kbase < kend);
>> +	} while (step && kbase < kend);
> why not do a
>
> 	if (step == 0)
> 		return;
>
> before entering the loop ? According to MIPS32PRA no synci is needed,
> if stepi value is zero.
>
> Thomas.
>
> PS: Does anybody know a reason, why this code doesn't use an old fashioned
> dache/icache flushing, which might be slower but would work also on
> legecy cores ?

I thought that's because legacy flush requires much more cares.
You'll have to probe cache ways sets and line size to do so.
However relocation happens very early, even before cache probe.

Thanks.

- Jiaxun
