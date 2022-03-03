Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71614CC47C
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbiCCSA5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 13:00:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbiCCSA5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 13:00:57 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20987194A8F;
        Thu,  3 Mar 2022 10:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646330388;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=S/Ajb9G7BzvTHaV25UD/SK5bUJk7mTLUkAHqeR66ezQ=;
    b=aEgtHOoTY5bTpPc3idG57z1HEaIhVL42kWXPjObiI7C3E4s7WfRAzDGT0kAceCRp2R
    E4SrJJaJoLyYy+Roupvo+vCYO1nSrQRSd8nuUXsZKtI4fDc/4tjal4KWHXyzBqU+XJ7o
    n8uQazYNwx0uKDbZY3s0R7sxQRwtL2RDDdEaxg9wCBRt22o0ck6PSD0fYtBDkt/yLneU
    OJHbA77pN49x9E1iBbXDRIuun/SAMwsLULf14HcR4uGARBVxDBSQD9cHPsq8VLQH8k1j
    mDDoy6KMXYeCQWXQhKfSbKfrF5AnmUe4LXkzUaCn/odMmWCBf4VQS59l00O5dNu9S2pq
    mL+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey23Hxl1Va
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 3 Mar 2022 18:59:47 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <RUI68R.Z009SPJAAD8N1@crapouillou.net>
Date:   Thu, 3 Mar 2022 18:59:47 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Maxime Ripard <maxime@cerno.tech>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0F8F36B-3A0A-476C-8C7D-566255C629C6@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
 <RUI68R.Z009SPJAAD8N1@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>,
        Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul, Neil,

> Am 03.03.2022 um 18:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> [snip]
>=20
>>> Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do =
have access to the main drm_device in the ingenic_drm_bind() function, =
so you can add it there (with a cleanup function calling =
drm_kms_helper_poll_fini() registered with drmm_add_action_or_reset()).
>> Well, do you really want to mix HPD detection between connector, =
Synopsys bridge and Ingenic DRM core? These are independent...
>> Or should be accessed only through the bridge chain pointers.
>> IMHO we should keep separate functions separate.
>=20
> The drm_kms_helper_poll_init() just says "this DRM device may have =
connectors that need to be polled" so it very well fits inside the main =
driver, IMHO.

As far as I understand, it has the side-effect to always set =
dev->mode_config.poll_enabled and
schedule_delayed_work() for all devices.
I am not sure if this is intended for arbitrary ingenic-drm devices. But =
you know better than me.


Hm. But wait, I think I now finally remember why I have proposed it the =
way it is!
It is always better to go back to requirements and find the least =
invasive solution.

- HPD IRQ works and calls dw_hdmi_irq() [as can be shown by adding =
printk()]
- it is just that the udevd is only notified if poll_enabled =3D true =
(but no polling takes place!).

An earlier version (v4) to fix this proposed to add an explicit call to =
drm_kms_helper_hotplug_event()
in dw_hdmi_irq() but that was rejected a while ago because =
drm_helper_hpd_irq_event() will already call it:

	https://www.spinics.net/lists/dri-devel/msg316846.html

Since this did not take into account that dev->mode_config.poll_enabled =
must be set true, I then proposed the
enable_poll() mechanism just to set this bit for the ingenic-dw-hdmi =
specialization.

So a HPD event is delivered to the dw-hdmi driver as dw_hdmi_irq() and =
that calls drm_helper_hpd_irq_event()
but not drm_kms_helper_hotplug_event() and user-space is not getting =
aware.

It is all a hack because we mix the dw-hdmi driver which originally did =
register its own connector
with an explicit connector...

In summary I now thing that the v4 patch is the simplest and least =
invasive solution.

We neither have to introduce a dw_hdmi_enable_poll() function or call =
drm_kms_helper_poll_init() anywhere.

It is just a single line to add to dw-hdmi. And neither touches =
ingenic-dw-hdmi nor ingenic-drm-drv.

So let's go back to v4 version (just modify commit message to better =
describe why we have to call
drm_kms_helper_hotplug_event() explicitly) and forget about =
alternatives.

BR,
Nikolaus=
