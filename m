Return-Path: <linux-mips+bounces-9962-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB0B17043
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 13:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BFB1AA4063
	for <lists+linux-mips@lfdr.de>; Thu, 31 Jul 2025 11:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BE32BFC85;
	Thu, 31 Jul 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlrGQIWa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EFD2BF00B;
	Thu, 31 Jul 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753960726; cv=none; b=mUCk1hgkO0TzGORPYJg80Vd/Kk+FWnugcBNlOe7AmyEBcRHsKGv5Jad8f9PbdXpMz9mcSFkzdHYM1vL9RuSNA8nu03PUDcwy8vEF6T+nFfTizGgXcydt2itek+FPdUnf5J3xAYTHAiredy6coIbbNu6frrJZZizvbe6Y9A+nups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753960726; c=relaxed/simple;
	bh=rswEmbzAbnRa2dgcdTCzb6hzHnfprvlr8wLY/EDWe28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upob/SgoDjLxP2G8mNx1eh/E3Wq329/HZom/RTJb/qzErcHr0VhBWhY3iRNQqdawVQf/rEHumwexvHiXNKDhV23d3sGmWpg8S3pmFszkjJBalaU8btIGAV7dKg60ox3iklhBPP7ixY7WF9fstBZhxR9VC/S5wO7f5137bK0V1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlrGQIWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC196C4CEEF;
	Thu, 31 Jul 2025 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753960725;
	bh=rswEmbzAbnRa2dgcdTCzb6hzHnfprvlr8wLY/EDWe28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rlrGQIWa23plGopbto7j2HRa8jRdZ1zJRui8whhL8/foCBFcDnmxXeEtvqjfl02aa
	 w1y4vhhSS2hc+4znf9i+X9EQ8fojOxLl+pVlcgBjpIU6a8begku4B1AzaLphj0013g
	 tPqsQE7Z23u7YvvrjdHuDse7JukLmYSaPjjX6vlFGeQMnxySN3yAWTa39MVFYoijf9
	 2LfskJLl2Y5C47Np0EHCAQMn4NEBvHgsnBsslHo2DZYuU7U3qXFA/pZ7v5EoT4HlZX
	 u3LGLpUhlzXqqs6NwYPGmrmiHaJ5lcvAFipJRA8tAh26bRAFUEUPVoW+KzQDorIJIt
	 KGcqazTykIgag==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-615378b42ecso1338129a12.0;
        Thu, 31 Jul 2025 04:18:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGaC2grd6/q4o6xHFpXtqD2YB+eEMIASKx88ffsavYhwJpfe5TnaR5kv6aCCCOfuGsBoQToybbmm4D+A==@vger.kernel.org, AJvYcCWt9bdTJchZ0y5IPRERjGT+esCOGF2+3jd9/U3vFdkXlLTTFNS2FxZuKKNgz+wcENe3vkRyas67AN0flPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrz4iZkhj+4lYmTAbUryPVNFo77MtBOYwcL2CF8kqPbux9fp6t
	qkYwXJSr8eOqeqMoQ6M1j6OK74WGpQa2fXckHsmkjyDqXzXmQsePLwvcFakxF6CIvWMMQQyDoQn
	CU+Dtplisbds95M0b8TJ0u1igMzpUQvk=
X-Google-Smtp-Source: AGHT+IEJqhQ3w8H3+lFjy46dU1ytMowLPop/riplOTIN2fGGdvVE989ka5RInCaPlew98qpmqod3UawUDnmI2K4pIok=
X-Received: by 2002:aa7:d5d5:0:b0:615:481c:7e03 with SMTP id
 4fb4d7f45d1cf-615871e685cmr5773649a12.21.1753960724238; Thu, 31 Jul 2025
 04:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731091109.16901-1-tiwai@suse.de> <20250731091109.16901-4-tiwai@suse.de>
