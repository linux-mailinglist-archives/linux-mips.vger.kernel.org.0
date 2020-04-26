Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75C91B941D
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 23:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgDZVAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 17:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726188AbgDZVAO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 17:00:14 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5713C061A0F;
        Sun, 26 Apr 2020 14:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587934810;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=tBYDlL7NzsOjZoE8VbUARgLNfJnA9ln8lbc1BWfhqMY=;
        b=ioyxdgjksphjE/lgw3XV/4d4tS9NkGCZK81PjoM0Vhy1ONEL1TNPSRJdwmbLA1OzNH
        V1EkPNj5fBScYUyfVy4WfxfAWq7n2eLTogwCSQE+Sv9pxBaw4Myxmth2q4tPnP4QzLuJ
        sicQp+NNP0Y2cb4uiGNF2ISTAP8mfa9rBe5VwvLoegITAJ/6BnEwfRp/d7tP3nyU/1rp
        S7VbqbTrcZ8DJ4/l+gErg52rN0+bitsgyUltsq02uy8MMNQVpOJL2rrPRdou5PKebGsX
        puz2HrWtDc4a8yYDM1J0El7/uh1wEpBez83OkRsPIuw0lK1GG1fXbArpT/udiPXYUStl
        Ax3w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDOjwps="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3QKxSHt5
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 22:59:28 +0200 (CEST)
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9d9998cc-33bf-7d8f-658b-8d6218338135@gmail.com>
Date:   Sun, 26 Apr 2020 22:59:28 +0200
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
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
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0D48517E-8F66-4B27-953B-1C27F8A8DE0A@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com> <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com> <9d9998cc-33bf-7d8f-658b-8d6218338135@gmail.com>
To:     Philipp Rossak <embed3d@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Philipp,

> Am 26.04.2020 um 21:36 schrieb Philipp Rossak <embed3d@gmail.com>:
>=20
> Hi Nikolaus,
>=20
> On 24.04.20 22:34, H. Nikolaus Schaller wrote:
>> The Imagination PVR/SGX GPU is part of several SoC from
>> multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
>> Allwinner A83 and others.
>> With this binding, we describe how the SGX processor is
>> interfaced to the SoC (registers and interrupt).
>> The interface also consists of clocks, reset, power but
>> information from data sheets is vague and some SoC integrators
>> (TI) deciced to use a PRCM wrapper (ti,sysc) which does
>> all clock, reset and power-management through registers
>> outside of the sgx register block.
>> Therefore all these properties are optional.
>> Tested by make dt_binding_check
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 =
++++++++++++++++++
>>  1 file changed, 150 insertions(+)
>>  create mode 100644 =
Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml =
b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> new file mode 100644
>> index 000000000000..33a9c4c6e784
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Imagination PVR/SGX GPU
>> +

...

>> +      - description: SGX544-112 based SoC
>> +        items:
>> +          - const: ti,omap4470-sgx544-112
>> +          - const: img,sgx544-112
>> +          - const: img,sgx544
>> +
>> +      - description: SGX544-115 based SoC
>> +        items:
>> +          - enum:
>> +            - allwinner,sun8i-a31-sgx544-115
>> +            - allwinner,sun8i-a31s-sgx544-115
> those two bindings are wrong.
> It should be allwinner,sun6i-a31-sgx544-115 and =
allwinner,sun6i-a31s-sgx544-115. I did a copy paste error in the patches =
that I provided for this series.

Ok, noted for v8.

BR and thanks,
Nikolaus

