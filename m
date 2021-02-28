Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C423C327247
	for <lists+linux-mips@lfdr.de>; Sun, 28 Feb 2021 13:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhB1MuE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Feb 2021 07:50:04 -0500
Received: from angie.orcam.me.uk ([157.25.102.26]:37084 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhB1MuE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Feb 2021 07:50:04 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 19BBF92009C; Sun, 28 Feb 2021 13:49:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 1385C92009B;
        Sun, 28 Feb 2021 13:49:22 +0100 (CET)
Date:   Sun, 28 Feb 2021 13:49:21 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     YunQiang Su <wzssyqa@gmail.com>
cc:     YunQiang Su <yunqiang.su@cipunited.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: introduce config option to force use FR=0 for
 FPXX binary
In-Reply-To: <alpine.DEB.2.21.2102280217220.44210@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2102281340310.44210@angie.orcam.me.uk>
References: <20210222034342.13136-1-yunqiang.su@cipunited.com> <CAKcpw6UgEUUCG2=9E9KFpTYF23fWshdcFtmB_O+YT0xEoS3swA@mail.gmail.com> <alpine.DEB.2.21.2102280217220.44210@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 28 Feb 2021, Maciej W. Rozycki wrote:

>  Nope, quoting include/elf/mips.h from GNU binutils:
> 
>   /* Not tagged or not using any ABIs affected by the differences.  */
>   Val_GNU_MIPS_ABI_FP_ANY = 0,
> 
> which means that the object file *either* does not use FP *or* has not 
> been tagged at all, as the GNU linker does not tell these two cases apart 
> internally (yes, quite useless semantics, but there you go; I think the 
> enumeration constant of 0 shouldn't have been chosen for any explicit tag, 
> or possibly for double float instead, so this is an ABI design mistake).

 FAOD I think the original intent was to make non-tagged legacy objects 
link-compatible with any FP ABI under the assumption that the user knows 
what he's doing.  While that is acceptable, it shouldn't have implied the 
absence of FP code in such legacy objects.  Instead legacy properties 
should have been implied, that is double FP and likewise legacy NaN.  It 
would have been easier if a non-zero enumeration constant was assigned to 
Val_GNU_MIPS_ABI_FP_ANY, as generic GNU linker code considers the absence 
of a given tag equivalent to that tag being equal zero.  This still can be 
handled, but complicates matters.

  Maciej
