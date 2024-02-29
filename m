Return-Path: <linux-mips+bounces-1898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD186C52B
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51BEC1F233FB
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98975B5C5;
	Thu, 29 Feb 2024 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5lfH0Z1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB95B697
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198972; cv=none; b=c/4H0Rve+oJLaBWF9pqY01nV3ULRrQ4ggTSGU/M6WAaFRPGsPas6By0B31jF8xdnrssfHxxbXziVWaGcZmVux3pWcQPnhzA3JvG4KRkeflupU+QDzpiByYyXirYt5d/4nNvAd8RZE34MxADWC9nmk9wWjec8B14qL6QIyw1wmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198972; c=relaxed/simple;
	bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBfh6Ouifu3t115kl31712MayuhAw6SSEud7d9634qwAIBkuJI1mDxOUSr/rC1KEJNmUZad//l3ap1Rc8CT4lAzObuddssj82oV6aI8ZScbQMHk7lpzgReGKjL/OfFKuW2ssrvQ31DwDQrE0RQIVy1A6LrnXcqhnN0C2emVZM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5lfH0Z1; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-607dec82853so7012277b3.3
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198970; x=1709803770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
        b=d5lfH0Z1sSIgs50yYIeIQKbO474hjQu/EvDmwE49iQgsPOInNaUQDOSA+AF4CXIpmy
         Xb1yPwzdhzClmaM4/Sk0iXEUpm+yQhSsgDzdlqlLeZvTwcW3dE3W01U7sSMPo0shu7Fc
         DvniCqD9rNmEwOafYGPLQlfQwYPz5sQoI9To5ytwb51myDjMz8imulc5asSJHGygEuRW
         niIiT0OyykV5slPLPb3X8XhzLIz8bSeMBjuBVD+hqMi3M/ZVN6reQuYyVcKeW7hgzrHU
         GJh75fl0fgOWApwNO5tjbiM5lwSFeovt7YtrIQmbdYcRK4gc52P62cd5kaS1C6Oqf5xj
         tbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198970; x=1709803770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xrun28hvTbwUNlBt/r1pmmvIKLwTUek4EH0OAQeY6g=;
        b=Ityz5lxjrT5QqNYAP6/IpJGF0KznLL6yFMcYUpGfSZiaV5MdnblDCLBMy5zOrIoZj3
         VxKgx6YB/WbhlxC66DrsHBXXAy725kaZwMfs0EywvuWIiodWjGq+mi9YHTy+DWv4dC6x
         nwxl4ZUAdjXHL7MCYO/4gie38MPBcKo545DMCr1JPkGFCH1VwiQq6/fYHpWmLC5odmDA
         9WvYOiifWo5sV4wIMAp5YDYjOg8oR2bzHoLlUGsrJ6reIcYJ9ql8TEmOkcQSWTmDEdDT
         esvA4crVq2eOmaFMhQFQLH9l8Nz+Lf1YImH5+69/Lt/jTgXfpZMO3d978PCeidlrSiNV
         Vqyw==
X-Forwarded-Encrypted: i=1; AJvYcCWv/7Mg0YfymeatfEbww7KE1OXYZzQanBtLFe6r/6oBwnNjps7XfLTNUWbaV0RRhlxccVBDqDe54W7YWbNYepYG5nWzdKvvHMgjpw==
X-Gm-Message-State: AOJu0YwLNUhMNDBYjMQvCGAXgzeRGNWNyRfqJ0RrnUMTr5/PUOFKT+Qq
	Qdw4BCHB8Q3J3lw4l24JJ8g/VuxGjZUP+WAnog7KoCrIZJrU6CsVOYJTubL1qEUYc3Zw25muKU9
	LKz1IcrQNUuH+s6wRGitwQPhWj8r05mfgqGpeiQ==
X-Google-Smtp-Source: AGHT+IFcIq6rOa8YJF/37W++7S7G6OEFznJJRmbQw71XiyjH8oKuNU7jWDHU4uKxFfdpywX9lIfEjnnzQ3AuD36QOkg=
X-Received: by 2002:a25:81cd:0:b0:dcc:8c5e:7c9b with SMTP id
 n13-20020a2581cd000000b00dcc8c5e7c9bmr1795722ybm.57.1709198970093; Thu, 29
 Feb 2024 01:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-14-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-14-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:29:19 +0100
Message-ID: <CACRpkdYavroWGW5HXLJATF0UuffQYnyoQYnO=aV364=XA7ARsg@mail.gmail.com>
Subject: Re: [PATCH v2 14/30] gpio: nomadik: add #include <linux/slab.h>
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

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> Add linux/slab.h header include for GFP flags.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

