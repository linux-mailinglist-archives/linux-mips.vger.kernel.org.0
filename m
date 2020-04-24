Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650251B713C
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 11:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgDXJw2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 05:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726788AbgDXJw2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Apr 2020 05:52:28 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3758BC09B045;
        Fri, 24 Apr 2020 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587721943;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=EADzuRL+YsoGCLSE7b2pLcK0IVG9NS9sozBTxA+ffmU=;
        b=qX4Tgh9DexKEcEKY8O3CSB7UEzJZ1Er7j0iMt+mCqFDpmNz0mtEAMbNthQakqarUvS
        oezsCKUGyBkq1FlzG9KgCa6IAnZH81ggZ0FU+mT6Su2J/Heog5Qkh47YmFWPdeETREux
        Cw8Eo00uB9npN4Nxeih9vCYiFtvmRyS6yi900ttbFqufXoNqTOnrm9GwWXCODZ/Jh0QJ
        oURcz5yoIuaVxK04/Q061dqmzRwh1fdnLtKIU/7soLldpl2YL8QMysOWCg0MwofVlySv
        v09I/sy2HTmQi0tP+VzeDTKVHgPIDCSQu4v4yJ2xTMThHoLBtyJeiUOpuK+MLKTtB+JH
        XbQg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlabXA0JT7U="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3O9pgAHY
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 11:51:42 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200423203642.35ms4aarnv65tfp5@gilmour.lan>
Date:   Fri, 24 Apr 2020 11:51:42 +0200
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <A095F2EA-C6F8-47AD-A333-E19F7073581A@goldelico.com>
References: <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan> <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com> <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan> <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com> <43688597-4b99-8f4d-9ad5-548ddff07f52@baylibre.com> <71F2F964-32C7-41E6-8F1A-A73161EA1BB3@goldelico.com> <20200423203642.35ms4aarnv65tfp5@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

> Am 23.04.2020 um 22:36 schrieb Maxime Ripard <maxime@cerno.tech>:
>> My goal is to keep the bindings as minimalistic as possible. And reset
>> lines and power domains are (at least for those we have in the works)
>> not needed to make working systems.
>> 
>> Therefore, for clocks I also would start with a minimalistic approach
>> for a single optional GPU core clock and leave out reset and power
>> completely.
> 
> Like I said above, the DT is considered an ABI and you'll have to
> maintain backward compatibility (ie, newer kernel running with older
> DT).

Generally I fully agree to this rule (although I have experienced
that exceptions happen more often than I like).

But here, we don't have any older DT which define something about SGX.

We introduce SGX for the first time with bindings and DT in parallel.
So they are in sync.

Therefore, newer kernels with SGX support and older DT simply will
skip SGX and not load any drivers. So we can't break older DT and
older DT can't break SGX.

What we introduce is a DT code that is well hung and tested (originating
in vendor kernels). It is cast in a bindings.yaml where not everyone
is happy with for reasons outside the originally proposed DT.

For new SoC not yet supported, I don't see a need to touch the
existing ones.

This is because I only propose to *add* properties to the bindings
for devices that have not been supported with SGX before and are
not sufficiently covered by what exists.

So backward compatibility is a non-problem.

> Therefore, you won't be able to require a new clock, reset or
> power-domain later on for example.
> 
> I guess the question I'm really asking is: since you don't really know
> how the hardware is integrated at the moment,

Like I explained, we do not need to know and model all details about
the hardware integration. The register set of an SoC does not always
provide bits to control all signals we may see in a block diagram or
think they must exist.

We have a set of SoC where it is demonstrated to work without need
for more detailed knowledge about specific hardware integration.

So we know everything of importance for this initial set of SoC to
make it work.

> why should we have that
> discussion *now*. It's really not suprising that you don't know yet, so
> I'm not sure why we need to rush in the bindings.

Because:
* there are people who want to have upstream SGX support for an initial
  set of SoC *now*
* the discussion already lasts ca. 6 months since I posted v1,
  that should be enough and is not a rush
* it is not required to know more details to make a working system
* we will not gain more information by waiting for another year or two
* problems are not solved by postponing them
* there are DTS for some initial SoC, tested to work
* it is no longer possible to submit DT without bindings.yaml (or is it?)
* we just need to define a bindings.yaml for them, not invent something
  completely new
* we can start with a minimal bindings.yaml for the analysed SoC and
  *extend* it in the future if really needed
* we can discuss changes & extensions for the bindings when they are
  really proposed
* having this patch series upstream is a prerequisite for introducing
  the sgx kernel driver to staging

In other words: your suggestion to postpone everything will keep finished
work sitting in front of the door and rotting and blocking unfinished work...

And to be honest, we have postponed SGX support already for too long
time and could be much farther with more and broader community cooperation.
So we should not block ourselves.

So if you can contribute new information or proposals to specifically
improve the proposed bindings.yaml, you are very welcome. But please do
it *now*.

BR and thanks,
Nikolaus

