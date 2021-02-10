Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C37E316566
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 12:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhBJLm3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 06:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhBJLkV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 06:40:21 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77B7C061797
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 03:38:33 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q8so2051679wru.13
        for <linux-mips@vger.kernel.org>; Wed, 10 Feb 2021 03:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4rVMlP6gjKEMU63mGD7671tvTyj9ZrG88p6nRruDhD4=;
        b=p+ZA4r4TVfUrnZEfFnCd4KrXSrjCFPfAoCXkwDVb+g+0YP5QvF640W8kPI8xhn2h/X
         RaWcQtC8Vv1HKNhNaNO6nBAYIxzVbFCdTwl+ZcCpv4t0J9tybTQJzBNzeZ+v6ERAMNRX
         nAKrbYTXLfbZwM5EOuj/nQhPIvQX7L5WVtblJHqwlbw4/pGwZTgDpb6r3Se5WwvAEhTI
         4sMreTWc++yMZ9Cniv2TEy8QnMGe6j0p5DX4CTWekgUsPPRc6gxIY4o3bG98lhRQuuX7
         2HnGNCQaZVSSYDznUIkyKYM/yHEuZibq8t5AaBwK0zLQgbd2xF6wN3/bMy1MbaOxr9Fa
         zPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4rVMlP6gjKEMU63mGD7671tvTyj9ZrG88p6nRruDhD4=;
        b=G5IxHRmFYT1SzmJ6aj3iMeqJHxbfJR0VPkB8tqHMcwO72rlslptgEYDPA23uAGZ0vI
         DEoWTDHqWlJMHDTOqdY1TaLdMY/TZUrDkWJ5xSFAWhvyXoOG6h5twIkKq/WDzlT7RnCi
         01QrSC2y9gsGbV01X7qql3ckw+buxG/ikY8LO7kbeIGzcvO1HZYGo4+NyE/QIeCGCjgr
         3D3fM/t8T3Ttc4+ql6K6FD0qtp8GLQTWu7Mijb45pVXdleRWdygz6Kde8jPdBkkH/4U/
         VmXIP+SdlBJ5UaJCyOYAJ+ieewe7khLbbt8CwYyAgn8iY40Bt8sycniQfbxe/o11pjp+
         8Y0w==
X-Gm-Message-State: AOAM533v4/moZaV1RQnNiZujj1h+e1LMXoJfdWNwoixdlhCyg8qhdp5k
        9ZOEqzJP2WPS8bdqUBnJNQs2zA==
X-Google-Smtp-Source: ABdhPJxenO/CxL4IFitEtlZPB+o7QMqk6v4NdIgkJGXMIYWJgtUiJQHJ3TNJZ43z/uypizwijnpCGA==
X-Received: by 2002:a5d:5010:: with SMTP id e16mr3107436wrt.202.1612957112546;
        Wed, 10 Feb 2021 03:38:32 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id k11sm2680097wrl.84.2021.02.10.03.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 03:38:31 -0800 (PST)
Date:   Wed, 10 Feb 2021 11:38:30 +0000
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
Message-ID: <20210210113830.xeechzpctz5repv5@maple.lan>
References: <20210122110307.934543-1-arnd@kernel.org>
 <20210122110307.934543-2-arnd@kernel.org>
 <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102081748280.35623@angie.orcam.me.uk>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 08, 2021 at 06:03:08PM +0100, Maciej W. Rozycki wrote:
> On Fri, 22 Jan 2021, Arnd Bergmann wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > kgdb fails to build when the FPU support is disabled:
> > 
> > arch/mips/kernel/kgdb.c: In function 'dbg_set_reg':
> > arch/mips/kernel/kgdb.c:147:35: error: 'struct thread_struct' has no member named 'fpu'
> >   147 |    memcpy((void *)&current->thread.fpu.fcr31, mem,
> >       |                                   ^
> > arch/mips/kernel/kgdb.c:155:34: error: 'struct thread_struct' has no member named 'fpu'
> >   155 |   memcpy((void *)&current->thread.fpu.fpr[fp_reg], mem,
> > 
> > This is only relevant for CONFIG_EXPERT=y, so disallowing it
> > in Kconfig is an easier workaround than fixing it properly.
> 
>  Wrapping the relevant parts of this file into #ifdef MIPS_FP_SUPPORT 
> would be as easy though and would qualify as a proper fix given that we 
> have no XML description support for the MIPS target (so we need to supply 
> the inexistent registers in the protocol; or maybe we can return NULL in 
> `dbg_get_reg' to get them padded out in the RSP packet, I haven't checked 
> if generic KGDB code supports this feature).

Returning NULL should be fine.

The generic code will cope OK. The values in the f.p. registers may
act a little odd if gdb uses a 'G' packet to set them to non-zero values
(since kgdb will cache the values gdb sent it) but the developer
operating the debugger will probably figure out what is going on without
too much pain.


Daniel.
