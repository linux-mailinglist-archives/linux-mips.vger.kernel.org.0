Return-Path: <linux-mips+bounces-3887-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B2914522
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE07A2842AF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 08:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233FC61FF2;
	Mon, 24 Jun 2024 08:42:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996745FEED;
	Mon, 24 Jun 2024 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719218578; cv=none; b=U8Wwi3X3KEZ+rsxZUm/zWov5Xx+dVzO2tyV/cWWTI9BMBTFDPoovcg6Qr4QRtvUJJtluKOPwvGBAofZJfyr7xDE9PVT6Dbx1gYHUprUHVz8zAtThZEBvOjKuF6dbkRnXN3bWFFLnKUki/y0drirJXwOJYs1Qp4PbxyoJVVHmnJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719218578; c=relaxed/simple;
	bh=uou/1X38TpOV1H5lzk1XUMo5zHQwtHBpEjhyhwTfJHY=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=CLAGUwDBK9o8jqf1uqhzOUaeezU+/UMF551hqKSpAlOqbegEmSxgxUkxMu7BPf7GBueijP5bfd8aJ2KjHtKxnY9FJRHOc+esCs0txDxGAtbtH71ihnBOX6sINGM0mmqS0T2SHiqxMb0md9U1yNctho8tRHnwlsjSe53mjhTFOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=99192e773b=ms@dev.tdt.de>)
	id 1sLesm-008vkJ-9h; Mon, 24 Jun 2024 10:17:00 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sLesk-00Ctb6-St; Mon, 24 Jun 2024 10:16:58 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 72BD9240053;
	Mon, 24 Jun 2024 10:16:58 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id CF369240050;
	Mon, 24 Jun 2024 10:16:57 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 038F634826;
	Mon, 24 Jun 2024 10:16:56 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Mon, 24 Jun 2024 10:16:56 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, tsbogend@alpha.franken.de,
 rdunlap@infradead.org, robh@kernel.org, bhelgaas@google.com,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: pci: lantiq: restore reset gpio polarity
Organization: TDT AG
In-Reply-To: <ZnN9rkNqucEYuXzR@google.com>
References: <20240607090400.1816612-1-ms@dev.tdt.de>
 <ZmnfQWFoIw5UCV-k@google.com> <7d34eb4017e809245daa342e3ccddf4f@dev.tdt.de>
 <b6bea9239050ed39ce3a051a5985b86d@dev.tdt.de>
 <6e4eed26-0a15-4ab4-8f3f-7ed0e223db5e@hauke-m.de>
 <c1813503ba16e1d46a93382dd806ffa6@dev.tdt.de> <ZnN9rkNqucEYuXzR@google.com>
Message-ID: <ce1ba2382d12010f960d3e4c04d78fb2@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1719217019-4697E746-1C37EBBB/0/0
X-purgate: clean
X-purgate-type: clean

On 2024-06-20 02:54, Dmitry Torokhov wrote:
> On Fri, Jun 14, 2024 at 10:43:29AM +0200, Martin Schiller wrote:
>> On 2024-06-13 22:06, Hauke Mehrtens wrote:
>> > On 6/12/24 21:47, Martin Schiller wrote:
>> > > On 2024-06-12 20:39, Martin Schiller wrote:
>> > > > On 2024-06-12 19:47, Dmitry Torokhov wrote:
>> > > > > Hi Marton,
>> > > >
>> > > > Hi Dmitry,
>> > > >
>> > > > >
>> > > > > On Fri, Jun 07, 2024 at 11:04:00AM +0200, Martin Schiller wrot=
e:
>> > > > > > Commit 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using
>> > > > > > gpiod API") not
>> > > > > > only switched to the gpiod API, but also inverted /
>> > > > > > changed the polarity
>> > > > > > of the GPIO.
>> > > > > >
>> > > > > > According to the PCI specification, the RST# pin is an activ=
e-low
>> > > > > > signal. However, most of the device trees that have been
>> > > > > > widely used for
>> > > > > > a long time (mainly in the openWrt project) define this GPIO=
 as
>> > > > > > active-high and the old driver code inverted the signal inte=
rnally.
>> > > > > >
>> > > > > > Apparently there are actually boards where the reset gpio mu=
st be
>> > > > > > operated inverted. For this reason, we cannot use the
>> > > > > > GPIOD_OUT_LOW/HIGH
>> > > > > > flag for initialization. Instead, we must explicitly set
>> > > > > > the gpio to
>> > > > > > value 1 in order to take into account any
>> > > > > > "GPIO_ACTIVE_LOW" flag that
>> > > > > > may have been set.
>> > > > >
>> > > > > Do you have example of such boards? They could not have
>> > > > > worked before
>> > > > > 90c2d2eb7ab5 because it was actively setting the reset line
>> > > > > to physical
>> > > > > high, which should leave the device in reset state if there is=
 an
