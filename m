Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF29C19F430
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 13:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgDFLLq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 07:11:46 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17841 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726873AbgDFLLq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 07:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586171466;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=Y6H0UZ+rUE7MyyGuh8+kpzPUZz7EvzhkzLuIA8Y0cbg=;
        b=HWFrAsg7jj35y2hzV4v4EB/Vet6MmdhW8rHbiJqCjULfMr4nsnIZ5ptGmbdFJmDk
        dIcucmWMia4qv2vFhFt5xI3ACXET5zYtyeDZK1Rz1aw+8JCKFDtX1J6oWZwQDOqfrvP
        oK6FPcbPjG5XBHjV95efIMLBYsAo5PNICq63hU3o=
Received: from [26.26.26.1] (115.193.87.168 [115.193.87.168]) by mx.zoho.com.cn
        with SMTPS id 1586171461806156.29970469650766; Mon, 6 Apr 2020 19:11:01 +0800 (CST)
Date:   Mon, 06 Apr 2020 19:10:58 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAKcpw6U=VW+h4sU1fzrsqXU9z-zVfcFsENKHgAD4paqtndip2w@mail.gmail.com>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org> <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com> <alpine.LFD.2.21.2004051817310.4156324@eddie.linux-mips.org> <CAKcpw6U=VW+h4sU1fzrsqXU9z-zVfcFsENKHgAD4paqtndip2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] MIPS: malta: Set load address for 32bit kernel correctly
To:     YunQiang Su <wzssyqa@gmail.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     linux-mips <linux-mips@vger.kernel.org>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <079F408B-9C44-4317-8DD3-7A1896564960@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B44=E6=9C=886=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=886:=
57:18, YunQiang Su <wzssyqa@gmail=2Ecom> =E5=86=99=E5=88=B0:
>Maciej W=2E Rozycki <macro@linux-mips=2Eorg> =E4=BA=8E2020=E5=B9=B44=E6=
=9C=886=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=881:23=E5=86=99=E9=81=93=
=EF=BC=9A
>>
>> On Mon, 6 Apr 2020, Jiaxun Yang wrote:
>>
>> > > Given the description above I think it should be done uniformly
>and
>> > >automatically across all platforms by trimming the address
>supplied
>> > >with
>> > >$(load-y) to low 8 digits in a single place, that is at the place
>where
>> > >
>> > >the variable is consumed=2E  This will reduce clutter across
>Makefile
>> > >fragments, avoid inconsistencies and extra work to handle
>individual
>> > >platforms as the problem is triggered over and over again, and
>limit
>> > >the
>> > >risk of mistakes=2E
>> >
>> > I was intended to do like this but failed to find a proper way=2E
>> >
>> > Makefile isn't designed for any kind of calculation=2E
>> > And shell variables are 64-bit signed so it can't hold such a huge
>variable=2E
>> >
>> > Just wish somebody can give me a way to do like:
>> >
>> > ifndef CONFIG_64BIT
>> > load-y =3D $(load-y) & 0xffffffff
>> > endif
>>
>>  Use the usual shell tools like `sed', `cut', `awk', or whatever we
>use in
>
>perl may be the easiest to use tool here=2E
>
>ifndef CONFIG_64BIT
>  load-y :=3D $(shell $(PERL) -e 'print $(load-y) & 0xffffffff')
>endif
>
>Note that it is `:=3D' instead of '=3D'=2E

It seems like perl is not one of kernel's build dependencies=2E[1]
I'm comsidering a alternative solution,
write a small hostprog in C to deal with that=2E

Thanks=2E

[1]: https://www=2Ekernel=2Eorg/doc/html/v5=2E6/process/changes=2Ehtml


>
>> the kernel build already for other purposes=2E  There's no need to do
>any
>> actual calculation here to extract the last 8 characters (and the
>leading
>> `0x' prefix)=2E  At worst you can write a small C program, compile it
>with
>> the build system compiler and run, as we already do for some stuff=2E
>>
>>   Maciej

--=20
Jiaxun Yang
