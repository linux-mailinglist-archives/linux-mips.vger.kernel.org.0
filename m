Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292EA1AA17D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 14:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369986AbgDOMmI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 08:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370024AbgDOMmG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 08:42:06 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94E1C061A0C;
        Wed, 15 Apr 2020 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586954523;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FKESjbpPziqBCtdf8D9+b48eIHzcaxzwb3aIpI4k59s=;
        b=O36EHHv91cdNv+91ItMQmSFElJQToXNgexnFLDkzLg2d4ijavO9erA12yMrCf7LyKx
        qdq79ROFNK2jPJxz3is8AAx1/tWPOsWBvhg/vtswZUgFPs3mL6RTZJTIAVc0hvZBc8ch
        IrwoEw5k91InhTM3ozWEtGisOqxsOa+Ut4ZB/IEf68f0fH8Yyv1iukl/GVHdgeOVGAVL
        QMaR66IfiRhDmNdb14n5PNTvVbHRBgRqPJudiSjNv9USfDEwKFrgL4m6jQxwtL91EzRO
        tfG4H0+bADgyY3bY4EUssNlgmw/6xZuvXyH78c43v7AHMOhVIFYDkYT2OleRoRYazgZY
        NXXQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PtwDConyM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3FCfq1v4
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 14:41:52 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
Date:   Wed, 15 Apr 2020 14:41:52 +0200
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
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E3401F1-A106-4396-8FE6-51CAB72926A4@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com> <20200415101008.zxzxca2vlfsefpdv@gilmour.lan>
To:     Maxime Ripard <maxime@cerno.tech>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maxime,

> Am 15.04.2020 um 12:10 schrieb Maxime Ripard <maxime@cerno.tech>:
>=20
> Hi,
>=20
> On Wed, Apr 15, 2020 at 10:35:07AM +0200, H. Nikolaus Schaller wrote:
>> * rebased to v5.7-rc1
>> * added DTS for for a31, a31s, a83t - by Philipp Rossak =
<embed3d@gmail.com>
>> * added DTS for "samsung,s5pv210-sgx540-120" - by Jonathan Bakker =
<xc-racer2@live.ca>
>> * bindings.yaml fixes:
>>  - added a31, a31
>>  - fixes for omap4470
>>  - jz4780 contains an sgx540-130 and not -120
>>  - a83t contains an sgx544-115 and not -116
>>  - removed "additionalProperties: false" because some SoC may need =
additional properties
>>=20
>> PATCH V5 2020-03-29 19:38:32:
>> * reworked YAML bindings to pass dt_binding_check and be better =
grouped
>> * rename all nodes to "gpu: gpu@<address>"
>> * removed "img,sgx5" from example - suggested by Rob Herring =
<robh+dt@kernel.org>
>>=20
>> PATCH V4 2019-12-17 19:02:11:
>> * MIPS: DTS: jz4780: removed "img,sgx5" from bindings
>> * YAML bindings: updated according to suggestions by Rob Herring
>> * MIPS: DTS: jz4780: insert-sorted gpu node by register address - =
suggested by Paul Cercueil
>>=20
>> PATCH V3 2019-11-24 12:40:33:
>> * reworked YAML format with help by Rob Herring
>> * removed .txt binding document
>> * change compatible "ti,am335x-sgx" to "ti,am3352-sgx" - suggested by =
Tony Lindgren
>>=20
>> PATCH V2 2019-11-07 12:06:17:
>> * tried to convert bindings to YAML format - suggested by Rob Herring
>> * added JZ4780 DTS node (proven to load the driver)
>> * removed timer and img,cores properties until we know we really need =
them - suggested by Rob Herring
>>=20
>> PATCH V1 2019-10-18 20:46:35:
>>=20
>> This patch series defines child nodes for the SGX5xx interface inside
>> different SoC so that a driver can be found and probed by the
>> compatible strings and can retrieve information about the SGX =
revision
>> that is included in a specific SoC. It also defines the interrupt =
number
>> to be used by the SGX driver.
>>=20
>> There is currently no mainline driver for these GPUs, but a project
>> [1] is ongoing with the goal to get the open-source part as provided
>> by TI/IMG and others into drivers/gpu/drm/pvrsgx.
>=20
> Just a heads up, DRM requires an open-source user-space, so if your
> plan is to move the open-source kernel driver while using the
> closed-source library (as that page seem to suggest), that might
> change a few things.

The far future goal is to arrive at a completely open implementation,
but nobody knows how to get there. Therefore we bake smaller bread :)

step 1: get SoC integration right and stable (this is what this series =
is for)
step 2: make the open source kernel driver work with closed-source libs
step 3: write open-source replacements for user-space

>=20
>> The kernel modules built from this project have successfully
>> demonstrated to work with the DTS definitions from this patch set on
>> AM335x BeagleBone Black, DM3730 and OMAP5 Pyra and Droid 4. They
>> partially work on OMAP3530 and PandaBoard ES but that is likely a
>> problem in the kernel driver or the (non-free) user-space libraries
>> and binaries.
>>=20
>> Wotk for JZ4780 (CI20 board) is in progress and there is potential
>> to extend this work to e.g. BananaPi-M3 (A83) and some Intel Poulsbo
>> and CedarView devices.
>=20
> If it's not been tested on any Allwinner board yet, I'll leave it
> aside until it's been properly shown to work.

Phillip has testes something on a83.

BR and thanks,
Nikolaus=
