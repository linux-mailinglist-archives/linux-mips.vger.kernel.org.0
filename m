Return-Path: <linux-mips+bounces-7411-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B08A0B112
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 09:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C1916536C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 08:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B370E233139;
	Mon, 13 Jan 2025 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K867550L"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED0C233146;
	Mon, 13 Jan 2025 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736756836; cv=none; b=TLGcKROZjoW/dibhaedyOydiLynEjDR8qmIWqgofw4VBw/3s7KMXvltxXYwUjUvGi6fe1SCj1ux/SECi8LKkac0pH17hfMZNsOvUmK/w8HpXotHBOnvsdIGvrdep2GSZzIHBJqnPqDCxffynZktzOlIcjPgsQeWfd1C9O27Do4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736756836; c=relaxed/simple;
	bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I97PEbr4OIE/sIO9e5/7f64nsfGwj2JsL2XRAUnBcFTZyikT4gBZUdJrA3RwYFR2KFUQCU/PIiCHBo4piGU6gV6R8gHsqLUpbtEVbspT+uniJT4omAmlEjuxRT6CpqipeDBnIcylxjswq1XOx23sCQVmMsgQIO3vpFA7T+JvHzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K867550L; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30613037309so13925961fa.3;
        Mon, 13 Jan 2025 00:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736756833; x=1737361633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
        b=K867550LjvOFDmP5OshC4v4C2xfB7CjXjGpsSM3gRYleLlgBNZBjk/Qx/RyU4ZhWLQ
         dUFn2+53Qjnae2MOeCFvt464/6JJjp6QbSXK42mH7CZC77J0d5DV5KHZqdqaZLYtTzjU
         2QDwpajGeY4UuzbajBJuRbxXrEzldPTYCXj8WGfZuxix2eUc6zJUeAp/E2eKbngYBgMy
         Un6ZdSP4bXM3xD2G0TiGowdC4kQptyR7Mj3j/yw75G6AAo2Vy2rTtG+UwoSmpRz4sebH
         q5FcUGHyQ71pr8eIpBPA2Cfoog2KroTBBj1kU62Qy/IIb4iv4Ni3Sa9yog6SbkSVZ5ps
         z3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756833; x=1737361633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
        b=pz8oatH+xuh07GhsJ2pCk3gmg4PiX9dXxvspqgHw1+e67Gj2hboiKE4t7WJVfC46Zc
         YaqPwaYA1p6Wlz8CAQZ0xsAEKJAiSsNCyXdkmN94r0stTv+vy2hfXxl13pOfCCqKOoKk
         Q7c7Gvq43bb1PZB9TaruzZ0KqgIijp/c6YMkmw/UdK+yDfhs2lItrNcs/Dilc/P55ujn
         yYdX0Xqqj6TjoaRLJM3B0H1FTcQ0ou/O+diTb7pzjYqbVLeiyBYlHQPUKKebeouortlS
         tUpa0/1F13on3hLOQvoXjfS+LWBrKp/lD/ORDydZK/3PzmWmr0tjM4zDnj0SA7NLYMqN
         tVzA==
X-Forwarded-Encrypted: i=1; AJvYcCU072DaC0I9tMwEAYDFt3wLeXwjM6Jojoc7Wdi8iei9ArpOA3/nNRSZhx6KSg+H4p76DCizwZ3U/OWy8kM=@vger.kernel.org, AJvYcCUXaOQeS3L+GabD5kljMbQREUL4HDKki5Y06t79O4GGkmucgZPjS7wYHSX+2eOCdrMkVSHuU3dtasItMtlo@vger.kernel.org, AJvYcCUusGUdtaLXDZIZEUmE5P+yNH84MTLgmAmSal+z31xrNmLXFlDsG9KM9VoDutQtxj2ga7NIUMRwO2l6WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44uBroLIrr7pqPzYdg02j4Cz64OR2U6zU9bIbwLgolgJB6gS5
	A19SPhHPT5fI46KQ0WE6vXiA7XfIDU8Zx8myGSKGb2Dt7I1hAgKq+Y1bFA05NJOw7TRd+oFS4vF
	xyrdgRmL41Sj6DYXxzjm2u19oM/7+QNTp
X-Gm-Gg: ASbGncssgfiqbTaptHwepaFke3PI3+7Bje1syxn7UWq4V5HsHV0BMuAN3maNAK/inw7
	N29m7jS2NQlxdZgRYBOn+LrOtOcui6Upe3qLJ
X-Google-Smtp-Source: AGHT+IHbnPn6i9h7YBUlLi8m5aMfqWXK89UzEp3V6TTJV5vWAk5yvS0/3N9anCOG7Usk3SgfvFBd5HW9NsEBwWHSpx4=
X-Received: by 2002:a2e:a716:0:b0:300:4362:40 with SMTP id 38308e7fff4ca-305f463cf58mr41312191fa.36.1736756831112;
 Mon, 13 Jan 2025 00:27:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
 <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
In-Reply-To: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
From: wzs <wangzhengshu39@gmail.com>
Date: Mon, 13 Jan 2025 16:27:00 +0800
X-Gm-Features: AbW1kvaZRDwF8NRC6pRwpBV01fZRcE__7p5mkdq9ZI2BSDV4bxbnWk5RbAlBpYo
Message-ID: <CAGXGE_JaVxfpsGh4qqJ4zb3smaV3EFYPggtF9cEQvv_BtBR+Cw@mail.gmail.com>
Subject: Re: watchdog: BUG: soft lockup
To: Doug Anderson <dianders@chromium.org>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip!

Doug Anderson <dianders@chromium.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=E6=
=97=A5=E5=91=A8=E5=9B=9B 01:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Sun, Dec 22, 2024 at 10:32=E2=80=AFPM wzs <wangzhengshu39@gmail.com> w=
rote:
> >
> > Hello,
> > when fuzzing the Linux kernel,
> > I triggered many "watch: BUG: soft lockup" warnings.
> > I am not sure whether this is an issue with the kernel or with the
> > fuzzing program I ran.
> > (The same fuzzing program, when tested on kernel versions from
> > Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> > warning on some versions, while others do not. Linux 6.12.0 is the
> > latest stable release where this error occurs.)
> >
> > The bug information I provided below is from the Linux-6.12.0 kernel.
> > If you need bug information from other versions, I would be happy to pr=
ovide it.
> >
> > kernel config :https://pastebin.com/i4LPXNAN
> > console output :https://pastebin.com/uKVpvJ78
>
> IMO it's nearly always a bug if userspace can cause the kernel to soft
> lockup. I'd expect this isn't a bug in the soft lockup detector but a
> problem in whatever part of the kernel you're fuzzing. For some
> details of the soft lockup detector, see
> `Documentation/admin-guide/lockup-watchdogs.rst`.
>
> Presumably you're fuzzing the kernel in a way that causes it to enter
> a big loop while preemption is disabled, or something like that.
> Presumably the kernel should be detecting something invalid that
> userspace did and that would keep it from looping so long.
>
> I tried looking at your pastebin and probably what's going on is
> somewhere hidden in there, but unfortunately the beginning of the logs
> are a bit jumbled since it looks like the RCU warning and the soft
> lockup warning happened at about the same time and their stuff is
> jumbled. There's also a lot of tasks to go through. Honestly, it's
> probably less work just to look at whatever you were trying to fuzz to
> help you pinpoint the problem.
>
> I'll also note that you seem to be using KASAN and are running in a
> virtual machine. It's not inconceivable that's contributing to your
> problems. KASAN makes things _a lot_ slower and a VM may be getting
> its time stolen by the host.
>
> -Doug

