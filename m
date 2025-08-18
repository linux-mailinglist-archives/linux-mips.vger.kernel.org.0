Return-Path: <linux-mips+bounces-10358-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E8B299AF
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 08:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917B63BF75B
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 06:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00D5274FC4;
	Mon, 18 Aug 2025 06:30:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89831223DE8;
	Mon, 18 Aug 2025 06:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498657; cv=none; b=Qgfb4+N425RG5P1mTba5mP9Jlbj+cIlc8PliZKbA94NcQ6htwvNWYcT0NwqaZXDA3wD/djh1aURraBjHZhGBWPsXnMHzsfsiLoYdEhBejqt92I1y6HTi+5KSEuRljQtmKgd+1cC/h7PLFG9R3Fzvg9SQlN2PYJlAxSk+tLDYo2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498657; c=relaxed/simple;
	bh=VoNHNqo8fUGvNqIOg37Qh0MYP91XFhZxSxTsoOiS8Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2CMcs57///+cBeTRy38qyMeSG+TO8mthIiiaOtqQvDjoAT2J21KPIYU1gA+h78uDaqddRDJcLKsUTeEkRxDHotm8G8Lj1R2yP6C0ApeqOhGKwx52vNw5J6/k5rifS+nz9B25y/UCPax7InpxIn0mPi61aB2X7/PUsINxeExY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89019119eeeso2430119241.3;
        Sun, 17 Aug 2025 23:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498654; x=1756103454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOcu/p0cV7w38P/APFmgt8wjqwiJZHneIgQmVX2LtzA=;
        b=ndn44/1Js1hjOR7W09wtReUHF0UgwFs5XIQmtGYawAMIEHoMPj9VIQgKBVXiUuv36o
         9Mo7jd6Efz2APPNivrvYqzo/joCmuIAvkn4PIOwPADW6/JbCzOEI3hrmWfxKPz2woxJu
         jyUZ+YtevXOBlZY4t0Agj+Z+hg4+pVv10nlbyWwPsAMjxG8HDK2ydZmm1q1X4CVgolYm
         jB0ktuP1Y5mVO50HX2ZxIKqOZkepLAQ9WkBfTrbDh0BHVBBEOJRC9d89C9Rd+Lg/rv3h
         TUlqBJsVMYof7KEC1sbT8Wt1ohxniKtGNdyT/xl6OPY5t8OsZl1zwz+YyDMTzD1ZdCU8
         d+cg==
X-Forwarded-Encrypted: i=1; AJvYcCUKgKSc+J3sL4eWKCt8v0SM7QCB151TTOhj8TaUtdr3FFzqUVm03iAPn1mdSUejODcYbbI2UwT8sXx0MIb7@vger.kernel.org, AJvYcCXZjHra1+mjCfUvrBkZC2taWJHbnVC+SnSGfPKQQWuyTtj37tmnDt0FoqybwBw5yQm05q0KZHrpUmFd2A==@vger.kernel.org, AJvYcCXfT6N375E7WRyiqWaYLc2+rW9keb4bbkfkhshONGIzesGGWT3eAkcl/9w0Qk64H+m3awgOeDpj8Z4k7+CcHpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyA5c9+mAjDCTx3LDChEav1OEuJV2mAH5nNmyf26v7ry+1CXGX
	wWpezvjYWlt/cJ+n3VbPSuN/La5ZjmepbGf8blAe/l/5hbOrZBJoV0J8vzGR2EJe
X-Gm-Gg: ASbGncucwPfQSZnQmSMKMQUEwbmj9gmpyI7KCUgjWZJiIlE6kfjIiJUZoKz1FNLxFE/
	nN+Lq8B/6WYvP/Q/rjlpMcAIVQH6HgpdZTm7sQg01266C0RWfJapeaqwPgrADK07RJlYHcO3yHX
	aMo6rFIeT5zae/aLfNbUjzaLRoH49SblWN+48Si8qWR/lP5XS/XOwsRoxtXD3DoOnnmbdXtrQt1
	qxgyu3AZpHz0AZrpgyE2wrIxyR9I7bLf3ML9sF4F1EMH0jVnEFb/vFN8jYtbyYdounelrY3Of1C
	IbZ1egVMLrnRW8yHu21UQ41rt/Jobrmt7n7EMH8INKBb9auTDCTcN5Fj4O4EWVsU18xY029UiLM
	mJT6XFozYJsY5AJOSn2aZ0LQu97p5lzzX1/Uj+M8J/rGr6R8aZBo2aSBu8FMnjC9wg+S8FUg=
X-Google-Smtp-Source: AGHT+IHq6NW2gxSf1SiiUYzjyJCIne3mIKLZM7LKKCNsYMEYvMfzX4JmGDZ9fVqfCNGX0NxkXvSqzw==
X-Received: by 2002:a05:6102:41a1:b0:4fa:e005:cb20 with SMTP id ada2fe7eead31-514c8b6839amr2937481137.3.1755498654216;
        Sun, 17 Aug 2025 23:30:54 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127fb10254sm1923168137.18.2025.08.17.23.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:30:54 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-890190bee8bso2389929241.2;
        Sun, 17 Aug 2025 23:30:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7hPAWM3Xfpp0Af0jODS9O3FLr7Anu3PCxXUAO0m+bVFxjLsDZXPnRZvd/HJgczy1IB2yfaAyOrvI/Ng==@vger.kernel.org, AJvYcCWC7ecIeCA2vo2jwmkaKmrzLIC1D77l8OjN/SJBcPs0lbsFj0JGTlJ7RNHw1A8/d0+VfiTYeha/cMAhw9fT@vger.kernel.org, AJvYcCWOt3WhELc4iX4cvaOP73c0EJS3drZ5bPO9ZkPu4QcDuJHpaUkDTHomGAO2Q4Co1wcPlh0Xb5Y0RyhOa0jJYjY=@vger.kernel.org
X-Received: by 2002:a05:6102:418a:b0:4f9:6a93:2a3a with SMTP id
 ada2fe7eead31-514cb1a473dmr2883727137.26.1755498653860; Sun, 17 Aug 2025
 23:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817183728.612012-1-thorsten.blum@linux.dev> <20250817183728.612012-4-thorsten.blum@linux.dev>
In-Reply-To: <20250817183728.612012-4-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 08:30:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwvTGSyqTt4z=EgDrZ9=UxvQcb8kKzOx5H4s40sWTq+A@mail.gmail.com>
X-Gm-Features: Ac12FXwVhRbO3bMzLwzayoRGg_slz1P9TUgElvRbnD6lMZ2Ht0pOA0TsGu9z7N4
Message-ID: <CAMuHMdVwvTGSyqTt4z=EgDrZ9=UxvQcb8kKzOx5H4s40sWTq+A@mail.gmail.com>
Subject: Re: [PATCH 4/8] MIPS: txx9: Replace deprecated strcpy() with strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-hardening@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Aug 2025 at 20:38, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> strcpy() is deprecated; use strscpy() instead.
>
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

