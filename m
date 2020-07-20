Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FC7225E23
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 14:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgGTMH1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 08:07:27 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:57445 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728532AbgGTMH0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 08:07:26 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 18017200EA;
        Mon, 20 Jul 2020 12:07:23 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id DCE7B3F201;
        Mon, 20 Jul 2020 08:07:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 277542A91E;
        Mon, 20 Jul 2020 14:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1595246840;
        bh=eDVY8o+7oayv+lM5OYiTyoCzTXiZdojhQRqvbdUrU04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Jx5MQCegyWXgariFzYcLO2lReVnhfJWD5m+GPB+ZoYPV11s3epjwo9fsb6k3fSCYJ
         /8NA0ywCtrFXfRVHV7n0SOPGzfs1qPMJ9ki3H8YFWWdIUnMPQKceeE/KWMlqqXtNeC
         uYsM7OX2NT+S5VGsWK+zNAVB36Q98fh2xDnApO+M=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DFd7o2ZNcW9i; Mon, 20 Jul 2020 14:07:18 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 20 Jul 2020 14:07:18 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E0DF940143;
        Mon, 20 Jul 2020 12:07:17 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="u1kYlusY";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1733-105.members.linode.com [172.104.123.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 83ED840856;
        Mon, 20 Jul 2020 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1595246671;
        bh=eDVY8o+7oayv+lM5OYiTyoCzTXiZdojhQRqvbdUrU04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=u1kYlusY7YoAxXUHbKSahSg7rGVeujB3QVvDSH+frtzwrX0PxRgyvwOoodMOQgiJk
         XHm8nDPqsj3u13trUYK4zehGEtm7dY+FXPHDB+beRddyUp7sk52XtvW5VxFYCHNU3z
         KPUbyNLOy0Z4LzWgjNHYuRNboKBUHiXcoxedMcJA=
Subject: Re: [PATCH 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
 <20200720074249.596364-4-jiaxun.yang@flygoat.com>
 <CAK8P3a13vZJyOGZ1FpS98ytVC57P6NgmQpSfhf2h9b7meQLtcw@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d927b5b6-e33e-4a94-c997-b1794dbde411@flygoat.com>
Date:   Mon, 20 Jul 2020 20:04:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a13vZJyOGZ1FpS98ytVC57P6NgmQpSfhf2h9b7meQLtcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: E0DF940143
X-Spamd-Result: default: False [4.40 / 10.00];
         TO_DN_EQ_ADDR_SOME(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         TO_DN_SOME(0.00)[];
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
         MID_RHS_MATCH_FROM(0.00)[];
         ARC_NA(0.00)[];
         RECEIVED_SPAMHAUS_XBL(3.00)[172.104.123.105:received];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,alpha.franken.de,lemote.com,gmail.com,google.com];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/7/20 下午6:45, Arnd Bergmann 写道:
> On Mon, Jul 20, 2020 at 9:44 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>> It can be very big on LS7A PCH systems.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>    * On MIPS I/O ports are memory mapped, so we access them using normal
>> diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
>> index 3de0ac9d8829..b99b43854929 100644
>> --- a/arch/mips/include/asm/mach-loongson64/spaces.h
>> +++ b/arch/mips/include/asm/mach-loongson64/spaces.h
>> @@ -11,8 +11,7 @@
>>   #define PCI_IOSIZE     SZ_16M
>>   #define MAP_BASE       (PCI_IOBASE + PCI_IOSIZE)
>>
>> -/* Reserved at the start of PCI_IOBASE for legacy drivers */
>> -#define MMIO_LOWER_RESERVED    0x10000
>> +#define IO_SPACE_LIMIT 0x00ffffff
> Does this mean that firmware may already have assigned "high" I/O space
> numbers for devices? I'm not sure how well device drivers can generally
> deal with port numbers that don't fit into a 16-bit integer.
Limited test shows most drivers can deal with that. But We'll aware the 
problem,
thanks for the remind.
>
> Is it possible to run a 32-bit kernel on these machines? If yes, than
> taking up 16MB of virtual addresses may also become a problem.

We've killed the ability of running 32-bit kernel on MACH_LOONGSON64.

> In practice, one should rarely need more than a few kb worth of
> port numbers, unless you expect to see hundreds of legacy PCI
> devices.
I must blame stupid hardware design here. The LPC Controller (for ISA 
device) can eat
up to 0x20000 IO BAR, and we can't resize it. Thus we have to enlarge 
the I/O Space.

Thanks!

- Jiaxun
>
>         Arnd
