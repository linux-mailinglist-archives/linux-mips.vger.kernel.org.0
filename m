Return-Path: <linux-mips+bounces-675-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685180DFAD
	for <lists+linux-mips@lfdr.de>; Tue, 12 Dec 2023 00:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E531C214B7
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 23:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528DE5101D;
	Mon, 11 Dec 2023 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4GX/zQ/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0504ECD
	for <linux-mips@vger.kernel.org>; Mon, 11 Dec 2023 15:48:45 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-da819902678so4647385276.1
        for <linux-mips@vger.kernel.org>; Mon, 11 Dec 2023 15:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702338524; x=1702943324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euwhIsXaz0VLvDyOMBm+aGeo2N9PmOW4/s9hUBEtSZo=;
        b=x4GX/zQ/bn9bZMeZ5vnmGHY9Bgw5VNMkl82qDdU7+7fFWYNnVCWJv7yEwYQDvldJiI
         +ruO/a4Wpd5fxSeOo8+7CIrOO79h2a5Qb0VOu7SVfsOIY8dINIK+AHE3PwQSrBN/CL/s
         US6FfLbb2NsW/H4g3P+5km4V8i6mLeV3jpzmUz0yPDk5kgikznNTM4LmNroElKUJhqpo
         X/aQL49+u+ZxUVh9LaALaOQle//ExuzjBcyudB7CKWmwmxSk2SrToc98KWQkdEuWqH1u
         QrT0S8245VmLA3p22yNloX8RbzfBKEPilN+ArhaF88nvW5vbBsR33XoV00TxokAVYxW+
         7Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702338524; x=1702943324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euwhIsXaz0VLvDyOMBm+aGeo2N9PmOW4/s9hUBEtSZo=;
        b=lZn2v+O/U9JSfjdvs5pa2Sfupbfyn2eSniy5pEUv/7WEZuSBVlSGJYwpN9shB59ZDI
         9/ja+F/lo4JqVWtHRv5gLl7KBEu9t+JERg1D3mOQtpNJ0vJg6p+9407ClSPw2yAs0ApD
         w62DJXrPh+HZxt3D/yiKcFGzoZj/Hj0hr1PqWZXm3NWNnIX5Dwlqrivi8Z0VprHffMj7
         n4euTYjaVmudUjQlW0Kb39tYaSSguILGDZwu1XF6frOTKQXZkKeeI5Gi13sRo0vNyTCs
         9LswJ5NfldbYsV42ZXvNlns8nSXp90qRPRF5rqeH4M1V/kp/XBEWdTE2mTQighSNzkaJ
         hMaQ==
X-Gm-Message-State: AOJu0YyzoYBF5FyiHcjBLoVcVOpK6BNMZOLtgwDuDqi8ExgLPWFatN8D
	BLA8426BwKDBouFgXUTaxMWjQfaWOiY/5nBqDaUyvuD7Z2QDh5Di
X-Google-Smtp-Source: AGHT+IF3tcL6UUeVPz0zW8dM+eYBEA/+XZsY8k/PjoTsu5zg1gtMmDM1MoplNrzJcbsk6c/SNpSN4vT8MNFw/3YCimY=
X-Received: by 2002:a25:254:0:b0:db5:4715:da36 with SMTP id
 81-20020a250254000000b00db54715da36mr3859002ybc.58.1702338524206; Mon, 11 Dec
 2023 15:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Dec 2023 00:48:33 +0100
Message-ID: <CACRpkdbbDAph2gUyvPCPD0s6LtjekK8zVBPLMg1ESB_1SMow_A@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 8:03=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> NB. The function_desc is in plan to follow the similar deduplication.
>
> This time test-compiled with old GCC 8 for arm64, besides GCC 13 and
> LLVM 16 for x86_64.

Applied to my pin control devel branch for v6.8.

Yours,
Linus Walleij

