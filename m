Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA32223D346
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 22:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgHEUt6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 16:49:58 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:59095 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgHEUt5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Aug 2020 16:49:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1063297|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.100094-0.014619-0.885287;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03268;MF=zhouyu@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.ID03Ai1_1596660592;
Received: from 192.168.10.205(mailfrom:zhouyu@wanyeetech.com fp:SMTPD_---.ID03Ai1_1596660592)
          by smtp.aliyun-inc.com(10.147.41.121);
          Thu, 06 Aug 2020 04:49:53 +0800
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Maciej W. Rozycki" <macro@wdc.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
References: <20200731041018.1381642-1-jiaxun.yang@flygoat.com>
 <20200731061702.fxdfyxpvd6qrhoql@mobilestation>
 <alpine.LFD.2.21.2008022213500.24175@redsun52.ssa.fujisawa.hgst.com>
 <ceb71bef-b3e6-68ce-df80-bcff92085e66@flygoat.com>
From:   Zhou Yanjie <zhouyu@wanyeetech.com>
Message-ID: <ca13783f-ec52-0e39-a408-2a01393fa22d@wanyeetech.com>
Date:   Thu, 6 Aug 2020 04:49:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <ceb71bef-b3e6-68ce-df80-bcff92085e66@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2020/8/3 下午5:01, Jiaxun Yang 写道:
>
>
> 在 2020/8/3 上午5:46, Maciej W. Rozycki 写道:
>> On Fri, 31 Jul 2020, Serge Semin wrote:
>>
>>>> Requested by downstream distros, a Kconfig option for default
>>>> IEEE754 conformance mode allows them to set their mode to
>>>> relaxed by default.
>>> That's what should have been here in the first place. Thanks!
>>   Well, originally plans were there to have NaN interlinking implemented
>> and no such mess or desire for hacks like one here would result.  Cf.:
>>
>> <https://gcc.gnu.org/ml/gcc/2015-11/msg00068.html>,
>> <https://gcc.gnu.org/ml/gcc/2016-05/msg00137.html>,
>>
>> and then:
>>
>> <https://lkml.org/lkml/2015/11/16/386>,
>> <https://sourceware.org/ml/libc-alpha/2015-11/msg00485.html>,
>> <https://sourceware.org/ml/binutils/2015-11/msg00170.html>,
>> <https://gcc.gnu.org/ml/gcc-patches/2015-11/msg03241.html>.
>>
>> You could well pick this work up and complete it if you like. Final
>> conclusions for further work were made here:
>>
>> <https://gcc.gnu.org/ml/gcc/2016-11/msg00027.html>,
>> <https://gcc.gnu.org/ml/gcc/2017-08/msg00260.html>,
>> <https://gcc.gnu.org/ml/gcc/2017-10/msg00142.html>.
>>
>>   In the relaxed mode math programs may produce wrong results unless you
>> rebuild all your software for the correct NaN mode for the hardware used
>
> Unfortunately most of the hardware guys didn't understood the 
> difficulty here.
> They decided to implement their hardware (P5600 & LS3A4000) as NaN2008 
> only.
>

All SoCs based on Ingenic XBurst2 CPU core are also NaN2008 only.


> I was thinking about let Kernel drop SIGFPE exception was caused by 
> mismatched NaN,
> as most applications don't rely on signaling NaN, but it is still a 
> dirty hack. Not a good
> idea in general.
>
> Thanks.
>
> - Jiaxun
>
>> (in which case you don't need the relaxed setting in the first place).
>
>>
>>    Maciej
