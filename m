Return-Path: <linux-mips+bounces-389-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2127FDD3E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 17:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDBA1B20F79
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 16:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B830322;
	Wed, 29 Nov 2023 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbVZmAqI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E42910A;
	Wed, 29 Nov 2023 08:37:01 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cfa7be5650so13421955ad.0;
        Wed, 29 Nov 2023 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701275820; x=1701880620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDYi0w7H+J+q+dM9ucawgoKr/ctQDdxFveeMbGCHqgs=;
        b=CbVZmAqIjZJqcvnM1Qy+OLHpsdg+RuL6QSYn6cnFgIwvTEtJ8Qe/1czzuRReq5k+pn
         cY8nFT/994cGbpi06YeurnMU8LX57wiZdcds41dmORZY77PiJDF4l8bikE0Z8alP085+
         9pze1+YgJY4lGfsjE08oc6QNI71em697umzxeCgWNFiAdG0D02NO4GbTEaq0Kb4nlSpI
         UgEd5H9DTbevpwKbVXiebsPCt0jjjru5+A99DmP0vX2t8YvnKBP917zSpfkOryPDbUNR
         lWmeG1hvu/5YHQ2aNPPpdZ1Sg+1hWMkd8A8uNiunZIlJn1J+gy/hFbwhYlu8yDiKh444
         56Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701275820; x=1701880620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDYi0w7H+J+q+dM9ucawgoKr/ctQDdxFveeMbGCHqgs=;
        b=QS1SWHMJR3HFMHT8hQzhXYwU8DhfRNxoD4gydqxs3/bN+/FUEyB2hSvpkEKi7zArPT
         YXYZsEsppv0z4rA1MiuseMqXShHEg4iqa3z65hH/ndi0XfdjUUJcMNshCa9I7mlMybfX
         YA3T7AyF/G5ZR69RFhhOdgnthXeksvuW4DsK7mR88+BMkWkENVVmt5lfEjwqtiKMuN0a
         AOoiJ52dsrCdqUaGPDmMDXMjAlNZUGVsKju8HmtSOOXJwUNHTBEf26YyfJVXQ3TGkGfg
         s57Iqhb8lKM4YNI/ga7cTQ1kOlYwyfWz/2P895DTzLqEZ+qtf23qKWuk3InAp3vF4Lly
         /bcw==
X-Gm-Message-State: AOJu0YxdaMbPeyC049qBWmxsUYfWhu9GzGHvHlRvS5etsN16/yWWA9Yk
	0yo9cTXEjkgVuyBZfar6MjKUcEVQ+shglk358SM=
X-Google-Smtp-Source: AGHT+IEHOS/VoqEOAE9S0a4Bo0mCXwMfAjLAWB11WdwDsJGo7JPiUty3L8kqBCtFFqb6Z8cDlcEqIcrQbJXKS8k7E9Y=
X-Received: by 2002:a17:90b:358f:b0:285:59aa:fceb with SMTP id
 mm15-20020a17090b358f00b0028559aafcebmr18947614pjb.4.1701275820473; Wed, 29
 Nov 2023 08:37:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com> <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Nov 2023 13:36:49 -0300
Message-ID: <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Nov 29, 2023 at 1:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Convert drivers to use grp member embedded in struct group_desc.

You explained what you did, but you did not explain the reason.

