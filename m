Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0471D477F
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgEOH6s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 03:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726708AbgEOH6r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 03:58:47 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8CAC061A0C;
        Fri, 15 May 2020 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589529524;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=BlFVs+ve08LHwN7Uvu0hVD6GgM0+61h79p2IJC+S0j0=;
        b=PKXsO+RPOPgskbFCzDFhDroaXIImvP6pbOse2kXKSoXd/RydTZvTqG7ixZ3H4My6cg
        qiJd4o1RdcT9i4U4iZOjahCZfu0iA32TrSa5LQN5i/qWU3BXuosi8knTNzqOTwl5glWe
        VgAHzBnAFN0veaKzT2e0nOuS4+I5JDJ8VsvqA3saguzUi+llKrlWb+z5ctw3USJ5u30O
        sL9n9ii2u81PVWgzb6Pu2UvYz01ks17ZudXRjYS5MyoqHQTcdnP9Vh8S/g42oZ+6KKYZ
        yLjlDwk0mTNsFn0+FPvBXJrWenPnkEAkboZ6fOine7w6U1EbDIKWSDqbjsrgHcuo62mw
        rQ8Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw4F7wWYfs
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 15 May 2020 09:58:32 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200503150143.GG37466@atomide.com>
Date:   Fri, 15 May 2020 09:58:31 +0200
Cc:     Paul Cercueil <paul@crapouillou.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A411DCE-A882-4868-9265-532D79922F6E@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <NMCE9Q.LWG45P20NBVJ@crapouillou.net> <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com> <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net> <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com> <8EER9Q.C206SXNSICP7@crapouillou.net> <20200503150143.GG37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tony,

> Am 03.05.2020 um 17:01 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Paul Cercueil <paul@crapouillou.net> [200503 14:19]:
>> You have a new SoC with a SGX, and you only need to enable one clock =
to get
>> it to work. So you create a devicetree node which receives only one =
clock.
>>=20
>> Turns out, that the bootloader was enabling the other 3 clocks, and =
since
>> the last release, it doesn't anymore. You're left with having to =
support a
>> broken devicetree.
>>=20
>> That's the kind of problem that can be easily avoided by enforcing =
the
>> number of clocks that have to be provided.
>=20
> The number of clocks depends on how it's wired for the SoC.
>=20
> On omaps, there's are no controls for additinoal SGX clocks. Sure some
> of the clocks may be routed to multple places internally by the =
wrapper
> module. But we have no control over that.
>=20
> If we wanted to specify just the "fck" clock on omaps, then we can
> do it with something like this:
>=20
> allOf:
>  - if:
>    properites:
>      compatible:
>        enum:
> 	  - "ti,omap4-sgx544-112"
> 	  - "ti,omap5-sgx544-116"
> 	  - "ti,dra7-sgx544-116"
>    then:
>      properties:
>        clocks:
> 	  minItems: 1
> 	  maxItems: 1
>=20
>        clock-names:
> 	  const: fck
>=20
>    required:
>      - clocks
>      - clock-names

will add to v8 of this series as a separate patch on top of the
general one. This should make it easier to have a focussed discussion
and revert/bisect if something goes wrong.

BR and thanks,
Nikolaus

