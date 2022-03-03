Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90B04CC364
	for <lists+linux-mips@lfdr.de>; Thu,  3 Mar 2022 18:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiCCRGn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Mar 2022 12:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiCCRGn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Mar 2022 12:06:43 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5B0197B54;
        Thu,  3 Mar 2022 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646327146;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=uasWRhknaZLqfDzpjCYNCmO+ZffAW+trwexFejCCrSU=;
    b=bXDUo5EWNaKWe9/EulAf+wlVST1S15UavSqv1xfjpZnCStx28c3QOC1ypTS8/2LNWp
    DFXE3t4efwMIAxUR+uDtExVKEMPvym7OdhcuojP5kfhKT6ZQEv2cSqQRnoohuGNXEa+I
    mvOSqa1SxSyp4WNX9OSKCen1sYxxHU25orbHWtgVO8/BJK99g06fPXbRdPJZLmDy0Z4q
    97cszrURtagoCfJhP8QxDu3999YtJwQcjNd699ZxW8YYqwRY9+zOHOl3kYo8bSovIi8Y
    nKI/1/200kZaI+AC5VXNA2RSH/NuwtGXuu3Sbsa+qFuydaT+wzdgTN2brol8h2SEp1v/
    9NIQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw47tT+k="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey23H5k0WZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 3 Mar 2022 18:05:46 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <W8H68R.34YMAB8619ZY1@crapouillou.net>
Date:   Thu, 3 Mar 2022 18:05:45 +0100
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Paul Boddie <paul@boddie.org.uk>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3514A1B-5597-49F2-B252-FA2A2058D156@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <W8H68R.34YMAB8619ZY1@crapouillou.net>
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

Hi Paul and Neil,

> Am 03.03.2022 um 17:46 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Neil,
>=20
> Le jeu., mars 3 2022 at 17:23:02 +0100, Neil Armstrong =
<narmstrong@baylibre.com> a =C3=A9crit :
>> Hi,
>> On 26/02/2022 18:12, H. Nikolaus Schaller wrote:
>>> so that specialization drivers like ingenic-dw-hdmi can enable =
polling.
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++++
>>>  include/drm/bridge/dw_hdmi.h              | 1 +
>>>  2 files changed, 10 insertions(+)
>>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c =
b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> index 4befc104d2200..43e375da131e8 100644
>>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>>> @@ -3217,6 +3217,15 @@ static int dw_hdmi_parse_dt(struct dw_hdmi =
*hdmi)
>>>  	return 0;
>>>  }
>>>  =7F+void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable)
>>> +{
>>> +	if (hdmi->bridge.dev)
>>> +		hdmi->bridge.dev->mode_config.poll_enabled =3D enable;
>>> +	else
>>> +		dev_warn(hdmi->dev, "no hdmi->bridge.dev");
>>> +}
>>> +EXPORT_SYMBOL_GPL(dw_hdmi_enable_poll);
>>> +
>>>  struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>>  			      const struct dw_hdmi_plat_data *plat_data)
>>>  {
>>> diff --git a/include/drm/bridge/dw_hdmi.h =
b/include/drm/bridge/dw_hdmi.h
>>> index 2a1f85f9a8a3f..963960794b40e 100644
>>> --- a/include/drm/bridge/dw_hdmi.h
>>> +++ b/include/drm/bridge/dw_hdmi.h
>>> @@ -196,5 +196,6 @@ enum drm_connector_status =
dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>>>  void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>>>  			    bool force, bool disabled, bool rxsense);
>>>  void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>>> +void dw_hdmi_enable_poll(struct dw_hdmi *hdmi, bool enable);
>>>  =7F  #endif /* __IMX_HDMI_H__ */
>> As I understand, this is because the IRQ line of the dw-hdmi IP isn't =
connected right ? and you use the display-connector ddc gpio instead ?

Ah, I should finish work for today since I am no longer reading every =
word properly...

No, we do NOT use the display connector for HPD. We use HPD of the =
dw-hdmi.
Either IRQ is not enabled properly or not working in IRQ mode.
But it works if polling is enabled.

>=20
> According to the CI20 schematic, it is wired properly. So that's =
strange.

Yes, HTPLG input goes through an 1k=CE=A9 + 1=C2=B5F low-pass filter to =
debounce HDMI_HTPLG.
This goes to the HPD (BGA ball N19).
There is an optional Q14 driving HDMI_DETE_N.
This could become the hpd-gpios property of the connector in the device =
tree.
But it is optional.

So we have to use dw-hdmi HPD and make it work (in combination with a =
chained hdmi-connector).

>=20
>> In this case I think the Ingenic DRM core should call =
drm_kms_helper_poll_init(drm) instead.
>=20
> Yes, the ingenic-drm driver does not poll for connectors because until =
now it never has been needed.

Well, if we go back a while we only needed it after introducing the =
hdmi-connectors
and making dw-hdmi a bridge.

Originally the dw-hdmi driver did properly take care of everything (by =
registering its own connector).

BR and thanks,
Nikolaus

