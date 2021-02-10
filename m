Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DF7316C0F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 18:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhBJRFs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 12:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbhBJRFo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 12:05:44 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89715C06174A
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 09:05:04 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m13so3351502wro.12
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 09:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ep/FDpznCUD5t+mHArGEFOrAw8wvHgkG6nK9cK6sVyI=;
        b=l0iLHULMd41UjPr3/tt6FiBu7jxjsHje1rxBvDgVRuQgQRgaMGarUFf1xD/MDxG+gg
         rCuUeSKKiGYcIyloePZCV7fA0OrRCiVevEU5gqZB0n7hFm9XyaA8TnCTCU0TvwPP1xoc
         wXc7GUoj9EHxBfS99UeFPpPGQtXZ1AJnOVRmbP8EXEroYuNI8jUg/f7Nr8q6EqnkhgdO
         cTkiVzzYiPpQPm6VxINj7rq+HHZ/oAirO8J6nqVvPXhmjTvVO79KpEaTuGyNW0wr04Si
         N8ck7xsfI1fXi/iYKVdkBKnXfL068mtCEjzNda6iSuLkQD7VHXH56dncWrrnXZml+sRX
         gf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ep/FDpznCUD5t+mHArGEFOrAw8wvHgkG6nK9cK6sVyI=;
        b=kvGFJTOrSu5/fI9V62O3XD1rHae2XvIlsJic+6NkIqjcY9SlPq3slKTGkd30LQEMyv
         wC/NTf/V+nmib2ZZdTAoS6cLGq/5H43QwDwUdbRwujVe1l8WbCNkkycevbfzz9Ek9lHx
         VdF+V1U7qJebQRG/oOgC2kiDYYATVGaJNUSMRoUpDzplssVEqP3nmFsiZjJX+K3iNzG0
         4NuTjXEdoiLKIPRuzC79zlq8TyT6vGab30Z8yPTh+H3OxjmyJT/1xAdH+zBzxRB8Ts4X
         YjlOdX8/dKty8NhyFtdIgXxBxmsqwdM76StymBiu+3qk1eFLz2kthBa/GKfQQX4eGYMR
         I49Q==
X-Gm-Message-State: AOAM531xGZeNec840YkZan1tpF2klH116u8+S7JzQ9PN8uCvyJFOS6/+
        9OorNcb3I4/C7GG7MtGqu9RTnGhEDv7DKA==
X-Google-Smtp-Source: ABdhPJzu1HV7VjUbMAXR0rnJs5YczWEuPmQWyg76b138n5O2o5n62VdmwC0PMMfFUmG2/zltjp8qLg==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr4669657wrr.82.1612976703183;
        Wed, 10 Feb 2021 09:05:03 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id f8sm3816175wrp.65.2021.02.10.09.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 09:05:02 -0800 (PST)
Date:   Wed, 10 Feb 2021 17:05:00 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: make kgdb depend on FPU support
Message-ID: <20210210170500.3osd7agp4kpmygwk@maple.lan>
References: <20210122110307.934543-1-arnd@kernel.org>
 <20210122110307.934543-2-arnd@kernel.org>
 <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk>
 <20210210113830.xeechzpctz5repv5@maple.lan>
 <alpine.DEB.2.21.2102101252580.35623@angie.orcam.me.uk>
 <20210210122929.rgqfkoop4rsso3yo@maple.lan>
 <alpine.DEB.2.21.2102101444140.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102101444140.35623@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 03:15:10PM +0100, Maciej W. Rozycki wrote:
> On Wed, 10 Feb 2021, Daniel Thompson wrote:
> 
> > >  NB if GDB sees a register padded out (FAOD it means all-x's rather than a 
> > > hex string placed throughout the respective slot) in a `g' packet, then it 
> > > will mark the register internally as "unavailable" and present it to the 
> > > receiver of the information as such rather than giving any specific value.  
> > > I don't remember offhand what the syntax for the `G' packet is in that 
> > > case; possibly GDB just sends all-zeros, and in any case you can't make 
> > > GDB write any specific value to such a register via any user
> > > interface.
> > 
> > kgdb doesn't track register validity and adding would be a fairly big
> > change. Everything internally (including some of the interactions with
> > arch code) is based on updating a binary shadow of register state which
> > is only bin2hex'ed just before transmitting a packet.
> 
>  I've had a peek and it doesn't appear to me it would be a big deal.
> 
>  We have `gdb_regs' defined as an array of longs.  We'd just need a second 
> array for a register validity bitmap, which could for simplicity just have 
> a single bit per each byte of `gdb_regs'.  It would then be updated in 
> `pt_regs_to_gdb_regs' according to the result of `dbg_get_reg' across the 
> number of bits given by `dbg_reg_def[i].size'.  And then `kgdb_mem2hex' 
> would interpret the bitmap given as an extra argument accordingly.
> 
>  It looks to me like a couple of lines of extra code really.

Agree, the core changes aren't too bad.

I was more concerned about whether the validity bits would leak into the
arch specific code via sleeping_thread_to_gdb_regs() and also noted the
effort needed to review each architectures dbg_get_reg() implementation
if we are going to react differently to it's return value.

It is still not an infeasible amount of work though if someone
does want to go in this direction.


Daniel.
