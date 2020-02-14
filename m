Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5990115F5B6
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 19:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390048AbgBNSic (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 13:38:32 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:56768 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388315AbgBNSiI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 13:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581705485; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=beZzKtKyiHGgH1Qk/SiuKXMW0hDwqXZLEktuMIuWvEE=;
        b=sC5pJA/nh5xcTm7rWdmK2CKb8najbEJln1+fkR17tqQylQ5NhHpjbnDlOK5AnbztrT6vIl
        bV7+EhcjF8AqgTGgCFQ+sFlp/PYN6uiSrjG2Ew3MIdT2Wo7mLp3cWlnNAFhc2Fi6Jpu7c1
        LLPZu0xnCOeBG/mVs5pupfLnYePF4GU=
Date:   Fri, 14 Feb 2020 15:37:38 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 5/6] MIPS: CI20: Modify DTS to support high resolution
 timer for SMP.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, ralf@linux-mips.org, paulburton@kernel.org,
        jiaxun.yang@flygoat.com, chenhc@lemote.com, allison@lohutok.net,
        tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Message-Id: <1581705458.3.2@crapouillou.net>
In-Reply-To: <1581703360-112557-7-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1581703360-112557-7-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

I think you can move this patch before the clocksource one - it will=20
work with the old clocksource code and in generally it's a good idea to=20
ensure (if possible) that you can git-bisect without ending up with a=20
broken kernel.

-Paul


Le sam., f=C3=A9vr. 15, 2020 at 02:02, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Ya=
njie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Modify DTS, change tcu channel from 2 to 3, channel #0 and #1 for
> per core local timer, #2 for clocksource.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v1->v2:
>     No change.
>=20
>     v2->v3:
>     No change.
>=20
>     v3->v4:
>     Rebase on top of kernel 5.6-rc1.
>=20
>  arch/mips/boot/dts/ingenic/ci20.dts | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts=20
> b/arch/mips/boot/dts/ingenic/ci20.dts
> index 37b9316..98c4c42 100644
> --- a/arch/mips/boot/dts/ingenic/ci20.dts
> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
> @@ -456,6 +456,13 @@
>=20
>  &tcu {
>  	/* 3 MHz for the system timer and clocksource */
> -	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
> -	assigned-clock-rates =3D <3000000>, <3000000>;
> +	assigned-clocks =3D <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>,
> +					  <&tcu TCU_CLK_TIMER2>;
> +	assigned-clock-rates =3D <3000000>, <3000000>, <750000>;
> +
> +	/*
> +	 * Use channel #0 and #1 for the per core system timer,
> +	 * and use channel #2 for the clocksource.
> +	 */
> +	ingenic,pwm-channels-mask =3D <0xF8>;
>  };
> --
> 2.7.4
>=20

=

