Return-Path: <linux-mips+bounces-10256-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A7B25077
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 19:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25B4D1C23234
	for <lists+linux-mips@lfdr.de>; Wed, 13 Aug 2025 16:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1586028C2D3;
	Wed, 13 Aug 2025 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApNM+ubm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1F928B415;
	Wed, 13 Aug 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104261; cv=none; b=eTuihXQIcKFuVt3/mFotCMkKZ1K4BJXr1Qq5hwxLNYEWWfMBez0nMON0/wo2Jwp7z99tQP7hZL2onc2eMI6ohS8zm4zrNPkINnDseg/z/SSoun1voObkkaZryu5F4fbOeJIDbwSvxOtC0kh5Ik11E9ho4/pwo3jVpHSTiYM20w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104261; c=relaxed/simple;
	bh=d5wzBkVFNX6qAoxoJebtm0HqVmOo3GmOYnWMCd8weXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qi7ob+ZtrLVVySobUDDg7RDy0YgNl4yjYXjUtu9NCusKQloBhCWf+nYso14zVeaCPblexC3+OBHOYu9EjjPw02zQ+IIZsD4rvutPGeScvDuv5s3Dm/ILCK05PvLJuH88H5Y+vcen+ug+RSF8NSVTZitUV3gdQgeOZPpPIlFZJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApNM+ubm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so6984466b.2;
        Wed, 13 Aug 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104258; x=1755709058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=ApNM+ubmRwM7RSC40DNjE+ofpXjCz0yVpOG/2xfbZi7qscg3jPcd0V1xK83tfflzLO
         xQQlfAD4bgsOZcSMc67YABOsyEF6BXTj5BH2upqRzKtS2Altdfq6vhhhP/7xyuZTRLw+
         69ny3NIaMzt0MQQEQAutWV+QfX93MxlGgyAykiy+GLYt8EvrisfyCpZTFn1GwdzCRzkJ
         MH3O+wRG8+n3jEaEctWMEIsjWc4iXIV5pxnkR1WZkgZJDJ6GapcKHjw5Tbsfar7c12Bg
         xdB1OvsDYRk7kSQOc2nI21dgx6rKom352XD0xuHGhr1P29M7Evm+IOllImUPOVV/gWwS
         6FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104258; x=1755709058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2gxI4yFXWVOtLhM/0polO/7seLsXtV2FXKtzlfxTr8=;
        b=ROBFyP7FXRAoMOQA9puH7RV1e+pK4tlgzizwsHAxkc2T2KFurKXxf18jnEp/Xk74kH
         3Xe/1a2phHMo8hH/xB8y8bieWK1bS7lOhHGCWs7tJWiu4AmAnkE3tjwUjBXYuug9ieEd
         jJG+nRkfjlhaCKWyuySRxZ8TjPVW3gsMsDHZDaXUBWPl0VZg/ye44uBE6Zi8+X1jEUAZ
         aB+j2cK/gplAjEdjLsj/UA3QNAk91uKpOrSL80SNOCCecy0TKW2DNHm/rP4vaGcFOO8E
         33rx/bVxXIfhzD4k9dZFKXg3vLx03ZFCYXRztnnA4USq550yiBg4xMc47MXDWG+DGLly
         zTEw==
X-Forwarded-Encrypted: i=1; AJvYcCUFb/n2JjPOu+zVN0OpJD5bZwH6eGBLsD5d7DAv6L9YHIdMD3b+KbEm+cfQLNAOHDBtQCyMXptz+YjslA==@vger.kernel.org, AJvYcCUP8BuxXXlOY9TMnZ/VD5tK6sjv0S13p63uOvvr90XZptPa5RoHXfYjgJvqf7atW4bXyOC3m748YAZ/Dg==@vger.kernel.org, AJvYcCV1bSdJq0Z/LPIvpipkgXlLXQnN2nZl87MGMArkAeMtDq1Jy12bwMXvUxbLlpXPwwhlva6T/vKs2UNV2gouSkCB@vger.kernel.org, AJvYcCVrwpaCIGrNeuijpvLKerhBzw4o4uOurA6c9XrYjP2f9ZpjvqNzd7TxepUNKxKSNl33unVrk4TAWaniHN6s@vger.kernel.org, AJvYcCWUknLfk/wYmVAYugSHt3TnD5PEmZGk1zXkLIWb3c6uFNWeqpLUUniVc8hcY07/7aKV4fmOJ3pG4GxhwQ==@vger.kernel.org, AJvYcCWb/Ndlo8q3BUH80OzxEitcaS/f7JIvCRPkowjJosNxWLWYQGrzt6ZQvLL6MYcI4iejGZvwHXTHi+cnybW5@vger.kernel.org, AJvYcCWdigR4/hLNteSLuUQHxSzRd5A428Xy0WdFVH//gJaUTiGeWqQR+jl6xqxND6EfYC5iHDryYD1s8R33VPwuW9fIHcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyqgZclVJHPondCKLNK8BuomvBV97MPaE9FWZH2oHA3ugNqaa
	agiFpvx2BaCWd5PChZmqZ2yrMT+dtIGgJXeJNA77Ui/c22Fu2SM4FRTw9xDSwH7JiL07kUyyiC3
	vuI/S2qSjAbBCFdjvzx/wOcAF634KxoE=
X-Gm-Gg: ASbGncsIOMOGI6ZYGV8RcPe4fZAMDUblFDMD9hUgtTSdwG8wix5q5Nsi3YMegNgeaBX
	nQPXHn2AZKzqwieFJp2k1jEOnJrqDh4vPeLhd75yDNt2YwnWEXtK6fMsAMvgh49amTV4wL7BNwu
	0s/vT0Yz74ymLMzbQtMfq1jwPltmI6gfLaEzkz40xcyhg4KriywShqk1yhhV/oj14Itz5zF82dE
	4QDzlAu/w==
X-Google-Smtp-Source: AGHT+IHbk44OEj1r3kasIcTcyEDngMuhrBuyXGAMgY2npDrtdlj0x5dJHeL/vjl9xwrgnQvrGKpG6wybKFGCryjWMzw=
X-Received: by 2002:a17:907:3f0b:b0:af9:116c:61c4 with SMTP id
 a640c23a62f3a-afca4e44cd7mr358157166b.48.1755104257569; Wed, 13 Aug 2025
 09:57:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Aug 2025 18:57:00 +0200
X-Gm-Features: Ac12FXzRwEdbOG7WcfkJrIX52h7RVyVAx5HnOB8PpoXFNYyQXL2enxp09SWUXag
Message-ID: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.

...

>  #define PINCTRL_FUNC_DESC(id)                                          \
>         {                                                               \
>                 .desc =3D {                                              =
 \
> -                       .func =3D {                                      =
 \
> -                               .name =3D #id,                           =
 \
> -                               .groups =3D id##_groups,                 =
 \
> -                               .ngroups =3D ARRAY_SIZE(id##_groups),    =
 \
> -                       }                                               \
> +                       .name =3D #id,                                   =
 \
> +                       .groups =3D id##_groups,                         =
 \
> +                       .ngroups =3D ARRAY_SIZE(id##_groups),            =
 \

Can this use PINCTRL_PINFUNCITON() ?

>                 },                                                      \
>                 .groups =3D id##_func_group,                             =
 \
>                 .group_size =3D ARRAY_SIZE(id##_func_group),             =
 \

>  };

--=20
With Best Regards,
Andy Shevchenko

