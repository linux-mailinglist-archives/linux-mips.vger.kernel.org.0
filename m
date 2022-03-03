Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E8C4CC369
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 18:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234175AbiCCRKR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 12:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiCCRKQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 12:10:16 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE313163076;
        Thu,  3 Mar 2022 09:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646327355;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DZkjigILC9llxh5+typoDVVJKoolclEAlbUvnjI/Gfs=;
    b=nLObxp/JntALEnC6k5IfGbDLVgzTt0Y4k/fZjTdtDPLf2Y2ovGbNmZfKAynQR1U1zt
    XP6zqiV2mhpcuwfsNuKisVbsnnPW3vKi5fJilJEIVqqMuD1qAFqAAQY+HEWB+My4h7Rv
    7Rr9amI8Lf544vW3/BN/kP3XexRYw1mEC7h1QZYH/yNEktwNqU2LSxkRlTXloouMD7Pr
    5LrhaWThKeRFhISbUyz7Eq8SZU8jz14QoZo12oqfVhpA4vnrPIb4wXhI0f4C3topGfgD
    ZXdvAGy+MZRCbu5YideeYOKArKSRoeef3741I/TDciQCZZeZs2OkviTPNJPinIqWYovg
    o/7w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey23H9F0XC
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 3 Mar 2022 18:09:15 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
Date:   Thu, 3 Mar 2022 18:09:14 +0100
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
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
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 03.03.2022 um 17:51 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
> Le jeu., mars 3 2022 at 17:43:05 +0100, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Neil,
>>> Am 03.03.2022 um 17:30 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>> Hi Neil,
>>>> Am 03.03.2022 um 17:23 schrieb Neil Armstrong =
<narmstrong@baylibre.com>:
>>>> Hi,
>>>> On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
>>>>> so that specialization drivers like ingenic-dw-hdmi can enable =
polling.
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>> ---
>>>>> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>>>>> include/drm/bridge/dw_hdmi.h              | 1 +
>>>>> 2 files changed, 10 insertions(+)
>>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>> index 4befc104d2200..43e375da131e8 100644
>>>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>>>> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi =
*hdmi)
>>>>> 	return 0;
>>>>> }
>>>>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
>>>>> +{
>>>>> +	if (hdmi->bridge.dev)
>>>>> +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
>>>>> +	else
>>>>> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
>>>>> +
>>>>> struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>>>> 			      const struct dw_hdmi_plat_data *plat_data)
>>>>> {
>>>>> diff --git a/include/drm/bridge/dw_hdmi.h =
b/include/drm/bridge/dw_hdmi.h
>>>>> index 2a1f85f9a8a3f..963960794b40e 100644
>>>>> --- a/include/drm/bridge/dw_hdmi.h
>>>>> +++ b/include/drm/bridge/dw_hdmi.h
>>>>> @@ -196,5 +196,6 @@ enum drm_connector_status =
dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>>>>> void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>>>>> 			    bool force, bool disabled, bool rxsense);
>>>>> void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>>>>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>>>>>   #endif /* __IMX_HDMI_H__ */
>>>> As I understand, this is because the IRQ line of the dw-hdmi IP =
isn't connected right ? and you use the display-connector ddc gpio =
instead ?
>>> Yes. The IRQ line is not connected on all boards as far as I can =
see.
>>>> In this case I think the Ingenic DRM core should call =
drm_kms_helper_poll_init(drm) instead.
>>> Ah, that is good. it seems to do "dw_hdmi_enable_poll()" in a more =
generic way.
>> Well, I looked through source code and it is defined as
>> 	void drm_kms_helper_poll_init(struct drm_device *dev)
>> But there is no direct pointer to some drm_device available.
>> Neither in dw-hdmi nor ingenic-dw-hdmi.
>=20
> Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do have =
access to the main drm_device in the ingenic_drm_bind() function, so you =
can add it there (with a cleanup function calling =
drm_kms_helper_poll_fini() registered with drmm_add_action_or_reset()).

Well, do you really want to mix HPD detection between connector, =
Synopsys bridge and Ingenic DRM core? These are independent...
Or should be accessed only through the bridge chain pointers.

IMHO we should keep separate functions separate.

And maybe this should also be conditional? Maybe not depend on =
compatible =3D jz4780 but compatible =3D ci20?

Looks to me to be a quick fix in the wrong place.

Let's fix the CSC issue first.

BR,
Nikolaus

