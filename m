Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30DA21640D2
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 10:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgBSJwf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 19 Feb 2020 04:52:35 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:43719 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgBSJwe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 04:52:34 -0500
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mmhs6-1jlyJ51ItK-00jnKw; Wed, 19 Feb 2020 10:52:33 +0100
Received: by mail-qk1-f178.google.com with SMTP id u124so21910451qkh.13;
        Wed, 19 Feb 2020 01:52:33 -0800 (PST)
X-Gm-Message-State: APjAAAWcLSIIx8i5+sfpHcLdtgKtlQCdUUriQ1VAFclMlEZdJ0Xanf0Y
        3YSowuPIznniXF6K04m0cULmZUWKkDnw9YPzTJY=
X-Google-Smtp-Source: APXvYqz6sQrDPqUNAmecu/h04WniHkbB4ukHoV+epQJlqXgny5NFbF326v+1laQu3l+m+Fb5JwCdWHZ/0sv+ehZyuPE=
X-Received: by 2002:a05:620a:1530:: with SMTP id n16mr22824472qkk.394.1582105952127;
 Wed, 19 Feb 2020 01:52:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org> <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org> <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
 <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
In-Reply-To: <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 19 Feb 2020 10:52:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Message-ID: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Subject: Re: Surprising code generated for vdso_read_begin()
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Segher Boessenkool <segher@kernel.crashing.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Andy Lutomirski <luto@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:KfAcI+gmei7MEogTHDFUMd8r6p43ZGnpPPhbMyVd38ltGLhQ+/C
 ndqCjVB3FVXe5vp1kY/yjjKmGeOk8b+Egk2k2n5HlVk213lpmmkUj4gFRdddOjdAphhbQ5L
 lG6idmDOjNwUbarIQ83wl0SovEwmdEFLQNPrn18m5cSTe/3KxY/myeW/X6zLQ0Zg8rap4f6
 /SKF4iu4AJ8GBkxgX+2rw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MhDAhJpzmlU=:DjPodyAtMoLFwqgep3fd1v
 XDckU16XYd5HBY3MqlOKv7C03hN20ucrMu0tSrSxsBlQzLJG4C976PtM4MmLD2Tbk0Wrp8kIJ
 8Riq5depe7w8YRDkwpzoc2HdzfQWdSpXijJSnV8tksY2eYkNvONAbhXOsrSipomkamamRDBJW
 0kTw8IRBibFRVxxoE8l7l/oagyl8srBT0kNWRHf9GsmN064qlJf9FSHfEPGAAfOXGhrgT6uM1
 TjTNADH7wOa75N0+ICyjwfl4mSbffjH9yqnRGvfh8qBuetnQW/W4nd8VGA15hFbWivtFKLR2a
 kTxp2SyUh60ANYbFDYHT4Or2BSu/aJ7SKuTpPPcXOBofBj1sPnoKAaUxV+SmS2k0zB+9nz2Ox
 0wl0Uxt9NpIGqXNcBVxl+HUqdgw0pnvNRKWwJwgLJVrbf4l+0WSIR2mIitQUf7iJx8DWgl34P
 kMPoQmVI4Vouldx6ANUMgD7ZEeLl2MXCq6JWoVizJu5Jz+ds8AyAR74LS7JldkDm6CK+TbT2/
 NnXZNE7JyGRKuRgKdbJ/qwzLM5nnfwqpbICfmmPnZ0Zb3AJbXSlwr+kudiB2ltlrpoATPuIqm
 cIm9LAMY6Hw/UdKYbV6jCVlof5PzIoRDmBSYepgt1VMvJJB0aGY54vJaNrXZ6CMeOoeALccH0
 UfaX1FyfJavjuhhaSgpeKqgdG+FMchw4dyeyTazJOI7wqoPLXI7Nv0Tf5I4dAb9S5m3Bgkgln
 W4Knc8n89vHn+ftkP6A2o+phyIXhA/pavmRVSPKSGA755c3DtDgYbs7UBECfhfDOF2DMsOnDl
 GciNkSl4WuQtylVJlIJSfGXtG+cTNL5qJUC9Q/dmEnfk3iSY7k=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 19, 2020 at 9:45 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 16/02/2020 à 19:10, Arnd Bergmann a écrit :
> > On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> >>
> >> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> >>> Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
> >>>> It looks like the compiler did loop peeling.  What GCC version is this?
> >>>> Please try current trunk (to become GCC 10), or at least GCC 9?
> >>>
> >>> It is with GCC 5.5
> >>>
> >>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
> >>> recent than 8.1
> >>
> >> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> >> this hard and/or painful to do?
> >
> > To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.2
> > binaries, as well as a recent 10.0 snapshot.
> >
>
> Thanks Arnd,
>
> I have built the VDSO with 9.2, I get less performant result than with
> 8.2 (same performance as with 5.5).
>
> After a quick look, I see:
> - Irrelevant NOPs to align loops and stuff, allthough -mpcu=860 should
> avoid that.
> - A stack frame is set for saving r31 in __c_kernel_clock_gettime. GCC
> 8.1 don't need that, all VDSO functions are frameless with 8.1

If you think it should be fixed in gcc, maybe try to reproduce it in
https://godbolt.org/ and open a gcc bug against that.

Also, please try the gcc-10 snapshot, which has the highest chance
of getting fixes if it shows the same issue (or worse).

     Arnd
