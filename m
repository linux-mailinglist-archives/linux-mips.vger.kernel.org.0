Return-Path: <linux-mips+bounces-574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733880859D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 11:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5D5FB20B2A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 10:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2091E17988;
	Thu,  7 Dec 2023 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="P4KnjRZc";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="8d0eEMoe"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A86BAA;
	Thu,  7 Dec 2023 02:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701945246; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mOL/PMP+NeJ2E1KYllEYqgE2h5AcWTErDO3aQ08TaQ8JZjehdXmAwJalEHuCVXkpyB
    pkBUHZul7XE/T7ykcWminQrQMWVEZUZHPZcUE0NoZgveVR6WHAD0hQxa3N+ufw5g6Nen
    8zWXy6kbmx9Y+i+btlZCxbrwtR51GfUwT0hwoxXAl5dhTjkv1RQO67o+36PuXvY1516R
    NyHYwUZ++0RlL3EdJ/q6lOF5yPl7x5laUqpRt67G3WEY4hzvjiLDhPUv+Mx5heZbFUgv
    jroJy31PqkkbQQUc6SchYn7ZNQVqfTuRdiaU7q+Cw4Yj5WHu5jLr2uB6QKcjV7VlIpZT
    Kc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701945246;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+Kqy8hxh9JRvG98xCRnk451nXywJ+xmBnT99GgubYp4=;
    b=lVCuFhGEYJikPgPrANervfmrscNeYed2KGhx53qraGreguxpFqO+LyIpVUwVPl49GO
    XFS1PjWme3pFwiqbNwUaeiqtXXNPcyk07lrvSCqf+0xH559yWb8/spVjF+xj8a8Tgu3/
    A8y+8tPLXcQ8UIUPUSmHnYcXHDwGa7kDtFZqx53R/y8SZjPhAMhYM/nwwrg6SiRv/lqq
    /QNV/2+2xo2zbiJ9U7M1qgE9RwPq36j0NsQVe6ILNBOBUWq9mTy4hrYMxZr2MyTpS4xN
    FZ9AGUD80zYo7zO4V7xi0g9io3YM0hnP92nX9UokIdESV4FGkKiP2Yg8EiWCl43J/ckq
    2G4w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701945246;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+Kqy8hxh9JRvG98xCRnk451nXywJ+xmBnT99GgubYp4=;
    b=P4KnjRZcvO2pNha1Mo6dGvsIsh/cZ1u/T9KBCygDl5AA3NaBfrEerVEWz68GM31lHT
    908aifCihZsHCnnn+a54wi9EF0B/m5MRdQQbLc3p80IIoSwUSSgODdBOKYf+Zr3Yahhl
    w8ODwA/4kqQjOwHlX+UXjkw0lWt0xBvhUzfx2BAGnT0YPn90E3QvpvS9NQ3cssDMv927
    CAVAE2YmJ2ghP5LPbzYARBhTHk3tym/kQkxc1nF9zUcGS8zmEO3G0FBikU/vOsRiRAhp
    mBbEQWcporaSThp5QnXdx86L0RHk8K9Gi8iVxEXW/m+GvESmMk5RLZ1TAmncO4WsqEwP
    TZng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701945246;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+Kqy8hxh9JRvG98xCRnk451nXywJ+xmBnT99GgubYp4=;
    b=8d0eEMoeXltuoLS8rflw6BVU1WX0h+Aj9r6oZwRPtbRNw2Opa5kgGDVbEfK1NGPSoQ
    xgx53NjHA6DPVO1RgSCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGerXQ="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
    with ESMTPSA id wfeb35zB7AY4C2K
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 7 Dec 2023 11:34:04 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
Date: Thu, 7 Dec 2023 11:33:53 +0100
Cc: Andrew Davis <afd@ti.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org,
 linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8AB6CC4-DCA5-40DD-A311-94A16FF59254@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
 <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Hi Maxime,

> Am 07.12.2023 um 10:20 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> On Tue, Dec 05, 2023 at 02:50:08PM +0100, H. Nikolaus Schaller wrote:
>> Hi,
>>=20
>>> Am 05.12.2023 um 14:29 schrieb Maxime Ripard <mripard@kernel.org>:
>>>=20
>>> Hi,
>>>=20
>>> On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller =
wrote:
>>>>> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
>>>>>=20
>>>>> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
>>>>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs =
from
>>>>>> multiple vendors. Describe how the SGX GPU is integrated in these =
SoC,
>>>>>> including register space and interrupts. Clocks, reset, and power =
domain
>>>>>> information is SoC specific.
>>>>>>=20
>>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>>> ---
>>>>>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 =
+++++++++++++++++--
>>>>>> 1 file changed, 63 insertions(+), 6 deletions(-)
>>>>>=20
>>>>> I think it would be best to have a separate file for this, =
img,sgx.yaml
>>>>> maybe?
>>>>=20
>>>> Why?
>>>=20
>>> Because it's more convenient?
>>=20
>> Is it?
>=20
> It's for a separate architecture, with a separate driver, maintained =
out
> of tree by a separate community, with a separate set of requirements =
as
> evidenced by the other thread. And that's all fine in itself, but
> there's very little reason to put these two bindings in the same file.
>=20
> We could also turn this around, why is it important that it's in the
> same file?

Same vendor. And enough similarity in architectures, even a logical =
sequence
of development of versions (SGX =3D Version 5, Rogue =3D Version 6+) =
behind.
(SGX and Rogue seem to be just trade names for their architecture =
development).

AFAIK bindings should describe hardware and not communities or drivers
or who is currently maintaining it. The latter can change, the first =
not.

>=20
>>>> The whole family of IMG GPUs is PowerVR and SGX and Rogue are =
generations 5 and 6++:
>>>>=20
>>>> https://en.wikipedia.org/wiki/PowerVR
>>>=20
>>> That's not really relevant as far as bindings go.
>>=20
>> But maybe for choosing binding file names. Well they are machine =
readable
>> but sometimes humans work with them.
>=20
> Heh. It's something that can also be easily grepped,

Yes, arbitrarily introduced confusion can always be resolved by search =
engines
and makes them necessary and more and more advanced :)

> and the name is
> never going to reflect all the compatibles in a binding so it's what
> you'll end up doing anyway. But feel free to suggest another name to
> avoid the confusion.

Well,

1. rename img,powervr.yaml =3D> img,powervr-rogue.yaml
2. new file img,powervr-sgx.yaml

to have at least a systematic approach here.

>>> We have multiple
>>> binding files for devices of the same generation, or single bindings
>>> covering multiple generations.
>>>=20
>>> The important part is that every compatible is documented. It =
doesn't
>>> really matter how or where.
>>=20
>> Yes, and that is why I would find it more convenient to have a single
>> "img,powervr.yaml" for all variations unless it becomes filled with
>> unrelated stuff (which isn't as far as I see).
>=20
> Again, hard disagree there.

I am fine with that. I just advocate to follow the KISS principle.

Same vendor, similar purpose, similar architecture =3D> single bindings =
file
as Andrew proposed.

BR,
Nikolaus=

