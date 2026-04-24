Return-Path: <linux-mips+bounces-14298-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIyXDqoi62muIwAAu9opvQ
	(envelope-from <linux-mips+bounces-14298-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 09:58:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6120E45B041
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 09:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 464613021EAB
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2026 07:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4186378815;
	Fri, 24 Apr 2026 07:57:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44C3659F6
	for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2026 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017446; cv=none; b=Hj+4bsSlU3k/a7+0kTd1iVb41DbEzPD7Jejk8jkv0eJp+Fzy0kw9JvvI/CyXxIp8FncdrgyXwiKZYNHAwqL6vHImuX7ynWvszwaMA4WYnjSn+4H+sLuYWQ7nvZdKDHU9+wYzEzAIpk3WqH8H0hgsspY6wY3wUTU3yAL/zIhosfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017446; c=relaxed/simple;
	bh=BZaZ3g7ZBPkjQoz8nLCka6ZxevyTyp8FYNkCXs7p8Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbWeBo9A47GecKHFxiNzyyOrrh/LJYpydnUz285dWyPRpvYX4TNFnNO8IzF8//70hPnbK6XFq7jWY2EDLga3U13lHq0bmvz/PDT3bBAafCl5MlScOQrV6pjX8d9A0d2xyXs1Y2AjWkSOmniD5HzIWrUzJUu0iAc7OJ1OAJjUJF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7de4ebe10cbso1175082a34.3
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2026 00:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017442; x=1777622242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=GFuU8d16MRHq1wqu27tJtruv8xHMDS4RN1YvL0ZNtjq3gEVjP3erWQEDp6YYLmZegT
         KYbCNOX4ju8oiFN2nUUCQAY/Fxx3ucT1JpuK0cx8VjMejECWBuUfCxINg4gXLgQJ2pgE
         GyX70iDm4/po21rlX6z7udHibfeEKZX3WqzZplW9+HoG95HTziFzuWnku8f3oVvcJx0J
         7Qy4rJhbKDb7WEgJfOkpv13nrvnEnbkczUjYSW43J748mjyCx89qBC65u72G/q4Lq0oQ
         CQahPp8T5BBe6UFlvtwzMngpoUU/Xi4pzgikiPDAqdYl/op/hxcl6gmndc+0MIyZXy9p
         kQVw==
X-Forwarded-Encrypted: i=1; AFNElJ+/JDD2F8IGG4saB+4t/AIH1S5njvex5qgq9JtdxKZNMyW1HBlyqVRdryXcnt5cIM8KBO3P/NtBPcso@vger.kernel.org
X-Gm-Message-State: AOJu0Yw83LM+2LvmzVx5cpI3TPmVsCyYTh8DOB29kvujiR86hQ705Hlm
	t2cw9WBCzJ9TK1AFUsX8KRTIlrzj9p8iH1VUjefCymm4Fl5qtHfKrcZeVh8xOHUCQX4=
X-Gm-Gg: AeBDiet7xIHq4McizEz2gcT9Raw8ew4vtJSy4RxP3mwLXSee0WpSiDhwH3cAA/Ngdod
	O8QHFGp6pAVMM7UzKd0U3J4wjac5UUyO5AF00jCGdqj9IXxXx1ci2uG0TaJMVJWhla2+NyQe0gP
	B0TKzJPcm91OOJrGEGWlgUSVu5Gz2TvQ4Dtk8B2g6UYFBKJ7tB3DWo134Q8LsMIzOoZ9Yqon4fK
	YSLAkukgKa3o/aYZh1i7lXpmK4WCgeRYEeR9kZXvm5cD/RMVTDUxidoafh0jI1NYgltGGvBNMCp
	svDnjSf/uRqaxlVZVckMi1E2nT7aFMhjKLZUPjfYUXeu8m7Qc+pdxEmBV2LQUYb4/0UYYYQwU1Q
	CJ8Ef8O03CzY7Y8ct15KU4brfDVZLWKyIUn/wFuY5MehAHhAED2iWXuLZ19WqW6oDQxtidrPMs1
	Ksy3EpgUYweo/esO6hodR5oikhBir21N4l3pzLq/nf0NGMdm81JGbURNHl1isWlsV76pTpQcE=
X-Received: by 2002:a05:6820:991:b0:68a:af54:cb61 with SMTP id 006d021491bc7-69462f71333mr15873704eaf.60.1777017441873;
        Fri, 24 Apr 2026 00:57:21 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464e5e732sm13524140eaf.3.2026.04.24.00.57.21
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:57:21 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so2664715fac.2
        for <linux-mips@vger.kernel.org>; Fri, 24 Apr 2026 00:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+DxmHxf/zV2fO2GBE1uRmFapiBqB9eu4EAn1lCFm/+mO9d+mrk+20Dw+kWhr3QrfSyPFkpPhCGyCZ@vger.kernel.org
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6120E45B041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-14298-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[78];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,bootlin.com:email,mail.gmail.com:mid,glider.be:email]

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

