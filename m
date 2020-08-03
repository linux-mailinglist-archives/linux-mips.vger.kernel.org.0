Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244DB23A199
	for <lists+linux-mips@lfdr.de>; Mon,  3 Aug 2020 11:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgHCJKi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Aug 2020 05:10:38 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:40870 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgHCJKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Aug 2020 05:10:38 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.199.117])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id B38D0206BC;
        Mon,  3 Aug 2020 09:10:34 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 72A8D3F1D0;
        Mon,  3 Aug 2020 11:10:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 3D6582A911;
        Mon,  3 Aug 2020 11:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596445832;
        bh=Ab0IIpO/eIdkWbO25fAzy9lHE/XfBxoKYGaNcLmixyw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OZ4a7Jx7x/F8Nbf1iDJBbnPTFGFC2BSU0MAIBHO5FUBKJ05zM9gxlzp7NMdjcfssY
         0NeGOnGgBOv5ljQWUAF4IIAEvCSZHDK72uEbsCuTeP8HOsyu4oEsHkZ1z4A0x3L/py
         LPFPwcWdf+iXh0ipdbf65BlRLaNJuDlqaU1TDTdk=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Ve1O92gmF8my; Mon,  3 Aug 2020 11:10:30 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon,  3 Aug 2020 11:10:30 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id EA56940E55;
        Mon,  3 Aug 2020 09:10:27 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="l7tP+RWG";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (n11212042148.netvigator.com [112.120.42.148])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 488B44014B;
        Mon,  3 Aug 2020 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596445314;
        bh=Ab0IIpO/eIdkWbO25fAzy9lHE/XfBxoKYGaNcLmixyw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l7tP+RWGkLX+oYhWEvwek/kl89XI5oSgVXOQ4zs0Of0CSye8s1oock0ONdO20tsrA
         kd9V46g4jiXt8TRkVsdoyaqjGHCh9huqh4bjiO6Zct8or7h+VQ/XFVIS2xybAcHBWr
         0TH1WyS8E4mAAE91WjYshE8CVmG1mLyVl7GlquNs=
Subject: Re: [PATCH] MIPS: Provide Kconfig option for default IEEE754
 conformance mode
To:     "Maciej W. Rozycki" <macro@wdc.com>,
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
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ceb71bef-b3e6-68ce-df80-bcff92085e66@flygoat.com>
Date:   Mon, 3 Aug 2020 17:01:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2008022213500.24175@redsun52.ssa.fujisawa.hgst.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: EA56940E55
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com,zoho.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_TWELVE(0.00)[12];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alpha.franken.de,kernel.org,lemote.com,zoho.com,wanyeetech.com,linux-mips.org];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/3 上午5:46, Maciej W. Rozycki 写道:
> On Fri, 31 Jul 2020, Serge Semin wrote:
>
>>> Requested by downstream distros, a Kconfig option for default
>>> IEEE754 conformance mode allows them to set their mode to
>>> relaxed by default.
>> That's what should have been here in the first place. Thanks!
>   Well, originally plans were there to have NaN interlinking implemented
> and no such mess or desire for hacks like one here would result.  Cf.:
>
> <https://gcc.gnu.org/ml/gcc/2015-11/msg00068.html>,
> <https://gcc.gnu.org/ml/gcc/2016-05/msg00137.html>,
>
> and then:
>
> <https://lkml.org/lkml/2015/11/16/386>,
> <https://sourceware.org/ml/libc-alpha/2015-11/msg00485.html>,
> <https://sourceware.org/ml/binutils/2015-11/msg00170.html>,
> <https://gcc.gnu.org/ml/gcc-patches/2015-11/msg03241.html>.
>
> You could well pick this work up and complete it if you like.  Final
> conclusions for further work were made here:
>
> <https://gcc.gnu.org/ml/gcc/2016-11/msg00027.html>,
> <https://gcc.gnu.org/ml/gcc/2017-08/msg00260.html>,
> <https://gcc.gnu.org/ml/gcc/2017-10/msg00142.html>.
>
>   In the relaxed mode math programs may produce wrong results unless you
> rebuild all your software for the correct NaN mode for the hardware used

Unfortunately most of the hardware guys didn't understood the difficulty 
here.
They decided to implement their hardware (P5600 & LS3A4000) as NaN2008 only.

I was thinking about let Kernel drop SIGFPE exception was caused by 
mismatched NaN,
as most applications don't rely on signaling NaN, but it is still a 
dirty hack. Not a good
idea in general.

Thanks.

- Jiaxun

> (in which case you don't need the relaxed setting in the first place).

>
>    Maciej
