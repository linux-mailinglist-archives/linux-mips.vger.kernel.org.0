Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65773349CE7
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 00:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhCYXaJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 19:30:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:54934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231309AbhCYX36 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Mar 2021 19:29:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6AC1161A27;
        Thu, 25 Mar 2021 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616714997;
        bh=1So/sDC1qFPREyegXHFcy7/VmRkzeq/fmOvYjRI/LkM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ays7TH2UlrPjYT2EhVKB9kfoPA5X87la04AArIOH/b/tNiVyioalV2c0dN8bICOoL
         7VJtPJyCS9xna9DctRH8KPmi55ZNcoYl6ih9TRaL9tTERYwV06i8f7RN/lu6xMqld9
         e2l8Of2a/O3BXNaZZgjWqjkX0LVObsYgCGTtH+ZCr2VaXRrIItdTzF93vAGrcWB7z3
         Ewo07B3N41P6QiPOcmR96/pdF1SZpaj3tHf5XQrXzYYKBM0F01axjY0X5FWxjIwrJt
         cDmzFK//Fa80+AgrWa/Pscxi8j3sI2x8kQO05VvBQdTX/SWhTViEySY6kw5g9Bhi0R
         UVP/O02On5eaw==
Received: by mail-ej1-f46.google.com with SMTP id u5so5688866ejn.8;
        Thu, 25 Mar 2021 16:29:57 -0700 (PDT)
X-Gm-Message-State: AOAM533CTzxUXZ/VCW+V7wgGq4B7txnOhWtKz301rrA1qEdkakUx+sWB
        +yxmEUHF+RiuI7v0C/L7kDc0DzkUYBhQWjR3Jw==
X-Google-Smtp-Source: ABdhPJyp90At2ic5zxJIDhb11Bg7kKraVHtULioYfIts4QYqWxOJiucuvniDhV6Uc0L1MCJm0RL6y9lW3E+JgBiBtTE=
X-Received: by 2002:a17:906:5e01:: with SMTP id n1mr12293198eju.359.1616714996020;
 Thu, 25 Mar 2021 16:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com> <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba> <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu> <20210325195956.GM109100@zorba>
In-Reply-To: <20210325195956.GM109100@zorba>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 25 Mar 2021 17:29:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
Message-ID: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Will Deacon <will@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> >
> > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> >
> > Let's only provide once CMDLINE as of today, and ask the user to select
> > whether he wants it appended or prepended or replacee. Then no need to
> > change all existing config to rename CONFIG_CMDLINE into either of the new
> > ones.
> >
> > That's the main difference between my series and Daniel's series. So I'll
> > finish taking Will's comment into account and we'll send out a v3 soon.
>
> It doesn't solve the needs of Cisco, I've stated many times your changes have
> little value. Please stop submitting them.

Can you please outline what those needs are which aren't met?

Rob
