Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048D01B236A
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 11:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgDUJ5i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 05:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725920AbgDUJ5h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 05:57:37 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A1EC061A0F;
        Tue, 21 Apr 2020 02:57:37 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id r26so2976110wmh.0;
        Tue, 21 Apr 2020 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WrPXEec4AITga6eSmOansPu77CmlHKFEwJJ/qpS6qN0=;
        b=XzIAztT+mPDZUOwemSpHeuMKwyyom6UpYVUgvy9sW+plkI+MKvLzF0WIelhE/s4fQd
         FdQLN8/mrEzy8YyT/vrCk46xeGu1rRAkl3J50y4Yh38jJwMBYr6JPXv4HDCOXp4X5cWG
         lxvpYer0iUja0i9/cnq6qi/aczhg7taK+V1C5VP87hlnsVyIEmOwnZhYslHgNhX3JXrD
         ORLG/NSj8yZZwwLlP2ddoTtJ2uTmIToQwF4ZS6XQPk0/a6yw1DpWbNWVJ5hwKCRc6n0c
         6wI68y7E6M8JbLE07W3iSrNsXtH7b30IUSO1Fnp/QOx08JPxGM7xlafgolcctTcz/meZ
         DFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WrPXEec4AITga6eSmOansPu77CmlHKFEwJJ/qpS6qN0=;
        b=MIbYpDbMej+FoMe+t0GbLxkeNs1fiQknuNQl9H3jV69KmxwnFzp1ky91n5vta7miFc
         Z2VTE4oB42lAtVfzMGvfg+KV3Mvg1zi/btMADJV4WqfjNSv5OhjlA4FZWPLWgtjQV48A
         0toR8hllXTZXNhknqbqPIRCg5tbJKDzdt3QJgV/pTegTp2n9Sb4MLSw6ULO9IoyfmlwA
         0b+cPKUgpPYOJnXZEvGPyeUFrixt3RoDDrDMXl3e4tK9eSJDKL/VmnQ9zwH8pq7Kdzrp
         46ypMAYK6lpcdbraUSMr+vwC7gOlpDyWOQzX3xlQXkkT/qGBhyPkCo6VC2PqIfP/PvWU
         q99A==
X-Gm-Message-State: AGi0PuYfXESpSPmUleg/XO59RGBrtpaNsXecCpX81yGFH9BsPgWHffX2
        Zewsh4XvY1VQ+yRn90GrY26wbYmh
X-Google-Smtp-Source: APiQypIk3cTAhoSv9SYqD5kOWe7sVp3s0kn28AOHHwlVh0ZbrjxfvG0bZNvA0N2HoKlsXm6HuX2Sig==
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr4188162wme.79.1587463055735;
        Tue, 21 Apr 2020 02:57:35 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:bc17:18d9:e349:724? ([2a02:810d:340:2e50:bc17:18d9:e349:724])
        by smtp.gmail.com with ESMTPSA id 17sm2751403wmo.2.2020.04.21.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 02:57:35 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        linux-mips@vger.kernel.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
References: <cover.1586939718.git.hns@goldelico.com>
 <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
 <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
 <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
From:   Philipp Rossak <embed3d@gmail.com>
Message-ID: <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
Date:   Tue, 21 Apr 2020 11:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 20.04.20 09:38, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 17, 2020 at 02:09:06PM +0200, Philipp Rossak wrote:
>>>> I'm a bit skeptical on that one since it doesn't even list the
>>>> interrupts connected to the GPU that the binding mandates.
>>>
>>> I think he left it out for a future update.
>>> But best he comments himself.
>>
>> I'm currently working on those bindings. They are now 90% done, but they are
>> not finished till now. Currently there is some mainline support missing to
>> add the full binding. The A83T and also the A31/A31s have a GPU Power Off
>> Gating Register in the R_PRCM module, that is not supported right now in
>> Mainline. The Register need to be written when the GPU is powered on and
>> off.
>>
>> @Maxime: I totally agree on your point that a demo needs to be provided
>> before the related DTS patches should be provided. That's the reason why I
>> added the gpu placeholder patches.
>> Do you have an idea how a driver for the R_PRCM stuff can look like? I'm not
>> that experienced with the clock driver framework.
> 
> It looks like a power-domain to me, so you'd rather plug that into the genpd
> framework.

I had a look on genpd and I'm not really sure if that fits.

It is basically some bit that verify that the clocks should be enabled 
or disabled. I think this is better placed somewhere in the clocking 
framework.
I see there more similarities to the gating stuff.
Do you think it is suitable to implement it like the clock gating?


>> The big question is right now how to proceed with the A83T and A31s patches.
>> I see there three options, which one do you prefer?:
>>
>> 1. Provide now placeholder patches and send new patches, if everything is
>> clear and other things are mainlined
>> 2. Provide now patches as complete as possible and provide later patches to
>> complete them when the R_PRCM things are mainlined
>> 3. Leave them out, till the related work is mainlined and the bindings are
>> final.
> 
> Like I said, the DT *has* to be backward-compatible, so for any DT patch that
> you are asking to be merged, you should be prepared to support it indefinitely
> and be able to run from it, and you won't be able to change the bindings later
> on.

I agree on your points. But is this also suitable to drivers that are 
currently off tree and might be merged in one or two years?

>> Since this GPU IP core is very flexible and the SOC manufactures can
>> configure it on their needs, I think the binding will extend in the future.
>> For example the SGX544 GPU is available in different configurations: there
>> is a SGX544 core and SGX544MPx core. The x stands for the count of the USSE
>> (Universal Scalable Shader Engine) cores. For example the GPU in the A83T is
>> a MP1 and the A31/A31s a MP2.
> 
> Mali is in the same situation and it didn't cause much trouble.
> 
Good to know.

>> In addition to that some of the GPU's have also a 2D engine.
> 
> In the same memory region, running from the same interrupts, or is it a
> completely separate IP that happens to be sold by the same vendor?
> 
What I know till now this is part of the PowerVR IP and not separated. 
So it should use the same memory region, clocks and interrupts.

Cheers
Philipp

