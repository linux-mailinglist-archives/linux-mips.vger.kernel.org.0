Return-Path: <linux-mips+bounces-8863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D855CAA05D3
	for <lists+linux-mips@lfdr.de>; Tue, 29 Apr 2025 10:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 699D93AC134
	for <lists+linux-mips@lfdr.de>; Tue, 29 Apr 2025 08:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC6D29290D;
	Tue, 29 Apr 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kgfkFngT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C32144A1
	for <linux-mips@vger.kernel.org>; Tue, 29 Apr 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915499; cv=none; b=n2QmIAw/Tm0uuEbr7TNKmppSc3mPE3lW/vJydPmD3clXo0EzAQ0sOSwOdnNlfX1FCTa9a63aPm2Qo4iaHM92SB8MGW+lVNAWr59x75zu6H+MLNEScmxd+LFXKx6fzma19nUMB1Mlun6znU+xK/8DPmsLoIxjpNhoE3gv2/FeoyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915499; c=relaxed/simple;
	bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSxyFriKFksQlcuHY0tmeWWUrKO1Hv9ZJ7qB1Cw0AKJKblq2qT753WIfvyWNr6xRc3UPVmwu3tGfWjKq9Kt+5/MJGdPmckarHfOWospfOZ6QcGhOvO4TXd6GUd5aJWqbPTSDbN8CN4V0/a5Nb14rmKI38HB5ba1XxtaiUi7JbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kgfkFngT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-31062172698so59895941fa.0
        for <linux-mips@vger.kernel.org>; Tue, 29 Apr 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915493; x=1746520293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=kgfkFngT99U37cDcTimcj0eBfZU1V/wgcNATyGtPXehLnEVmGSUE0LU3wq+5ZjH7hG
         EnzsgEizMSscxt7wEpR6A/FDTu9ru6KCnm2WawOoobl/AfOKVmj/Zixx4SOiIAQaGXF1
         1UNZHLkqTg0oyrUf7ezNnbx0rGSVAlRVfUMAszfezTwjOKhPfzdmuT5XJ0sHSRvt+P3A
         YsUEZ2TdJAHzA797v7glxk+EbHylXUKTBGxWN5cA6RCFA8gOniDGir32XzLTQwQiuBy/
         nbYWlni9+vITWDvbo48cIl6itlAHj3TXtZfuKUps43G3m8fPz4cV46DWM+1FD2MGAMQd
         qyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915493; x=1746520293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
        b=gaIkg6Y7nm2Isf70JXBqG047sWe1pS3+Jfg3tQvdvKL1no5rPTG6IXx8zekmPEiMCe
         j1zGK07fqUTVYQ8rfW/7jqN40/5slSyi+0ZSp4DOGDVz4693m5l+YgaDHy8yg0krJtxL
         ibv05jcnMPWynPGLMDF/vTJsmOqVX9ykchz/I/S5cLk8wtWDvjjXFSphUZSejiI/eMbQ
         6TwEQxRfa1n7wXobU6qofRLxOQAg70N0btNGKsRj95JGeF4itpC7191Zl2rpPUnLxdaH
         BWWA4oVXFEEftufLRQCoB6/I407hNP9Z28yBi81h6BgTeHV7VmU9YoNRJKl/QsV61DBe
         ReXA==
X-Forwarded-Encrypted: i=1; AJvYcCVXm0c67cSXjYv+1IIRF2O3H9WK0rcNOIRLdiwfkg0wH0Uu0gooykoI/lO74jHLDa26g5DGRa+tTed6@vger.kernel.org
X-Gm-Message-State: AOJu0YxOvdSFm3wzxvC6U6lilNzuRZcb6DgtB6FFPHKZZfbo1oAHjzxh
	TRaINYVlCJLf/XkVHQ2DvQW93nKwAoj7TH70b2eP5xxDBo3vqSNtIUVq7gevAIrif3P8mrRgUwb
	UIWzd+JDYCnRni/bJqIS/Y2tsVGIifxZVbNmPlA==
X-Gm-Gg: ASbGncslW4K05yESQyszhZ0nxzdik5CzeQqyklF+poAuUFdoEHfwr5vvUKglYoQOpv+
	koTppaitTNpEkyVsEcweXu/4DUusiW52rQHbp43f1fgSNAFP8BpoJSrAW4EcPMkXySRNxW1fECd
	oE6cYt16WnbKS8MTqHpBFKyw==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
Subject: Re: [PATCH 00/12] pinctrl: convert GPIO chips to using new value
 setters - part 2 for v6.16
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:35=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> the another round of pinctrl GPIO controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

