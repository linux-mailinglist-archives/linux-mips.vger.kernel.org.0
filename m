Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88466E999E
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 18:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234740AbjDTQeH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 12:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbjDTQdu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 12:33:50 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28A4E60
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 09:33:17 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54fa9da5e5bso50647027b3.1
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682008368; x=1684600368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3BSroRGTMjZwdWoqTKLfU1BwyXpXpK1CaYKOa1IhhA=;
        b=i1AYBs8uVK8brvleQAYqQGZPGcHCo8NkcuLi+lk7QlkZRzLXczecbwnHc2vEd3T3Md
         PfbKp6VSZaD3MeOVF4239vPmz3TbDBbw9lq0nXv1fzz7FCAiJlmMDtT1wiTOZVcjDxai
         kPI4A0jTiWieP1nCDhQ4VYXH7W/hwLNrESVTRG/RRIqoDtKy2NiZv2VQR6XyV4Lj9Czj
         nExymAAFbb3YZzvMjuFYCAYrt9itelr661Deu63vXoByzV3rko8BZHgjSwwLK6qCOpfK
         tbnscG88Njr/fQkPfOLtXDoMmB8ENZUE1qk6lIEAUdpwCKVcwfiRpPuxW2zCIDDpzLJF
         Q9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682008368; x=1684600368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3BSroRGTMjZwdWoqTKLfU1BwyXpXpK1CaYKOa1IhhA=;
        b=Ll/TOBkpGgDK9mFhPdOrNAjFtPcxC3wkvgpwlIQuIp3TZT6ULkWSSEilP96qG+Dqpl
         cR2O0D1LvBg3QPQEtTzzjhui7kVr4VU9zaG4RhaAcgKjq5F1/Q2Wocyot6mg5h7Vrvs2
         mDObSp/iMrhqdWtBRDQ2ByHyBLvN5bx0g8JY5BnUusJAnwzOUwMs8SOBkb/Zik8NBDtS
         JydLiOdi/62a6daP6jeAdj2LdvpGexVgTjHEGicmVjMmyy7Bdd7wZUBWq4q5G5YOjJ+l
         a13yyzBQE9wfG22KHx0dpuPQPhkWkNcjpnovkaPydAS6UnO3dUm1N87BQR7cRvsdh/iJ
         Lerw==
X-Gm-Message-State: AAQBX9cIyA3zxpykSIvIXTe094br/HdY7QDMCJbgd9tH3guI4v08/mP+
        Jw72QdFpmDPtFEKDlod1kFoZzUMemQN1FrRinQKTQQgwmOieQhfmX0Y4aQ==
X-Google-Smtp-Source: AKy350bS4Uph/moJnEKQings6CW8NakkSPNVDca75rNKjnPYS7Vm9ht4TnvcuOxwihcePODQeNmC90SYvB3pfCHYWfM=
X-Received: by 2002:a0d:d911:0:b0:54f:5cec:a643 with SMTP id
 b17-20020a0dd911000000b0054f5ceca643mr1364521ywe.41.1682008368023; Thu, 20
 Apr 2023 09:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com> <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com> <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
In-Reply-To: <20230419221500.GA17797@alpha.franken.de>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 20 Apr 2023 09:32:36 -0700
Message-ID: <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name,
        loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 19, 2023 at 3:15=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
> > On Wed, Apr 19, 2023 at 9:50=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> > >
> > >
> > >
> > > > 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers <=
ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang <jiaxun.yang@fl=
ygoat.com> wrote:
> > > >>
> > > >> LLVM does not implement some of -march options. However those opti=
ons
> > > >> are not mandatory for kernel to build for those CPUs.
> > > >>
> > > >> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> > > >> we can get those kernel to build with LLVM.
> > > >>
> > > >> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> > > >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> > > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > >
> > > > Thanks for the patch! Maybe it's more obvious to folks who work on
> > > > mips, but how did you determine that say `p5600` is `mips32r5` or
> > > > `r10000` is `mips4`?
> > >
> > > Wikipedia [1] should fit the purpose.
> > >
> > > [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processo=
rs
> >
> > Mostly! Though I was not able to verify:
> > - p5600
>
> mips32r5
>
> > - r5500
>
> mips4
>
> > - rm5200
>
> mips4
>
> > - sb1
>
> mips64r1

Thomas, thanks for reviewing datasheets to verify this.

Jiaxun, for SB1, you have cc-option fall back to -march=3Dmips4, does
that need to be -march=3Dmips64r1?

(With that last question resolved, I'm happy to sign off on this patch)

>
> all information taken from datasheets.
>
> > - loongson*
>
> probably depends on the exact type, but as I don't have datasheets
> I can't say what it is exactly, probaly mips32r2/mips64r2.

Oh look Jiaxun, you are the maintainer for
"MIPS/LOONGSON64 ARCHITECTURE"
ok then I will trust your knowledge of this architecture!

---
Separate question to Huacai, Wang, and the loongarch list; I know LLVM
landed the Loongarch backend recently; any idea what's the status of
building arch=3Dloongarch with LLVM=3D1 (linux kernel)?

--=20
Thanks,
~Nick Desaulniers
