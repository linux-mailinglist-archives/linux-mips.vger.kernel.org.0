Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8FDF1A4F68
	for <lists+linux-mips@lfdr.de>; Sat, 11 Apr 2020 12:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgDKKjV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Apr 2020 06:39:21 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17839 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725951AbgDKKjV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 11 Apr 2020 06:39:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586601527; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=lzZcGW+bXHWKANrCQa49/ZBG2WrGf9dGLmB4x9kQOwkRNefLCA6/Y2UMSsDZzgup3PoxNFtwSJ6Tc62BRyJRElfQOusFO1N2uOjrenByWhuVpjyAZO0X0TToUYjjNlRc+pvLFePomp8RxLtAs1gzZlLBSjvdd3daPsQbN3WbMfM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586601527; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=Mypne8A1cTcF5GvVy15gPad+0lCGhkQScQLoXBT/4Qc=; 
        b=NzfE38YS1HCwfZoaOZLcLCaqrd/JbHv65cOcIngDIqht5DdQPe52MYK65961bn7Am0y/xeMoYf4p7omQvPG7KjnUsBXnxcUC9ujNXGXk/cAFghThPMbk68/BF8+eqB4TaNp01qVN+oweeexn00M+dfYfXssnWcC+iv/la4b0kOE=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586601527;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=Mypne8A1cTcF5GvVy15gPad+0lCGhkQScQLoXBT/4Qc=;
        b=B8LBw+bgZypoavTuc8+QA0maEQY8nJaK9ilaAAyifNFiatYzFVHMALgd0ZU6iAQR
        IsCFKAmjc2WYW4lPX6c+QqdxIxJJ/avBxtYTxoxgzr/PyZ55uDQuP7q7CMdaxdAcuBV
        B93iby1AF8PUdRjqUtbHBRtBAg8oeDeaSkrCSoI8=
Received: from [26.26.26.1] (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 158660152546126.46526605852671; Sat, 11 Apr 2020 18:38:45 +0800 (CST)
Date:   Sat, 11 Apr 2020 18:38:40 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAKcpw6XU=vwGMwMBJk-Rsg--8CqEis39DEAJRMboP=2aYd5r8g@mail.gmail.com>
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn> <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com> <20200409150923.5b224361@flygoat-x1e> <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org> <7A98E39B-EDCF-496D-9525-0160A368361B@flygoat.com> <CAKcpw6XU=vwGMwMBJk-Rsg--8CqEis39DEAJRMboP=2aYd5r8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
To:     YunQiang Su <wzssyqa@gmail.com>
CC:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7B731159-084D-46D0-BB04-8E5705496C33@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883=
:37:24, YunQiang Su <wzssyqa@gmail=2Ecom> =E5=86=99=E5=88=B0:
>Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> =E4=BA=8E2020=E5=B9=B44=E6=9C=
=889=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:47=E5=86=99=E9=81=93=
=EF=BC=9A
>>
>>
>>
>> =E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8811:07:46, "Maciej W=2E Rozycki"
><macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>> >On Thu, 9 Apr 2020, Jiaxun Yang wrote:
>> >
>> >> > > There is no need to build and call check_bugs32() under
>> >> > > CONFIG_64BIT, just limit it under CONFIG_32BIT=2E
>> >> >
>> >> > Since 32bit is subset of 64bit, and due to the code, I think
>that
>> >the
>> >> > initial purpose
>> >> > of check_bugs32() is also willing to run even with CONFIG_64BIT=2E
>> >> >
>> >> > For example, if we have a CPU which is 64bit, and work well on
>> >64bit
>> >> > mode, while has a bug only on 32bit mode, check_bugs32 should be
>> >used
>> >> > here=2E
>> >> >
>> >> > Loongson's 3A 1000 is the example, I cannot support FP32 mode
>well=2E
>> >>
>> >> In this case bugs32 only contains a workaround for MIPS34K, which
>is
>> >a
>> >> MIPS32 processor=2E It's safe to do so=2E
>> >
>> > This is because commit c65a5480ff29 ("[MIPS] Fix potential latency
>> >problem due to non-atomic cpu_wait=2E") moved the other generic
>> >workaround
>> >elsewhere=2E
>> >
>> > The intent has been since historical commit 450ad16ba0ab ("Get rid
>of
>> >arch/mips64/kernel=2E  9116 lines of code gone=2E") that `check_bugs32=
'
>is
>> >for
>> >generic errata affecting both 32-bit and 64-bit operation (e=2Eg=2E
>32-bit
>> >instructions, which naturally may occur in both cases) and
>> >`check_bugs64'
>> >is for errata affecting 64-bit operation only (e=2Eg=2E 64-bit
>> >instructions)=2E
>> >
>> >But currently it appears we have no generic errata handled, as
>surely a
>> >
>> >34K erratum cannot affect 64-bit operation=2E  So I think such a
>change
>> >makes sense in principle (if a generic erratum appears in the future
>we
>> >
>> >can add a third category, which includes workarounds that are always
>> >applied), but I think it has to be made in a cleaner way=2E
>> >
>> >Specifically `check_errata' has to be renamed to `check_errata32',
>some
>> >
>> >commentary added as to the intent, and last but not least a proper
>> >change
>> >description added that not only repeats what the change does (and
>what
>> >everyone sees regardless), but actually justifies why the change is
>> >made=2E
>> >Saying: "There is no need[=2E=2E=2E]" does not tell us *why* there is =
no
>> >need=2E
>> >
>> >> But my suggestion is if you're going to clean-up bugs and
>workarounds
>> >> you'd better establish a file for silicon bugs and provide Kconfig
>> >> options to enable & disable them=2E Manage bug dependencies by
>Kconfig
>> >> will be easier=2E
>> >
>> > Why is using Kconfig supposed to be better?  Several configurations
>> >support multiple processor types (e=2Eg=2E swappable CPU daugthercards
>or
>> >FPGA
>> >soft-cores) and having to list CPU types across platforms as CPUs
>are
>> >added is going to be a maintenance nightmare=2E  Whereas having
>> >workarounds
>> >or panics associated with run-time determination of the actual CPU
>type
>> >
>> >guarantees they will trigger where necessary=2E  The use of `init'
>> >sections
>> >assures the reclaim of memory for use after bootstrap=2E
>>
>> Actually I meant let bug checks depends on Kconfig's CPU selection=2E
>>
>
>I don't think this is a good idea=2E Since the routine is executed single
>time,
>so it is not performance critical=2E
>And Kconfig for per-cpu is bad for the future if we want to try to
>archive
>single kernel image=2E

You can only select one kind of CPU one time,
according to our current design=2E
e=2Eg=2E MIPS32R2 (Indicating MIPS32R2 IP Cores from MIPS company),
Ingenic Xburst, Loongson64, R4000=2E

We won't create a new entry for a kind of CPU unless
the difference is significant=2E
But when that happens, filtering out unnecessary code on certain
platforms can be beneficial=2E

Thanks

--=20
Jiaxun Yang
