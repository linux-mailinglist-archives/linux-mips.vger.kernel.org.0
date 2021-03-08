Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA0533140B
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 18:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCHREe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 12:04:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:54602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229904AbhCHRE3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 12:04:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0382B6522C;
        Mon,  8 Mar 2021 17:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615223069;
        bh=jTPd/R2IcG/q8yWtov6si/pOz9VHOAJXbe8eW4LlU+Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T1efKG2784L/un1cdV6OCA2fxfIJ5Z071EsgFzk5a2rbjZFoqMILbv8C3XrykkjvL
         TRJm/PYRe1lNbcPAtXU0gFG8pDGB6LscEgn6c44axqR76/xyVo0pQ+OZq5U8b373tY
         SJWy+Pqyxf/9zVSZnA8DOY3ZGeCHBid1+kH0HWspsaEX+YzRGJRvN/4n4mjKkQWO+/
         IOek8ZgqOGx7lg3xezv9nnfJ9tZ0jvMEicFcUz7uz2KGk2xWm9k9LybfkC8kvvkK6/
         T/IDtxzRI5zoR04yRP4Dnc4RFQfJdjEK89dbiiny5ehfe0FNk2INEkaeilvhYp+tr5
         GEMa9/ZTlA53A==
Received: by mail-ed1-f47.google.com with SMTP id m9so15785852edd.5;
        Mon, 08 Mar 2021 09:04:28 -0800 (PST)
X-Gm-Message-State: AOAM5312B7y28jd08HgQcr0RHB7jXJJswp3EC4uW/x+8ywsaho8xveOa
        tPVU8hdBQ91CmjyNwgN3gbL++pokSoJXQonYfQ==
X-Google-Smtp-Source: ABdhPJxczdvK/qV3FEN5Qjf5LIKC2Y4tY0TDZ07L6U+SSEImjQdZGi6RQyutAsEb2IrV9+zVcIueWtbphsShO/EfFJA=
X-Received: by 2002:a50:fe17:: with SMTP id f23mr23703776edt.258.1615223067558;
 Mon, 08 Mar 2021 09:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20210303193305.924384-1-paul@crapouillou.net> <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
 <20210306084513.GA5453@alpha.franken.de> <CAL_JsqK0_M18gnoYFyTyf_OaQgbmbYYyoAr-WaFCzzsmFuFeFg@mail.gmail.com>
 <20210306225855.GA3574@alpha.franken.de>
In-Reply-To: <20210306225855.GA3574@alpha.franken.de>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 8 Mar 2021 10:04:15 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+m0uwgo_-phR_zAz6ZfiSAr=JMXMaFsW-tPv_kXV+3fA@mail.gmail.com>
Message-ID: <CAL_Jsq+m0uwgo_-phR_zAz6ZfiSAr=JMXMaFsW-tPv_kXV+3fA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 6, 2021 at 3:59 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, Mar 06, 2021 at 02:35:21PM -0700, Rob Herring wrote:
> > On Sat, Mar 6, 2021 at 1:45 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Wed, Mar 03, 2021 at 02:37:55PM -0600, Rob Herring wrote:
> > > > On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> wrote:
> > > > >
> > > > > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> > > >
> > > > I had checked the other built-in cases as microblaze broke too, but
> > > > missed some of the many ways MIPS can have a dtb. Appended and
> > > > built-in DTBs were supposed to be temporary. :(
> > >
> > > and a fdt can also be provided by firmware. And according to spec
> > > there is no aligmnet requirement. So this whole change will break
> > > then. What was the reason for the whole churn ?

Actually, that is wrong. The spec defines the alignment (from
flattened format appendix):

"Alignment

For the data in the memory reservation and structure blocks to be used
without unaligned memory accesses, they shall lie at suitably aligned
memory addresses. Specifically, the memory reservation block shall be
aligned to an 8-byte boundary and the structure block to a 4-byte
boundary.

Furthermore, the devicetree blob as a whole can be relocated without
destroying the alignment of the subblocks.

As described in the previous sections, the structure and strings
blocks shall have aligned offsets from the beginning of the devicetree
blob. To ensure the in-memory alignment of the blocks, it is
sufficient to ensure that the devicetree as a whole is loaded at an
address aligned to the largest alignment of any of the subblocks, that
is, to an 8-byte boundary. A |spec| compliant boot program shall load
the devicetree blob at such an aligned address before passing it to
the client program. If an |spec| client program relocates the
devicetree blob in memory, it should only do so to another 8-byte
aligned address."


> > There was a long discussion on devicetree-compiler list a few months
> > ago. In summary, a while back libfdt switched to accessors from raw
> > pointer accesses to avoid any possible unaligned accesses (is MIPS
> > always okay with unaligned accesses?).
>
> no, it will trap unaligned accesses, that's the reason for Paul's problem.
>
> > This was determined to be a
> > performance regression and an overkill as the DT structure itself
> > should always be naturally aligned if the dtb is 64-bit aligned. I
> > think 32-bit aligned has some possible misaligned accesses.
>
> the access macros are using *(unsigned long long *), which isn't
> even nice for 32bit CPUs...

Where are those?

> > As part of this, a dtb alignment check was added. So worst case, we
> > could disable that if need be.
>
> yeah, or override fdt32/64_to_cpu, if I understood the code correctly.

No, fdt32/64_to_cpu don't dereference the pointer.

Rob
