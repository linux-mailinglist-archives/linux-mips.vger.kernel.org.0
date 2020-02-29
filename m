Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274AB174570
	for <lists+linux-mips@lfdr.de>; Sat, 29 Feb 2020 07:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgB2Glj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Feb 2020 01:41:39 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:16056 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgB2Glj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Feb 2020 01:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582958496;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0ME2SplYdZp/EcXKhCp8KyLMdT2ULtuVLwdKdNAFg6E=;
        b=c/Efms7OL7pq8mGZHfLZOcbzDL1vn992XFmTCyE+TCrnL1gMKoHFFBEREUk5HZHnVr
        S1GjWb/4nOiB8klGMDyDtsPq8/cpIl5ZGkwgsPlsTBe8Xi2LATC+Z4yA0jjbG1KZDQ4h
        TXZlVpzdrkhcDe8WxtIoA3bLUAt/uCKmCjRGWBh3Q1x0gFVLfw8EN1214nZFr6EQaWVn
        d8AL1Ohe4NHBg3m7Mat8ZJyGgj8LXLzWkz8maLDqaRV57HCxGZ7CNIgfVRwlFo7vz7Ac
        X4184LR1WJlR5T8hbhFVDq+GS8f06Zlqw4MR4aucGl39zGxfGNPRt4ChE/EhlkfAhKDk
        4GCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlafXAwF5A=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1T6fI3wF
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 29 Feb 2020 07:41:18 +0100 (CET)
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CACRpkdYSde=6JBBbe3sL3hDHhGAeOfwadT0BvL0n+-F0O2vX0g@mail.gmail.com>
Date:   Sat, 29 Feb 2020 07:41:17 +0100
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A87158C4-E5AC-4B4A-B132-3A82982E37FC@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com> <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com> <CACRpkdYSde=6JBBbe3sL3hDHhGAeOfwadT0BvL0n+-F0O2vX0g@mail.gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> Am 28.02.2020 um 23:05 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>=20
>> From: Paul Boddie <paul@boddie.org.uk>
>>=20
>> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> This looks good, can I just apply this to the pinctrl tree?

Yes. It is more or less a base commit for the others.

>=20
> Yours,
> Linus Walleij

BR and thanks,
Nikolaus

