Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551F21AA41B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 15:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506270AbgDONRu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 09:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2506263AbgDONRr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 09:17:47 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB773C061A0C;
        Wed, 15 Apr 2020 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586956665;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ggeVHX1ECoHuxb0UgkenFd/4IT/OkoIPA4CW4OSiH4U=;
        b=tSk0cJVb5H6mQx63QImPqo27RrhaPv2mCMy/yhh3brjy8By+psy+Q0bbn3JXTtkz4X
        q4tfGCwNiaca/V/WUG837rYs+lHilJIWpBxoPA+FK+fjl6ETB8/UqiALsVMUaM6MAGDV
        bngvkgzNa6QOlwnd1/iLmIkh2Y0rgsSqYlJIFpMlWPmxUu/4PJfI4mUZ9CAVpb+fjqkI
        I2u5BiZPGWJfZus5K6ekldodYXIYrcSDWARM+hIeQAxG3Zvk1dXxL0Mt5gt0u+5nFtVu
        u/KYQCpSXmJz2uCmyZWaq8zaRh02wg8OXjtpoCE1MVlsrap/37j6djKWd5M0b7CeD7zO
        cK/A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FDHP26i
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 15:17:25 +0200 (CEST)
Subject: Re: [PATCH v6 01/12] dt-bindings: add img, pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
Date:   Wed, 15 Apr 2020 15:17:25 +0200
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        James Hogan <jhogan@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-samsung-soc@vger.kernel.org, letux-kernel@openphoenux.org,
        Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Vetter <daniel@ffwll.ch>, kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <535CAEBE-F43E-4BFC-B989-612C81F0D7EF@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com> <20200415101251.o3wi5t6xvf56xmhq@gilmour.lan> <72919514-0657-4B71-902F-3E775E528F64@goldelico.com> <f4fdca8a-d18c-a8d2-7f51-d1ebbbab3647@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Neil,

> Am 15.04.2020 um 14:54 schrieb Neil Armstrong <narmstrong@baylibre.com>:
> 
> Hi,
> 
> On 15/04/2020 14:43, H. Nikolaus Schaller wrote:
>> 
>>> Am 15.04.2020 um 12:12 schrieb Maxime Ripard <maxime@cerno.tech>:
>>> 
>>> Hi,
>>> 
>>> On Wed, Apr 15, 2020 at 10:35:08AM +0200, H. Nikolaus Schaller wrote:
>>>> The Imagination PVR/SGX GPU is part of several SoC from
>>>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>>>> Allwinner A83 and others.
>>>> 
>>>> With this binding, we describe how the SGX processor is
>>>> interfaced to the SoC (registers, interrupt etc.).
>>>> 
>>>> In most cases, Clock, Reset and power management is handled
>>>> by a parent node or elsewhere (e.g. code in the driver).
>>> 
>>> Wouldn't the "code in the driver" still require the clock / reset /
>>> power domain to be set in the DT?
>> 
>> Well, some SoC seem to use existing clocks and have no reset.
>> Or, although not recommended, they may have the io-address range
>> hard-coded.
> 
> The possible clocks and resets should be added, even if optional.
> 
> Please look at the arm utgard, midgard and bifrost bindings.

Interesting to compare to. Maybe we should also add the
$nodename: pattern: '^gpu@[a-f0-9]+$'

But the sgx binding is difficult to grasp here. Some SoC like the
omap series have their own ti,sysc based target modules and the
gpu nodes is a child of it lacking any clock and reset references
for purpose.

The jz4780 and some other need a clocks definition, but no reset.
Having a reset seems to be an option for the SoC designer and
not mandated by img. So is it part of the pvrsgx bindings or the
SoC?

Well we could add clocks and resets as optional but that would
allow to wrongly define omap.

Or delegate them to a parent "simple-pm-bus" node.

I have to study that material more to understand what you seem
to expect.

BR and thanks,
Nikolaus Schaller


