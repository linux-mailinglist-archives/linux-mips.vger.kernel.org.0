Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AA11D4789
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 10:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgEOIAC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 May 2020 04:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726665AbgEOIAB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 May 2020 04:00:01 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B616DC061A0C;
        Fri, 15 May 2020 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589529599;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bU5sZyM8w1KL+vZGRsgMWFgVeXL93IV+Cv0ulYGm/2A=;
        b=alnaWxEKpSA1rBoOXT48vSrULu+RI/e0xU9nCHnHdNqFFUxURjBx/tqciU56QRYToV
        lvvNzBP0USnQxUNjHyNOZzserzEEtxrlralZhKQs69D8sV+v5tSnksi/kE7gDfUf2QOh
        bmjr/IRKqF+Rz/mNI42AX/0FiOV/WYsCEA2aquMHqrXk+1zs42Z3Y7fRRWHAc2h+E+fg
        dfWya5oxkzcYQtFjGvvsJIi69fdWBi4DptQ1qPDzSFL9PVnA5GPYRM1YgHDhDG7BdJQB
        VZ3fTnEpXqRdhwOz+Xcw+xs4/1+uYVPIXyqi7WklPvHbYwJs+fMR+wUivSoxWHP58UxB
        lHSA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOvBTU="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw4F7xbYgL
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 15 May 2020 09:59:37 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200505155311.GA18025@bogus>
Date:   Fri, 15 May 2020 09:59:36 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
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
Message-Id: <DD3BF759-4F3D-4147-9A80-DB6C18B13400@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <20200505155311.GA18025@bogus>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 05.05.2020 um 17:53 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Fri, Apr 24, 2020 at 10:34:04PM +0200, H. Nikolaus Schaller wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>>=20
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers and interrupt).
>>=20
>> The interface also consists of clocks, reset, power but
>> information from data sheets is vague and some SoC integrators
>> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
>> all clock, reset and power-management through registers
>> outside of the sgx register block.
>>=20
>> Therefore all these properties are optional.
>>=20
>> Tested by make dt_binding_check
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 =
++++++++++++++++++
>> 1 file changed, 150 insertions(+)
>> +    oneOf:
>> +      - description: SGX530-121 based SoC
>> +        items:
>> +          - enum:
>> +            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora =
600MHz and similar
>=20
> Should be indented 2 more here and elsewhere where you have a list=20
> under a list.

added for patch v8 series.

BR and thanks,
Nikolaus

