Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AC341C67C
	for <lists+linux-mips@lfdr.de>; Wed, 29 Sep 2021 16:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343853AbhI2ORR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Sep 2021 10:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343804AbhI2ORQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Sep 2021 10:17:16 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639ACC061760
        for <linux-mips@vger.kernel.org>; Wed, 29 Sep 2021 07:15:35 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so3019668ota.6
        for <linux-mips@vger.kernel.org>; Wed, 29 Sep 2021 07:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1bOpTf6Jukz1rQn04/kh8ik747nwWUC8rE65lhqO1Xs=;
        b=MLodxKDCjbPbVfHqmbcLc+lFz7Fm4nAzcqoQdx/1K7UeQ8nwYJyY9ZgA2Viz20B1Wf
         FHqkYzOZFhsSWsnJyzin379oB7znNmpJnokdu8kAnQKBU1z0UmsmeSGDtWoZuzX2X8Fk
         lJYSuwZwGQW0BhwNYWdBnNh4lKmHhHBKx3X3b5X9fBrRGdWjm/MeGfr0jJAwCMhE6DoP
         DNQv24J1CTfdOSXLezlSaN00GTfkp2rpHcNAxUNxpBKFHdL3jRSaTXs2geRHaYhVDMuO
         0YTHrb/j5JJfDzPIkXN+WMGpSKYtRpZvvGBWdf+KOnDRFnVY8mBeUnh0VzB3NX56xC8u
         e4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1bOpTf6Jukz1rQn04/kh8ik747nwWUC8rE65lhqO1Xs=;
        b=NA7Rno1YyoGY5IW5/8yp+yRU2ziaORMRPdBbR96mxkeQlPJzIta/ftAOPLyjykDVS2
         tdO8E2mHc4bWXd39vhrMxtLPyaOHky4IlnmAJ49nXEEhvbQxez1eSiXpo4YtQFQR0prC
         BXCnJn6AzqdoMt30+9hUOqi5u+0d3g1Ez8cxikRJu08O0EINTGZGI/ZKmkB9x4TTIjhF
         IOoMjfie62iIQ+BQsnSH7y0YAGqinWcbGG0N30QVdIAH7twjWFRlGR/0RxW8DKt3bRfU
         82khDXd0FrsS3Nzkmk/+G5S4MCAKli94Id9lHRQwRsOa8gLCVtApqPRguXccF3uF3Nhe
         fJbw==
X-Gm-Message-State: AOAM5322icquN/iwh5qj5vpF1DjfDaGOixGqkoQVIcDB7ERbvO8RH9yT
        vu501CPwRlVQmbCL14LG0vDuzw==
X-Google-Smtp-Source: ABdhPJy89LkTd283QjwrvqhgJMbYUlI7RUIpOdWGGkYh7mMYYiT+wqNtJ9odI5KEX39BP+qpFI+L7A==
X-Received: by 2002:a05:6830:455:: with SMTP id d21mr228973otc.300.1632924934665;
        Wed, 29 Sep 2021 07:15:34 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s29sm468815otg.60.2021.09.29.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:15:34 -0700 (PDT)
Date:   Wed, 29 Sep 2021 09:15:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <YVR1A18fEAuFfCoj@yoga>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928083751.GG9223@ediswmail.ad.cirrus.com>
 <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
 <20210928092400.GH9223@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928092400.GH9223@ediswmail.ad.cirrus.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue 28 Sep 04:24 CDT 2021, Charles Keepax wrote:

> On Tue, Sep 28, 2021 at 10:51:36AM +0200, Arnd Bergmann wrote:
> > On Tue, Sep 28, 2021 at 10:37 AM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > > I guess the question might be where else would said code go?
> > > drivers/firmware seemed most obvious, all the other locations
> > > I can think of don't really make sense. Can't really put it a bus
> > > like spi/i2c etc. because we have parts on many buses. Can't
> > > really put it in a functional subsystem (audio/input etc.) since
> > > the whole idea was to try and get some independence from that so
> > > we don't have parts including subsystems they don't use. Could
> > > maybe put it in MFD, but no hard guarantee every part using it
> > > will be an MFD device and I am fairly confident Lee will feel it
> > > isn't MFD code as it doesn't relate to managing multiple devices.
> > > Only other option I can think of would be to make some sort of
> > > drivers/dsp or maybe drivers/cs_dsp, but not clear to me that is
> > > obviously better than using drivers/firmware.
> > 
> > Other DSPs use the drivers/remoteproc/ subsystem, but that
> > is more for general-purpose DSPs that can load application
> > specific firmware rather than loading a single firmware blob
> > as you'd normally do with the request_firmware() style interface.
> > 
> > Not sure if that fits what you do. Can you point to a high-level
> > description of what this DSP does besides audio, and how
> > flexible it is? That might help find the right place for this.
> 
> Hm... wasn't aware of that one, we should probably investigate that
> a little more at this end. From a quick look, seems a bit more like
> it is designed for much larger more general purpose probably memory
> mapped DSPs. I guess our code is a little more firmware parsing
> and loading, and a bit less generic remote proceedure call stuff.
> 

You're correct, remoteproc tends to situations where you have
multi-function firmware; be it at a single point in time, or due to
different firmware choices. Where you essentially boot some firmware on
the remoteproc and from that instantiate one of more functional devices
based on the loaded firmware.

> I am not sure there is great deal available publically on the
> DSP core. It is talked about in a few of our datasheets, see
> section 4.4 in [1]. But a basic description might be it is a
> signal processing focused, very small DSP core. If can be loaded
> with different firmwares at runtime, and indeed might be doing say
> echo cancellation in one use-case, or always on voice detect in
> another. Functionally it is very unlikely to be used for anything
> besides signal processing inside the device it is in, since it is
> typically quite integrated with that hardware and will be sitting
> behind a slow bus, like I2C or SPI.
> 

To me it sounds like the main difference compared to above is that you
have a single function that owns and controls the DSP and implements
that function - i.e. the audio driver probes, boots the DSP, if there's
a problem the audio driver will handle it etc.


When it comes to firmware parsing, that might be a somewhat unrelated
topic. E.g. in the Qualcomm case, the same customized ELF header is used
in both for remoteproc devices and in function-specific devices. For
this we extracted the relevant functions into a library of some common
helpers, which can be found in drivers/soc/qcom/mdt_loader.c.

Regards,
Bjorn

> Current users are all audio, planning to upstream some haptics
> parts soon, with possible other uses in the future.
> 
> [1] https://statics.cirrus.com/pubs/proDatasheet/CS48L32_DS1219F4.pdf
> 
> Thanks,
> Charles
