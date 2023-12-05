Return-Path: <linux-mips+bounces-543-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C490780567A
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 14:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CAF5B20F64
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 13:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EEE5E0D8;
	Tue,  5 Dec 2023 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="gvUKaiKK";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="x37upRab"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47481B1;
	Tue,  5 Dec 2023 05:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701784221; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=thU7GfXRdmud16hhoF4YyX4UyRq9xu8+0ec7eMtYZq6PzQHu9bU7+t16hQJyrbIY5w
    GL43j8cVmLYgqOpbix8oO2ePrp7uxovZc3vowcCgLSSJB14r3n6NH21BEfkuKtIwDUJs
    6DyteLESA4VghIobt5FAHd9lmURbVH2klx5IriG98W+NYPpIz+yT1pM738CqvV7VXAfp
    5gzfvd/xV330osDp3h/PnCep6vj1KugCgQp/ER7Mq05AaZSUwC/k/HUPD7L6hIJxxtmm
    sAebDLoA4UG3BTwTZS+sV7N2ydT4lBv4g+Wz4kIN3ChQJY9ydJeL4jl+YrxWIB2NxdBO
    rIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701784221;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BevZB1eqZGl2+QcgqrpfzNR7Ri326ZukfU8Ti2ESIko=;
    b=ZVpKj2lE6UPY6x3rSSrJ7NfyMfdvhGF9RIjIg0ZR9UUAlLlNvqo3Li8ta2mp9Y9VD6
    XYvfWbbahV3E21QwqkRuQoVnz644/UhUfx5y/VZQeORB5E0a4fEZgPdrIXEUTwYlVzMb
    yYyQWYCZH57WLtDsTbsyO1ujb9o432hTJrdb2NUpt7PlKGntO5X34mRuEelYXg7buC94
    dio6zGF4RtTNQakUADFfxYYyAnqiWDbeaom9wvijddx+sr88vYCKdf8VYKIY/TaDoaSb
    pErlX2aiGi+hoZTUbY5Wr3JRpILxWNMtL0hKujCg5NZqXMkeRJOx9p/CNURxOwKtw4pw
    1oBQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701784221;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BevZB1eqZGl2+QcgqrpfzNR7Ri326ZukfU8Ti2ESIko=;
    b=gvUKaiKK2pMqJEih6X3qP5q2HE4diwktFDI0x2D7T7fTE+3LK06yJbr3OOZfOSt96k
    m5a8zJuY6gCFs8CA77MgeV27eIUf05hISz6asZhErxc/2dD9SsipdOu4foe5N0TgSU6E
    xoCttMcyStMKC4Hf8ZEij4D9M5JcAvsPmyfl4aPPhS1c62G77aG06mxzcDyvBnCd9Bll
    iDIa55H0PNZy5EJb3vIbZ/JzzJASRlpBjicBFBWMQdZLPZHa46wHi7cJbrOi7/tYSAWZ
    2CHggPsKZ3DF5C6+inhSN+EfKWRLeS6ORG/StvZfPif3VcQc4rYjy1huLMLkzmCb62b0
    uJcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701784221;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=BevZB1eqZGl2+QcgqrpfzNR7Ri326ZukfU8Ti2ESIko=;
    b=x37upRaba5EaONfJgBtnk5313VU0c1csZgqbOTRvjE4ZsOoxVaOULDhgAPPuK6SxUl
    0xGrW118EH0GxKq/L7DQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeonQ="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.10.0 DYNA|AUTH)
    with ESMTPSA id wfeb35zB5DoJ252
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 5 Dec 2023 14:50:19 +0100 (CET)
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
In-Reply-To: <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
Date: Tue, 5 Dec 2023 14:50:08 +0100
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
Message-Id: <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Hi,

> Am 05.12.2023 um 14:29 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> Hi,
>=20
> On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller wrote:
>>> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
>>>=20
>>> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
>>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs =
from
>>>> multiple vendors. Describe how the SGX GPU is integrated in these =
SoC,
>>>> including register space and interrupts. Clocks, reset, and power =
domain
>>>> information is SoC specific.
>>>>=20
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 =
+++++++++++++++++--
>>>> 1 file changed, 63 insertions(+), 6 deletions(-)
>>>=20
>>> I think it would be best to have a separate file for this, =
img,sgx.yaml
>>> maybe?
>>=20
>> Why?
>=20
> Because it's more convenient?

Is it?

>> The whole family of IMG GPUs is PowerVR and SGX and Rogue are =
generations 5 and 6++:
>>=20
>> https://en.wikipedia.org/wiki/PowerVR
>=20
> That's not really relevant as far as bindings go.

But maybe for choosing binding file names. Well they are machine =
readable
but sometimes humans work with them.

> We have multiple
> binding files for devices of the same generation, or single bindings
> covering multiple generations.
>=20
> The important part is that every compatible is documented. It doesn't
> really matter how or where.

Yes, and that is why I would find it more convenient to have a single
"img,powervr.yaml" for all variations unless it becomes filled with
unrelated stuff (which isn't as far as I see).

BR, Nikolaus=

