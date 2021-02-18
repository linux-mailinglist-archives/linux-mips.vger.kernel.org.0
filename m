Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E172531EE81
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 19:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbhBRSkG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 13:40:06 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:39243 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233774AbhBRQiV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Feb 2021 11:38:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id DF1EFE1F;
        Thu, 18 Feb 2021 11:35:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 18 Feb 2021 11:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=9glu1NqYQ89GMrISno2hyWbjb5g
        /OTCuIq2T05YOits=; b=G6pm+BxV6Dh9oiD6SJUz1xXNJ7zPPCZpBW9AEchzgQY
        SsCnHwIhIZleE9PczJeaxSABPuNfyZNS1u3Zj2kDGJdZzYOuF3md0m5GftSNoeev
        ZavMKbuw+WSPSBcY4VpVTBkV/ddPDz1xHbCCETt+RAuJ3CD0g/aAsRM9ST0bJ2+t
        +6ifUhzBy+1w+NmK0Bu03Ar0ji4npJeGmU9jySby/2b7puTSkKn/YECDpUC+LyuL
        6Guj5EkOzfnyrZ7fuCEdeNrI7VmN9ZSWN6LpeNmu5/FnzVAUNcjxOj673ayo+RK2
        5fiMH3d3rCy4RcepJW9kS8GD2lNioOxaP+2WrEFLkFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9glu1N
        qYQ89GMrISno2hyWbjb5g/OTCuIq2T05YOits=; b=F8tizhTRDZ1QmkV4IX/nKz
        GFGeeljOv0nlv95ycFp0ze5k8JaZwhxcx+uGwtKUsVGuJaf3wBvlVHShQ6AEUuUa
        nYa/M+CR3Q7nQv96fSu/CfaeIwuzJxRKrhn2B8yNMcGRvghgtZ0Vp/RbSek1ItaO
        Huq8VE54K1HbMzSfgJ/qk4vTktg7KPqCaeXhHlIBqpyMVIsKqMHjMXcuPGS+ft/T
        80Nr4qrm62gEv7vJ1wWgcbm6pcoegFAPfttgQ+bfSTEtA0b5vB4AgmFNGzLe9Jjp
        2mDgst8VHznkjEYhvASc+FuMU+CJuXELKFptery4MIiY6qnvOy5wsWIYxYIQt8qA
        ==
X-ME-Sender: <xms:Q5cuYNHGf4DP6s5Yrk94g87bEt9maVsvZUvIZ5_OSwOa3ygXsvSckA>
    <xme:Q5cuYCWJqVHxc0TBvW8RaM0wSdODYkxfn4yClOKahSKwcF7ZJMIFzdXO9brx_KJON
    wVOak8LO-iBIzeTj3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeggdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q5cuYPL64pGtEXDOIjB2LytBtepgEjTDIlirUSWB4Z_2bk7CHwRyNw>
    <xmx:Q5cuYDGxFYNq90q1Kozd9_sE8xI5mkNSdlmaFJwB_t_-qpDhKS53yA>
    <xmx:Q5cuYDU83mA2iruvPx6pKrkqUS3fSvQrhe9kV_x71Rp0kdmagu5q-g>
    <xmx:RpcuYHmzfxpDFq6rYEjERoNkSWa7GUcR73y9VFLtc6uo7hgIIot_W0suCF8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id DE99E24005C;
        Thu, 18 Feb 2021 11:35:14 -0500 (EST)
Date:   Thu, 18 Feb 2021 17:35:12 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     airlied@linux.ie, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] drm/gem: Move drm_gem_fb_prepare_fb() to GEM atomic
 helpers
Message-ID: <20210218163512.arnmixdkygysxrqk@gilmour>
References: <20210211081636.28311-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qyrmapmaovukaths"
Content-Disposition: inline
In-Reply-To: <20210211081636.28311-1-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--qyrmapmaovukaths
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 11, 2021 at 09:16:36AM +0100, Thomas Zimmermann wrote:
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 6b013154911d..495d174d9989 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -9,9 +9,11 @@ struct drm_framebuffer;
>  struct drm_framebuffer_funcs;
>  struct drm_gem_object;
>  struct drm_mode_fb_cmd2;
> +#if 0
>  struct drm_plane;
>  struct drm_plane_state;
>  struct drm_simple_display_pipe;
> +#endif

That's probably not what you meant?

With that fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--qyrmapmaovukaths
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYC6XQAAKCRDj7w1vZxhR
xeYjAQDBp12JMmHuiBCHQBmWyl9fGbmCMg6R9psxq9edd+0vigD+MjBWZAmh8A1d
2S0DtBQtnfgH07vDxZs1Eb8jJZ+x/QQ=
=WmxA
-----END PGP SIGNATURE-----

--qyrmapmaovukaths--
