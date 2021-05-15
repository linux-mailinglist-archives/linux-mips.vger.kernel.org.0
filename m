Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7B2381AA7
	for <lists+linux-mips@lfdr.de>; Sat, 15 May 2021 21:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhEOTIN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 May 2021 15:08:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:34906 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234579AbhEOTIM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 May 2021 15:08:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6334DAFD5;
        Sat, 15 May 2021 19:06:58 +0000 (UTC)
To:     Paul Cercueil <paul@crapouillou.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210515145359.64802-1-paul@crapouillou.net>
 <20210515145359.64802-3-paul@crapouillou.net>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/3] drm: Add and export function drm_gem_cma_sync_data
Message-ID: <93fce1ea-f18d-7941-e973-9748243882b6@suse.de>
Date:   Sat, 15 May 2021 21:06:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515145359.64802-3-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x2vTxhbmwOfkAFOdrM8fvhtRRGsi5zKVn"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x2vTxhbmwOfkAFOdrM8fvhtRRGsi5zKVn
Content-Type: multipart/mixed; boundary="dPf7PCMtJc55MN21CIHNv1YF93Ixa5987";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Christoph Hellwig <hch@infradead.org>, list@opendingux.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-ID: <93fce1ea-f18d-7941-e973-9748243882b6@suse.de>
Subject: Re: [PATCH v4 2/3] drm: Add and export function drm_gem_cma_sync_data
References: <20210515145359.64802-1-paul@crapouillou.net>
 <20210515145359.64802-3-paul@crapouillou.net>
In-Reply-To: <20210515145359.64802-3-paul@crapouillou.net>

--dPf7PCMtJc55MN21CIHNv1YF93Ixa5987
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.05.21 um 16:53 schrieb Paul Cercueil:
> This function can be used by drivers that use damage clips and have
> CMA GEM objects backed by non-coherent memory. Calling this function
> in a plane's .atomic_update ensures that all the data in the backing
> memory have been written to RAM.
>=20
> v3: - Only sync data if using GEM objects backed by non-coherent memory=
=2E
>      - Use a drm_device pointer instead of device pointer in prototype
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/drm_gem_cma_helper.c | 55 +++++++++++++++++++++++++++=
+
>   include/drm/drm_gem_cma_helper.h     |  5 +++
>   2 files changed, 60 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm=
_gem_cma_helper.c
> index 235c7a63da2b..41f309e0e049 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -17,9 +17,14 @@
>   #include <linux/slab.h>
>  =20
>   #include <drm/drm.h>
> +#include <drm/drm_damage_helper.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_fb_cma_helper.h>

Alphabetical order:

fb < fourcc

