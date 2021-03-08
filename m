Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5759E331525
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 18:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhCHRrm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 12:47:42 -0500
Received: from elvis.franken.de ([193.175.24.41]:58711 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhCHRrS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 12:47:18 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJJyO-0007UB-00; Mon, 08 Mar 2021 18:47:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 04EF4C133D; Mon,  8 Mar 2021 18:45:23 +0100 (CET)
Date:   Mon, 8 Mar 2021 18:45:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: boot/compressed: Copy DTB to aligned address
Message-ID: <20210308174523.GA13680@alpha.franken.de>
References: <20210303193305.924384-1-paul@crapouillou.net>
 <CAL_JsqLfkjC4c4PYfm6yJLZMH-5WaKA_mr9ziJ1J63UohcgRCw@mail.gmail.com>
 <20210306084513.GA5453@alpha.franken.de>
 <CAL_JsqK0_M18gnoYFyTyf_OaQgbmbYYyoAr-WaFCzzsmFuFeFg@mail.gmail.com>
 <20210306225855.GA3574@alpha.franken.de>
 <CAL_Jsq+m0uwgo_-phR_zAz6ZfiSAr=JMXMaFsW-tPv_kXV+3fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+m0uwgo_-phR_zAz6ZfiSAr=JMXMaFsW-tPv_kXV+3fA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 08, 2021 at 10:04:15AM -0700, Rob Herring wrote:
> On Sat, Mar 6, 2021 at 3:59 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Sat, Mar 06, 2021 at 02:35:21PM -0700, Rob Herring wrote:
> > > On Sat, Mar 6, 2021 at 1:45 AM Thomas Bogendoerfer
> > > <tsbogend@alpha.franken.de> wrote:
> > > >
> > > > On Wed, Mar 03, 2021 at 02:37:55PM -0600, Rob Herring wrote:
> > > > > On Wed, Mar 3, 2021 at 1:33 PM Paul Cercueil <paul@crapouillou.net> wrote:
> > > > > >
> > > > > > Since 5.12-rc1, the Device Tree blob must now be properly aligned.
> > > > >
> > > > > I had checked the other built-in cases as microblaze broke too, but
> > > > > missed some of the many ways MIPS can have a dtb. Appended and
> > > > > built-in DTBs were supposed to be temporary. :(
> > > >
> > > > and a fdt can also be provided by firmware. And according to spec
> > > > there is no aligmnet requirement. So this whole change will break
> > > > then. What was the reason for the whole churn ?
> 
> Actually, that is wrong. The spec defines the alignment (from
> flattened format appendix):

I was talking about the "Unified Hosting Interface" from MIPS/Imagination.
As the spec talks about device tree blob all firmware developer knew
about the fdt alignment rules.

> > the access macros are using *(unsigned long long *), which isn't
> > even nice for 32bit CPUs...
> 
> Where are those?

nowhere, I've missread the code in libfdt_env.h

> > > As part of this, a dtb alignment check was added. So worst case, we
> > > could disable that if need be.
> >
> > yeah, or override fdt32/64_to_cpu, if I understood the code correctly.
> 
> No, fdt32/64_to_cpu don't dereference the pointer.

you are right, brainfart on my side.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
