Return-Path: <linux-mips+bounces-7315-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFFA06358
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jan 2025 18:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 758FC1636D1
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jan 2025 17:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7F11FF7D5;
	Wed,  8 Jan 2025 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kp4SZkr+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D21FF61A
	for <linux-mips@vger.kernel.org>; Wed,  8 Jan 2025 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357255; cv=none; b=oaKaYVITZJYFOLzPXq4OUgciEliBfY5bSrmkpJ3/bFHpKjTndqrCKaXfcm7bcuUv8cgmVZiV1WWvX1qLD06JYsup1nqAJMqQ2fKTcuGf42Z3EUqeg9Uk7PyU36iUnoVIzoRMA/lW1eb5OqUo/MxEd9L2b7ykR5txzcQfCO3W5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357255; c=relaxed/simple;
	bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egm/u4Vq699UxQT7KY7QW6mVByRVXZLh6QeLgrkZqImjFPmeowCVSP2rVo0qcmbuTdXDZYBimFJgZj9ZBMpBgAo5MSk0x6zf3cU9KU36wHizejuW5I3c7jsXsKAXC9ZyX/arMIQ5eenScYQYXyUciVvysWn89hKZwIFX5ylAxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kp4SZkr+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53f22fd6832so41791e87.1
        for <linux-mips@vger.kernel.org>; Wed, 08 Jan 2025 09:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736357251; x=1736962051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=kp4SZkr+bhTDSDZIwfjJrTf1/59qzWvHmfXAjf0I9Z9qsC74CUDsMYt40qXaKwEaNO
         KKsjJ4yLvsTZNXMZsMOPcFy94LRKGC1abdrPpdP4dJdTgqXQ2ykCqr7oXbMkRnu2e7Rc
         he8E3KwtO3US2lT+N9cBJ2I+upuUn+IKR2DyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736357251; x=1736962051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=rKBKFARB4lbtFlP6rBxC6mn/9Nq9zGW5cPGVL3nKuQjd6KPvK+d3Z76nivShCmvYzi
         ugKpwoIh66jbYgoQtZ5h0arM6PNLOnzV6inDSVylLQIVX0IK7AI8yT3yWrARUCFfDe7k
         Ovu4hDIPeOKqTP1XtSIHuORLR8pxj1cFkmaB8lVX3WCttncE4ZMFZw+DOITq5+xjC81v
         xJsnWBLDA26L3WybQv8/H1F2y4GaXLUIGTLSNAgTlqW8PuejsIPBDN9ihu5LAVJqAf24
         F3KamgOFYv+zZbCCagvBmvJPXmQUI1ivYY3WtDJR3cbG1glLfGYO9fxQgux5Ci0aDWcC
         R7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVL8zqfm+Ly2iDltBMKobQKFHoIuwMUcm7Xi8i9ka1O2XBH1Emv/2J0oJRWLNDzvANy8oUfsO7QKNYh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++c5HY+43SFFMWXtxhbv5Flj3yHlCzyqMVMmhQ/iuEkKBh1Il
	VhJlI+81xc/x2+9PavBHIG9dMQwkQoKW83g6ZyTzWIDgFUntuobNfsQCTXmoFyswC2pC+OnqEd7
	71g==
X-Gm-Gg: ASbGncu4+F5pb7dNYNSMR9jnIGQLExbnQaH/L8UM0hQdNzQ6X8KsW9J38O89jGCRasV
	SUMgVESReJRJi2Y/8PldOr1nz8LeXqaIfSgDAJ3gOWrI0kCNmZ+dHvo0DsPtX78UI7YWZk8fcUt
	X4pkA8uSEwaR74mJNl+YHkb3LiO5E81FC6G2oLW9HvEh84aLXpyfXrTrGLNTozD9Xdrf1nXLwnq
	CotAN2hRdBYp6sr9lA5clnWXtuktA5iOUNkl+WvYQIUmRR35qOHoy9U/R1mj9WEQ5Q+6Jj89kCb
	f4GQriOU0FL+FzmILzPk
X-Google-Smtp-Source: AGHT+IGrU2pc6XbsoBHsJ4QxX9MCVwBlJD7xvVTOL37Nln0D9SdUl5MFwagrtC0WuQ8fJBk+mClMcg==
X-Received: by 2002:a05:6512:3d8a:b0:53f:a8c0:22a7 with SMTP id 2adb3069b0e04-54284810ea7mr975751e87.38.1736357250996;
        Wed, 08 Jan 2025 09:27:30 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422381381csm5631442e87.165.2025.01.08.09.27.29
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 09:27:29 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so27756e87.3
        for <linux-mips@vger.kernel.org>; Wed, 08 Jan 2025 09:27:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsEo08Uo6mCw069FWoTz5G/MlIlAnhtma09VzrPu1a0pmKmWqcnIp8E/8CBmzd5mCwf8uHERVp2N32@vger.kernel.org
X-Received: by 2002:a05:6512:2354:b0:540:21f1:e9e7 with SMTP id
 2adb3069b0e04-542845b9b94mr1068026e87.16.1736357249082; Wed, 08 Jan 2025
 09:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
In-Reply-To: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Jan 2025 09:27:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
X-Gm-Features: AbW1kvZ7WHp39ciL3QA7T0aXBTFHS6WcSbmLSDiGkRPVgTELV5ossj5Zmm_Z_6A
Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
Subject: Re: watchdog: BUG: soft lockup
To: wzs <wangzhengshu39@gmail.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 22, 2024 at 10:32=E2=80=AFPM wzs <wangzhengshu39@gmail.com> wro=
te:
>
> Hello,
> when fuzzing the Linux kernel,
> I triggered many "watch: BUG: soft lockup" warnings.
> I am not sure whether this is an issue with the kernel or with the
> fuzzing program I ran.
> (The same fuzzing program, when tested on kernel versions from
> Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> warning on some versions, while others do not. Linux 6.12.0 is the
> latest stable release where this error occurs.)
>
> The bug information I provided below is from the Linux-6.12.0 kernel.
> If you need bug information from other versions, I would be happy to prov=
ide it.
>
> kernel config :https://pastebin.com/i4LPXNAN
> console output :https://pastebin.com/uKVpvJ78

IMO it's nearly always a bug if userspace can cause the kernel to soft
lockup. I'd expect this isn't a bug in the soft lockup detector but a
problem in whatever part of the kernel you're fuzzing. For some
details of the soft lockup detector, see
`Documentation/admin-guide/lockup-watchdogs.rst`.

Presumably you're fuzzing the kernel in a way that causes it to enter
a big loop while preemption is disabled, or something like that.
Presumably the kernel should be detecting something invalid that
userspace did and that would keep it from looping so long.

I tried looking at your pastebin and probably what's going on is
somewhere hidden in there, but unfortunately the beginning of the logs
are a bit jumbled since it looks like the RCU warning and the soft
lockup warning happened at about the same time and their stuff is
jumbled. There's also a lot of tasks to go through. Honestly, it's
probably less work just to look at whatever you were trying to fuzz to
help you pinpoint the problem.

I'll also note that you seem to be using KASAN and are running in a
virtual machine. It's not inconceivable that's contributing to your
problems. KASAN makes things _a lot_ slower and a VM may be getting
its time stolen by the host.

-Doug

