Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA65E12A13A
	for <lists+linux-mips@lfdr.de>; Tue, 24 Dec 2019 13:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfLXMPP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Dec 2019 07:15:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34960 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfLXMPO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Dec 2019 07:15:14 -0500
Received: by mail-pf1-f195.google.com with SMTP id i23so5272633pfo.2
        for <linux-mips@vger.kernel.org>; Tue, 24 Dec 2019 04:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=cUl5gZioHf+9+6AN9dmbhGHLhNt8/shlwV1E7YstAts=;
        b=zDWD8XCA/EeC40f+rqUuDAnCbmAAgAgN8grpTLGD/hu+c6oJ0ekyx9F6083vGsPNpB
         IGrhdkZdQkxUJLQB7IC7MUBKdiAhvr42yCtnEmbLuDVhaVlWU50A+XXkfqUzCfKxLwYd
         NcWZApcamRuoTETR8c7gHOWeAVehTsmseTXj6LnGvlE98ZW3YWEywJh2onhr62RKIN/O
         QbWUv3VfPQ9hUaNXtaLLQYhY2txQ0sPDCgcRwZIrZh36FXuwhdnUh56nRBpE8VWMrHr3
         eko3/wFRsyPKl+dK9FEf1/R7qWEszOxJvMCuzKzRvNgASrlCBXtD9TcieHqLYVVfd8P7
         LnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=cUl5gZioHf+9+6AN9dmbhGHLhNt8/shlwV1E7YstAts=;
        b=pT9TOdgKrjk4T2lAOzBti+sUdyZ21NnrQoU7C0sxDtGqBdB7g6Atrl3sAvmUpA0WS6
         hkSUaZiKrMEC2XwQ1ZMla0CpnmoxrStaJYGOrkEhhsj0osJ90qjtiXnZwNYrwIaYHiT3
         uGcR+qdtxflK4ipR6hPOw7WyXSr6Bzw/vpB+YzM59DVO+vExLjl28+kT+iyCV/OHoUv5
         BVWjm9p7i2YQudqIfMmoK/DGJkHpEzOnn/fsuobDXhvoNLx4gMo9BVBdUK3+jg2q7oBa
         2ACYh7uYqBVePqP5fh2W+nAACd3k74V1kVs3uGAm2FI6SgVnVc3/+z0uUX9Izb4h69Rw
         J/Sg==
X-Gm-Message-State: APjAAAVd63qzxFKHJOkb3Vc2PCrudd3RgzLPg2uUl74vTkPIuaUl3uGH
        117O4Kdica1Vg38ZjVjJ2AuDBg==
X-Google-Smtp-Source: APXvYqxQw1UT4Rk2hWrXeLnplHcgXPOvZ2uVcW7HJIiySYb8+fVviH72PQISJdC4tjd4Z7zmNcXU4Q==
X-Received: by 2002:a62:868f:: with SMTP id x137mr34816521pfd.228.1577189713974;
        Tue, 24 Dec 2019 04:15:13 -0800 (PST)
Received: from [192.168.0.9] (111-255-104-19.dynamic-ip.hinet.net. [111.255.104.19])
        by smtp.gmail.com with ESMTPSA id j5sm11842535pfn.180.2019.12.24.04.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 04:15:13 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 04/10] lib: vdso: get pointer to vdso data from the arch
Date:   Tue, 24 Dec 2019 20:15:11 +0800
Message-Id: <D2614EC4-5B80-4846-994D-22730ACD44A1@amacapital.net>
References: <de5273aa-69dc-8e37-c917-44708257d2ba@c-s.fr>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        X86 ML <x86@kernel.org>
In-Reply-To: <de5273aa-69dc-8e37-c917-44708257d2ba@c-s.fr>
To:     christophe leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Dec 24, 2019, at 7:53 PM, christophe leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> =EF=BB=BF
>=20
>> Le 24/12/2019 =C3=A0 03:27, Andy Lutomirski a =C3=A9crit :
>>> On Mon, Dec 23, 2019 at 6:31 AM Christophe Leroy
>>> <christophe.leroy@c-s.fr> wrote:
>>>=20
>>> On powerpc, __arch_get_vdso_data() clobbers the link register,
>>> requiring the caller to set a stack frame in order to save it.
>>>=20
>>> As the parent function already has to set a stack frame and save
>>> the link register to call the C vdso function, retriving the
>>> vdso data pointer there is lighter.
>> I'm confused.  Can't you inline __arch_get_vdso_data()?  Or is the
>> issue that you can't retrieve the program counter on power without
>> clobbering the link register?
>=20
> Yes it can be inlined (I did it in V1 https://patchwork.ozlabs.org/patch/1=
180571/), but you can't do it without clobbering the link register, because t=
he only way to get the program counter is to do to as if you were calling an=
other function but you call to the address which just follows where you are,=
 so that it sets LR which the simulated return address which corresponds to t=
he address following the branch.
>=20
> static __always_inline
> const struct vdso_data *__arch_get_vdso_data(void)
> {
>    void *ptr;
>=20
>    asm volatile(
>        "    bcl    20, 31, .+4;\n"
>        "    mflr    %0;\n"
>        "    addi    %0, %0, __kernel_datapage_offset - (.-4);\n"
>        : "=3Db"(ptr) : : "lr");
>=20
>    return ptr + *(unsigned long *)ptr;
> }
>=20
>> I would imagine that this patch generates worse code on any
>> architecture with PC-relative addressing modes (which includes at
>> least x86_64, and I would guess includes most modern architectures).
>=20
> Why ? Powerpc is also using PC-relative addressing for all calls but indir=
ect calls.

I mean PC-relative access for data.  The data page is at a constant, known o=
ffset from the vDSO text.

I haven=E2=80=99t checked how much x86_64 benefits from this, but at least t=
he non-array fields ought to be accessible with a PC-relative access.

It should be possible to refactor a little bit so that the compiler can stil=
l see what=E2=80=99s going on.  Maybe your patch actually does this. I=E2=80=
=99d want to look at the assembly.  This also might not matter much on x86_6=
4 in particular, since x86_64 can convert a PC-relative address to an absolu=
te address with a single instruction with no clobbers.

Does power have PC-relative data access?  If so, I wonder if the code can be=
 arranged so that even the array accesses don=E2=80=99t require computing an=
 absolute address at any point.
