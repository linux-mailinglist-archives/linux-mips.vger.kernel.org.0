Return-Path: <linux-mips+bounces-3539-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7C900D0A
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 22:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07CA1F2675C
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2024 20:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A6839FFB;
	Fri,  7 Jun 2024 20:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1BB8A7y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1913E034
	for <linux-mips@vger.kernel.org>; Fri,  7 Jun 2024 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792487; cv=none; b=Bw/WdqG9hnbj7jFimesizJIW/siKI810/fSJ1SXtJS0E74naRhbQ5gwWaVukV5Lhv9FxjEYOIuRgz7ubmmTuVHKSUfKMC6fx7PcfaoF+TAhZr2f/3PMWYxG/X9lErZvDoLj/RQcABQ5OCVLTkNkAD6AtjuWR6eKoDW3inU+z528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792487; c=relaxed/simple;
	bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsX/+NenOucXLUgc06T1yGFLVUqXVSPnkspr0wxRozyvZdUYLpcJ85KmUXVhfPUItwvRvdx5Hi2RoEeS1NofDpzx5MAmBCbsDzYI55Rz/F/31HLKngBkvjckH6BBkk196e+sNEX+5RoeqePLCZRL2wdO9y1K3fclpQowWJ8K0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1BB8A7y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c525257feso235443e87.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Jun 2024 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792484; x=1718397284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=m1BB8A7yBiNPShRrmqz7xPwDKfXBlpNZK2rsZ6BA3nJqPB1ooli/n1nd+8SBZBRc3m
         Z1N23zpsp+oxIPeXZntr9qBa2bUYdGe4tnBD3FjquRTZXYHOWdr8uKIdIqNRmhCx7xLC
         BOcVCf92IW6ki5CFqFc83g0alflBApdihWjES6LJpLdJ+MnDX0o5ItR2FbwS0J5mXNZp
         D5BkdAgBEHf0o9hUCRZwS6OXQCw4YebQYIRzQNrUyCRAfTcjgqMUvAA8fuL5qgSiM0LT
         D2I6SlFdAzy6ELVzn6CkUT2l1/lP7SASLw6EEcD9ZAiA/Clf3Oi7ZV72SiRd5cMImrOb
         DfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792484; x=1718397284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=MV3oW77Zuhw6Duo1BzGgBFFOvUTw9m5vhwupIS9MjTgCgCIOujanQWEsZI9yUYIb4k
         hyGG8Y9RpbBuPPLAmWi1tvf7Elzf1rcTgCOzHqQAzmEVlARAIspwPhk0CYc21QUQkNV1
         pbshiKqrGybYcjjLJ8kNm6EYmLbs7CqjlHvQZnzXOFwPTsGo8p0nZab5Sljm6bxMMRp1
         TadvP7oxcYcDMhSvaGvuIHDNo1EIlu266uzk4OvCNDYBVpT8lsMVKLJ2RXo0lkWLOhha
         VuZTdoPFFv9wP3ojywxJyPDLJ5OyqhKZR4w1yAH5siihEDS1w4Pj9LPdARUPOXhNf/HH
         SKYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpm5Y7RiSUo74FhsEZInKlPFaVeiQfGsUeHs0CFdg+dGtvc13rNxmB3u0qKKqWTTClNaU0rRGbHQljkFS+nDk0gf9x7hXSTlr9xQ==
X-Gm-Message-State: AOJu0Yx5RJuKhLtcIuVI6uB/hlIUOgQweUDwRDKNUcppYzzjPhlF7nRW
	fGh9NVC+vFmHDs/ztA5GiywEWvAYbJuYrTyOPu1Cba0tkSyKafa1cqeTITZlfpMc2P1IIS204B6
	1WKpxYSJVLjhLv04ZQzUfYPgBJNjiF8nVyDse/g==
X-Google-Smtp-Source: AGHT+IGEyJ+w+NYHGdHZTgbtEUQOfYGBIFct41lT8WKTrSrUoBr0eDijD2Dx44IKe7RqxIodGmEk6AWnkM/ViP3EgMk=
X-Received: by 2002:a05:6512:131c:b0:52b:e2ab:7db2 with SMTP id
 2adb3069b0e04-52be2ab7e90mr867659e87.22.1717792484193; Fri, 07 Jun 2024
 13:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:34:33 +0200
Message-ID: <CACRpkdbHwY2UJ-OodeJu2VrhML6tcjKeD-00ZoZotmi1tKzsEg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] pinctrl: pinmux: Embed and reuse struct
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 10:57=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> As promised to Linus W. there is a series that converts struct function_d=
esc
> to use struct pinfunction. With this it both struct group_desc and struct
> function_desc will rely on the generic data types (struct pingroup and st=
ruct
> pinfunction respectively). I haven't compiled everything, some builds mig=
ht
> fail. Anyway, comments, reviews, testing are all appreciated.
>
> In v3:
> - added 'moore' to the mediatek patches summary (AngeloGioacchino)
> - added tags (AngeloGioacchino)
> - fixed build error in IMX driver (LKP)

A week passed, no comments.
Patches applied!

Yours,
Linus Walleij

