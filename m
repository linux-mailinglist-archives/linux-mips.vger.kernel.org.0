Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402FF3E4470
	for <lists+linux-mips@lfdr.de>; Mon,  9 Aug 2021 13:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhHILOx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Aug 2021 07:14:53 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:17980 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbhHILOv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Aug 2021 07:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628507645;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=D61QcQ2ikH6pyF93PQRIiJa+9hIZ7LO0u46R8W91maQ=;
    b=UdOYTApLJwx0c2vExbmf7pAQCT6CniU38cVObbtbANOxSSH1+PVPixmZWbCGXOUSH4
    6sfUFqq7+6UGFy/oG466AqqBUPwRIU+mhVp+HA2gFqPW2tMnlqlM2hMk0q8jQ1Mz7fCk
    hzEnCwOMUJQ8V/kdMaXarNnfffy+bD5tabNbYiTXs/kAbUq11+EN4QpRJo0E3lcxqYoA
    SPvIeQ7mV0frwKBBUIlaqnjNyZRC+DWZoC3rSw99x7aRV3NPVvURG2IA1BkUMTIXV8in
    1GX/IDOJlr3Dw0DE+1FPlc/V+hXqlmEGPlD3LQjx+68abAlC/+xG3BvKSHq7USTjpAlm
    iUiw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dH6ihWzeaSyEkW3kk6mc5VRcFik4jBU+iRlqxmKI"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2d70:c400:353e:9c7b:18f6:2302]
    by smtp.strato.de (RZmta 47.31.0 AUTH)
    with ESMTPSA id Q02727x79BE4Joa
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 9 Aug 2021 13:14:04 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <137A13EE-9E0E-469E-BE43-677349478A58@goldelico.com>
Date:   Mon, 9 Aug 2021 13:14:03 +0200
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        linux-mips <linux-mips@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, list@opendingux.net,
        Sam Ravnborg <sam@ravnborg.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5DADB00D-1E0E-4B3A-86CE-4E98A5DC04DE@goldelico.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-9-paul@crapouillou.net>
 <2AEC5953-FE54-4DD5-88B7-783C4D9E23B2@goldelico.com>
 <4OBJXQ.DA6PDYNSVNYV1@crapouillou.net>
 <2C83670F-3586-435B-8374-C3CC1C791391@goldelico.com>
 <137A13EE-9E0E-469E-BE43-677349478A58@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,
quick feedback: our HDMI on top compiles fine after fixing 2 merge =
conflicts, but dos not yet work.
Will need some spare time with access to the CI20 board to research the =
issue, i.e. can not give feedback immediately.
BR and thanks,
Nikolaus

> Am 08.08.2021 um 21:12 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 08.08.2021 um 21:06 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>>=20
>>=20
>>> Am 08.08.2021 um 21:04 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>=20
>>> Hi Nikolaus,
>>>=20
>>> Le dim., ao=C3=BBt 8 2021 at 20:57:09 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> Hi Paul,
>>>> all other patches apply cleanly but this one fails on top of =
v5.14-rc4.
>>>> What base are you using?
>>>> BR and thanks,
>>>> Nikolaus
>>>=20
>>> The base is drm-misc (https://cgit.freedesktop.org/drm/drm-misc), =
branch drm-misc-next.
>>=20
>> Ok, fine!
>=20
> Contains 3 patches for drm/ingenic and after taking them first, I can =
apply the series.
>=20
> Again, BR and thanks,
> Nikolaus
>=20
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

