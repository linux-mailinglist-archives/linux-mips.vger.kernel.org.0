Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9646741E707
	for <lists+linux-mips@lfdr.de>; Fri,  1 Oct 2021 07:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241548AbhJAFGK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Oct 2021 01:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbhJAFGI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Oct 2021 01:06:08 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1123C06176A;
        Thu, 30 Sep 2021 22:04:24 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id 20so5833799uaj.6;
        Thu, 30 Sep 2021 22:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaOKesWp0OQYYEyp6e9KKklUt8/dEShzcBRZOQsSIUk=;
        b=nNAm5P2E/eeF6xIE8ulwnhpz4kaN6LPdu+EZcNYqdGsTe33WSVhXekrNiskMRmhVDv
         o1B10s7g1BNSD+QHxpJErdM5zJV125jr8RJ8J4xknfNq5P9h7Zha9wvCAP7PxSGAMwFV
         8Gkt7cjgkZ4xVnqOUMyZIKH4CH6LNNY6vYtAS+m6jnlWPq1uH/r4SiUXRZBn+3aT/vXZ
         hNh60R7WxH7m0ENmAyH5usheFyL/aziYHQ9rW8VmA9kGRffvZekq+0P7+nUkF62wTNN+
         Ovt+Rw72dHhiNLFdu0fWLZ1MKpBjHB/z+0lm7lNXbHJkpH4q1uTTvCgL8baTDs+xwCdK
         YBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaOKesWp0OQYYEyp6e9KKklUt8/dEShzcBRZOQsSIUk=;
        b=VwC7ea1ms6mBcd18WJefA5La7cYaDbSgSxVxfrrs4/d/hajuL+mXongsHrzH2PWkXt
         IlAEQxU5PbNzfE6q79J3buzp/LzKjaX8xU8LEdkm/iZbbKkkbInzA6sbbnqqjkAqxd/D
         AZ9UaJiJ1dZ8xU1c4Nv+04wYkTaxia2OtG13pCj/tdS3QXo0EqjNuyaezXx5LNiyZsNE
         o4sGHqukTaGBLnZJQGeBso0NLzf+a1kXjxCOjzUjOTEAZtFBCNJyEAX+k5mLhT8uyXWD
         TEsi3NXoDrTHLtnmC6osau/OawwrQsmX23yxwDU1Kwi1wc3taprEtpKN8aLzOPBbdpeE
         fFOA==
X-Gm-Message-State: AOAM533fnRh7+tMPK9NCn2pWDe5O/a9o6AF+nisqRJslgY2UseSSl9I4
        b495VQtkKyI8QNF1c4rBaqhPh3mAgljrkyQ/GJk=
X-Google-Smtp-Source: ABdhPJwEU+XQlNT5Gm297g7XPWr8NtvZDtNSLMIY4dnAsqmW07fudIAvS6rNdZjlmST65j+EncKPw/UiXqx6FM0/5eQ=
X-Received: by 2002:ab0:538b:: with SMTP id k11mr8601171uaa.131.1633064663723;
 Thu, 30 Sep 2021 22:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <4d9e3b39-7caa-d372-5d7b-42dcec36fec7@kernel.org>
 <07fc9510-148a-4ae9-e240-7d5402e0e2d7@gmail.com> <3cc110b0-42cc-d6e0-0404-c5dfc6cd9248@kernel.org>
 <CAMhs-H9_wMHsgGbTBxa7_hx+02+VqeK4e_jVPUhWd7LfLRAaVA@mail.gmail.com>
 <CALCv0x1pChoPKC2nm_GSS3VypAQ6OgdzD00HrtniPksg9ebSmw@mail.gmail.com> <d1eb4cb4-6e9e-3f3c-8ca7-a84d03bb9f53@gmail.com>
In-Reply-To: <d1eb4cb4-6e9e-3f3c-8ca7-a84d03bb9f53@gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 1 Oct 2021 07:04:12 +0200
Message-ID: <CAMhs-H_M_weq5gKG5cNTeNT5NakovrXUm-mn3gjN8kR=aiQwSw@mail.gmail.com>
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
To:     Strontium <strntydog@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Greg Ungerer <gerg@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Wei Li <liwei391@huawei.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Felix Fietkau <nbd@nbd.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Steven,

