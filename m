Return-Path: <linux-mips+bounces-8602-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB07A896D6
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 10:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D2D43BAFDB
	for <lists+linux-mips@lfdr.de>; Tue, 15 Apr 2025 08:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA67927E1A7;
	Tue, 15 Apr 2025 08:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0nkpvfg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985D27C854
	for <linux-mips@vger.kernel.org>; Tue, 15 Apr 2025 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705981; cv=none; b=D2zny6Q9ef7PeLiEA0BaUqX51nx448N5mYl0W1VlfU0f3nRPItJAx4nMII381cZ9uBSxu0jgiuSlmFiLv0HLQkGp8nUejazI+msvHOYiJhkp61bYYTh2CVRRBHjweGn/OAdyKgG9r0g/Tche25Ns/jKSNoO9ssHncKXcnPW64QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705981; c=relaxed/simple;
	bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHBYZxYYEzoKMFjEQ7dYh/JVvHOLhYsHuibKL8Jg/Yhv6aegK18QScgOWyHS4uRCJiZ8MkXU1/czh+eFh9YfTCuZ8wber6UtGewb6a9ocmWMKtSMLHsvE0OU48Wto7dkwu0OLsDYuv/e7znU9O4MVwgFNZgwffQRSd7BEc3SGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0nkpvfg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-31062172698so23118891fa.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Apr 2025 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705978; x=1745310778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=Q0nkpvfgEMZiIYM6rWgOZhHhOiEvBFZyxS+X+MwOlT5bjg6uPCqpdltlgAnIw/42mr
         Fb/c1o2yflo1ZqaZNaWRk71JzfNcvr4jwKB/CikUjIGDwKkiplyRcB46lbNMv4iFNAed
         SnhAS/Jpw+wsxE9iZmo7T0nIwdYsf0jk465kEOoaL4mPPv+/hm/JitKyghn4m86nEZt/
         VmpiEjAFUl8X9EJgErZm2vMMqU5OPChGlrqB41fpaaiAfNVopPfTbq2VICULqBZi2ibU
         AtW34RDZQoTDlIB6HgJ3Tl2xm5qKp2WfJUnl+t/b+7tt1CjWwJ6y2ZOh3DDV81UNkNq+
         6DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705978; x=1745310778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/sfemeB3+3AkoNBn983i9nv2fEhv2yg6yOcdLv/+hY=;
        b=qCDq6DIRmS2WQuiFDWJon+mEDdtdTTp5wqo/z+/CoQtjSYrfLMzw+5kU5o4TY1+dM2
         utpSUFavVrQWHFq7qIk1lmvZhKw/rlR2vE9Tzes6uvh1txEJv6AuDHB9nAwkQAg0L/AR
         xkN6BdZhiX7j6sX9g5aKyBODDEQOc27zqHmn+DNdFMG0U45IyJbSw+53bXDP7xLCvUvC
         ycwv3Vrkx18nG1kk4wqfNgPWWAXNmU4ahiou6SrBjBUGkf9Cgq2cuIrahQmpklopuZYd
         BaNK2nrmMTH/SuZpCZVzkfjlXcJRUSu6UxI7iYKEUksQOUJTM/zAE6HA+aVOsMyj5zP0
         Ss4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGhf/VTRozxL1f092VywV55fs8sYIVJNnjSM2ywpMmthgrz5NI2Skzl7bUkpueP8ezEzGaSUc9fQnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YysduzgWJkQXimuxZ0OoaOP+O0rnIalP8IlufmjF3SZcpTbW4C7
	dg1Wm18GKsx1E+6LXbCxpMOPPybzObXlunjvfWgHy3aHsO0HUia9YFnDpO9PZ1X1Jxop/U170ys
	J1IixAWKdYNAWBxy4xH6DCu+jwEdUSI7lOcdj7NcH7elWugcl3pU=
X-Gm-Gg: ASbGncuIYAVac0y8CHQFTw/FpCRiCdPtlP7abjAe9W8jvYLzZzuW/coHlBI/TAVqJVc
	X5kfqOjMMcPYvrqMqm41x4LCq3ZJ4yZ/raUW3+YeZWltwO4kiHb0cmJr/en6K28vVpRW30+T7AD
	T2xD6vefSw3X1BHk2yrOE4bw==
X-Google-Smtp-Source: AGHT+IFY4mxWjOvUJ45dJSrLBON1zaTvdnLpGG/sPvryWvonle0qbT8VZTQ6lzHhQH0TveUlkekm7lMiWhkJTsAbCfk=
X-Received: by 2002:a05:651c:1597:b0:30b:acad:d5ce with SMTP id
 38308e7fff4ca-31049a1acd9mr52007071fa.21.1744705977861; Tue, 15 Apr 2025
 01:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:32:46 +0200
X-Gm-Features: ATxdqUHStbj-Ti_vRnViTaRVrQ8zaVNPZsXG8wIEFb28PzUwDvLDxspkFk2FCi8
Message-ID: <CACRpkdb0RHqYejNJ9w5HzvX0nkYCJRpdzsp3=JankRkJKYXmdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] MIPS: convert board-file GPIO drivers to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all MIPS board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

