Return-Path: <linux-mips+bounces-9953-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E275B16344
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 17:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323E15642E7
	for <lists+linux-mips@lfdr.de>; Wed, 30 Jul 2025 15:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6366D2DC35C;
	Wed, 30 Jul 2025 15:01:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BF264615;
	Wed, 30 Jul 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753887687; cv=none; b=ivOItPBzJVShFKEzkNSw5aE8sx/O/dw7+cWO/LX4Ti/68TDpInOmRNIgji7F+OJzAsbrY9GJb5am/pAIj+n8UN5I8cuC7lUTV1XIWlPvLwTecyZlJrotHs5rfeAKxQI6Fk5Y5aMPYXPVy7y7PGL9ezv9NzJzTPYPOAmGg3R7lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753887687; c=relaxed/simple;
	bh=3VznigarjS4+bf7sHcF2OdxMen0xturLzi7KfF46aC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+eL8egW8YFy8k19dlHOtrKxqf0rwex7iywsq++1qlNGWxgBzyP68Wx/Ray17Rx3aVuad/9iVSOcO9vfun0GvIaHmBwm5xMC62yJew3NceQbvBoyBGP1YfH99mhbfANIIcpaRC6nFiTosB/DNEugv0wO2NX2LIjDJAcXyXudK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-7073075c767so60947046d6.3;
        Wed, 30 Jul 2025 08:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887684; x=1754492484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCufAOV94HIMKHfZVdb3wjn9NSi/Vfyn02LpL1/VMoY=;
        b=B+vuJ8H+LpDD6D22U5moqoHnvJVfISQ2ERDL5XASexYvYLfnCirjQ4O34vlZWd2M1n
         2pxunix5tH7AYUtWmVABMeIAOI5+JryKDOgIgyanC4G0Owy7QmMtlRkKLLcNKMiq2TSV
         /BkKEgQlJIA7gSUzHEnsb6nNBxqtgyoj4jdXwNnvVw4xFG7xEz6cLcM4d0Qe5digzTuv
         EZECJIrB71Wiue4i/P6Hvr84B0xOlVKluWd84xQ8ueIfbXHoq1S1iQPc0/65MOYGyBad
         hWuj4EIRbP0tunZB/DQBVKlLA9PHqfw9uKVX776zAuUecl6N3iGz/8M6l40LQli7NBKa
         03QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKKZu/UP4CCRTMB6xviXh08xJLZElWz2ZHEVRkCaPX0ye/bkjmIH7Asy8KLEvX2/+RDldswanet1h8arLMCbwYNC0=@vger.kernel.org, AJvYcCV1NeBabSDxAjcre/H4exV4QTx8B7zV/9jHC3bKLb+4l3qyRiGqivMy+2I5LE7KOMgCAOHcKt7ix7CfEg==@vger.kernel.org, AJvYcCV60kIAWvVJ5akryTd9BW/Iblfs2igqavLZD0wz6Y2BeUOKXuYlsUE8e6XtervKM/fKHvY6B5QyZe/fnKFe@vger.kernel.org, AJvYcCWHG0SLaPFdY0GR/+WMDUNveY7UMJzYGxTKItQX+QaTH7Ypym54EVO3K4dTyfaHfp0wRBJz3XdiM5U2xWEh@vger.kernel.org, AJvYcCWRYTHbN5ncTCD0lB9ji9fmCm6K1nvXjfxQbXUdZ39O1YXJNM28WI0RHwdAY4//z4TRjhnCqOdBBPLKpI1gqF6h@vger.kernel.org, AJvYcCWuzB8AfKzssQzoq79SrvbRJSi26JiPq7R0GhxbmhyA9oqXebhdAjp18QmLBPvennmEzXIYA12UNGDwQw==@vger.kernel.org, AJvYcCXZ4LfiOrEAlgwqtIFqeuaRucU//cWii2e+g0KawVDT36sSAcm1C3n+tHnQ1/ZntQHVWGUzKjMxqlaNqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeQPimSte8qSS20Fl/auZzAQlP0RGVyQIZZwbEpVeZA/Nv1U2t
	5OPmakTlh/4UGhJIzqb/zBbzAjkCY9Aib2kt8tL5YoFJcilIN69nPX43+5icGL52nss=
