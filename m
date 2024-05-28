Return-Path: <linux-mips+bounces-3354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA78D1DA6
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 15:55:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5248285A04
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1820D16FF2A;
	Tue, 28 May 2024 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSQ0mrHG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D6516F28D
	for <linux-mips@vger.kernel.org>; Tue, 28 May 2024 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904459; cv=none; b=D2qvuWtf5e10zMtSK//qpCs57sUJynUmWuslfm0LmlNH1d5YaRRS/lYi6Aqf+bUR4QsR5OpoJnvDo5Q9xWsllMJvO1SLNb8uLb5mtz5IsncUlxf+zO2hXrUgRS6IPJtHkWimpL2NXHdy6bLzPUk+wgR1ByL6cN/4dVPbGLN+l/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904459; c=relaxed/simple;
	bh=7FRvHhRIIGYDk4+qwxfvO9/uo5NTHqwlQyzNXACIsqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkK31Co5oEfRe2logJKoPLyldJtI07282EnZ6I10iycgUYT2I6CP5kO8x7R0CM9IlnDpqoh3rtSUBVjb9Nk1/KzfJUe0ZbVfgPEbd9PZ+KzcYinLGLG5kl9hs9y3s3IYKrpcQIevf1PwGRc631hS/7B5lRov/8ycVn2+t7ojnnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSQ0mrHG; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df4e6ece05aso873733276.0
        for <linux-mips@vger.kernel.org>; Tue, 28 May 2024 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716904456; x=1717509256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FRvHhRIIGYDk4+qwxfvO9/uo5NTHqwlQyzNXACIsqE=;
        b=tSQ0mrHG3+n3PGa7X9pcZE1Chu/Ou4kJD5PRZeuVs6X0UgWzGhjAKz12y4MXw9+B08
         QpdwOLF04csZe9v+E/6RDvFZ3pFEHnNLPHykMSobr+H4Jc8N0qZuVuNMqA7cemTP7E/P
         Br7A5Q3p7PFXO+QdwqJs3tnZm8XLaFvdTuGZCpqwrfLfYuqi+ZlQxtMsb873oasKObTE
         Um9H50l7SA449CHzSMzd1Bm8MA6HBYGxHXLL6SYocnxsHjW/yjCkx1XQOQO2wiELJnMf
         /F+Js73JovAr7xSKVQ+N1cf1wa7OoZ7ij2x61L4Ty6hgGo7c6YGFH+Wp1QI5BM2Mm+z5
         7JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716904456; x=1717509256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FRvHhRIIGYDk4+qwxfvO9/uo5NTHqwlQyzNXACIsqE=;
        b=rxzBHlkNYKZ74iasOZ91s5dMgmBrwFThoHljjCFmLNoQG6uooudKhLAOB4uHBvL0Gj
         u92ZbGp/RwlvCoBFNQtgp4YmDiwyPv9IzstbHMQ4VPbOu187SeDmcvwDVl2H9/qruNlo
         ecZ6gNtmTNgjS0XOufHbS39hfKq2bcUy0UF/sjlS/Ws7/S+/+zHORzpalnebo7g1ZMvt
         JmmNuAZOfh5Ro9kBwu6t+MAAVXzLOjv0DZhBzVZwaTB9ODid5zYFGnvao5gNI8vr9zen
         TtqUSsDYSVhMObJ3VtuYztx4IIZjHnzAfMpZeczCm4Br8Kfh+RQdWLxVZCBK6ghVvQeb
         SzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiB0TKG/rcbLrwsEALP1M51Szr8EcTp7e+OSajsv597QB2byUCiXxN+lzLBRraR2otnM9/ijtM8pprUEyqMFlmCB5+c7ZcRSyi/A==
X-Gm-Message-State: AOJu0YwILdn459AtjkUvxVRtH9dLEs4D/E6PCqQ8ke56Kga3nIFXqRDl
	QGXVGXb+/UWrNzWqB3CNUM00h8rfKz+Mm5ZKD8EpnNphzHSq17DwutWMzt7OmM5rWX6ZSuWbcVe
	V3dIYh49EvLyqJc6JhQGE24GdT5W5u13b0862bg==
X-Google-Smtp-Source: AGHT+IGiPfPdnxrsrhzRu1zp22yduOAlK20srMU3ZfVqa4PYk+PdmHe6VAHg28ob32G6Sc5b0+jA9ivDKnJzxrYwPFU=
X-Received: by 2002:a25:a545:0:b0:deb:42d2:c299 with SMTP id
 3f1490d57ef6-df7721ff9dbmr11796718276.55.1716904456264; Tue, 28 May 2024
 06:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527022036.31985-1-user@blabla>
In-Reply-To: <20240527022036.31985-1-user@blabla>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 15:54:04 +0200
Message-ID: <CACRpkdY99LACAUsg_S4ww4U7-KU_EtkLZ+c8dsa0M85i9eJZbA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ralink: mt76x8: fix pinmux function
To: liweihao <cn.liweihao@gmail.com>
Cc: arinc.unal@arinc9.com, sergio.paracuellos@gmail.com, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 4:21=E2=80=AFAM liweihao <cn.liweihao@gmail.com> wr=
ote:

> From: Weihao Li <cn.liweihao@gmail.com>
>
> The current version of the pinctrl driver has some issues:
>
> 1. Duplicated "gpio" pmx function
>
> The common code will add a "gpio" pmx functon to every pin group, so
> it's not necessary to define a separate "gpio" pmx function in pin
> groups.
>
> 2. Duplicated pmx function name
>
> There are some same function name in different pin groups, which will
> cause some problems. For example, when we want to use PAD_GPIO0 as
> refclk output function, the common clk framework code will search the
> entire pin function lists, then return the first one matched, in this
> case the matched function list only include the PAD_CO_CLKO pin group
> because there are three "refclk" pin function, which is added by
> refclk_grp, spi_cs1_grp and gpio_grp.
>
> To solve this problem, a simple way is just add a pingrp refix to
> function name like mt7620 pinctrl driver does.
>
> 3. Useless "-" or "rsvd" functon
>
> It's really unnecessary to add a reserved pin mux function to the
> function lists, because we never use it.
>
> Signed-off-by: Weihao Li <cn.liweihao@gmail.com>

The patch looks good to me and Sergio: patch applied so
it gets some testing in linux-next.

If Arinc has issues with it or something else occurs I can
always drop it again.

Yours,
Linus Walleij

