Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D981336D4F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 08:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCKHwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 02:52:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:44486 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhCKHwa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Mar 2021 02:52:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E67CDAB8C;
        Thu, 11 Mar 2021 07:52:28 +0000 (UTC)
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20210307202835.253907-1-paul@crapouillou.net>
 <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
 <YVORPQ.MCVK409VD57J2@crapouillou.net>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
Message-ID: <5246f93f-b383-03be-4d5c-53cd530df079@suse.de>
Date:   Thu, 11 Mar 2021 08:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YVORPQ.MCVK409VD57J2@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KNoks9VeZAPFoGM1bz0Bm3NPD06xo4uk4"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KNoks9VeZAPFoGM1bz0Bm3NPD06xo4uk4
Content-Type: multipart/mixed; boundary="oLrJJkeRxpp4RiGgNAPrS23pgef1an46J";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 od@zcrc.me, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Message-ID: <5246f93f-b383-03be-4d5c-53cd530df079@suse.de>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
References: <20210307202835.253907-1-paul@crapouillou.net>
 <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
 <YVORPQ.MCVK409VD57J2@crapouillou.net>
In-Reply-To: <YVORPQ.MCVK409VD57J2@crapouillou.net>

--oLrJJkeRxpp4RiGgNAPrS23pgef1an46J
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.03.21 um 20:02 schrieb Paul Cercueil:
> Hi Thomas,
>=20
> Le lun. 8 mars 2021 =C3=A0 9:41, Thomas Zimmermann <tzimmermann@suse.de=
> a=20
> =C3=A9crit :
>> Hi Paul,
>>
>> having individual functions for each mode only makes sense if the=20
>> decision is at compile time. But in patch 5, you're working around=20
>> your earlier design by introducing in-driver helpers that select the=20
>> correct CMA function.
>>
>> In SHMEM helpers we have the flag map_wc in the GEM structure that=20
>> selects the pages caching mode (wc vs uncached). I think CMA should=20

Re-reading this, it should rather be WC and cached.

>> use this design as well. Have a map_noncoherent flag in the CMA GEM=20
>> object and set it from the driver's implementation of gem_create_objec=
t.
>=20
> Is that a new addition? That severely reduces the patchset size, which =

> is perfect.

It was added a few months ago, around the time you send the first=20
version of the patches at hand.

Originally, SHMEM uses write combining by default. And several drivers=20
used default mapping flags instead (so usually cached). IIRC I=20
streamlined everything and flipped the default. Most drivers can use=20
cached mappings and only some require WC.

Recently there was also a patchset that added support for cached video=20
RAM (or something like that). So at some point we could store these=20
flags in drm_gem_object. For now, I'd just put a flag into=20
drm_gem_cma_object.

>=20
> I'll send a V3 then.

Great!

Best regards
Thomas

>=20
> Cheers,
> -Paul
>=20
>> And in the long run, we could try to consolidate all drivers/helpers=20
>> mapping flags in struct drm_gem_object.
>>
>> Best regards
>> Thomas
>>
>> Am 07.03.21 um 21:28 schrieb Paul Cercueil:
>>> Rework of my previous patchset which added support for GEM buffers
>>> backed by non-coherent memory to the ingenic-drm driver.
>>>
>>> Having GEM buffers backed by non-coherent memory is interesting in
>>> the particular case where it is faster to render to a non-coherent
>>> buffer then sync the data cache, than to render to a write-combine
>>> buffer, and (by extension) much faster than using a shadow buffer.
>>> This is true for instance on some Ingenic SoCs, where even simple
>>> blits (e.g. memcpy) are about three times faster using this method.
>>>
>>> For the record, the previous patchset was accepted for 5.10 then had
>>> to be reverted, as it conflicted with some changes made to the DMA AP=
I.
>>>
>>> This new patchset is pretty different as it adds the functionality to=

>>> the DRM core. The first three patches add variants to existing functi=
ons
>>> but with the "non-coherent memory" twist, exported as GPL symbols. Th=
e
>>> fourth patch adds a function to be used with the damage helpers.
>>> Finally, the last patch adds support for non-coherent GEM buffers to =
the
>>> ingenic-drm driver. The functionality is enabled through a module
>>> parameter, and is disabled by default.
>>>
>>> Cheers,
>>> -Paul
>>>
>>> Paul Cercueil (5):
>>> =C2=A0=C2=A0 drm: Add and export function drm_gem_cma_create_noncoher=
ent
>>> =C2=A0=C2=A0 drm: Add and export function drm_gem_cma_dumb_create_non=
coherent
>>> =C2=A0=C2=A0 drm: Add and export function drm_gem_cma_mmap_noncoheren=
t
>>> =C2=A0=C2=A0 drm: Add and export function drm_gem_cma_sync_data
>>> =C2=A0=C2=A0 drm/ingenic: Add option to alloc cached GEM buffers
>>>
>>> =C2=A0 drivers/gpu/drm/drm_gem_cma_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 223 +++++++++++++++++++---
>>> =C2=A0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c |=C2=A0 49 ++++-
>>> =C2=A0 drivers/gpu/drm/ingenic/ingenic-drm.h=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 4 +
>>> =C2=A0 drivers/gpu/drm/ingenic/ingenic-ipu.c=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 14 +-
>>> =C2=A0 include/drm/drm_gem_cma_helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 13 ++
>>> =C2=A0 5 files changed, 273 insertions(+), 30 deletions(-)
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--oLrJJkeRxpp4RiGgNAPrS23pgef1an46J--

--KNoks9VeZAPFoGM1bz0Bm3NPD06xo4uk4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBJzDsFAwAAAAAACgkQlh/E3EQov+B7
JxAAxcuL3q6SHtclQBjch43wGJvyugcQFie4RBcl0SpfF5XgBBxn6+BkF34vHT1tWzIiJVCBMqdy
Dv7QPMnIiIVJy/mO4rvAYdYQe+tnhl7wki0dActkMo+jBYddJEjTIbsB8eskezFpf/7fvA30GmxL
mjSL9/tX0a1LNVyTecOJ7vgk3G7ITjc5RLRqEVq0B9wOS0XP2zoNTbtlnkvIPIdamUlGYzJWT8eD
na3h/Xp0WZfYzRTKjrhXESOH9urNFTPeMVVwlCbIeMufS+Kt1oMjUC2iLOW4s6EKtDTPWUXIOAzq
HajhQ/wWJj2f+8gVGU0BFm7Zbdgy2vhEcezJXTUSvwIZzY5Es5KX8YeKVuDXBPptL6FAkmywGRg4
/YdYZW7IQxns3OUM8NxihkvDRGbErAbCd0Pompwy2jeN3rUKsOn0SEA0UQR9QVekv9xUTFvUqXB+
yYG3RCvxd9qLmWLPA5P9Wb0ZqStJ++K65+ifthzcE0Mcj85JjMj4/j02dQp/ri5chp3svyJPFi5d
23+eewAMPiNJK7F5Ux+5mJu6a0KptSNT0jKZtczBmKefsW8ZgvR7dM1xlfM+wYxLY4Ml0wZWI2RF
nnMPXeg8oTTzrCf3hUoMbseAbsWoyG5fHngPUAfHEley3DV405pcofUg9pDq0uMTUI+TFTR5EuYH
5Bo=
=RZlk
-----END PGP SIGNATURE-----

--KNoks9VeZAPFoGM1bz0Bm3NPD06xo4uk4--
