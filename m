Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F74330992
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 09:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhCHIlc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 03:41:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:51102 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231719AbhCHIlW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 03:41:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1BE4FAD21;
        Mon,  8 Mar 2021 08:41:21 +0000 (UTC)
To:     Paul Cercueil <paul@crapouillou.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210307202835.253907-1-paul@crapouillou.net>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
Message-ID: <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
Date:   Mon, 8 Mar 2021 09:41:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vCAFos3ArVUElPWBfRykBthcMcwIbnSYQ"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vCAFos3ArVUElPWBfRykBthcMcwIbnSYQ
Content-Type: multipart/mixed; boundary="hAsOKY0EVgusrQ8CVoyBxdQSCrgitxGoq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-ID: <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
References: <20210307202835.253907-1-paul@crapouillou.net>
In-Reply-To: <20210307202835.253907-1-paul@crapouillou.net>

--hAsOKY0EVgusrQ8CVoyBxdQSCrgitxGoq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Paul,

having individual functions for each mode only makes sense if the=20
decision is at compile time. But in patch 5, you're working around your=20
earlier design by introducing in-driver helpers that select the correct=20
CMA function.

In SHMEM helpers we have the flag map_wc in the GEM structure that=20
selects the pages caching mode (wc vs uncached). I think CMA should use=20
this design as well. Have a map_noncoherent flag in the CMA GEM object=20
and set it from the driver's implementation of gem_create_object.

And in the long run, we could try to consolidate all drivers/helpers=20
mapping flags in struct drm_gem_object.

Best regards
Thomas

Am 07.03.21 um 21:28 schrieb Paul Cercueil:
> Rework of my previous patchset which added support for GEM buffers
> backed by non-coherent memory to the ingenic-drm driver.
>=20
> Having GEM buffers backed by non-coherent memory is interesting in
> the particular case where it is faster to render to a non-coherent
> buffer then sync the data cache, than to render to a write-combine
> buffer, and (by extension) much faster than using a shadow buffer.
> This is true for instance on some Ingenic SoCs, where even simple
> blits (e.g. memcpy) are about three times faster using this method.
>=20
> For the record, the previous patchset was accepted for 5.10 then had
> to be reverted, as it conflicted with some changes made to the DMA API.=

>=20
> This new patchset is pretty different as it adds the functionality to
> the DRM core. The first three patches add variants to existing function=
s
> but with the "non-coherent memory" twist, exported as GPL symbols. The
> fourth patch adds a function to be used with the damage helpers.
> Finally, the last patch adds support for non-coherent GEM buffers to th=
e
> ingenic-drm driver. The functionality is enabled through a module
> parameter, and is disabled by default.
>=20
> Cheers,
> -Paul
>=20
> Paul Cercueil (5):
>    drm: Add and export function drm_gem_cma_create_noncoherent
>    drm: Add and export function drm_gem_cma_dumb_create_noncoherent
>    drm: Add and export function drm_gem_cma_mmap_noncoherent
>    drm: Add and export function drm_gem_cma_sync_data
>    drm/ingenic: Add option to alloc cached GEM buffers
>=20
>   drivers/gpu/drm/drm_gem_cma_helper.c      | 223 +++++++++++++++++++--=
-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  49 ++++-
>   drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
>   drivers/gpu/drm/ingenic/ingenic-ipu.c     |  14 +-
>   include/drm/drm_gem_cma_helper.h          |  13 ++
>   5 files changed, 273 insertions(+), 30 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hAsOKY0EVgusrQ8CVoyBxdQSCrgitxGoq--

--vCAFos3ArVUElPWBfRykBthcMcwIbnSYQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBF4y8FAwAAAAAACgkQlh/E3EQov+C1
dA/+KIMFQ+rriBUPeo1eB07iNl9uspD2AZu03sWj+ZpRBIsrzznTDkEVccL5EUYa5jxvpfiORFCQ
wiJf4J9WfReL5EEnk8bCSFMbsQyD0Vqq+MdzlLeI8RcD1m2rjEKeMWiBaeMIWjxlxeLmY9wzutnG
jbEODyxNDhVHaAZAty5OkgRLKY6FwtYfCXCsBw5z5lqlTXeb11f3+a263kZ23Lp6tGOGgWWIDYZl
5rTtmE4G5rj+YzB5Lo8sAADvbQQaZGkc/A26v7vDQVInxMhVbkYTkP46KZcOUx4dLUfBN4PgTLb6
wYbt1tzNz9DcZsNObI4FWrbSEtjTQKp/rNK1i7QWsyOha63vRGCg5wC+Fz7VaWOkwqGdNCaL4ndt
SGaOV/m8L8t9ZpqDphLsWQm0Ku0duPbEdGP2Qd9Kh3umDKo11eVsk1W2xZaXwcNFIEKAhSvuYEhv
JuPZyBhCmF7IdUh6JQB8VWlIYXhUVPFX0ntFtS1agJoETqPzX0hQj8b+OSmx+wlOioaPFnDIf9jW
naxPEtgUQnmowFFt/lpP+E0AlGeYIipaxp4HJvVlkY1aNetiK0sz6ALhW5xHABwZLsELSXyLH3cm
mhtqW2hbC3+geE5PzLzMBLZCWZ1SIhgm3KcZFCkSnLGkvfUrkCO77kTgRRjFFLa/iIvJaZmHybVX
6yo=
=Oi6k
-----END PGP SIGNATURE-----

--vCAFos3ArVUElPWBfRykBthcMcwIbnSYQ--
