Return-Path: <linux-mips+bounces-5991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85E99A808
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 17:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AE8281175
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B29195F22;
	Fri, 11 Oct 2024 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dASfOhcj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9169D188CB1;
	Fri, 11 Oct 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661244; cv=none; b=YpPfSNEvnXoW6wU1TsErGUBegBO/TYUIL01C+GdiVwWXTuBir8JTLh6ZPcnGloxBp5hGN3N6Ygu9hO7VBsjxhNNaMvnSha9Rda8QT0ZYLQ9rDgFxs1QTqWaL100hNw4fR8p9v7u0oe6sXTEbxKDvboxrOrSfJFdyLH4A6T0aJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661244; c=relaxed/simple;
	bh=txzseXvjE2O+sLlURQCWNSGk2j8iSYWpIn/M93xrnvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcQERrxtlKFSPfbvq4WU2EWTDsuJWn+PBzgTswjOHOb0EazUcuP405o4fJgRkX0phPbtaYJZDaXfvi4VP/hRcwvo6MRJHGYMqiIErjfvFRHFla+/+Wfj0z0xb4NM5OYG93ehvSyzk2HIpAXF9XUUf18svUsjVqbDdmznSy6bc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dASfOhcj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facaa16826so19888211fa.0;
        Fri, 11 Oct 2024 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728661241; x=1729266041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khBtE4bfekeyDh6IrhDJxWXSph73WxxA+3qlzAGlTrQ=;
        b=dASfOhcjPvBwde/DBl0KJAZ4qlU8PRzrie75rD4bphcY2dPkrQyLc0oW2T+x/rCrW5
         Ji/4Cl2IDjlAT9eScaLTzNTMdyla2e1b0ULtRbXQ6eSFkw8uVgYv8AWlTc8Ael0kPvNp
         HStVJeYz64u/rSd9GAUxWV50bXcqqY5AydkZGZOMjCXMJzxugYC8Ry2TPbKFmwKpafVG
         zxFkCNKa2Hy+U+5p1WUffHVlNK3K1u5GM38tCWaoWmT2cqRbMClWBJWq0Z2e493TzEpT
         FShvrjpDSa9E6ROd0sAESO9Tb5Bu8HnwEHKdCxuEzoS5oMzxIFzw4eQuJVPet4Og4pVq
         sIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661241; x=1729266041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khBtE4bfekeyDh6IrhDJxWXSph73WxxA+3qlzAGlTrQ=;
        b=FJDp0qKGn4IyMo5lzDhVm0MdbVBzFL0It/qkesHY+0yWqVrtyFrPN83mQHI29SetqB
         0qjxJz2c1HGMLR0+P963huLBrhAnR+Scppt27N43kV3L+o0SKGsVlsyBLJJC4QMJaGFp
         Jffm7RgQMuZ0HnUy2rPP7iCQFPkA7Qw6KjpaFFeY/+bI4ULJqBPpAHDdVVgbRlJGMnLj
         VEhyvQgOCHa0uU0iwrIYoOHfQ3mS2ZC4P+dnwoEyS6kO+r0oTkqD6R/CV/2FfBxFH6uc
         Zeq2fKHlXJEgESLE/unjRyQIFmQGettVS4XKxOJS4N5Iq+cIDaj6PCWnjEqM1DkDy6OS
         rZJw==
X-Forwarded-Encrypted: i=1; AJvYcCUwJg/Yp0QXtbc8xu4IIe94evWpUB+5x8xYu5m/8UTm9myLX83XpviMz5uR5d8qPeNKjdcaLHJffDB3O0rr@vger.kernel.org, AJvYcCVffHSZOsX4/gOD/r/iHxbIyUgjqWp47ZF3CuHxM9kjq4wWqRNNGeDJe92yr5pR6Tc5fG5u3CmbFaGV@vger.kernel.org, AJvYcCWG4SHiPNS1S5QgAFotTYVE+xLekuJfz5nNqYb9XV4XuolXmxSqcwfj+JmdJCZlVGxOEZZBeAD943UnlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8fgsnNxwAPdcZMz2ZSuUXqVxZLIwJT8DI/2E6jhoKiR1X0E+M
	Oz8LdLQHDKf6aCs4+zbU2hlZZzHWM9UK4CvJ0OHiIuEaBRGPtti8JD1qrQtF
X-Google-Smtp-Source: AGHT+IHep9OrMoxi7CVDlu+vi5Q0yCuyEnYZKWCtJ8HitXCyhFhaycpIEJ/UUfG2VXmQImYcI0ahMw==
X-Received: by 2002:a05:651c:1548:b0:2f9:cc40:6afe with SMTP id 38308e7fff4ca-2fb3270b3b4mr15435211fa.14.1728661240359;
        Fri, 11 Oct 2024 08:40:40 -0700 (PDT)
Received: from KILLINGMACHINE ([46.188.27.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245799fcsm5281791fa.7.2024.10.11.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:40:38 -0700 (PDT)
Date: Fri, 11 Oct 2024 18:40:36 +0300
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: alexandre.belloni@bootlin.com, quentin.schulz@bootlin.com,
	lars.povlsen@microchip.com, horatiu.vultur@microchip.com,
	andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 1/1] pinctrl: ocelot: fix system hang on level based
 interrupts
Message-ID: <ZwlG9AKToZFFPAvi@KILLINGMACHINE>
References: <20241006181310.181309-1-matsievskiysv@gmail.com>
 <20241006181310.181309-2-matsievskiysv@gmail.com>
 <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbJ7xh1qOYaZOh+s+Tj_GgE4LXMFuOgL1zpxBRqJQVx6w@mail.gmail.com>

On Fri, Oct 11, 2024 at 11:18:55AM +0200, Linus Walleij wrote:
> I'm a bit puzzled by the patch because I don't understand it.

The current implementation only calls chained_irq_enter() and chained_irq_exit()
if it detects pending interrupts.

```
for (i = 0; i < info->stride; i++) {
	uregmap_read(info->map, id_reg + 4 * i, &reg);
	if (!reg)
		continue;

	chained_irq_enter(parent_chip, desc);
```

However, in case of GPIO pin configured in level mode and the parent controller
configured in edge mode, GPIO interrupt might be lowered by the hardware. In the
result,if the interrupt is short enough, the parent interrupt is still pending
while the GPIO interrupt is cleared; chained_irq_enter() never gets called and
the system hangs trying to service the parent interrupt.

Moving chained_irq_enter() and chained_irq_exit() outside the for loop ensures
that they are called even when GPIO interrupt is lowered by the hardware.

The similar code with chained_irq_enter() / chained_irq_exit() functions
wrapping interrupt checking loop may be found in many other drivers:
```
grep -r -A 10 chained_irq_enter drivers/pinctrl
```

> This needs to describe how moving the chained irq calls achieves
> this effect.

If the explanation above satisfies you, I'll elaborate the commit message and
resend the patch.

--
Sergey Matsievskiy

