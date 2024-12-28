Return-Path: <linux-mips+bounces-7188-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E389FD9A6
	for <lists+linux-mips@lfdr.de>; Sat, 28 Dec 2024 10:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23CAF18855B0
	for <lists+linux-mips@lfdr.de>; Sat, 28 Dec 2024 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AAC8635F;
	Sat, 28 Dec 2024 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nnlv6RmS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854A8633E;
	Sat, 28 Dec 2024 09:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735379309; cv=none; b=PfF/SzRWcsSLRcVJFQ/3ACZGrgY7qek/MZ2Pe/aSL7RTlCuE9OmMW9eSSVnyjqZqENe7YwPrAFwTOINUKKPbADEoK/Tp/0p80QEsEdpjQn7UR/YzNAFqj7R8ythfgmhX7SdMdMFIwwxMdSEcd4V+iqBkMfDk/aAh0VwBYqhaQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735379309; c=relaxed/simple;
	bh=3nWLLd8Rw+xKEQPANeGCnqSlWq3hAdpW+DJZ4DpfgpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfMZp+2NLuOjq7WeFDKLyYGZil8CtSw1enePB2cC8JzjybNuSKQGC9OlJlOaQyLjhYZVZv/DODXHzSCGPvLgiW0NYWCM9atRHmqGth9+tWJ4A5eEEwuT4goRLUEKGOH868Zpu9Zneeirfpylc7p2oO3a3uS61GkK+kkLqOxaR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nnlv6RmS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so9902422a91.2;
        Sat, 28 Dec 2024 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735379306; x=1735984106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nWLLd8Rw+xKEQPANeGCnqSlWq3hAdpW+DJZ4DpfgpU=;
        b=Nnlv6RmSTRv/GSJSFfxWmUFIbxVK8lpGWCqiT1I0q68f7lVT3IbeUJw82+pSagN+Eb
         FyOnfEBRtadF2593AMSsFRHnIX9DME9Yv8D/gPV20eXQmTHcm9FIiHFn188EAW3AOUF/
         GQPx4TjEYxDJXWH8T/wHOfDlWfaObi5GEDqtuE+Q1upe5aaIiRH9QZyDQcJ57w3+QvCR
         0YWzBKzhC/OipjNs7BKo2529EqkelroRcN8FZbg9RdnWAv+75AzDI8YYCW/85SEx9+bM
         XXv2sKJ2BNPO21l1dpBQUMi3msPNkSJPu/U9r9oVV57o/Is8vnbYiEDbQd19U/PNmPm6
         cXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735379306; x=1735984106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nWLLd8Rw+xKEQPANeGCnqSlWq3hAdpW+DJZ4DpfgpU=;
        b=TKrypXEJPZSDmCYZtRmdTnvpFnBcEAIvxwYv/q6vq8GkHGbrbVcBpX87ZAXxH+lKlX
         9xv+tZ5YDrp0rqhQlGoaCvasLvl6o/0BF9l2q0KvxkniUhRXUZg+NJP7obqY4nKQv8aX
         wvlRMq1r2pVDR4H7vLT+ezBwCs5I6QlAZOGoPhimGtUqCD2b4GaVBAqcHNLwpOGHw8ld
         f6wxoNFnKMR6XoMcVtB/pbhAItm6EsF88n/2BwDKXGTXtlHmkE47M02VifZjRAYjGNgJ
         YrK97VgNMkfLTxSzXfI8BPNZq5aJPUFYFtUpvoNrRkUfPIv5JmHa5KCiYddREgfjIeCM
         eFQA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQ1H2n+I/3IdGCN1ZyvafTOvbN8qXgrKRBwPF7dDhf5fZB7p96ACbPDkSyRLwkl9NIUPWaYjAEWKvWz2e@vger.kernel.org, AJvYcCVZ0r/Wfa+xoC2aTJi/1cdZ30GLXXqesHI5DHv6Vd8gkcYFzvfmhDI/gnzNa0rTNlelu8VSoqcVSafn@vger.kernel.org, AJvYcCVi6IZJsy1I4eCzrEuuK/pxoqNgI4wzQXfkhdBd97ce8eu78sOgCEjt1jVzw6XmfNLh3chAiIOm2qg21Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4RJYfu0wvrMsgVtSqpR3WjQz+5e4c19+eoDbQG3LsOa4D0ZJ+
	vEA4qxoVYGsab0TwSy+1nP73SkCbZM7s7TG7Ei+2tc6LCIAg4Sa2niTBy+8s3+ptSIpdYxwRqKZ
	0twrmGd6mhCUGSTTX7U7FIakr5wzoBg==
X-Gm-Gg: ASbGnctxJV5hbZYgnP1ZnFcGEY9+OO7Zz9fYqwmOjJtSKFZySsYom2BqcdJZs1+gbfZ
	UU+5wWM63fTTR5LEHlY4tgPDh4Li/EKYgMG3luLg=
X-Google-Smtp-Source: AGHT+IFrTKOZSooS9ithv4i2QGULf7s56SwaHTCofLckzpstPzo9WY8xpi2n5YefoDo8jgufx3zLnRp/JHeYQ3OdsdY=
X-Received: by 2002:a17:90a:d003:b0:2f2:a664:df1a with SMTP id
 98e67ed59e1d1-2f452debea5mr42774425a91.2.1735379305736; Sat, 28 Dec 2024
 01:48:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207223335.17535-1-kylehendrydev@gmail.com>
 <20241224103645.1709996-1-noltari@gmail.com> <CACRpkdb=kD=sOeUskOZEYHJGbEaDRNyQzyHWGx=dAs7HYE+31Q@mail.gmail.com>
In-Reply-To: <CACRpkdb=kD=sOeUskOZEYHJGbEaDRNyQzyHWGx=dAs7HYE+31Q@mail.gmail.com>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sat, 28 Dec 2024 10:47:50 +0100
Message-ID: <CAKR-sGeVfd4VttzycUXMZDi=5eGYmQ8f5PfzQkgb_EF1cFqXiw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: bcm63268: add gpio function
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, kylehendrydev@gmail.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 27 dic 2024 a las 17:17, Linus Walleij
(<linus.walleij@linaro.org>) escribi=C3=B3:
>
> On Tue, Dec 24, 2024 at 11:36=E2=80=AFAM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>
> > From: Kyle Hendry <kylehendrydev@gmail.com>
> >
> > There is no guarantee that the bootloader will leave the pin configurat=
ion
> > in a known default state, so pinctrl needs to be explicitly set in some
> > cases. This patch adds a gpio function for drivers that need it, i.e.
> > gpio-leds.
> >
> > Signed-off-by: Kyle Hendry <kylehendrydev@gmail.com>
> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>
> This looks right to me, but can we get some review from some
> of the Broadcom people? (Hm it's MIPS so I guess that means
> Florian.)
>
> Yours,
> Linus Walleij

Thanks Linus :)

BTW, I think that other bcm63xx pinctrl drivers need that fix too (or
at least bcm6362).
Can anyone confirm it?

Best regards,
=C3=81lvaro.