X-Gm-Gg: ASbGncuI5Ih5PGUon4YmA3vl50Y2pCMk/Fd0+/lGtziJgbf/7Qwvuy8Xd8xdNAT0sFQ
	mFEdZIAwkQxvE8VQIRBm7kf47OcFo7AKnY/VO7MiJn9oRmRvx6DDw10R5LuikbqIfe8mbg/ytJX
	6ctjh9dyFp3i4DsNXB01nlz72V7q5HPOGtzOTXG6nPBx+CNDOQRuoYv8ZXqlKV8QILoCZxnugTU
	46MwyxrWeEiwjn46Ah5wPxuL/c+LFl+oUReVaVj5oJnXtgH7dSbOKGpGlH71SZaRxOnG9g86PFv
	tIfklFWLD8IhqEG+Dtp6PCLpusBwcQRTBpGjg+jU92qBZ4mlOF2HK/CrjCg8ScIiQOkJRHZx4H7
	ErWvLsfZIbNEWyc2PweNCjNhUATF5ceYbomO68fWbZ1thetbp3KctySmIV6Kzju0n
X-Google-Smtp-Source: AGHT+IFsTW9z5D2BQK8ymlA44XvPfxhFdnVT6k1bc7I7LL8fuAqWnSjoyScOeyxgzunz+VQyj1HxYg==
X-Received: by 2002:ad4:5e8a:0:b0:707:5273:9dd2 with SMTP id 6a1803df08f44-70767446626mr66344786d6.45.1753887684319;
        Wed, 30 Jul 2025 08:01:24 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7075e302832sm22517356d6.60.2025.07.30.08.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 08:01:23 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e62a1cbf81so939898485a.0;
        Wed, 30 Jul 2025 08:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5lVf0Aun349NJc8Sa8+EFAWJoroLJhE0/ZVyYmEXXMAw3Cqe1U89vSwSiFr4OnVuLT4FXBXjER4WfDzkUzrrH@vger.kernel.org, AJvYcCUCGkaK0hLq2yIuhoNSNdbdApYxoiEvFc54ELzXabR2/ouhI56eq8c6LTVBF3Bgegh/ucRwY93fHXVC9w==@vger.kernel.org, AJvYcCV1+RDDQpHQFqEV2+DhxkbBlCxIHjSWDsMjKgWBSuRMwggEAX29z5vmnVGzPD87K17vDtWAGDCKFgEhwg==@vger.kernel.org, AJvYcCVzRCMcXn2wluV92t9xDrF0wOfTQjdKyYqCbkNt4YbP0ABMpzH2QrD2DIkxamUhY5ZE+lN1aJuGCe1Te6ap@vger.kernel.org, AJvYcCWuedqxEEeHTnIFdFs+pVrv64fQhqIyRChySbmtQDlQH6Tz/+ujRRGaARIwftwkp3hjDTdVdhG9AlS9V7eA@vger.kernel.org, AJvYcCX1s1aYXIW/+XYQGbR4yCQU30emEfy/+851JOsmmLw3+A7dRJXteA7+tPfm7FGAOZtzc3e+Qk+SqQj9FQ==@vger.kernel.org, AJvYcCXo9FT61V9ARcHttMmIm5I3RyJ/6KfeBGRiVrTSBYRoY1w0dV+NHzvv6yb3BsKLl5dLEDpEn/ni/caaXlzG+Z9MIPo=@vger.kernel.org
X-Received: by 2002:a05:6102:358c:b0:4fa:85f:31c0 with SMTP id
 ada2fe7eead31-4fbe87acbd8mr2306438137.19.1753887248543; Wed, 30 Jul 2025
 07:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
X-Gm-Features: Ac12FXzcRmJnrFvnxFG5jsyy_jc5Ss1VNLUefIVdE-6ssqD0s07eH4xzZW0L3Ow
Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] pinctrl: constify pinmux_generic_get_function()
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
	Haojian Zhuang <haojian.zhuang@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Jul 2025 at 11:24, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

