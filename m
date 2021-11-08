Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB843449C01
	for <lists+linux-mips@lfdr.de>; Mon,  8 Nov 2021 19:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236209AbhKHS42 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 8 Nov 2021 13:56:28 -0500
Received: from aposti.net ([89.234.176.197]:33428 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236093AbhKHS42 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Nov 2021 13:56:28 -0500
Date:   Mon, 08 Nov 2021 18:53:24 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/7] drm/ingenic: Add support for JZ4780 and HDMI
 output
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Jonas Karlman <jonas@kwiboo.se>,
        dri-devel <dri-devel@lists.freedesktop.org>
Message-Id: <0HO92R.RF221XL59J3I1@crapouillou.net>
In-Reply-To: <ACEFD0BB-1FCF-4EEB-A40F-1F2543A05BF4@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
        <2c7d0aa7d3ef480ebb996d37c27cbaa6f722728b.1633436959.git.hns@goldelico.com>
        <FXTI0R.3FZIJZ7UYSNQ@crapouillou.net>
        <7CEBB741-2218-40A7-9800-B3A154895274@goldelico.com>
        <Q6U72R.9HY4TXLC6RWV2@crapouillou.net>
        <229EBE4C-6555-41DE-962F-D82798AEC650@goldelico.com>
        <HQY82R.69JHJIC64HDO1@crapouillou.net>
        <2E32F572-72D0-44E7-A700-AF8A2D37BFDA@goldelico.com>
        <ZA692R.GHQL6RBCLFB12@crapouillou.net>
        <D0809E59-DCB5-46CE-BE5E-D2A5D2ECA6F0@goldelico.com>
        <BVH92R.0VU3IKPQTLX9@crapouillou.net>
        <2F8A88BC-2696-491B-9C01-7D07A3B3670A@goldelico.com>
        <RIL92R.MLAZ6CTO865E1@crapouillou.net>
        <ACEFD0BB-1FCF-4EEB-A40F-1F2543A05BF4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Le lun., nov. 8 2021 at 19:33:48 +0100, H. Nikolaus Schaller 
<hns@goldelico.com> a écrit :
> Hi Paul,
> 
>>  Am 08.11.2021 um 18:49 schrieb Paul Cercueil <paul@crapouillou.net>:
>> 
>>>>  Variant 4: the variant #2 without the changes to the DTSI files.
>>>  Hm. If there is no cache and we can safely remove tight boundary 
>>> checking (by JZ_REG_LCD_SIZE1) for jz4725/40/70 (by not fixing 
>>> DTSI) why do we still need the max_register calculation from DTSI 
>>> specifically for jz4780 and at all?
>> 
>>  It's better to have the .max_register actually set to the proper 
>> value. Then reading the registers from debugfs 
>> (/sys/kernel/debug/regmap/) will print the actual list of registers 
>> without bogus values. If .max_register is set too high, it will end 
>> up reading outside the registers area.
> 
> Ok, that is a good reason to convince me.
> 
>>  On Ingenic SoCs such reads just return 0, but on some other SoCs it 
>> can lock up the system.
> 
> Yes, I know some of these...
> 
>>  So the best way forward is to have .max_register computed from the 
>> register area's size, and fix the DTSI with the proper sizes. Since 
>> your JZ4780 code needs to update .max_register anyway it's a good 
>> moment to add this patch, and the DTSI files can be fixed later (by 
>> me or whoever is up to the task).
> 
> Well, it would already be part of my Variant #2 (untested). So I 
> could simply split it up further and you can test the pure dtsi 
> changes and apply them later or modify if that makes problems. Saves 
> you a little work. BTW: the jz4740 seems to have even less registers 
> (last register seems to be LCDCMD1 @ 0x1305005C).

Sure, if you want. Send the DTSI patch(es) separate from this patchset 
then.

>> 
>>  Fixing the DTS is not a problem in any way, btw. We just need to 
>> ensure that the drivers still work with old DTB files, which will be 
>> the case here.
> 
> Yes, that is right since the new values are smaller than the 
> originals.
> 
> Ok, then let's do it that way.

Great. Waiting for your v6 then.

Cheers,
-Paul


