Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493901B3881
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 09:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgDVHLL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 03:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725907AbgDVHLL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Apr 2020 03:11:11 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED86C03C1A6;
        Wed, 22 Apr 2020 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587539467;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=x9g4xzih9SHZrw00RWoUucyKrGmw7cFSE/C08UHHhbo=;
        b=Yp8bxIcS44j849A4MQvicvK+yl4C/uCwDApU0g29MmNVcsvsvTuHIxW7Wto7j197z5
        L/kKtTxuuE6CG2/5RL0QZALxSiwemqThf8bOHNIz2OelEWuYlKXdwItCeKamyLUEhUKu
        aXNEUs4mRpVdtGsS/GqYALWb7M5mUrqPCCyusa48oz/SoYsR0a3FmBZxcgXBPOqrqxVS
        hCJMkxsZXJcTtXwyTqkQQHtp3CB9zTUo1AbAJa98QSgeyHi6M3S0SRVYUMqJ1L1+t5T5
        YykSgrFeiE3kQ8VN5618m3/R4uS5M0DC065X+0zrl1hZJOpevb71xhVx/zyr09+VGDGv
        dBdw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCym3NRQH2PRBNS67Wq1XcMUsV9wfG0LbuNrxINn"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:263a:4100:a53d:b96b:debd:cf9d]
        by smtp.strato.de (RZmta 46.6.1 AUTH)
        with ESMTPSA id e09987w3M7Ao19A
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 22 Apr 2020 09:10:50 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
Date:   Wed, 22 Apr 2020 09:10:57 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
References: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan> <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com> <20200415130233.rgn7xrtwqicptke2@gilmour.lan> <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com> <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com> <20200420073842.nx4xb3zqvu23arkc@gilmour.lan> <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> On Tue, Apr 21, 2020 at 07:29:32PM +0200, H. Nikolaus Schaller wrote:
>>=20
>>> Am 21.04.2020 um 16:15 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> * Maxime Ripard <maxime@cerno.tech> [200421 11:22]:
>>>> On Tue, Apr 21, 2020 at 11:57:33AM +0200, Philipp Rossak wrote:
>>>>> I had a look on genpd and I'm not really sure if that fits.
>>>>>=20
>>>>> It is basically some bit that verify that the clocks should be =
enabled or
>>>>> disabled.
>>>>=20
>>>> No, it can do much more than that. It's a framework to control the =
SoCs power
>>>> domains, so clocks might be a part of it, but most of the time it's =
going to be
>>>> about powering up a particular device.
>>>=20
>>> Note that on omaps there are actually SoC module specific registers.
>>=20
>> Ah, I see. This is of course a difference that the TI glue logic has
>> its own registers in the same address range as the sgx and this can't
>> be easily handled by a common sgx driver.
>>=20
>> This indeed seems to be unique with omap.
>>=20
>>> And there can be multiple devices within a single target module on
>>> omaps. So the extra dts node and device is justified there.
>>>=20
>>> For other SoCs, the SGX clocks are probably best handled directly
>>> in pvr-drv.c PM runtime functions unless a custom hardware wrapper
>>> with SoC specific registers exists.
>>=20
>> That is why we need to evaluate what the better strategy is.
>>=20
>> So we have
>> a) omap which has a custom wrapper around the sgx
>> b) others without, i.e. an empty (or pass-through) wrapper
>>=20
>> Which one do we make the "standard" and which one the "exception"?
>> What are good reasons for either one?
>>=20
>>=20
>> I am currently in strong favour of a) being standard because it
>> makes the pvr-drv.c simpler and really generic (independent of
>> wrapping into any SoC).
>>=20
>> This will likely avoid problems if we find more SoC with yet another
>> scheme how the SGX clocks are wrapped.
>>=20
>> It also allows to handle different number of clocks (A31 seems to
>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx =
bindings
>> or making big lists of conditionals. This variance would be handled
>> outside the sgx core bindings and driver.
>=20
> I disagree. Every other GPU binding and driver is handling that just =
fine, and
> the SGX is not special in any case here.

Can you please better explain this? With example or a description
or a proposal?

I simply do not have your experience with "every other GPU" as you have.
And I admit that I can't read from your statement what we should do
to bring this topic forward.

So please make a proposal how it should be in your view.

BR and thanks,
Nikolaus