> +#include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane.h>
>   #include <drm/drm_vma_manager.h>
>  =20
>   /**
> @@ -576,3 +581,53 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_=
device *dev,
>   	return obj;
>   }
>   EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
> +
> +/**
> + * drm_gem_cma_sync_data - Sync GEM object to non-coherent backing mem=
ory
> + * @drm: DRM device
> + * @old_state: Old plane state
> + * @state: New plane state
> + *
> + * This function can be used by drivers that use damage clips and have=

> + * CMA GEM objects backed by non-coherent memory. Calling this functio=
n
> + * in a plane's .atomic_update ensures that all the data in the backin=
g
> + * memory have been written to RAM.
> + */
> +void drm_gem_cma_sync_data(struct drm_device *drm,
> +			   struct drm_plane_state *old_state,
> +			   struct drm_plane_state *state)
> +{
> +	const struct drm_format_info *finfo =3D state->fb->format;
> +	struct drm_atomic_helper_damage_iter iter;
> +	const struct drm_gem_cma_object *cma_obj;
> +	unsigned int offset, i;
> +	struct drm_rect clip;
> +	dma_addr_t daddr;
> +
> +	for (i =3D 0; i < finfo->num_planes; i++) {
> +		cma_obj =3D drm_fb_cma_get_gem_obj(state->fb, i);
> +
> +		if (cma_obj->map_noncoherent)
> +			break;
> +	}
> +
> +	/* No non-coherent buffers - no need to sync anything. */
> +	if (i =3D=3D finfo->num_planes)
> +		return;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
> +
> +	drm_atomic_for_each_plane_damage(&iter, &clip) {
> +		for (i =3D 0; i < finfo->num_planes; i++) {
> +			daddr =3D drm_fb_cma_get_gem_addr(state->fb, state, i);
> +
> +			/* Ignore x1/x2 values, invalidate complete lines */
> +			offset =3D clip.y1 * state->fb->pitches[i];
> +
> +			dma_sync_single_for_device(drm->dev, daddr + offset,
> +				       (clip.y2 - clip.y1) * state->fb->pitches[i],
> +				       DMA_TO_DEVICE);

A framebuffer can have multiple BOs with different coherency. The=20
current loop syncs every BO, but you only have to sync non-coherent memor=
y.

I suggest to merge the above test loop into this sync loop, such that=20
only non-coherent BOs get synced

damage_iter_init(iter)

for_each_damage_plane(iter) {
   for (i < finfo->num_planes) {
     cma_obj =3D drm_fb_cma_get_gem_obj(i)
     if (!cma_obj->non_coherent)
       continue;
     dma_sync_single_for_device()
   }
}

For cache locality, it might be better to exchange the loops:

for (i < finfo->num_planes) {

   damage_iter_init(iter)
   for_each_damage_plane(iter) {


   }
}

This way, you operate on the BOs one by one.

> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_cma_sync_data);
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma=
_helper.h
> index cd13508acbc1..76af066ae3a7 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -7,6 +7,7 @@
>   #include <drm/drm_gem.h>
>  =20
>   struct drm_mode_create_dumb;
> +struct drm_plane_state;
>  =20
>   /**
>    * struct drm_gem_cma_object - GEM object backed by CMA memory alloca=
tions
> @@ -185,4 +186,8 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_d=
evice *drm,
>   				       struct dma_buf_attachment *attach,
>   				       struct sg_table *sgt);
>  =20
> +void drm_gem_cma_sync_data(struct drm_device *drm,
> +			   struct drm_plane_state *old_state,
> +			   struct drm_plane_state *state);
> +

Maybe call this function drm_gem_cma_sync_non_coherent() so that it's=20
clear what the sync is about.

Best regards
Thomas

>   #endif /* __DRM_GEM_CMA_HELPER_H__ */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dPf7PCMtJc55MN21CIHNv1YF93Ixa5987--

--x2vTxhbmwOfkAFOdrM8fvhtRRGsi5zKVn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCgG9AFAwAAAAAACgkQlh/E3EQov+DQ
tA/+JvvM1uDc8G9rNsR2O7LjyGk5y3GZqbmvgG7vabjuqeTO/dNVVs1NclHBG9nUMiHaaaHIemNR
0/CgCdcOMfwpvbKZmyRK0An8yo1Ajg1BakVSf29HpIUwpwYpnH7sKDb00yW3le97OKpTfK/jBbOd
JOxOYk37VXz8OMA4zYERgfjU5lgGXywBumDteE03OIXi8jBZkdPaVLPuX7+4r862EybBv0kBJjZG
ZEdaXpkqdF+ZJKGGcPB2b9MGfhCrnKtK/q9vSw5SMYwnv9eQdmSSJJRYaYhDw6bzXAJRwRUjDf7e
xS5b+G8vAVgC1ycBttaflx68lcyEk6XbM45ePVcTeOuAAho523+LnRdrpzxBxpWXz6L7skJqRK/z
OYw2hekgpL06Z+CU6O7Eb0ni57y42fw4jVzbHAixvbsVQhJeo1DQD9Sesy0ETYRaAbicQsuwKTBr
ljfBbodl1Zdt3q+i378ugdjhialHfnxdAPXEIKWOOyMN4Bhz3ToOAW1c5j+BHWaCz1pDhAw868Q7
3BMAVJXzpkKuoeZRNJmuyWdVL90wHUZvdKEKBVmAH+mXrg8m6oCHY22WqiZgssUN99R7ZxL9eiSC
hwgyHBu7+OiZmiJLKxRToBVNsKfKGmtkKgipTdR9J3m3zzJvN0jHs7YcfMm0ZxV0Qh5yOBp1e9sg
2Rk=
=I/0w
-----END PGP SIGNATURE-----

--x2vTxhbmwOfkAFOdrM8fvhtRRGsi5zKVn--
