Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 601C415F69E
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387603AbgBNTOQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:14:16 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:33960 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387499AbgBNTOP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581707653; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GWW/U1EMXRIvSaUuU3ZUKXODjzrpk3LBni1j1cPRbT8=;
        b=gAVUJm9canvo30OIb4f+WOtryV2XFl8R6eFCM2rd+ZKdiZvbpn+WZhDbh5Z173xEoOwMt2
        ingBiUx+DL0TXeN/zlQWdmzrGAre4/OLxe6TCjeQWvZfJVXSoxTnBl1Jg3npjKNEtNOjCb
        /N2OHhVqbS1H5QZdK8z9mwQtg24io2w=
Date:   Fri, 14 Feb 2020 16:13:53 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 12/12] MIPS: DTS: CI20: fix interrupt for pcf8563 RTC
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
Message-Id: <1581707633.3.8@crapouillou.net>
In-Reply-To: <42aed0c7c063fa6c289fcbf361645056e15f513c.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
        <42aed0c7c063fa6c289fcbf361645056e15f513c.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,


Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Interrupts should not be specified by interrupt line but by
> gpio parent and reference.
>=20
> Fixes: 73f2b940474d ("MIPS: CI20: DTS: Add I2C nodes")

If you add a Fixes tag, you should also add:
Cc: stable@vger.kernel.org

if you're fixing something older than -rc1, which is the case here=20
(alternatively Cc them manually, but just for these patches).

Same remark for your patch 05/12.

Cheers,
-Paul

> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 8f9d182566db..4bacefa2cfce 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -298,7 +298,9 @@ Optional input supply properties:
>  		rtc@51 {
>  			compatible =3D "nxp,pcf8563";
>  			reg =3D <0x51>;
> -			interrupts =3D <110>;
> +
> +			interrupt-parent =3D <&gpf>;
> +			interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>;
>  		};
>  };
>=20
> --
> 2.23.0
>=20

=

