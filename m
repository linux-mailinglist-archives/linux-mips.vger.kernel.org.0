Return-Path: <linux-mips+bounces-7637-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D58A21F14
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 15:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D1D1881F79
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 14:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97ED14A635;
	Wed, 29 Jan 2025 14:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkpUuYOb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915113D51E
	for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160807; cv=none; b=rqcaaUlPbQc/ZQw7sIc5U96gkyyGMvSGoQO3U764J7VZKDTIVgY1c+bVzXnDhfTDHt2aX9mHm4zJKfcx8e/PNoZ6aayCZDxaRjxljvrqlwzl07SdgYmsB0SpbBysSMP0Tf8GdyQE1Fc3ZX96CgNu/KTmqne21lAh5tz5hgJZ+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160807; c=relaxed/simple;
	bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d28aABXLRqk1dBH9EUWIIfurQkbgbmjPhF5nZzMGxIxXi+1ROQx1hgy1em+PcGgC7+/zhojq2jmwG2Ug7Z39kvwVzah9EbL9kWSjUSWGsGsw8Nm2J+bv1fl1LlUvZC93LRV0AiJ18y0UjoF5HB0VOzVoOOUMpq/H7svs3W8ikbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkpUuYOb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543cc81ddebso5553749e87.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Jan 2025 06:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738160804; x=1738765604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
        b=AkpUuYOb7MRfKp3EUCzIgyIUMU3p1tqrwuSs1m6F+MqAh0mczPjbKnjl6c6hOhWz48
         BYIJlb51qGBaq53gr+yAueXzRiQhShi4Pi/9XyUKlk8RCW1a7TRvv1RxmCtodKzJiR4i
         mTWMpHEQrswMMONNmPG1XCsOAoYSt2jkPcz3zXR1E++3VE7VXE2BT38xkO8TwiOUq4B2
         XyDLnaV/1wEvCDdLnl28Ogl3yqwm5lXY0UwNsfDONzaWRNmTDJ2A/O7VXzLOvv5BEbjE
         q+uJHh8ZZmmFUmje8dIiwLRe3TneycAT0EgNfXa64gDNcNP2gDKdKiIu3qYM6/XOp19R
         LTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160804; x=1738765604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
        b=ty8VpQXIKJ0Z1uXoBu30BkywcEr34mV1AjlrEht/Q3kPMIE2nsZCv9ck5wUwmXnpU9
         cB1qmw+zOAFFWvxmc2DxHV3ffLCAKOt7fQLrhertg7g2gb7yseGMJTENli3Y7V+2kMee
         ZXu4HNhieAcM2ZeS4JmZ7LxJapDuCZO1Wk6LzkATJIF1DgenwfjEUmd7bM9qq2C/rLPc
         FsrMxTw0x0cqCQMY7cRg5VRr1/5cD4pLWf/UQ3kt/nItQslDJmWMjOaveZZYVuEKcryV
         hWsf72jKbL6V9V+ARE+5PtXymLhf1aCCD1sRD4ERegJ/w509hF5nWrjYVQXk+XaMlZz6
         NYww==
X-Forwarded-Encrypted: i=1; AJvYcCUOukSh9mxbk3aT8IHTzyTGoierpBEQCn18Vgf6uAM3A3BDqC3jlBPKNBdm8x9Dgzql1al6a/pO2r+R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lefIHbZn6SiVFnVuc+wcOm4rLJ0lFEZsVVRvDj2BINbjXDHK
	bqFvmaj1v7LrDu93Tv8ZJMvnEZl1wH24pbEpYZL+mmz2OgxKxlnTCg5oYb2Dnb+JMumTzTEk4lQ
	QwQ2iLu6SonoIxKNWqiahv+Wf3vvT8wLK35QwdQ==
X-Gm-Gg: ASbGncuSK5R0X9ramjCVy8f+QPITNX61nD6+HO1HBvh8w/ak6bjgnw94AwqRPDI9myM
	lJlgwULRlx7zppWyYf1pdBu4j8jJctklnNNRnDs/NLFZsgl3X8SKMsB7oDLWFSgCoBb4wAhN3
X-Google-Smtp-Source: AGHT+IHw1F/lo1/Ko4z7pikW4LFnEDu5Ve1ZScMGRFoM5rAS+hq7npeLgI/60jvet6gNCQddPeFB19H+PtzGDKVNdzI=
X-Received: by 2002:a05:6512:4802:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-543e4beac65mr993160e87.22.1738160803896; Wed, 29 Jan 2025
 06:26:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128150228.GA15298@redhat.com> <20250128150307.GA15325@redhat.com>
In-Reply-To: <20250128150307.GA15325@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Jan 2025 15:26:32 +0100
X-Gm-Features: AWEUYZl3XKXbgInDRKrHV1u1-_zdCdB6TJlCed9nhE-D94gFzevJM-mPjaUlV5g
Message-ID: <CACRpkdbEKYz_GFYeuBLsSv3xD3qjGjoDh16GWgzfdOfwRjOdYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] seccomp: fix the __secure_computing() stub for !HAVE_ARCH_SECCOMP_FILTER
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 4:03=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:

> Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> will crash or not. This is not consistent/safe, especially considering
> that after the previous change __secure_computing(sd) is always called
> with sd =3D=3D NULL.
>
> Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dn, __secure_computing()
> has no callers, these architectures use secure_computing_strict(). Yet
> it make sense make __secure_computing(NULL) safe in this case.
>
> Note also that with this change we can unexport secure_computing_strict()
> and change the current callers to use __secure_computing(NULL).
>
> Fixes: 8cf8dfceebda ("seccomp: Stub for !HAVE_ARCH_SECCOMP_FILTER")
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

I had no idea it was this complex, thanks a lot for looking into this Oleg!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

