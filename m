Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E22234F200
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 22:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbhC3UN1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 16:13:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230125AbhC3UNQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 16:13:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E85D6196C;
        Tue, 30 Mar 2021 20:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617135196;
        bh=a0u6btj9eABWcxyPcMcImxEQD72LmDexfcRuz0Fotaw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oxcTEFt8SZA7Bx7749WETP1GMcz8oii+pSej4jE7fgG7WS52nFSAy0fAei47dgGTT
         q+Qb1Vck6k9rwb/VKFbpxYLCRwW8Zmp1NygRTYvTbkrtN8tcJTYHnYqP37zGDxtl3E
         fLVdYj+EF8UqAvR0aWxEGFZxJkFSDv4Byhn8kleGogmKDj7PTae42Z1E5/o+jWQsb1
         HYw1Fo55Tqy0SK39VzMpcr/2Pwo8JaJitq/88PjP/eTbN9nL6pj+wOZyP2ryfIX68I
         bA376/UXRBuXIyfqtJFeQh4VhT/oB3BGehfnYkXzNHHRLkOJra/md8EVxl2jTS73e4
         GEFqd0oC0lteg==
Received: by mail-qv1-f54.google.com with SMTP id 30so8813831qva.9;
        Tue, 30 Mar 2021 13:13:16 -0700 (PDT)
X-Gm-Message-State: AOAM531pTxjlDjbOgwQ6qfgV4UuikDTpmHki1hsHSEmWgzy9kDF6NECc
        z8ifOsWSZ5FZoMn8wQa3fU7YzrhmoS9s36B+xg==
X-Google-Smtp-Source: ABdhPJw55amAUhZyFZAQITDAaWCWvjRQ4s0B/xEdY/mzymYT1/HSrfDlYWJbEwEmGzlU1vhNgrIIF8xwK9tMaYRV82Y=
X-Received: by 2002:a05:6214:12a1:: with SMTP id w1mr32724714qvu.57.1617135195251;
 Tue, 30 Mar 2021 13:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com> <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba> <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu> <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com> <20210330173254.GS109100@zorba>
In-Reply-To: <20210330173254.GS109100@zorba>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 30 Mar 2021 15:13:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
Message-ID: <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 12:33 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> > On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > >
> > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > >
> > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > ones.
> > > >
> > > > That's the main difference between my series and Daniel's series. So I'll
> > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > >
> > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > little value. Please stop submitting them.
> >
> > Can you please outline what those needs are which aren't met?
>
> append AND prepend at the same time on all architectures. Christophe doesn't
> understand the need, and hence tries to minimize the feature set which is
> incompatible with Cisco needs and all the other out of tree users.

Okay, but that's never been a feature in upstream. For upstream, we
refactor first and add features 2nd. In this case, the difference is
largely the kconfig and it would be better to not change the options
twice, but that's not a blocker for taking the refactoring. You won't
find a maintainer that's going to take adding a feature over cleanups
and unification.

Rob
