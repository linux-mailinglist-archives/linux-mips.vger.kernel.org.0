Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEEB1A376B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 17:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbgDIPuU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 11:50:20 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17871 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728167AbgDIPuU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 11:50:20 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586447228; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=baohuD0+T7gGmwybRKFlWkKCpnXnIPoSnfCR3RwB7G550Lh+fDFBPWJZc+YpFzRdsNI3JD70j3tn2uMHvhZrH1dIgt0KRIXaqrNQoh+251aP0iX14+u1cJ+w0MLBnK06eL+Qai22mMzk/Mj+uRSmpLngKHJFnbhzrKplJTKXEog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586447228; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=7NS7Q3zVeNavt4rsurOXuLHIPPUMmF/JiqIUXTwsRJQ=; 
        b=l1pTlEjKypYNd44pl8lguPjydFd5EcH7x2yBhKkplN+7C1E+8Ww40D5ddHW1RSBuuZIKdkgzHnAeoV8okNKbXR0GnUeYBiCqy9HYtWNoOYMLGYoY8VQIU8TKsJrbuxD8iF5gl+RkjdtDBdhToL33dveYbL8eE7xJ76T0hcz+/Eo=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586447228;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=7NS7Q3zVeNavt4rsurOXuLHIPPUMmF/JiqIUXTwsRJQ=;
        b=MG4HzWGeR22X3BPBYFI/CtMcAfu6nXvWRQc4OatC5s+gduoAVXkT43tt3fDMqk7I
        A7TPIdjMt9uiQhJtc5uQfJ0Kzc/Qlh71yZb4hLGoNGs+rksNoT0su7cD1/2lQ0g5Bfi
        Y/ZudcgsNuszVhIObVns0MxZPFXva9Ty/lhQyNtY=
Received: from [26.26.26.1] (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586447226864494.93198647046177; Thu, 9 Apr 2020 23:47:06 +0800 (CST)
Date:   Thu, 09 Apr 2020 23:47:04 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org>
References: <1586401829-22242-1-git-send-email-yangtiezhu@loongson.cn> <CAKcpw6XywbOs-rh5ko0uz9vLz9nkgrJ0LiRTSkQQaU9dZbg7oQ@mail.gmail.com> <20200409150923.5b224361@flygoat-x1e> <alpine.LFD.2.21.2004091540450.596385@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: Limit check_bugs32() under CONFIG_32BIT
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     YunQiang Su <wzssyqa@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7A98E39B-EDCF-496D-9525-0160A368361B@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=889=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:07:46, "Maciej W=2E Rozycki" <macro@linux-mips=2Eorg> =E5=86=99=E5=88=B0:
>On Thu, 9 Apr 2020, Jiaxun Yang wrote:
>
>> > > There is no need to build and call check_bugs32() under
>> > > CONFIG_64BIT, just limit it under CONFIG_32BIT=2E =20
>> >=20
>> > Since 32bit is subset of 64bit, and due to the code, I think that
>the
>> > initial purpose
>> > of check_bugs32() is also willing to run even with CONFIG_64BIT=2E
>> >=20
>> > For example, if we have a CPU which is 64bit, and work well on
>64bit
>> > mode, while has a bug only on 32bit mode, check_bugs32 should be
>used
>> > here=2E
>> >=20
>> > Loongson's 3A 1000 is the example, I cannot support FP32 mode well=2E
>>=20
>> In this case bugs32 only contains a workaround for MIPS34K, which is
>a
>> MIPS32 processor=2E It's safe to do so=2E
>
> This is because commit c65a5480ff29 ("[MIPS] Fix potential latency=20
>problem due to non-atomic cpu_wait=2E") moved the other generic
>workaround=20
>elsewhere=2E
>
> The intent has been since historical commit 450ad16ba0ab ("Get rid of=20
>arch/mips64/kernel=2E  9116 lines of code gone=2E") that `check_bugs32' i=
s
>for=20
>generic errata affecting both 32-bit and 64-bit operation (e=2Eg=2E 32-bi=
t=20
>instructions, which naturally may occur in both cases) and
>`check_bugs64'=20
>is for errata affecting 64-bit operation only (e=2Eg=2E 64-bit
>instructions)=2E
>
>But currently it appears we have no generic errata handled, as surely a
>
>34K erratum cannot affect 64-bit operation=2E  So I think such a change=
=20
>makes sense in principle (if a generic erratum appears in the future we
>
>can add a third category, which includes workarounds that are always=20
>applied), but I think it has to be made in a cleaner way=2E
>
>Specifically `check_errata' has to be renamed to `check_errata32', some
>
>commentary added as to the intent, and last but not least a proper
>change=20
>description added that not only repeats what the change does (and what=20
>everyone sees regardless), but actually justifies why the change is
>made=2E =20
>Saying: "There is no need[=2E=2E=2E]" does not tell us *why* there is no
>need=2E
>
>> But my suggestion is if you're going to clean-up bugs and workarounds
>> you'd better establish a file for silicon bugs and provide Kconfig
>> options to enable & disable them=2E Manage bug dependencies by Kconfig
>> will be easier=2E
>
> Why is using Kconfig supposed to be better?  Several configurations=20
>support multiple processor types (e=2Eg=2E swappable CPU daugthercards or
>FPGA=20
>soft-cores) and having to list CPU types across platforms as CPUs are=20
>added is going to be a maintenance nightmare=2E  Whereas having
>workarounds=20
>or panics associated with run-time determination of the actual CPU type
>
>guarantees they will trigger where necessary=2E  The use of `init'
>sections=20
>assures the reclaim of memory for use after bootstrap=2E

Actually I meant let bug checks depends on Kconfig's CPU selection=2E

It's guaranteed that you can only select one kind of CPU one time,
to prevent the overhead of checking bugs on irrelevant processors=2E

And we still have to check PRID/CPUTYPE during boot to enable
proper workarounds, because the Kconfig options are telling about the poss=
ibility,
which means a processor potentially has some kinds of bug=2E

In this case, M34K's errata should depends on or selected by=20
CPU_MIPS32_R2 in Kconfig=2E

So there won't be any nightmare, but only reduced code :-)

Probably we can build-up a general framework for checks & workarounds,
and display affected bugs in /proc/cpuinfo?
That's my personal thought=2E

Thanks=2E

>
>OTOH I agree splitting off errata handling to a separate file may make=20
>sense for structural reasons; we have it already for `check_bugs64'=2E
>
>  Maciej

--=20
Jiaxun Yang
