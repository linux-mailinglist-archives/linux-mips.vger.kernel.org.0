Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337C62B1725
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 09:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgKMIY7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 03:24:59 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:51321 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgKMIY7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 03:24:59 -0500
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id F0AD52008F;
        Fri, 13 Nov 2020 08:24:54 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 822F53ECD9;
        Fri, 13 Nov 2020 09:24:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 5B3D12A7E9;
        Fri, 13 Nov 2020 09:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1605255892;
        bh=lnbCuScKRwrdOM/77XgCl9+PwaukHhGgIbDHfOe0WTw=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=i4L/lGJPRPyL++5Nh48rnKc0U9ZTvGn7Q6crvxOJH2/K0CscEZHSjhBmcPkE42HjH
         NOyQypzVJqADt42bXhdv5NRfuuzEhGHSGL6zJ4xHXg8G5OQaA/0ZaMMOPKVZb6sqJ1
         WrpA11p2ezUXq5nPyaoB2xCjgFpxpWMER6kMJYzs=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lSSjkspKHywM; Fri, 13 Nov 2020 09:24:50 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 13 Nov 2020 09:24:50 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 246D4400D1;
        Fri, 13 Nov 2020 08:24:48 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="KQqeHeTN";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (unknown [113.52.132.216])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2580A41ECA;
        Fri, 13 Nov 2020 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1605255883;
        bh=lnbCuScKRwrdOM/77XgCl9+PwaukHhGgIbDHfOe0WTw=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=KQqeHeTNrDm/KpErz8k/Say8LAe40ubNv0RcYSGyUaiKdctL6Av1Q7hEcphV59Rng
         fmg+GoDafDa6jLlbXHnkf9jTZUM7+fPJT4DS5xLLewpxktbTpnjPnjxiZZXPXvL7nY
         3RUDVDTSpVOEIjTAPDugO/mW2B/QY+k6SGJXx+AY=
Date:   Fri, 13 Nov 2020 16:24:37 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH] MIPS: Loongson64: Add read_persistent_clock64()
User-Agent: K-9 Mail for Android
In-Reply-To: <bb0fbd42-07b2-397b-1a63-f7817a1a9d4b@loongson.cn>
References: <1605169793-10481-1-git-send-email-yangtiezhu@loongson.cn> <8d6ebfe2-e300-3f38-6316-196cba947d36@flygoat.com> <b84fe88b-7527-e88c-1efd-739f6d846518@flygoat.com> <6f0a7a43-4eac-65d8-61ff-778dc13f925c@loongson.cn> <1e01b317-b315-443c-a53b-db360ea17254@flygoat.com> <bb0fbd42-07b2-397b-1a63-f7817a1a9d4b@loongson.cn>
Message-ID: <C36B1D2E-5642-4399-9165-052EC1070D57@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 246D4400D1
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
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



=E4=BA=8E 2020=E5=B9=B411=E6=9C=8813=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=88=
11:41:01, Tiezhu Yang <yangtiezhu@loongson=2Ecn> =E5=86=99=E5=88=B0:
>On 11/13/2020 10:21 AM, Jiaxun Yang wrote:
>>
>>
>> =E5=9C=A8 2020/11/12 20:03, Tiezhu Yang =E5=86=99=E9=81=93:
>>> On 11/12/2020 06:09 PM, Jiaxun Yang wrote:
>>>>
>>>>
>>>> =E5=9C=A8 2020/11/12 18:04, Jiaxun Yang =E5=86=99=E9=81=93:
>>>>> Hi Tiezhu,
>>>>>
>>>>> =E5=9C=A8 2020/11/12 16:29, Tiezhu Yang =E5=86=99=E9=81=93:
>>>>>> Add read_persistent_clock64() to read the time from the battery=20
>>>>>> backed
>>>>>> persistent clock=2E With this patch, we can fix the wrong time issu=
e=20
>>>>>> due
>>>>>> to the system clock is not consistent with hardware clock after=20
>>>>>> resume
>>>>>> from sleep state S3 (suspend to RAM), at the same time, the system=
=20
>>>>>> time
>>>>>> can be right instead of "Thu Jan 1 08:00:00 CST 1970" without rtc=
=20
>>>>>> driver=2E
>>>>>>
>>>>>> start_kernel()
>>>>>>    timekeeping_init()
>>>>>>      read_persistent_wall_and_boot_offset()
>>>>>>        read_persistent_clock64()
>>>>>>
>>>>>> timekeeping_resume()
>>>>>>    read_persistent_clock64()
>>>>>>
>>>>>> timekeeping_suspend()
>>>>>>    read_persistent_clock64()
>>>>>
>>>>> It is highly discoraged to do anything with bridgetype, which isn't=
=20
>>>>> probed via
>>>>> devicetree=2E
>>>>>
>>>>> Please check if you can deal with that inside RTC framework, or=20
>>>>> make it as
>>>>> a part of RTC driver (e=2Eg=2E set up a callback)=2E
>>>>>
>>>>> Also you should submit RTC driver at first if you intend to=20
>>>>> complete LS7A support=2E
>>>>
>>>> Oops,
>>>> Just dig it deeper, I guess simply select RTC_HCTOSYS would solve=20
>>>> the issue=2E
>>>> We're trying very hard to decouple all the drivers and conponents,
>>>> DeviceTree for all!
>>>
>>> +cc WANG Xuerui <git@xen0n=2Ename>
>>>
>>> Hi Jiaxun,
>>>
>>> Thanks for your reply=2E
>>>
>>> Xuerui has already submitted the patch of LS7A rtc driver [1],
>>> but not yet been merged into the mainline kernel, I discussed
>>> with him early today=2E
>>>
>>> Do you mean that read_persistent_clock64() can call the function
>>> like rtc_read_time() defined in rtc driver?
>>
>> I do think select RTC_HCTOSYS after getting RTC driver applied can help=
=2E
>
>Yes, I agree=2E
>
>> What's your point to have read_persistent_clock64 for Loongson64?
>
>(1) Currently, the LS7A RTC driver has not been merged into the
>mainline kernel, read_persistent_clock64() is useful in the following
>call path:
>
>start_kernel()
>    timekeeping_init()
>      read_persistent_wall_and_boot_offset()
>        read_persistent_clock64()
>
>(2) When the LS7A RTC driver is merged into the mainline kernel
>some time later, if RTC_HCTOSYS and RTC_DRV_LS2X are not set,
>read_persistent_clock64() is also useful unless RTC_HCTOSYS
>and RTC_DRV_LS2X are set by default in Kconfig instead of
>loongson3_defconfig=2E
>
>So I think read_persistent_clock64() looks like a backup function=2E

Still can't understand why this kind of backup is necessary=2E
If you wish to help please help with the RTC driver=2E

Duplication is not the way we work=2E
Please try to learn common solutions, all others are doing so=2E

Thanks

- Jiaxun


>
>>
>> Thanks
>>
>> - Jiaxun
>>
>>>
>>> Thanks,
>>> Tiezhu
>>>
>>> [1]=20
>>> https://patchwork=2Ekernel=2Eorg/project/linux-mips/patch/202009230758=
45=2E360974-2-git@xen0n=2Ename/
>>>
>>>>
>>>>>
>>>>> Thanks=2E
>>>>>
>>>>> - Jiaxun
>>>>>
>>>>>>
>>>>>> Signed-off-by: Yinglu Yang <yangyinglu@loongson=2Ecn>
>>>>>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson=2Ecn>
>>>>>> ---
>>>>>>