On Fri, Oct 1, 2021 at 4:02 AM Strontium <strntydog@gmail.com> wrote:
>
> On 30/9/21 23:41, Ilya Lipnitskiy wrote:
> > Hi Sergio, Greg, Steven,
> >
> > On Thu, Sep 30, 2021 at 6:35 AM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >> Hi Greg,
> >>
> >> On Thu, Sep 30, 2021 at 3:13 PM Greg Ungerer <gerg@kernel.org> wrote:
> >>> Hi Steven,
> >>>
> >>> On 16/9/21 6:54 pm, Strontium wrote:
> >>>> Hi Greg,
> >>>>
> >>>> I had trouble with this as well.  This line from the patch:
> >>>>
> >>>>> if (!(launch->flags & LAUNCH_FREADY))
> >>>> is checking ram which I believe is supposed to be set by the bootloader.
> >>>> On my platform it looked like the preloaded uboot wasn't setting that as
> >>>> expected.
> >>>> If you have control over your bootloader you can force this ram address
> >>>> to be what the kernel wants, or you can do what i did, because i didn't
> >>>> have that targets uboot src, and wedge before the kernel starts to force
> >>>> the ram to the required state, like so:
> >>> Well, my solution was to revert that patch locally :-)
> >>>
> >>> But many people will not have control of or the desire to change
> >>> their u-boot loader. I would have figured this ends up being a
> >>> real regression for many (most?) users of this SoC.
> >> Agree.
> >>
> >>>
> >>>> #define CORE0_INITIAL_CPU_STATE (0xf00)
> >>>> #define CORE_FL_OFFSET (0x1C)
> >>>> #define FLAG_LAUNCH_FREADY (1)
> >>>>
> >>>> #define WRITEREG(r, v) *(volatile uint32_t *)(r) = v
> >>>> #define KSEG1ADDR(_x) (((_x)&0x1fffffff) | 0xa0000000)
> >>>>
> >>>> void set_core(uint32_t core)
> >>>> {
> >>>>      uint32_t start = CORE0_INITIAL_CPU_STATE + (0x40 * core);
> >>>>      WRITEREG(KSEG1ADDR(start + CORE_FL_OFFSET), FLAG_LAUNCH_FREADY);
> >>>> }
> >>>>
> >>>> void fix_cores(void) {
> >>>>      // Fixes the flags for each core, just before running the kernel.
> >>>>      // Means we don't have to patch the kernel check for valid CPU's.
> >>>>      for (int i = 0; i < 4; i++) {
> >>>>          set_core(i);
> >>>>      }
> >>>> }
> >>>>
> >>>> It seems that memory section is supposed to set all the cores registers
> >>>> before the kernel runs, but i never found it did anything except that 1
> >>>> flag.
> >>>>
> >>>> Obviously a better way would be to properly detect the number of cores
> >>>> and not rely on the boot loader to set a flag in ram, I don't know if
> >>>> that's even possible.
> >>> I can't help but think this commit is not a proper fix for this problem.
> >> I also do think this commit should be reverted. Ilya, do you have a
> >> strong opinion to maintain it instead?
> > Not a strong opinion - I think we need a better fix that would work on
> > the platform I tested with as well as Greg's. I'm okay with reverting
> > it while trying to come up with said fix. Downstream projects, such as
> > OpenWrt can keep this patch or apply it only when building for MT7621S
> > targets until the detection logic is made more robust.
> >
> > Greg - if and when a proper fix is made, a test against your platform
> > would help so we don't regress again in the future.
> >
> > Ilya
>
> Hi Ilya, Sergio and Greg,
>
> Could we, instead of checking data passed from the bootloader check
> something set in the device tree?
>
> For example currently `linux/drivers/staging/mt7621-dts/mt7621.dtsi`
> defines:
>     cpus {
>         cpu@0 {
>             compatible = "mips,mips1004Kc";
>         };
>
>         cpu@1 {
>             compatible = "mips,mips1004Kc";
>         };
>     };
>
>
> But that's not true for an mt7621s.  For this device, it should be defined:
>
>     cpus {
>         cpu@0 {
>             compatible = "mips,mips1004Kc";
>         };
>     };
>
>
> And if it was, the code that detects the cpu cores could check this and
> enable either the number of cores it probes, or the number of cpu's
> defined by the device tree, whichever is the lesser.
>
> Then Downstream just needs to properly set up the cpu in the device tree
> for the effected targets and it should work.
>
> If something like this is acceptable, I would be happy to propose a
> patch along these lines for testing.

I guess this would become a new mt7621s.dts that only include the
other original mt7621.dtsi and just overlay cpus. But I think we can
check the register related with chip name and so on [0] and see if
something is different in order to set 'soc' related code and
attributes to checkable values. Check [1] and [2]. Ilya, maybe you can
check whaever value is in there to see if the "S" stuff is different
with other normal mt7621 chips?

Best regards,
     Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/latest/source/arch/mips/include/asm/mach-ralink/mt7621.h#L15
[1]: https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt7621.c#L86
[2]: https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt7621.c#L59

>
> Steven
