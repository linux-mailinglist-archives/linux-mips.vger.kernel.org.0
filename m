Return-Path: <linux-mips+bounces-1896-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2386C51D
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 10:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EDF61C2382E
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 09:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC165BACB;
	Thu, 29 Feb 2024 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/0qOpCI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81FD5B5D8
	for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198896; cv=none; b=UMtU6bsA05y3rmxM+WRM+4ip7+iu5hsWcee0m2tjiJpzAEMpiG+p0cgQp5+sR8MaHgMigmWswojtLeIz42abCq2CzlL11qbZMFdiKHJVXkdwtvhC/Pvpel9S6ByG2Sx0u+uaznvnTWr4hObziUYyAzVkYXchZJ0bTBlLCZGoCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198896; c=relaxed/simple;
	bh=Sp9hVYy8RvwknY8xaF2NY4lfQDm5hhrVThxfCUMJdRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo8qQ4w7CDtCZvk3jwjyb8Uev48j/Y8MVNeQIRunhylfwTzFUvnGf/91LLKVCeBUj9cfli931HEGqqTP7q/q8D1EL3eU+zHfk5qqyJgkfw2El56QAlFio4OHtJT0s38vftKskH/+quIMLzWs04ueevbxZeoKK8M1EZc8P9k73Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/0qOpCI; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74435c428so788428276.2
        for <linux-mips@vger.kernel.org>; Thu, 29 Feb 2024 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198894; x=1709803694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkcK/kWoc4VLSEGC0rvaMV9x9NBCtROw8bD0RDsj9V0=;
        b=Q/0qOpCI7qIzHaFIqWO3X3AGxHH6Nw/G2aA5OoyK+t1ubbYoYKX/uNXfOuhL2LXqop
         EzSmmKZnEn0CHhzK76z1OOBEZLSnnmMedZQBlWf4DdeZdldeZS4lytFOfschebHw5qMb
         GWZkttJUH6LwGxcGi/bxze5jnQhomkzV0sYaKd8bC5IJfMj6xpjduAcSyNuJumFvODON
         ZjXdAAgRj75seWcL60WTp5s8AzORhUpNSFoZ5h1f4l4y2GkLKVEQMPYBoOlWaxtmxtxX
         hH9MrRivbG3QxiJnUreGDZwODPOUTOlqi3Q3uorNHghSPYrP4ajrRxPez4heZ8+mvr1z
         /bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198894; x=1709803694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkcK/kWoc4VLSEGC0rvaMV9x9NBCtROw8bD0RDsj9V0=;
        b=nJkeK1Q35xBmf9wjxoDP64De6jBhPJzCWGPO6Js4nuBoczqPqAT5tQHCiqRs4GFTnR
         hT4ujp6NLh1mOcWTDIDoIYLFWD3ouQVJKVRTyxXrQUAT2DDnr4W3PLzoFgjKXeNdDs58
         VHnv5q0JHXjCENzx30Y7GCbkfX3JTE1ZWYkLXttJKJdY8cjJCsZH602NjhMlkB3CrEXr
         OgkTll2Pb5Uuc+TnO+6M+F2uS8xwaCytnLbuxo/gRPa8QSWVWk3vbmPDHp+YU0sR52tV
         ZXkhDBoRjN7PER6kRdT3aqM2XkbvbcnQKLFBeUvyykhe1xr8t+WOwtcWnU8neOFPCM7A
         6C2w==
X-Forwarded-Encrypted: i=1; AJvYcCWFxDDI64kqKCgDkrrQh3ksh9jfzP8HHpMv5luQfl6FwWjzk2iasYJXK7eirEPne3mhc6WfzeN4I1mMwJLUw9TtIyCGrZNPT8AGgQ==
X-Gm-Message-State: AOJu0YxA3EMXnyEjiw3Js3dbJgJoi50gxa7QrcMKH9azjHo1jgMH+CjV
	NIouFDsEOX0XPxNRN81z+X8bf8my/K8GJ9pZ1LQoqRy9qEQV6Hu+qj3iH/GkQHcMZc00kc2t+ay
	W7TBq8XG7nKpavOsZxhmWvPzDgmr2+rOLQE69vA==
X-Google-Smtp-Source: AGHT+IH8fx/8sF1vAbE79BjOykSbpKj5al5QkwqPE1sPBuzrG4OGX6e2BzTUyjAs/nf9MZJ3L+YJycEaQmhpHHeon8E=
X-Received: by 2002:a05:6902:230a:b0:dcd:6c0:da64 with SMTP id
 do10-20020a056902230a00b00dcd06c0da64mr1763073ybb.58.1709198893879; Thu, 29
 Feb 2024 01:28:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-12-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-12-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:28:03 +0100
Message-ID: <CACRpkdYjHq=RKS6OT3K6xaTPKDp3xx6qq950KeZZOAzGuxpK6w@mail.gmail.com>
Subject: Re: [PATCH v2 12/30] pinctrl: nomadik: follow whitespace kernel
 coding conventions
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

> Fix strict checkpatch warnings relative to whitespace. Message types
> addressed:
>
>    ERROR: space required before the open parenthesis '('
>    WARNING: quoted string split across lines
>    CHECK: Alignment should match open parenthesis
>    CHECK: Please don't use multiple blank lines
>    CHECK: line length of 103 exceeds 100 columns
>    CHECK: spaces preferred around that '+' (ctx:VxV)
>
> Before: 1 errors, 2 warnings, 38 checks.
> After:  0 errors, 1 warnings, 16 checks.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Yours,
Linus Walleij

