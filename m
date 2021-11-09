Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C053044B485
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 22:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241880AbhKIVR6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 16:17:58 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:36355 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbhKIVR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 16:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636492464;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=quLu7mS7NCzSVjkHuzT3rgqoZ7lnZyxc90gs5rG1UFg=;
    b=D2LLh5em7bNfkxFpNKYI4ke/zCaEhrT46dLU/hyC0OcN3rA7mgQ6GyXpv6LNY6VS9V
    STjYbaos7o1qS7xUrW/YXncEKOC6xz16tJKAbPWFMvdVAxxAswHkGbmb2BgQvnj49Ur8
    av1ht+6HJm/hzQXERImagp2t4MFWoW9ETljOmXXNlHePeCvDzW6atF/BnJ/WTj++eQs7
    Ple58DB0NYkekyj/TB3pbeysVqiIj7DCLSxNfFMeasMX49Ra9tEi7VhEP8aeHnHHKll8
    8m/rOOaNZgBj3ZOEVgUDdrILc76NNLgR1CVuUU2AhPeFwjQtBeCwa3Vk5WEH4LNTj9bv
    Lm+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8cT6Q=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id Y02aa4xA9LEN0iJ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 9 Nov 2021 22:14:23 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH v5 5/7] MIPS: DTS: jz4780: Account for
 Synopsys HDMI driver and LCD controllers
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4DCFE008-A619-465F-9124-F58AC36A2B08@goldelico.com>
Date:   Tue, 9 Nov 2021 22:14:22 +0100
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Paul Boddie <paul@boddie.org.uk>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
        Jon as Karlman <jonas@kwiboo.se>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <108FD13E-F623-493D-8091-1E0D73479A4D@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
 <c243176cb5e5a3ab5df1fe77f9246b6d5ec4f88e.1633436959.git.hns@goldelico.com>
 <O7VI0R.CRIG8R7O0OOI3@crapouillou.net> <3514743.EH6qe8WxYI@jason>
 <N3YI0R.7ZLKK5JTBXW63@crapouillou.net>
 <95D1DE70-DDF4-419B-8F0C-E9A6E0995D1F@goldelico.com>
 <BDU72R.SAKM4CQWCUKI2@crapouillou.net>
 <BF6CBFFA-E8AA-4CCE-A587-4D5D647DEC64@goldelico.com>
 <6WNB2R.GJ2KT1BB7QOY1@crapouillou.net>
 <4DCFE008-A619-465F-9124-F58AC36A2B08@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> Am 09.11.2021 um 21:42 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>> So you want to update these properties to add the HDMI clock setting, =
like this:
>>=20
>> 	assigned-clocks =3D <&cgu JZ4780_CLK_OTGPHY>, <&cgu =
JZ4780_CLK_RTC>, <&cgu JZ4780_CLK_HDMI>;
>> 	assigned-clock-parents =3D <0>, <&cgu JZ4780_CLK_RTCLK>;
>> 	assigned-clock-rates =3D <48000000>, <0>, <27000000>;
>=20
> Will give it a try.

Yes, works. So v6 is not far away.

BR,
Nikolaus