In-Reply-To: <20250731091109.16901-4-tiwai@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 31 Jul 2025 19:18:31 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4YX22_p_H3M8SD6ap4W4pbRnOBw16L_7GchZh7W50TQA@mail.gmail.com>
X-Gm-Features: Ac12FXwakZb0YubvZH4vlqOzWkpBuNqNoMFC67ysNaFv3Pns3YculL_KzXserkM
Message-ID: <CAAhV-H4YX22_p_H3M8SD6ap4W4pbRnOBw16L_7GchZh7W50TQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mips: Update HD-audio configs again
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 5:11=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> The HD-audio codec driver configs have been updated again since the
> previous change.  Correct the types and enable all Realtek HD-audio
> codecs for loongson, per request.
>
> Fixes: 1d8dd982c409 ("ALSA: hda/realtek: Enable drivers as default")
> Fixes: 81231ad173d8 ("ALSA: hda/hdmi: Enable drivers as default")
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
> v1->v2: enable all Realtek codecs and most of HDMI codecs
>
> The changes are only in sound.git tree, so I'll pick up this there, too
>
>  arch/mips/configs/loongson2k_defconfig | 11 +++++++++++
>  arch/mips/configs/loongson3_defconfig  | 15 ++++++++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/l=
oongson2k_defconfig
> index 4b7f914d01d0..7a86632b87e9 100644
> --- a/arch/mips/configs/loongson2k_defconfig
> +++ b/arch/mips/configs/loongson2k_defconfig
> @@ -257,6 +257,17 @@ CONFIG_SND_HDA_INTEL=3Dy
>  CONFIG_SND_HDA_HWDEP=3Dy
>  CONFIG_SND_HDA_PATCH_LOADER=3Dy
>  CONFIG_SND_HDA_CODEC_REALTEK=3Dy
> +CONFIG_SND_HDA_CODEC_REALTEK_LIB=3Dy
> +CONFIG_SND_HDA_CODEC_ALC260=3Dy
> +CONFIG_SND_HDA_CODEC_ALC262=3Dy
> +CONFIG_SND_HDA_CODEC_ALC268=3Dy
> +CONFIG_SND_HDA_CODEC_ALC269=3Dy
> +CONFIG_SND_HDA_CODEC_ALC662=3Dy
> +CONFIG_SND_HDA_CODEC_ALC680=3Dy
> +CONFIG_SND_HDA_CODEC_ALC861=3Dy
> +CONFIG_SND_HDA_CODEC_ALC861VD=3Dy
> +CONFIG_SND_HDA_CODEC_ALC880=3Dy
> +CONFIG_SND_HDA_CODEC_ALC882=3Dy
>  CONFIG_SND_HDA_CODEC_ANALOG=3Dy
>  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dy
>  CONFIG_SND_HDA_CODEC_VIA=3Dy
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/lo=
ongson3_defconfig
> index 5ff0c1554168..315ab7ec17b6 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -292,11 +292,24 @@ CONFIG_SND_SEQ_DUMMY=3Dm
>  # CONFIG_SND_ISA is not set
>  CONFIG_SND_HDA_INTEL=3Dm
>  CONFIG_SND_HDA_PATCH_LOADER=3Dy
> -CONFIG_SND_HDA_CODEC_REALTEK=3Dy
> +CONFIG_SND_HDA_CODEC_REALTEK=3Dm
>  CONFIG_SND_HDA_CODEC_REALTEK_LIB=3Dm
> +CONFIG_SND_HDA_CODEC_ALC260=3Dm
> +CONFIG_SND_HDA_CODEC_ALC262=3Dm
> +CONFIG_SND_HDA_CODEC_ALC268=3Dm
>  CONFIG_SND_HDA_CODEC_ALC269=3Dm
> +CONFIG_SND_HDA_CODEC_ALC662=3Dm
> +CONFIG_SND_HDA_CODEC_ALC680=3Dm
> +CONFIG_SND_HDA_CODEC_ALC861=3Dm
> +CONFIG_SND_HDA_CODEC_ALC861VD=3Dm
> +CONFIG_SND_HDA_CODEC_ALC880=3Dm
> +CONFIG_SND_HDA_CODEC_ALC882=3Dm
>  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
>  CONFIG_SND_HDA_CODEC_HDMI=3Dm
> +CONFIG_SND_HDA_CODEC_HDMI_GENERIC=3Dm
> +CONFIG_SND_HDA_CODEC_HDMI_INTEL=3Dm
> +CONFIG_SND_HDA_CODEC_HDMI_ATI=3Dm
> +CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=3Dm
>  CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
>  # CONFIG_SND_USB is not set
>  CONFIG_HIDRAW=3Dy
> --
> 2.50.1
>
>

