Return-Path: <linux-mips+bounces-10231-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4AFB222FA
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 056753ABB87
	for <lists+linux-mips@lfdr.de>; Tue, 12 Aug 2025 09:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5576B2E88AA;
	Tue, 12 Aug 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcSf6R+w"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B872E8897;
	Tue, 12 Aug 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990236; cv=none; b=i8a2CH8GmgKgDKOPLvJpedGCrT6PDknonn6slcC9eadekjRJjEXh/zqv4c4I/phczTibevzfxX2jQTjkScU9ajaMgAHhSnM/RGZEquiq5t+WoZPYfbAUhZtfkZOcS8lY9sV/aEWI4ujsAGfOD8PL5dkfpwtPBqnanwGhi5gZ/A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990236; c=relaxed/simple;
	bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiARrn1HorsHcddKcrOLn9DhHYRkXgokB/+G3eHwZvHJQpJekBVbF1grxH+RnSN7QQlrTXRIfMCtGSESLbHG+ZuG6HSX/e3KuGMcVxRpVEI62ubLTWWmu3Or9BuTU1JEENUN0iJGnm7TdTEOx0xbbh284tYrzNPzWIr7WuxNE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcSf6R+w; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-33230f1347fso42418441fa.3;
        Tue, 12 Aug 2025 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990232; x=1755595032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=kcSf6R+we9AS2Or4FMhZnYfGl5SAmg4yv5cv54zNHuZ/XDKpbghtGKy/qxlAJbj0ad
         llU19nmlx1JFRxnhgSSHMrKPclzR+Z5y7LUBxNfO7iXThFpIM0nIYXmYKh5PnsFRY1gy
         8ln9ppW4Cq1EkgT//vala6A20tPSS5xmoL8m0WJIZqUqqrpROEMxRBi6n3VvCiUv96i1
         GcqlygFYY13oK46k9NQbOMppAxJtEzJKz+A/g24oYEnBTJgMAf0DhnK9vLfUjEzEYt3j
         SUGom2JuPeYxaeEmQqE6MLdoRIx7dZh+fOg1odcBBwuFGJYC3aQiZsCfA/PMk7kRoGPs
         cQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990232; x=1755595032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH40Q72Hlv1Q+FKRAVO0gIDPDVp0pGWeafDOUhL/q28=;
        b=DENyzFt7IAdKHu31p9boMgibQV8NbJE/LIIGZm2NJklC3+qsSTGpz5Rj07PxHsDZG2
         +7Xp60rSiwGwc9ZJLssMf6DCY0ZzSWBvoUWe+34npXTL7QgnW18/+jW4apPiJCe2Ufed
         VLpVNLW1HjXw8zdNvr+oMzzPc4rk9ZTOMuxeqqSymvFAb7wo279FevM8CuIbGB2YR8LW
         Wgi8OcUsilukSg+SynCCcM3i69c+bnr0Bl3bTozR9PiBZITxcdo+hRtBLvS/Eqyqkv2n
         FzGWi7UcZFcUyi0gr5VfOV7XGVc0Zd+ZynWKnU2G+ExPLijZvbBWw3CXTcWtXFaNk/4x
         PUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLgeXATv+47uxuGlgRS5OodWs2vWfQvA0CMu6co9xxS7qVMtc9m314A59BwwWfQjtfq+UglPdyZqPwJA==@vger.kernel.org, AJvYcCViDGWF0d+PSnxY+LOPrA47WusknAk+ukTlVKKnbKxWN0nvAyVaCxDdcwmjne1WE468UVJbeFmimwHvD5Ew@vger.kernel.org, AJvYcCVmL7tD1bEuBQQEkTb7Amko3TkvakzMsbXo2n/Q2mzgGtdh4M79VzZt7GqsZ5Bjjdy8kWek9RB6iy6lLaXT5M4ykMs=@vger.kernel.org, AJvYcCVt+4oAuF06thvVJpUEnjdBA82klKDVwA8gsvTx+cIFCon2A50a8XUpRzqproYm7KV0T2rCXzu2o8aK6Q==@vger.kernel.org, AJvYcCW1aaVPxG8+KVpnYuamEUhRomET5xHBAUgMjaotRBmwCsjbhdIj+OhQkU87q9eBQm/z8UY/u8w4BtIL7Q==@vger.kernel.org, AJvYcCWB//6ONzkpsvZPJcw3PQHMYwvE/Z53bLKHtiLirxBE411Bj+GHVbhdUowTdRVjc+MEzM7f82+wWxYnX7zAlidW@vger.kernel.org, AJvYcCWEytDOvrhAtHGaRmGaRGFIHzxg0G0ubtMU4bQ/hODUESeGbIZd2maRk/ywUUXjaGwM/0+EVWZkagvyBnMm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xMa85W1X53xWf9OfXdUvAQlv2VLZIh8av2VZd5V0sqnRymt8
	bcUOBNxDoo8MpkoxwGBopBcOUTLY7D+qXa4lfgDJRiCeBJAbNxOjM48kEaa3MDdc8dwBZVva+61
	UgZdjHyBRfb5RBesbfmlYt3rnRKBt6Ok=
X-Gm-Gg: ASbGncvMQohodooEszWnCMi6m1h+XYtU6RvYooLyd23JmjRkjzAQb9+KIK/G93TKb84
	xdclUFoTqN8v79TvhIdU+K9JmZrHT1n8FU+dilLpCFQAbxki74HVqXOIWdPhtt6Cr01PSHH6uqP
	jDc6yreI4XN0nzrAWJaplS7hgZu5IpOC4TPXe4iLV27RatXV058tH2gaVFJkOrGxw/5BejEB/k2
	jMoc95gNw==
X-Google-Smtp-Source: AGHT+IEhcflI5Ydaa1GuiuNmpjFNx5ppiNgejnDAuoNiBIEGufTrSOsbJvRUoZYThN0W3IOGq2XThl67s2szsla47bM=
X-Received: by 2002:a2e:a7c1:0:b0:32b:59d1:7ef3 with SMTP id
 38308e7fff4ca-333d7d29e55mr7575061fa.35.1754990232270; Tue, 12 Aug 2025
 02:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-1-bb3906c55e64@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Aug 2025 11:16:35 +0200
X-Gm-Features: Ac12FXxOADkY0Kt68GjCLZnzoIn9ZUx9AbefjcCXbQIHx05RgPhrrqXj4qTh3Ik
Message-ID: <CAHp75VecVi9XZ25_qY3vX97xbDndPT+O8z=+V=Jocv_8yOQ=4A@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] devres: provide devm_kmemdup_const()
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
> Provide a function similar to devm_strdup_const() but for copying blocks
> of memory that are likely to be placed in .rodata.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

