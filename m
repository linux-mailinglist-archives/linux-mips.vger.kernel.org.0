Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0BF32E764
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 12:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCELsL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 5 Mar 2021 06:48:11 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:33130 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhCELsK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 06:48:10 -0500
Received: by mail-oi1-f174.google.com with SMTP id a13so2226355oid.0;
        Fri, 05 Mar 2021 03:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zh7xbs9vIY0JSC9Lpiym+twb4/acDRoEmPattmUqLm4=;
        b=DERdALh3P/MrLZEhh+cwZ+I17JQs1CnQoLfYBUyuuNtipQ4l5zmxCKhCHntom4KERr
         /e5uxIDIL25Z4dN0V5HFnrzWKCU3szJV+di34ghGl/B6ucOKesxa9ryDGsyra2nalXj7
         JnSheZ457b22l5h8biAl7vLJouNyLopsrH4kj7dF0kItV8hC8/VK8ynmwFBnLTx4Y0Ao
         Bna8Smwq+HwRsfpXYA87IDyGRCdrkNLGpJzsIvrAhUM5eRQ0TE/4T0C5c7pNHZCaRKE9
         xC1Z/8hqag3Hd00W9EIdRirwEnD8uz/KA8x8PKTzz0kODm/NA4lEtDPO8JfrkoeopN6s
         j6mw==
X-Gm-Message-State: AOAM531F0g4o3g7qjwJJ0ptVW6ZdNORtFRgU1jnP8dX2nZtxersUO3QT
        QaMrprWJWyzzPj9QXNfORdx8pVKmeXHryC6MC1mW2eMo
X-Google-Smtp-Source: ABdhPJwAo3yzfepN+DDmg+7CJ9v8WeZGk+kDpExi8VrK+eRW8wVD+s6fRrnlJA5TXIBsCJaCD4qsWfchUQa34nefAk4=
X-Received: by 2002:a05:6808:989:: with SMTP id a9mr6811113oic.175.1614944890362;
 Fri, 05 Mar 2021 03:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20210304072357.31108-1-zajec5@gmail.com> <20210305055501.13099-1-zajec5@gmail.com>
 <CAAdtpL7iWiumiOwMOH1xiBZvyOB0HB7W-9MMHoPPxkb3Srme=w@mail.gmail.com> <f4045af5-4866-6fc9-f34a-d789a7febb77@milecki.pl>
In-Reply-To: <f4045af5-4866-6fc9-f34a-d789a7febb77@milecki.pl>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 5 Mar 2021 12:47:59 +0100
Message-ID: <CAAdtpL5CMTaB6qCR=nZj+1MoGC97_BVd-r30E2RRYOhiktOiZQ@mail.gmail.com>
Subject: Re: [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor
 finding & reading NVRAM
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 5, 2021 at 11:16 AM Rafał Miłecki <rafal@milecki.pl> wrote:
>
> Hi,
>
> On 05.03.2021 10:58, Philippe Mathieu-Daudé wrote:
> > On Fri, Mar 5, 2021 at 6:55 AM Rafał Miłecki <zajec5@gmail.com> wrote:
> >>
> >> From: Rafał Miłecki <rafal@milecki.pl>
> >>
> >> 1. Use meaningful variable names (e.g. "flash_start", "res_size" instead
> >>     of e.g. "iobase", "end")
> >> 2. Always operate on "offset" instead of mix of start, end, size, etc.
> >
> > "instead of a mix"
> >
> >> 3. Add helper checking for NVRAM to avoid duplicating code
> >> 4. Use "found" variable instead of goto
> >> 5. Use simpler checking of offsets and sizes (2 nested loops with
> >>     trivial check instead of extra function)
> >
> > This could be a series of trivial patches, why did you choose to make a mixed
> > bag harder to review?
>
> It's a subjective thing and often a matter of maintainer taste. I can
> say that after contributing to various Linux subsystems. If you split a
> similar patch for MTD subsystem you'll get complains about making
> changes too small & too hard to review (sic!).

Fine. MTD subsystem developers are probably smarter than I'm :)

> This isn't a bomb really: 63 insertions(+), 48 deletions(-)

Too many changes at once for my brain stack doesn't mean others are
willing to review it. But to me that means each time I'll have to pass over
it while bisecting or reviewing git history I'll suffer the same overflow.
Anyway, matter of taste as you said.

>
> That said I admit I don't know MIPS tree habits. Thomas: do you prefer
> smaller patches in case like this?
