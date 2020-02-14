Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E0415F706
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387586AbgBNTnV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:43:21 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:33004 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387571AbgBNTnV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581709398; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wZkIWoT3qotVQAzgQYaq41IW6DjnXJ58Og2TKl+UxYc=;
        b=CylmmngXMjnDLNsYuyOHJWaCyYN0prjTB1gjlXLjqUQdJiqu7vagPSkN3rR0aPj+wUsXg+
        9Mb3yvg0l7sdZBsY3pTeC6M1N39ROw6FHsBzknaIEO29dIOPcUAwkiD1AMdfbWLTgzR0fp
        wDSRW6INz8BjS/H4ShcERbCgE415yNA=
Date:   Fri, 14 Feb 2020 16:42:57 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting
 modules
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1581709377.3.9@crapouillou.net>
In-Reply-To: <AD9439FF-9DEF-4B9A-8A01-F11B626708C1@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
        <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
        <1581707415.3.7@crapouillou.net>
        <AD9439FF-9DEF-4B9A-8A01-F11B626708C1@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le ven., f=E9vr. 14, 2020 at 20:30, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 14.02.2020 um 20:10 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Patches 03-12 only touch the same two files - ci20.dts and=20
>> ci20_defconfig.
>>=20
>>  Unless someone strongly disagrees, I'd suggest to squash all=20
>> patches that touch each file together (except the ones with a Fixes=20
>> tag), I don't think we really need that much granularity here.
>=20
> It comes more from having developed these things quite independently=20
> and only collected for submission...
>=20
> One patch I don't know how to handle: "MIPS: DTS: CI20: add DT node=20
> for IR sensor".
> It is from 2015 and has a different author (some Alex Smith but the=20
> mail address seems to be broken).
> This information and attribution will be lost if we squash them.

Ah, alright. Then I guess keep this one separate.

-Paul

>=20
> But I can do for V3 and will also fix the fixes tags by adding cc:=20
> stable :)
>=20
> BR and thanks,
> Nikolaus
>=20
>=20
>>=20
>>  -Paul
>>=20
>>=20
>>  Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Not all drivers need to be compiled into the kernel.
>>>  Support building and loading of kernel modules.
>>>  Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>  ---
>>>  arch/mips/configs/ci20_defconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>  diff --git a/arch/mips/configs/ci20_defconfig=20
>>> b/arch/mips/configs/ci20_defconfig
>>>  index be41df2a81fb..e0d3c9d4c2ae 100644
>>>  --- a/arch/mips/configs/ci20_defconfig
>>>  +++ b/arch/mips/configs/ci20_defconfig
>>>  @@ -1,4 +1,5 @@
>>>  # CONFIG_LOCALVERSION_AUTO is not set
>>>  +CONFIG_MODULES=3Dy
>>>  CONFIG_KERNEL_XZ=3Dy
>>>  CONFIG_SYSVIPC=3Dy
>>>  CONFIG_POSIX_MQUEUE=3Dy
>>>  --
>>>  2.23.0
>>=20
>>=20
>=20

=

