Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E85C4CC192
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 16:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234555AbiCCPi0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 10:38:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbiCCPiZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 10:38:25 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF49CE4D;
        Thu,  3 Mar 2022 07:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646321828;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=If+UNP/TxwUFZeZ8jIbY64ljcOyxXQFYDNgrBTHYBXU=;
    b=dQto4VdOAPi47VcTPMHk9Qjh2dRQVDF4JTph8Yxpsgo4/dYhAp6DGokCnxKCvJqhvx
    tPcVqeMZOzOhhnJWM4/lskVpUbGgliKDbgT/7lyHfizmLmzGHbRSor6e2FVLRTxuON6g
    9Xo9J2n8iz7nSvPY3LouQfr4ZU3fCA0c5Q/jEnlqigMqO2LEuMiUnb5fTSnKvQyv3mmI
    ZuLYwOc5n27upjrK9ZuAgcpTgiaQ0eOVlL9oMe4nOgtv3svq9yNjMLgOA/QYR2M38Nf/
    2J3tVNIw++rJTtliiF2OtF446BlOmdJZCoh8PSOEiRSrWcAUqGin/Og4v1QqiI4rXkE9
    vT/Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey23Fb70F4
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 3 Mar 2022 16:37:07 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <890BB299-AB92-4177-83E8-74C8AA551AF1@goldelico.com>
Date:   Thu, 3 Mar 2022 16:37:06 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E255C32-3B9C-4556-A4A7-0B575DF0F915@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
 <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
 <3625b23b-9718-640a-1aac-0b30773a26ab@baylibre.com>
 <E95145AB-DEFC-419D-B926-B0BAF0985D09@goldelico.com>
 <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
 <890BB299-AB92-4177-83E8-74C8AA551AF1@goldelico.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Neil,

> Am 03.03.2022 um 12:45 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Neil,
>=20
>> Am 03.03.2022 um 12:42 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>>=20
>>> So how can we get that merged? IMHO your proposal should be before =
we add ingenic-dw-hdmi.
>>> If you have a version with proper commit message I can add it to the =
beginning of my
>>> seried and include it in a v17. Or if you get yours merged to =
drm-misc/drm-misc-next I
>>> can build on top.
>>=20
>> You can add it in your v17 patchset with my authorship and my =
Signed-off-by tag + yours.
>>=20
>> As commit message something like :
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> drm/bridge: dw-hdmi: handle unusable or non-configured CSC module
>>=20
>> The dw-hdmi integrates an optional Color Space Conversion feature =
used
>> to handle color-space conversions.
>>=20
>> On some platforms, the CSC isn't built-in or non-functional.
>>=20
>> This adds the necessary code to disable the CSC functionality
>> and limit the bus format negotiation to force using the same
>> input bus format as the output bus format.
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fine! Will do.

I was a little too early.

While preparing the patches I found that I still had the hack to force
sink_is_hdmi =3D false in my test branch. Sorry for that.

Removing this made the panel go black again, even with your latest
proposal.

So I looked deeper into your patch and it seems to influence the
input formats only in dw_hdmi_bridge_atomic_get_input_bus_fmts()?

While the problem I see is with output formats and we had worked on
modifying dw_hdmi_bridge_atomic_get_output_bus_fmts().

BR and thanks,
Nikolaus

