Return-Path: <linux-mips+bounces-9917-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F9B108D5
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269CB5A373E
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D8F26E6E0;
	Thu, 24 Jul 2025 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISdAjv9Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301D248864;
	Thu, 24 Jul 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753355713; cv=none; b=FznVzOtwAqp33fw9YGhzpJ2naobWW2vMfna5HctAFlbmnRoSBYNaqjvEmUYa86b+yOvn14kjGEXG/ZrgKYQPHtttvGk8350l9SEvknatc+Kqbl70CxXLfLYRrC9h8otbU+ZCkR3MrdBnrcA7cugD9mTo+pXX8cP0/EJ7zwJ6sSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753355713; c=relaxed/simple;
	bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOAZ/mSrd3x00uvtlM/ULD5L7Fihc9ypb5GugxXBBwjKRzq8rXawnGRH4QdpoJolrzS9bWmkfhE4hZCRyRz1lhmL1PJU8Gi7Ak6315rIxcoejvNS/TwWu49a5Ml+qT9woE95S7RppV5g8WrxYXhm8D+ngFrRhUHxU2U8GFgNDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISdAjv9Q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0e0271d82so170651766b.3;
        Thu, 24 Jul 2025 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355710; x=1753960510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=ISdAjv9QnzRSl/KBcRHJ/3qFBz6ioUVOKJ76A+CB2Rtth+9m4qQwBISouJ79j/iHT1
         kNfVgetXuoJ6GFQYrrOtOb+i+w5LUGdJ5rfqrjF/hyqtpz7o1jwjUgVc6Q9KsRltvjkE
         pbFIhv5zMfRnPTb1bVLTpS1LEXmDvewqFS0CsLf+IDsyBBKs7JwO8DmWvT2TCJRlIIHb
         fXRrxTc/FYygeKF/w3bflGr/npfCbc2P3CWriGTvjx64KIdq9tVVXPAmPDof+4R83Z2/
         L3oCvRugCPx79rnMsksJPfZxlfIunmtm1YEdn/R0poCq3D5XG+wiPVMT8cT8sjmF5drg
         Y1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355710; x=1753960510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAtHv6jVtOKPfBxG+t4sPI1ngV8CsevwVhkX4+9+HYY=;
        b=FACUGy3W7U1E3LGI1/yVUpAxtbIFHklKy8DIujEMRbVd6/XXd29uPMd1b7cfdYmKA8
         Bce/oE5Mx6inbWxYlb1z0sJno2c70yAoHetWOZXzDY4UpjhBRXrpzsRGpPwQ1we32oMN
         JdC1UejXLlMrPexrUxrLUuy9g6IxxpZzi+y4V6d+xQV3Xgr9OItjFOqEgET5aklCdcEP
         yeWq+gbeTSKHEtnRaSYxRzvHq/VVA/FPseVXaoo3ivjfsK9dF6d7WCXPJsOb4Kj5HJ7U
         n/xkUlWwhE34NtQeWFFDfiXBzbiAFVnK2wTvloPqw6SJPSgE7oZdQ+IZMb0me9thQaQa
         rJLg==
X-Forwarded-Encrypted: i=1; AJvYcCUAKNJzh86Vu3XnOuOPk6vKuE6vD54q+s+lTtgaYPE+p1ABY8aawoIMmlBTz8tHM+N4U88JnfU7jLlX6A==@vger.kernel.org, AJvYcCVZrEkUb9R3+gCmEKUCsQbQHAAsISQf7vjswPtIMy2lY0JTplHIt8I/VJn7Hdxd06zLbPq8nH2RNBu3BWpD12Tz@vger.kernel.org, AJvYcCVb9+lsSWtcmRCZFWItYxYyBBgeAv7zXZfzaERzLXBcR5CjpMx3wuH6Q8LSO7wo0aH6L+rc3AnQ1jB81MH5@vger.kernel.org, AJvYcCWBHgG55SJRVExOaf81InzlOJR4haDFVUS+LP4tXmUqAGnwZwCxOlPLUQA+EXsGgivRNLzGc+CR7uIpWunplmz08F0=@vger.kernel.org, AJvYcCWh2tvT0xns7XSv1rbTmgD0hE1eiLDlbTILY4bG/cf7/Hop5GX/8Gwp1CEjeAhD8aKcyvIYgdg/B5SjlQ==@vger.kernel.org, AJvYcCX6TIWJ9KmD+8jyu7ndsxD/f3G8KsqdagBG2dBAsm69QX/0LMRxYyr3DJbnrOuksarEUV8sig0LgOhSdwYx@vger.kernel.org, AJvYcCX9X7jKGqHh1N0rPphEeB9rnhr6G7Jip036ZI6/SyqPR/QQ2eTXQjnp6JfPmZBvz5QnoW3YQMIHoAmEoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCp69Qsw29Rk0ePDricW2tv00PbVFfw/pzdRNPFhZwUCWNZ4/
	OUwOPP6+yRjuoZ/8CYFu/7zIUMnJ0A8saR/NKKi3Sh4T6MfPKkB8kpzrLtsVUitm1hTO14of7x5
	uV3UPYUeylFmCbLoZD3ZG9TT+Y+8/9G8=
X-Gm-Gg: ASbGncvvkzIbfOUOgcKcCqn5sxT3aozmQjzAjq6XNmcRGvqxONNONZzdREzGCDaKkzp
	H6HMaa+nasejqki+MgrubEB+EpKFTX5kTZL6vbOehA38vCUd6/ybd0k+uXePro3R5aQ9MpZneAA
	GA7zbF5Ccl5CnXPqxq+aVtsnOwZDEiJXwgVOjv4660n8Emo8dVUAVUF0CskT/CAMnmfkt6AuX8Y
	hOK8KU7MVub3kLypICg
X-Google-Smtp-Source: AGHT+IGWvdFdi6zzckyJlm6N2JYQgwAj1cZ4UkHgtQjTXi3F8fk1lJZ/2HIRvhtKXI2VlvbdwgIvW4p0HjJsBk5xRxw=
X-Received: by 2002:a17:907:9487:b0:ae0:e065:ddfb with SMTP id
 a640c23a62f3a-af2f6c0ae2fmr725433866b.18.1753355709200; Thu, 24 Jul 2025
 04:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:14:32 +0200
X-Gm-Features: Ac12FXyOn0y78pX82gZjLVt_m4TA-GVnUEaS_-xxL1ntUx22Wj5veadNWvnjdU4
Message-ID: <CAHp75VcEX6FBzAu3+-5iia6Z1+kSQLYFGp0FnO71gXwCF+-wDg@mail.gmail.com>
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
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.

I like this change.
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

