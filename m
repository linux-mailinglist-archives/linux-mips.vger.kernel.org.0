Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE1B1C2AB9
	for <lists+linux-mips@lfdr.de>; Sun,  3 May 2020 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgECIZo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 May 2020 04:25:44 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17747 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726751AbgECIZo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 May 2020 04:25:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588494322; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=lv3VxBVF7TotsLwZ+yN0cv+4RtixOroCBbrZt9pI0180klKeNzdoTQoBDzF3cxHdfYYyg0q5C7ZBypwfr348xc+DZV0HWXxs+ERMOkNR3kaH+QY8O1CBL9GCgIVlYcbgOMyg037CLgmQZ68zzKSs7lMej+3kKzWBHXpYvc24/6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1588494322; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:References:Subject:To; 
        bh=5sgVnweVLSo9tBAb3N6D7i8ljhThrIINKrlwSCh4ppA=; 
        b=XWBdFWCqF/YAflYqMLyuwY1XZE3GBOesKr/FQPm0WJbJt3+zit0lxl02NjLoSZ8GzW23RTVQFbhIONpxeLFo4hn0GS170iiGCuM/i5PbUH+agDF7VWg9Q272S5//FPuHdCU3N+jQzOn/UVeaSj6v0BzdvxF1uuQs6grFfXgRXps=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1588494322;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:CC:Subject:Reply-to:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=5sgVnweVLSo9tBAb3N6D7i8ljhThrIINKrlwSCh4ppA=;
        b=Mr4mZwkrLdmTwbyA5P6Yfv5BwTems1RJV8Zel9zzu3ICEZIRE/NNYSxwOyz3Zz7A
        eORs3k0/RphNma5Nwv6tqUIixJmlUD1LiE8bxa9I9E4ypLOFwhoJOMyezsizD7rYXtp
        EMV1qXn/nEk4n6/xrYbeipPUtoqWHTF7FEwBpNtE=
Received: from [127.0.0.1] (122.235.211.112 [122.235.211.112]) by mx.zoho.com.cn
        with SMTPS id 1588494320804789.3489162069088; Sun, 3 May 2020 16:25:20 +0800 (CST)
Date:   Sun, 03 May 2020 16:25:16 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Wang Xuerui <i@xen0n.name>, Huacai Chen <chenhc@lemote.com>,
        WANG Xuerui <git@xen0n.name>
CC:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>, hww@loongson.cn
Subject: Re: [PATCH 4/4] MIPS: emulate CPUCFG instruction on older Loongson64 cores
User-Agent: K-9 Mail for Android
Reply-to: jiaxun.yang@flygoat.com
In-Reply-To: <da2aa0e8-ee8c-18a1-ee04-b57678ed1bfc@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name> <20200502133846.40590-5-git@xen0n.name> <CAAhV-H5U+KHzORKVjrteYggF24WUAz+dsNL_-YJ_0vKvo2Mw1A@mail.gmail.com> <da2aa0e8-ee8c-18a1-ee04-b57678ed1bfc@xen0n.name>
Message-ID: <86450868-D79C-44E7-97DD-161B7640C215@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B45=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=883:=
58:45, Wang Xuerui <i@xen0n=2Ename> =E5=86=99=E5=88=B0:
>On 5/3/20 2:31 PM, Huacai Chen wrote:
>
>> Hi, Xuerui,
>>
>> On Sat, May 2, 2020 at 9:47 PM WANG Xuerui <git@xen0n=2Ename> wrote:
>>> +
>>> +static int simulate_loongson3_csr_cpucfg(struct pt_regs *regs,
>>> +                                       unsigned int opcode)
>> Maybe simulate_loongson3_cpucfg() is a better name?
>
>Fair point, I was thinking CPUCFG is a part of bigger CSR instructions,=
=20
>so kept the prefix; I don't know what other CSR instructions are=20
>accessible from user-space anyway=2E (Loongson, could you guys *please*=
=20
>release the ISA docs btw?)

Only readcfg and rdtimer family of instructions in CSR ASE
are user space instructions AFAIK=2E

By the way:

+ Professor Hu:

Sorry for interrupting=2E But documentations are really important for comm=
unity development=2E
We've called Loongson multiple times about that buy got no positive feedba=
ck=2E

Also we've seen Loongson's violation of GPL/MPL on FFmpeg/GCC/Firefox rece=
ntly=2E
That's really not a good signal=2E

Chinese below:

+ =E5=B0=8A=E6=95=AC=E7=9A=84=E8=83=A1=E8=80=81=E5=B8=88:

=E5=BE=88=E6=8A=B1=E6=AD=89=E6=89=93=E6=89=B0=E6=82=A8=EF=BC=8C=E4=BD=86=
=E6=96=87=E6=A1=A3=E5=AF=B9=E7=A4=BE=E5=8C=BA=E5=BC=80=E5=8F=91=E8=80=85=E7=
=9C=9F=E7=9A=84=E9=9D=9E=E5=B8=B8=E9=87=8D=E8=A6=81=E3=80=82
=E6=88=91=E4=BB=AC=E5=90=91=E9=BE=99=E8=8A=AF=E5=91=BC=E5=90=81=E4=BA=86=
=E6=95=B0=E6=AC=A1=EF=BC=8C=E4=BD=86=E9=83=BD=E5=BE=97=E4=B8=8D=E5=88=B0=E6=
=AD=A3=E9=9D=A2=E5=8F=8D=E9=A6=88=E3=80=82

=E6=9C=80=E8=BF=91=E6=88=91=E4=BB=AC=E4=B9=9F=E6=B3=A8=E6=84=8F=E5=88=B0=
=E9=BE=99=E8=8A=AF=E5=9C=A8=E9=83=A8=E5=88=86=E5=BC=80=E6=BA=90=E9=A1=B9=E7=
=9B=AE=E4=B8=AD=E5=87=BA=E7=8E=B0=E4=BA=86=E8=BF=9D=E5=8F=8D=E5=BC=80=E6=BA=
=90=E5=8D=8F=E8=AE=AE=E7=9A=84=E7=8E=B0=E8=B1=A1=EF=BC=8C=E8=BF=99=E4=B8=8D=
=E6=98=AF=E4=B8=80=E4=B8=AA=E5=BE=88=E5=A5=BD=E7=9A=84=E4=BF=A1=E5=8F=B7=E3=
=80=82

=E8=B0=A2=E8=B0=A2=E3=80=82

Thanks=2E

>
>Anyway, by removing the "csr" part it feels more consistent with other=20
>parts of the patch=2E I'll send v2 soon=2E
>

--=20
Jiaxun Yang