>> > > > > inverter between the AP and the device.
>> > > >
>> > > > Oh, you're right. I totally missed that '__gpio_set_value' was
>> > > > used in
>> > > > the original code and that raw accesses took place without payin=
g
>> > > > attention to the GPIO_ACTIVE_* flags.
>> > > >
>> > > > You can find the device trees I am talking about in [1].
>> > > >
>> > > > @Thomas Bogendoerfer:
>> > > > Would it be possible to stop the merging of this patch?
>> > > > I think We have to do do some further/other changes.
>> > > >
>> > > > >
>> > > > > >
>> > > > > > In order to remain compatible with all these existing
>> > > > > > device trees, we
>> > > > > > should therefore keep the logic as it was before the commit.
>> > > > >
>> > > > > With gpiod API operating with logical states there's still
>> > > > > difference in
>> > > > > logic:
>> > > > >
>> > > > > =C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value_cansleep(reset_gpio, 1=
);
>> > > > >
>> > > > > will leave GPIO at 1 if it is described as GPIO_ACTIVE_HIGH
>> > > > > (which is
>> > > > > apparently what you want for boards with broken DTS) but for b=
oards
>> > > > > that accurately describe GPIO as GPIO_ACTIVE_LOW it well
>> > > > > drive GPIO to
>> > > > > 0, leaving the card in reset state.
>> > > > >
>> > > > > You should either use gpiod_set_raw_value_calsleep() or we
>> > > > > can try and
>> > > > > quirk it in gpiolib (like we do for many other cases of
>> > > > > incorrect GPIO
>> > > > > polarity descriptions and which is my preference).
>> > >
>> > > So you mean we should add an entry for "lantiq,pci-xway" to the
>> > > of_gpio_try_fixup_polarity()?
>> > > Do you know any dts / device outside the openWrt universe which is
>> > > using
>> > > this driver.
>> > >
>> > > For the lantiq targets in openWrt, the devicetree blob is appended=
 to
>> > > the kernel image and therefore also updated when doing a firmware
>> > > upgrade. So, maybe it would also be an option to fix the driver (u=
sing
>> > > GPIO_ACTIVE_* flag for the initial level and set it to 0 -> 1 -> 0=
)
>> > > and
>> > > rework all the dts files to use GPIO_ACTIVE_LOW.
>=20
> Yes, cleaning up DTS files when it is possible is nice.
>=20
>> > >
>> > > Then we won't need any quirks.
>=20
> Quirks are fairly cheap and we are not in a hot path here.
>=20
>> >
>> > I am not aware that anyone is using a recent kernel on the VRX200
>> > outside of OpenWrt. I am also not aware that anyone is *not* appendi=
ng
>> > the DTB to the kernel. The SoC is pretty old now, the successor of
>> > this SoC was released about 10 years ago.
>> >
>>=20
>> We're not just talking about VRX200 (VR9) here, but even older devices
>> such as AR9 and Danube.
>>=20
>> > For me it would be fine if you fix the broken device device trees
>> > shipped with the upstream kernel and with OpenWrt to make them work
>> > with the PCI driver instead of investing too much time into handling
>> > old DTBs.
>> >
>> > The PCI reset is inverted on some boards to handle a dying gasp. If
>> > the power breaks down the reset should get triggered and the PCIe
>> > device can send a dying gasp signal to the other side. This is done =
on
>> > the reference designs of some Lantiq PCIe DSL card for the VRX318 an=
d
>> > probably also some other components.
>> >
>> > Hauke
>>=20
>> What I missed so far is the fact that the driver used=20
>> '__gpio_set_value'
>> before Dmitry's commit and thus used raw access to the GPIO.
>>=20
>> This effectively means that every device that has worked with the=20
>> driver
>> so far must have an ACTIVE_LOW reset, no matter what was configured in
>> the device tree.
>>=20
>>=20
>> So renaming the property in the dts from "gpio-reset" to "reset-gpios"
>> and setting the FLAGS to "GPIO_ACTIVE_LOW" should actually solve the
>> problem.
>=20
> Right, luckily (to a definition of luckily) the driver and DTB used
> "wrong" syntax for the gpio property, so we can quirk it and make
> force ACTIVE_LOW polarity on old DTBs, and new DTBs with "reset-gpios"
> property will follow polarity specified in DTB.

We have already adapted the device trees in openWrt. [1]
Will you create a quirk patch for the old DTBs or should I create one?

>=20
>>=20
>> What still bothers me about the driver itself are 2 things:
>> 1. the initial value of GPIOD_OUT_LOW. This means that there is no=20
>> real
>>    defined HIGH -> LOW -> HIGH on reset.
>=20
> Is this actually needed? Typically a card requires certain time in=20
> reset
> state (with reset line active) before it can be released, however there
> usually no restrictions on line being inactive beforehand. But=20
> typically
> it will be pulled up to avoid leakage...
>=20

No, I don't think that's absolutely necessary. Several tests have so far
shown that it works as it is at the moment.

[1]=20
https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3Df6fe1=
9ed6dfaf0444cd80f530bf89f6878fd5936


