Return-Path: <linux-mips+bounces-1558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E685A660
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 15:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B72EF1C212B6
	for <lists+linux-mips@lfdr.de>; Mon, 19 Feb 2024 14:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76036134;
	Mon, 19 Feb 2024 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFc96/QQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2425B25614
	for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354216; cv=none; b=qP/XTXG2FHTVF8Ti9I+uzmyyoHHsmztLbonVBsKCpKRTrMfR3NqCeKRn9e1Mcg/WUxI059YjBPQoClpvkH9p0ofY1xCI7PsIu+5RtV7yPzfh/euihKTdQwwr9DXbOnJd0rhdF4NJPIJxzzi2LW5rKuFPeW45G8KEjtQFNJUpTp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354216; c=relaxed/simple;
	bh=rU1Nhjxuoh9w7JkV5eSoZAZaD4OFNvrT3H/RvAXLkAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct1KZrdt5/NngAHI5V2pudHdrXoVE8Z45dpuvfnH+o+c/LzvBQ8E9YmW/e44+V0EV9LAQcwOLSZAn0kHweVTZFBk4j6PShmcS3ktWBM7r9wit7m+hN8uYkZCGjfLIfi3noIDev2XrBSjpypBTwink+Z7bVxTDbUAy5ew5QOiO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFc96/QQ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60818d338bfso14823047b3.0
        for <linux-mips@vger.kernel.org>; Mon, 19 Feb 2024 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354214; x=1708959014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rU1Nhjxuoh9w7JkV5eSoZAZaD4OFNvrT3H/RvAXLkAY=;
        b=PFc96/QQHBTJpEf9DWU/RyQk2TfXTVceCo1LFyCJ9gOz/owViEUaAf7HyUg8coVyY8
         eVQfNEh7SJyZEE5w7C+U817ZX4l9+HYALWP0R7pVMRaf4IlNtpWbQvOJX38zxVzANjVL
         6gOMSiS5gwGUJpORvbeTpnYlDvLtQIcMMnm6zcQYX3SrPDEwISzLCayik2HkUA5D5jz8
         i1Mx4b4XJXEQ8DMBh1tykDmWAKBGRhlizVx4O5KzOM6/t+GLkkicWVkhokZ3/aEuIOpH
         s1nTZm47U19dZmE1CrlVZfGEcWHby/6RMbJwcFuQgl436ItNlGGoXE+c/onXn/GmWYVD
         S4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354214; x=1708959014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU1Nhjxuoh9w7JkV5eSoZAZaD4OFNvrT3H/RvAXLkAY=;
        b=PMlvyr2udygrrci0yUN5QbHU0TPSd7brUhuyeQ7prWCDPmNX4dDv9mwprKzYJ5GphH
         nk54ZAM+LVRrJ4xWsk/OJ3auneVbZ9CXIDEbNt+J6M0LCtpqaHe0KaVQ5cjHz1eJ5BBC
         Xes9ofzsazF97R9FQ6sukskYQ7byluDHEdxD0vXlk19G7ExVJO7cJ0VJKp6XMAkpb4tc
         P2tNszCYHUtwUMOWVDPdoSvzJuqr1LA1eEsFzKjGy+RjtHDirHzc1/uveaLpvxi34AJx
         dgs6KBCqWnviU9N5MoQDi0Wlz/XcRDwReovRLttZPEMT9Kcgc0jvxE15Cw3o7ojRB5RJ
         afhw==
X-Forwarded-Encrypted: i=1; AJvYcCUNE7XKcw9zwq8lGeuQQW4Jx7C62mlgE7H/gbWuSQQvwuqhYApEzKasqqbTcBmuvDrmsmIZNqfKhZs6RSrapV//HxU1WKXBnxTaHA==
X-Gm-Message-State: AOJu0Yw6ZVrEVpoALIJK3S272DrIUZbmoUQdzW9xdgZUptx7jmTPGMXn
	jaxM80SxJtdXir4pQMun9jq9oBuM9DvynrhZUoXwcADgW/m7Eh/7TlKDGc2KRnCDdfPfMamo0xS
	AWfJbCoCKJ2I9TvPP4Z9jDMLykLytVbR3q4aGSaQt+GkzmkemgaA=
X-Google-Smtp-Source: AGHT+IEJHqQDCsci6I96xgNE047t8M8GSckWL1OsHotXe3InAs56fqBtxhznMhmQOhQopOOVFi/8CalxVtCOXzkKx6o=
X-Received: by 2002:a81:57d5:0:b0:604:9d6d:681f with SMTP id
 l204-20020a8157d5000000b006049d6d681fmr11641539ywb.31.1708354214166; Mon, 19
 Feb 2024 06:50:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com> <20240214-mbly-gpio-v1-1-f88c0ccf372b@bootlin.com>
In-Reply-To: <20240214-mbly-gpio-v1-1-f88c0ccf372b@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Feb 2024 15:50:02 +0100
Message-ID: <CACRpkdZyw+WyrmdkjQoO9-y4exw0k6FiHk6NJ1V6N+OGZaKqRg@mail.gmail.com>
Subject: Re: [PATCH 01/23] dt-bindings: gpio: nomadik: convert into yaml format
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 5:24=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Create gpio/st,nomadik-gpio.yaml json-schema dt-bindings file as a
> direct translation from gpio-nmk.txt. Remove the txt file.
>
> Add clocks and gpio-ranges properties which were missing and are being
> used in Nomadik devicetrees.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks for doing this.

With the fix pointed out by Krzysztof folded in:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

