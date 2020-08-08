Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B94CB23F605
	for <lists+linux-mips@lfdr.de>; Sat,  8 Aug 2020 04:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgHHCk1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 22:40:27 -0400
Received: from relay4.mymailcheap.com ([137.74.80.156]:35976 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHCk1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 22:40:27 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 09CE13F1CF;
        Sat,  8 Aug 2020 04:40:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 26D332A0FA;
        Fri,  7 Aug 2020 22:40:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596854422;
        bh=1nF3QarTGvr/e5w343LWySjb+/o2qTIdp+ZYnchZ+m0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FJCY0ckukaqVoLGGnl28WwcUotKJp+eQ2TLrAO2Rx5TRJPiZq+5dZgF7+bNNQCWDq
         y2YZrjsDZx3D33/sMWwgfw66jfChP2LNDqB+ATdRMANHn3Y/uMlQ4/F4slTIos7RJA
         xOw8ywUAUU3lRWF66VGWJPltWd9soqHWVPmSgPX8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NA2cGUBcdtO1; Fri,  7 Aug 2020 22:40:20 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  7 Aug 2020 22:40:20 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 0B9344131B;
        Sat,  8 Aug 2020 02:40:19 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Cpx0PyH2";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 5AADE4131B;
        Sat,  8 Aug 2020 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596854403;
        bh=1nF3QarTGvr/e5w343LWySjb+/o2qTIdp+ZYnchZ+m0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Cpx0PyH2MXZgFu/nJtmUW98WbS7MVHnq2Bb6/XYA1Df7IbCwqZiy+GdN2Ci6xxv8s
         MywhNxJm/sBOGf1chpXR6V8rac/eUr6EuOhpOy8zBQRXstIXhYESMgkyS4uqmtRLbM
         nwh0m0MhyKi0TUpO0v5BmqJd1aVlMx7XY0V0Pj2A=
Subject: Re: [PATCH 00/13] MIPS: Convert Ingenic to a generic board
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Krzysztof Kozlowski <krzk@kernel.org>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        =?UTF-8?B?5ryG6bmP5oyv?= <aric.pzqi@ingenic.com>,
        dongsheng.qiu@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, xuwanhao@wanyeetech.com
References: <20200803170124.231110-1-paul@crapouillou.net>
 <ab985296-8441-4006-210d-a71503bd01f0@wanyeetech.com>
 <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <49bb320d-27a7-2c9c-aeaa-68ee67be74f2@flygoat.com>
Date:   Sat, 8 Aug 2020 10:39:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <L8DPEQ.71Z8YA0QXBJA@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 0B9344131B
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[11];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/8 上午12:45, Paul Cercueil 写道:
> Hi Zhou,
>
> Le sam. 8 août 2020 à 0:23, Zhou Yanjie <zhouyanjie@wanyeetech.com> a 
> écrit :
>> Hi Paul,
>>
>> I'm not too sure if remove "cpu-feature-overrides.h" will cause some 
>> problems for X2000, because according to my current test on X2000, I 
>> found that it is somewhat different from the SoCs using XBurst1 CPU 
>> core, with the kernel source code provided by Ingenic, for example, 
>> we must configure "#define cpu_has_tlbinv 1" in 
>> "cpu-feature-overrides.h" to make the X2000 work normally, otherwise 
>> the kernel will get stuck. And X2000's interrupt controller has also 
>> been redesigned. If these differences make it impossible to share 
>> code, should we set a subdirectory of "xburst" and "xburst2" in 
>> "arch/mips/ingenic"? (I am just worried about this situation, so far 
>> I have not been able to successfully run the mainline kernel on X2000).

Hi Yanjie,

TLBINV is a optional feature. We can always invalidate TLB via rewrite 
TLB entry. If X2000 can't work
without TLBINV it means there are some thing went wrong with TLB.
You'd better investigate in detail.

Refined interrupt controller can be enabled via DeviceTree, you only 
have to write a new irqchip driver for it.

Btw: My X2000 EVB is on the way thanks to Taobao~

Thanks.

>
> The <cpu-feature-overrides.h> is kind of a hack, to hardcode settings 
> in case the CPU is not properly detected. The cpu-probe.c should be 
> able to auto-detect these settings, including the inverted TLB that 
> the X2000 has, reading from the CPU config registers ("TLB INV" info 
> should be in config4). Right now cpu_probe_ingenic() doesn't read 
> config4 (not present on older SoCs) but that's trivial to add.
>
> As for your other question, I don't see any reason why we wouldn't be 
> able to support the X2000 aside the others in a generic kernel, so 
> don't worry :)
>
> Cheers,
> -Paul
>
