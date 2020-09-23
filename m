Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CC72754B8
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 11:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgIWJqD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 05:46:03 -0400
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:57274 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIWJqA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 05:46:00 -0400
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id AA90420E2E
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2020 09:45:58 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 70BEB260EB
        for <linux-mips@vger.kernel.org>; Wed, 23 Sep 2020 09:45:56 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 476873EDEC;
        Wed, 23 Sep 2020 11:45:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 2798F2A504;
        Wed, 23 Sep 2020 11:45:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600854355;
        bh=WmH4sUX7rMwv7ZEn7Km4FbPWcYkvvAe8oD71hl3hl4k=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=n9Z8MqMYYkXNGr3Md61z/U3KBK3FSOhLt2l9QxLalepTLaaajOiGRtxy4wbuavEgQ
         9KUrFmndRevTJ93QE2C0fJADHehnze3bBfnoOtzlL5FOWZTsBVsgj3JW7vvXmZgp2z
         OTBoIoRdOYQSWVhONJz7ZQEE8lOSKYkTP3Ox1MOk=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5PwVxNikHEN7; Wed, 23 Sep 2020 11:45:53 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 11:45:53 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D6CE440FEF;
        Wed, 23 Sep 2020 09:45:51 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="SQfxzF4D";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [127.0.0.1] (114-42-183-127.dynamic-ip.hinet.net [114.42.183.127])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id E8C9640FEF;
        Wed, 23 Sep 2020 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600854252;
        bh=WmH4sUX7rMwv7ZEn7Km4FbPWcYkvvAe8oD71hl3hl4k=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=SQfxzF4DPFZxSSc3FCY+yhhGaCQmE/LX9tPKaIdfarAjCErdLl6B9Cl+1OvjEaQM4
         MpyQeMm+UQrTCT9go8IqxEPI9eJWWa/ir9kHNQAiIj/5LKN5t8XbrazI1byBbAQ3/n
         NmYkdtNU6qp4sCTSLX5ib/AQRFZmvNZfShRK/SGE=
Date:   Wed, 23 Sep 2020 17:44:02 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V7 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
User-Agent: K-9 Mail for Android
In-Reply-To: <20200921121554.GA8642@alpha.franken.de>
References: <1600679548-29154-1-git-send-email-chenhc@lemote.com> <1600679548-29154-2-git-send-email-chenhc@lemote.com> <20200921121554.GA8642@alpha.franken.de>
Message-ID: <177ADF0C-1633-449F-B589-712EA4857E79@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D6CE440FEF
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         RECEIVED_SPAMHAUS_PBL(0.00)[114.42.183.127:received];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B49=E6=9C=8821=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=888=
:15:54, Thomas Bogendoerfer <tsbogend@alpha=2Efranken=2Ede> =E5=86=99=E5=88=
=B0:
>On Mon, Sep 21, 2020 at 05:12:27PM +0800, Huacai Chen wrote:
>> Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
>> mode by default=2E However, gslq/gssq (16-bytes load/store instructions=
)
>> overrides the instruction format of lwc2/swc2=2E If we wan't to use gsl=
q/
>> gssq for optimization in kernel, we should enable COP2 usage in kernel=
=2E
>>=20
>> Please pay attention that in this patch we only enable COP2 in kernel,
>> which means it will lose ST0_CU2 when a process go to user space (try
>> to use COP2 in user space will trigger an exception and then grab COP2,
>> which is similar to FPU)=2E And as a result, we need to modify the cont=
ext
>> switching code because the new scheduled process doesn't contain ST0_CU=
2
>> in its THERAD_STATUS probably=2E
>>=20
>> For zboot, we disable gslq/gssq be generated by toolchain=2E
>>=20
>> Signed-off-by: Huacai Chen <chenhc@lemote=2Ecom>
>> ---
>> V3: Stop using ST0_MM and use ST0_CU2 instead (Thank Thomas and Maciej)=
=2E
>> V4: Adopt Thomas's suggestion to improve coding style=2E
>> V5: Use ST0_KERNEL_CUMASK in all possible places to avoid #ifdefs=2E
>> V6: Modify switch_to() and don't touch r4k_switch=2ES=2E
>> V7: For zboot, disable gslq/gssq be generated by toolchain=2E
>>=20
>>  arch/mips/boot/compressed/Makefile | 5 +++++
>>  arch/mips/include/asm/mipsregs=2Eh   | 7 +++++++
>>  arch/mips/include/asm/stackframe=2Eh | 6 +++---
>>  arch/mips/kernel/head=2ES            | 2 +-
>>  arch/mips/kernel/process=2Ec         | 4 ++--
>>  arch/mips/kernel/traps=2Ec           | 2 +-
>>  6 files changed, 19 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compre=
ssed/Makefile
>> index 9a9ba77=2E=2E2c491c1 100644
>> --- a/arch/mips/boot/compressed/Makefile
>> +++ b/arch/mips/boot/compressed/Makefile
>> @@ -22,6 +22,11 @@ KBUILD_CFLAGS :=3D $(filter-out -pg, $(KBUILD_CFLAGS=
))
>> =20
>>  KBUILD_CFLAGS :=3D $(filter-out -fstack-protector, $(KBUILD_CFLAGS))
>> =20
>> +# Disable lq/sq in zboot
>> +ifdef CONFIG_CPU_LOONGSON64
>> +KBUILD_CFLAGS :=3D $(filter-out -march=3Dloongson3a, $(KBUILD_CFLAGS))=
 -march=3Dmips64r2
>> +endif
>> +
>
>thanks for doing this, I'm going to apply this later=2E
>
>This remind of another question, what about loongson2ef ? I'm getting
>kbuild failure because of enabled loongson-mmi mails=2E Are we are missin=
g
>something like cflags-y +=3D $(call cc-option,-mno-loongson-mmi) in Platf=
orm
>file ? Who is taking care of loongson2ef ?

I'll send a patch later=2E Sorry for the inconvenience=2E

I'm taking care of it=2E Just being a little bit busy recently=2E

Thanks=2E

- Jiaxun

>
>Thomas=2E
>
