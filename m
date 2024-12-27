Return-Path: <linux-mips+bounces-7184-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E309FD5E1
	for <lists+linux-mips@lfdr.de>; Fri, 27 Dec 2024 17:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2FE018857D6
	for <lists+linux-mips@lfdr.de>; Fri, 27 Dec 2024 16:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7091F76A9;
	Fri, 27 Dec 2024 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxDuwG3Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E51F76A3
	for <linux-mips@vger.kernel.org>; Fri, 27 Dec 2024 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735316252; cv=none; b=dei+/utEWyDkMvDBCE0zsBsD59dsq8ssUIJnfgD3czbp78vYLwEt7CWOEx4/TrOoCrpZ8G3GF3AjvtLyGtWSzc1WqyRZf7U3igRACUCPIp904g4fWoiuub3Jyohk3X3tMm5N3xHZXkaGC2xlIDb5Q9RIJQm/2Ceiw1rmZ3psqho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735316252; c=relaxed/simple;
	bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmjCxjj/527tgsszlB9ODXUf7IsUKtMGDya3waBetQoVgybX3bmtbs4wRSRccDVe9ZkB/cp5WjwFukOiVrJaUgKFC1TPjBroXx25sfDGz2n7vQ0dYMzO0+hvYqIH1AdosHosreppYcdME0CIxbZwtseWARvdl75jrOxOrPf8h/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxDuwG3Q; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3a227b82so6962877e87.0
        for <linux-mips@vger.kernel.org>; Fri, 27 Dec 2024 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735316249; x=1735921049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
        b=uxDuwG3Q2/KBvnNTXYE828gFGWIZwEQPb+4ASgG5K2StLwhz79VEn2Nu9c7A7Yj1f4
         JYcRb34UCLDpAqmgUXjx5gqFTgD+biZjfDS/t2FFQx6LEy+RamIZedCKDKc7GklNEQin
         sJSbbq9RBXvnxmSmLkgzhqBvZS8N/ZRqe3PrFmn7iGDoSKbSbv9Po9H6ogKTjqfDspia
         5/WgyAshfNqX6oTgXLCztdnMJacGiQgdYtR3tR9YDkFZKH+aPgvPbXTWMhSeZuft9nTr
         t7GSsJ4qkHoojzYVKZyebbGhWFEXJMuqsjemZuxtlyVRXcNQTa1v06jt3xG/nxFloNTt
         jPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735316249; x=1735921049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4hO2aF42y/9l/AfT9xVgBVjby2APvfNVO5fytJbCn0=;
        b=IJNVNd+TbgoqqBiYHUMd0kCZLkcBhRYc32OLu55er1NfF525iwR3RaiJhfJLnnsxgg
         FbGIN3a9SiLiTDJ6O4ZUDZ63qC9vaX9MnkWbVbPnhaSoxGV1gI4Dq4QNQ1W/yU+42bIz
         B/XuI9L96WBciEdkd8bYjUiO5fIbRgWCJdDhzG5HaUfNblJnZ8ShQueBVKM9hN5bhlAw
         FLGzeP9W8E8rvzZRbcYyajz8P8X0NGIr1794jLNM5nC+wU3ji2rdJgkp4Z4uFaT1oDY9
         ls5pbVcmE8uQ0VK5ycpZwqTMNUEdW4rskBeJEY0OuLcX5NKZy1SK1Om7tI+tCBtN6Sbl
         mtow==
X-Forwarded-Encrypted: i=1; AJvYcCU4KPFyfGivDeiVEMR1deEUEl+d3y0tTpUpyWYSBPxspWI0qmaUPE8ty0F51DUvelL+O1EkvvkUoxnC@vger.kernel.org
X-Gm-Message-State: AOJu0YznpiT3/eqNk/18LxsIA1fblNO6Ebld4NFHVX8MatZLI7MjbvIv
	t5lbJgy2EgM4b+he2lkwcgblzfqf7xPM0+60s83z2OdWfD3Y06uszXz11xz/BjnoNLDcgyl7Dch
	NYStci6OIts8ciUFyIXREojPeP7NSBLzWCoOqpw==
X-Gm-Gg: ASbGncuv4bbljiGbZC4qQ8Bgg12DuUUbb9R/IuYh+0h+2zLwt10BbyHVzRIHoN+mGjq
	GpJREyp4k4c80C9s2asLK6K8OrPw+fNw2NH0F
X-Google-Smtp-Source: AGHT+IG85zWFKSuD1X54JFqeOEX2n0RtyYlC6Vmm5DBS3P1DQ/HFDw7z6GsAkmCJZbtSzsjnBieipxx8ESIFcIDCunI=
X-Received: by 2002:a05:6512:ba8:b0:542:28dd:6b7a with SMTP id
 2adb3069b0e04-5422952e7fdmr6285806e87.13.1735316248790; Fri, 27 Dec 2024
 08:17:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com> <20241224103645.1709996-1-noltari@gmail.com>
In-Reply-To: <20241224103645.1709996-1-noltari@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:17:17 +0100
Message-ID: <CACRpkdb=kD=sOeUskOZEYHJGbEaDRNyQzyHWGx=dAs7HYE+31Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: kylehendrydev@gmail.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 11:36=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:

> From: Kyle Hendry <kylehendrydev@gmail.com>
>
> There is no guarantee that the bootloader will leave the pin configuratio=
n
> in a known default state, so pinctrl needs to be explicitly set in some
> cases. This patch adds a gpio function for drivers that need it, i.e.
> gpio-leds.
>
> Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This looks right to me, but can we get some review from some
of the Broadcom people? (Hm it's MIPS so I guess that means
Florian.)

Yours,
Linus Walleij

