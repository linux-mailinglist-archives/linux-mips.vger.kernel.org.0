Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210803166BA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 13:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhBJMcI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 07:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbhBJMaN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 07:30:13 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011D5C061574
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 04:29:33 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j11so1677465wmi.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HSBGzyNlTheaTP9Pm689kFtenx8ASuk2y6uL2Tc/WCo=;
        b=ja8uBoCHnX3lV+218wuF4ozP9tqIM2twFANPvabPFO9wvMTYXLQfh8QD46knAfpuMN
         EmVCvgfqXLC0BwOPAqhj24425FF98V2EcIEOFDvxhjDl/LYym/D80JGuM/astu89Q6QU
         jQ1x6wNKProSzpJHYNZO6b5d3UDcgJ43ManuVMdqQesg6SEmz8qyfYE7gW/uUJ+VtfD2
         SGccTg91+1RR0uB/lUsQDCp+VfhPgSN2UrxntP3WOOz1d226AyI5+uFud9KZVI/a73Qc
         r0bYtcmwIo/L4Wxt7QZiVUe1rMqML0+AgIAEWOKw9C+hCUdzedpRdcFe9cDabgssblUf
         5kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HSBGzyNlTheaTP9Pm689kFtenx8ASuk2y6uL2Tc/WCo=;
        b=Z+I+Tv/hMs5ozboEKjVIMIcR2Fzutt+XfWdN/IH4OjF00NsGGYYoZdhNRGCLDEAcl7
         XstQGCI+ugun2PBjNo+LpCmWsgIlWQ4JnPIsNGniz4DWg9p2UhGp1FLcnsonppVYLIs8
         s4qTJQBeGZ67fllZR18BoIZDPBDJUrUFoLAjuIH9Ii17ZjCvsOxeCTjUkCS55jEO/POl
         rPNs9hPXHQQGc9wU1rXvxnM7kLePP8JcJcwoVFiwl6cM14vzMfd2m9wAeiBh4n8Nzdmk
         vqk3qV9PUFSbDkrPPVRsaJ3QOB49f8eEJT6aXDvAlXJRd5Xp1EopMlVoGobyIwB3Or14
         OC+A==
X-Gm-Message-State: AOAM530rcgVfKzDnkVXehTkFgAfL5eD5wQNd6Ps5ThAis0QtdORNRrfq
        ds6wPU/qfOiVOjgdn2ABLN5OGw==
X-Google-Smtp-Source: ABdhPJy8lL+GC/UgvYW10eu0d2mdCe/coatt2HAvvEKb9SYiGAKLYi3dUtCIF2vTvX8AshBPeMzWQA==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr2732673wmi.35.1612960171708;
        Wed, 10 Feb 2021 04:29:31 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id m18sm11864608wmq.1.2021.02.10.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:29:31 -0800 (PST)
Date:   Wed, 10 Feb 2021 12:29:29 +0000
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
Message-ID: <20210210122929.rgqfkoop4rsso3yo@maple.lan>
References: <20210122110307.934543-1-arnd@kernel.org>
 <20210122110307.934543-2-arnd@kernel.org>
 <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk>
 <20210210113830.xeechzpctz5repv5@maple.lan>
 <alpine.DEB.2.21.2102101252580.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102101252580.35623@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 01:11:28PM +0100, Maciej W. Rozycki wrote:
> On Wed, 10 Feb 2021, Daniel Thompson wrote:
> 
> > >  Wrapping the relevant parts of this file into #ifdef MIPS_FP_SUPPORT 
> > > would be as easy though and would qualify as a proper fix given that we 
> > > have no XML description support for the MIPS target (so we need to supply 
> > > the inexistent registers in the protocol; or maybe we can return NULL in 
> > > `dbg_get_reg' to get them padded out in the RSP packet, I haven't checked 
> > > if generic KGDB code supports this feature).
> > 
> > Returning NULL should be fine.
> > 
> > The generic code will cope OK. The values in the f.p. registers may
> > act a little odd if gdb uses a 'G' packet to set them to non-zero values
> > (since kgdb will cache the values gdb sent it) but the developer
> > operating the debugger will probably figure out what is going on without
> > too much pain.
> 
>  Ack, thanks!
> 
>  NB if GDB sees a register padded out (FAOD it means all-x's rather than a 
> hex string placed throughout the respective slot) in a `g' packet, then it 
> will mark the register internally as "unavailable" and present it to the 
> receiver of the information as such rather than giving any specific value.  
> I don't remember offhand what the syntax for the `G' packet is in that 
> case; possibly GDB just sends all-zeros, and in any case you can't make 
> GDB write any specific value to such a register via any user
> interface.

kgdb doesn't track register validity and adding would be a fairly big
change. Everything internally (including some of the interactions with
arch code) is based on updating a binary shadow of register state which
is only bin2hex'ed just before transmitting a packet.

It will simply default them to zero and update them on a 'G' packet.

>  The way the unavailability is shown depends on the interface used, i.e. 
> it will be different between the `info all-registers'/`info register $reg' 
> commands, and the `p $reg' command (or any expression involving `$reg'), 
> and the MI interface.  But in any case it will be unambiguous.

I guess this probably does create a technical protocol violation since
kgdb will reject per-register read/write for register that its report
says are zero rather then invalid.


Daniel.
