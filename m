Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3015321295
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 10:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBVJDR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 04:03:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:56210 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230100AbhBVJCw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Feb 2021 04:02:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E218DAF99;
        Mon, 22 Feb 2021 09:02:01 +0000 (UTC)
Subject: Re: [PATCH v3 02/11] drm: Rename plane atomic_check state names
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
 <20210219151235.dsv4mujqyrzndhsn@gilmour>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <2abb00b3-23d2-e652-4194-a10fbf171b88@suse.de>
Date:   Mon, 22 Feb 2021 10:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219151235.dsv4mujqyrzndhsn@gilmour>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w1lSYWSR69EiDDUmRFseCwFhMSFWd2baX"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w1lSYWSR69EiDDUmRFseCwFhMSFWd2baX
Content-Type: multipart/mixed; boundary="sEqTb7DLvEQPgunNTOiF1zujXM8e72iqO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "James (Qian) Wang"
 <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Brian Starkey <brian.starkey@arm.com>, Russell King <linux@armlinux.org.uk>,
 Dave Airlie <airlied@redhat.com>, Inki Dae <inki.dae@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, John Stultz <john.stultz@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Tomi Valkeinen <tomba@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Eric Anholt <eric@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Message-ID: <2abb00b3-23d2-e652-4194-a10fbf171b88@suse.de>
Subject: Re: [PATCH v3 02/11] drm: Rename plane atomic_check state names
References: <20210219120032.260676-1-maxime@cerno.tech>
 <20210219120032.260676-2-maxime@cerno.tech>
 <51bb5aaf-f771-020b-9a48-77d8679de6a2@suse.de>
 <20210219151235.dsv4mujqyrzndhsn@gilmour>
In-Reply-To: <20210219151235.dsv4mujqyrzndhsn@gilmour>

--sEqTb7DLvEQPgunNTOiF1zujXM8e72iqO
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 19.02.21 um 16:12 schrieb Maxime Ripard:
> Hi Thomas,
>=20
> Thanks for your review!
>=20
> On Fri, Feb 19, 2021 at 03:49:22PM +0100, Thomas Zimmermann wrote:
>>> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/=
ipuv3-plane.c
>>> index 075508051b5f..1873a155bb26 100644
>>> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
>>> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
>>> @@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_f=
uncs =3D {
>>>    };
>>>    static int ipu_plane_atomic_check(struct drm_plane *plane,
>>> -				  struct drm_plane_state *state)
>>> +				  struct drm_plane_state *new_state)
>>
>> This function uses a different naming convention then the others?
>>
>>>    {
>>>    	struct drm_plane_state *old_state =3D plane->state;
>=20
> So, the function already had a variable named old_state, so I was
> actually trying to make the drivers consistent here: having one variabl=
e
> with old_state and new_plane_state felt weird.
>=20
> The heuristic is thus to use the convention of the driver if one exists=

> already, and if there's none pick new_plane_state.
>=20
> It makes it indeed inconsistent across drivers, but it felt more natura=
l
> to be consistent within a single driver.

Makes sense.

>=20
> Maxime
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--sEqTb7DLvEQPgunNTOiF1zujXM8e72iqO--

--w1lSYWSR69EiDDUmRFseCwFhMSFWd2baX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAzcwQFAwAAAAAACgkQlh/E3EQov+BQ
PRAApEdNgQ+vqv+VzwVCbZGvaYSJtb908qPub+x6G/TOtgTxy8nU/+4qswCNV1TRb47fJcScii5P
muJ5755oRh4YUO4NVEtX8GKHOgjfCwpAUXuwlWMs7HX4yxmi5IlBj1w5nsFNF88DhVuB+2AEFXkd
ata8+bV5tpBKfULJcNvMYIG/sYzusZAf2m8hmCGpNKXC5Y1MkdVAaNzoZDmjOMdvyC8YVmiyuQYm
XH6RqvBNEdrVf8QpbecMX946GtVx/ZYhheMzeojAjs6BSN56nkEbFyeDTDZy5Dj2exfMb7r4c2Md
yXh3NGjtYAZc9AYFG5Gm23hEioOh1NeLQm5V2YA7FxtDqonl3w1pTvIBSdb/6tBAPFUWfiMOZIkI
FgBteGCFHY7zTITnY+R0RGDY6oFZApyVwiXtxj2bybCEyBG7dHBAJ7ga+tRvT7fG5T94Q6y1cyKj
v86blGFaPEZYZfeRbwrKbmwq/fbT6/OFH7eZLxzn5fLH1NJora6NM5gDXssJ77KwbVhbra2uzHuB
uzpM8wC0JU7YFsd8boCIoxlST7QHttvFX8pSd///+Hub0U1/QXZPfQ4t0J1AheysqA/onDRoyd8U
k3hPMvUtSmZwZSAGSO/6jzkR1Tki5qIgqmKJ6VDh8w7gpWSnDWkXcPiQlrNo4sWJnQQgDrL11BMb
e3E=
=cO2r
-----END PGP SIGNATURE-----

--w1lSYWSR69EiDDUmRFseCwFhMSFWd2baX--
