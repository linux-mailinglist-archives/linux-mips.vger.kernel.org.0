Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C906A418D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 13:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjB0MSH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 07:18:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjB0MSG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 07:18:06 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B83B472
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 04:18:05 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id p6so3440222pga.0
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 04:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O3Wbk4PyzeJv8vEVqhgTB6nRT41+PZyv3EpdVvZLss=;
        b=kLBr+8AAjfUN+W39IHft0s19JEo3QXQvA4IJHevtsTRa6ZWK6ueOUV11+5pyKRXV0Z
         87V1gl2zCTQjCKRVo6peImHHVA0SnxHk8FBWi4FMPsK0IlmBTUT6WARMogA3vTBxDV+y
         e4gD477Z/23mreZ44MJtExd040W89lvvtvqn79KApu/reuqUz4cYnb+onBTUxdlDsesO
         mCo2T4HnwBIVcsKdgZpfKqXP53Y5dUUDNb/HcnGRiMY85y7D3Y+HQQ9B+AwW8o7N/xmQ
         3+OQwcI8Bkn8lvDN3/9VJyaooFFguSDsDIJj0a0Bp9PBJtuY7oHMo+RusdQv4VsRvCvl
         MD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O3Wbk4PyzeJv8vEVqhgTB6nRT41+PZyv3EpdVvZLss=;
        b=0lu3gD5AB+w77z3O2WAi1M0jy12r3I7pT9tRzLpe5+PYIpFZ4xIlrlu8oCIYfZxmj+
         SxsAwGbMd7USl0rUWNf4q4QGg/mXEC7cbujnWCav7s4NAFfJ45BHoeSHeNtMELVpPzvb
         F7uzgkCCLMM+TBczF7SOLDylFzepiH8XDga4Q+GI/XBM1TgYHHJSU1dhDzQ2l0rLdlws
         BNpWcF+w8ZuqQBYWok6cGT87jrzsoUkMKlMNVEHPsPZxi4CR7OPhumS11rTb/ffJpOqM
         SNwBEhmBvkY4fuQayVDjfD0ZT/k/q0ImQbAc9O6TxU+7mQ3od/OIagjMb2X6DrsJf038
         1S0A==
X-Gm-Message-State: AO0yUKVccCGMBz/UV9ijy+tg+omvtUrj2VO7dR3vqrSRmQbhig9Z7XUY
        uSGlbUWotsG9hmtPrFMb+WZzH4dB5RaJkH+KgdnwNgwzZmG9ngH59KE=
X-Google-Smtp-Source: AK7set8wIvfOUTxpgUk1eqPvVSg2OskvjVdzsJ3NgROYebIQXNVp3jUycVc1FS2zPrMjnKbVJwVF3adhec31up6OZDw=
X-Received: by 2002:a62:864d:0:b0:5e5:7376:ea4d with SMTP id
 x74-20020a62864d000000b005e57376ea4dmr3475333pfd.1.1677500284525; Mon, 27 Feb
 2023 04:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20230222161222.11879-1-jiaxun.yang@flygoat.com>
 <20230222161222.11879-2-jiaxun.yang@flygoat.com> <CAM1=_QQRmTaAnn0w6wteQ_FKgoF=vGX_okfbiUHdyUB0ZzNghQ@mail.gmail.com>
 <7CAF04EF-FC1D-4BE1-A639-92D677525C63@flygoat.com>
In-Reply-To: <7CAF04EF-FC1D-4BE1-A639-92D677525C63@flygoat.com>
From:   Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date:   Mon, 27 Feb 2023 13:17:53 +0100
Message-ID: <CAM1=_QRVEG0Fw9U99V3ohMe60h0DwMzyWvV_gYdJ=SrQ1D11Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: ebpf jit: Implement DADDI workarounds
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Feb 23, 2023 at 11:29=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
> I didn=E2=80=99t see any place emitting DADDI.

Right, the JIT only uses unsigned arithmetics :)

> Yes I analysed all other place, most of them are just calculating memory
> address offsets and they should never overflow. Other two is doing additi=
on
> to zero to load immediate, which should be still fine.

Ok.

> >> --- a/arch/mips/net/bpf_jit_comp.c
> >> +++ b/arch/mips/net/bpf_jit_comp.c
> >> @@ -218,9 +218,17 @@ bool valid_alu_i(u8 op, s32 imm)
> >>                /* All legal eBPF values are valid */
> >>                return true;
> >>        case BPF_ADD:
> >> +#ifdef CONFIG_64BIT
> >
> > DADDI/DADDIU are only available on 64-bit CPUs, so the errata would
> > only be applicable to that. No need for the CONFIG_64BIT conditional.
>
> It=E2=80=99s possible to compile a 32bit kernel for R4000 with CONFIG_CPU=
_DADDI_WORKAROUNDS
> enabled.

Yes, but DADDI/DADDIU are 64-bit instructions so they would not be
available when compiling the kernel in 32-bit mode for R4000, and
hence the workaround would not be applicable, right? If this is
correct, I would imagine CONFIG_CPU_DADDI_WORKAROUNDS itself to be
conditional on CONFIG_64BIT. That way the this relationship is
expressed once in the Kconfig file, instead of being spread out over
multiple places in the code.
