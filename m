Return-Path: <linux-mips+bounces-11737-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBACBE404D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Oct 2025 16:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACABA5E30AB
	for <lists+linux-mips@lfdr.de>; Thu, 16 Oct 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349CA34DCDD;
	Thu, 16 Oct 2025 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MywwBi5l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387B345734
	for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 14:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626124; cv=none; b=cKRcCoMjPC6SEmTJ4+KSKNrr4uWuY0LlJCwawfSJfk6fsAZB2f43ugJsWbw51+XlKZPvhQbTYFN2+REYzWzq645wVM719MT00mOL6xkmL1ZcCpGRvSd+Ml4npDQ5TRUqDzq/3BEKzAbrrujc1J9/WIrqwQTsBj0DgIaup6PSzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626124; c=relaxed/simple;
	bh=fEYTH53YDZJZ8C2Er8bOzHta7ybr+V5+FzGrUdlcHBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKP8rYjj/CIPw+4Knb/jNLqpNP5Td4lQmj/IS0YFEco3ZWwHyY/z6PIAsnZOclVaXDFnPVh2roEdtUzdCa7OwMv6oakn+rnO2Ao1EJfGgtkKB9xIXqSjuBnSzch5e+kI3WLLa3o0xeRdej/BywLTndaCntV67WYAP1dVsT/+roY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MywwBi5l; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12807d97so789895f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 16 Oct 2025 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760626114; x=1761230914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il5/r0fmHwvIVU3+4q4zkfdvIMAREkRpbu6Q9Q7Tig4=;
        b=MywwBi5lmsOrpsCmmOV7nsIsxLrHGlTjFrIL4fvXm1GqGyoTm843ZETfE08u+w1whG
         Pd6itPgMW/hVeJSiobWZt4ZB/69aeq4PnEAvH0W5wWV9I++qCvK0hclteTx8rPbg0li/
         UECLKcUbJ6bsohZ9z0fC3GOby2FZtqSQVJOF76rdw9zc5NqUSlNHBUNrvu7aNdgfZP6L
         71UD1mDeKkrNLRX/brgQqU6sXugpZl+YIhHoSzEZkol3xU1yzH+ThXGULoSOvzBH049j
         wkgpLSoN4VA8Be25FHV1XILDwwuuyX486uJl6aWr3dkUEPrU1gdBFNPEOq6NuZppdUNu
         iiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626114; x=1761230914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il5/r0fmHwvIVU3+4q4zkfdvIMAREkRpbu6Q9Q7Tig4=;
        b=q1vqfQczN++kb1vyqrFU14kFEqSl7hEMwk2yxWoaMGSSeE12S7PaFe/o8I6vutmQNj
         CgShpW7nsp0u4KDfCRjXgzd5VRQYFZw92chZjQQVtRN585owdHFtE4LRMjP1+yzwmXNt
         MUfJOW/IDpvYlLVCv6twsgl6jzMi+8wPEK82qfDKBmNpeW1ZfBLk7x5Yu7FzD5IiaJmm
         NS/IorFAXMOufvJRL/85RIQpE/cctHyAKbY3u2fX7XCZ9F4MEaqGgYe7Y6a9aqEBBFUv
         ieuxZFqobAwG+JLyVoHqYs8XTJ9a5+gXBwpUSyx+xPcpSck/9T5OPLEqvPe7bGHxs7hf
         SEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1SVZIZWIzYPShu2eLw+iv8c5h3PLifVahaaUEv5RNT1IaZIDA0tfJfeBriU+f5/T7oVRBbUQuJ0yt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NNO8kJFg4VqxHlCRV28nsZYEAPRbNAHAgTqPWJAveJjMfKNj
	z6jTCMvHGO/vgEIqbbQVOx1ejb9Gu5+VBQYVjx8OhjfHWiKLpNEyhZC5CZ6pUoD/chk=
X-Gm-Gg: ASbGncuFdE8VztjlwN5NIy1ldLO8w720G7gX3ZCy3gql6Q/hEPFiT93w03DrqTwKFVQ
	xTeSP2UW5V01/dVlnjUyU4Ow6tW/UNAMh1GPsZgYh5r34Ak1jFwLgiCSFpLcxPTQvlfmRLVW3LO
	HwN7KXVpKJccHupV/Mtm+42xXvLD+0i1APvq9bJ4ajcZTdxv/tkYfbjfhzIh+fEL5KxjVOUwHIN
	1xnyDkyNSKMDdbUxSk83XF1qViYfgpZ+6nsw6BK3qe/kZ34VR37caNYa7KIG3q8Gem1D7hZH/vs
	GMPqhMVmOjV9TltFyKs/cFxNAde7O84lIfljcD69SEeKxXvBh6RGzt6Aszx+k7nwfx+vL3S459j
	L5UZ4zknoiFIyFqSp66hx/lb21+R2EIhZv8gZ3XdM17aCP1vn7oYOhiE72h10IJ4JG7OXZ7l/ad
	Wprw==
X-Google-Smtp-Source: AGHT+IGU+UUv23rPnRMVt1yR35zGCx+QFDbX2GlDTl3HK/z3KL4fSupr6QTfss0me53/F+Mqd2QUFg==
X-Received: by 2002:a5d:588f:0:b0:425:8591:8f5b with SMTP id ffacd0b85a97d-42704da4b6amr311746f8f.59.1760626114003;
        Thu, 16 Oct 2025 07:48:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ef97:57cb:86cb:f7c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426e6f03a76sm19507158f8f.36.2025.10.16.07.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:48:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: Re: [PATCH 1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Thu, 16 Oct 2025 16:48:21 +0200
Message-ID: <176062606134.122017.14455806740339775356.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
References: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 13 Oct 2025 15:07:14 +0200, Christophe Leroy wrote:
> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
> 
> [...]

Awesome work! Thanks for doing it, we really need to keep getting rid of all
these legacy intefaces. Queued for v6.19.

[1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      https://git.kernel.org/brgl/linux/c/8d0d46da40c878d082b92771355faba8036aecc7
[2/2] gpiolib: of: Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>
      https://git.kernel.org/brgl/linux/c/eba11116f39533d2e38cc5898014f2c95f32d23a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

