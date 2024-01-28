Return-Path: <linux-mips+bounces-1198-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2311A83F931
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jan 2024 19:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22011F21C94
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jan 2024 18:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3E02E65B;
	Sun, 28 Jan 2024 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FTY4TId7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B12561A
	for <linux-mips@vger.kernel.org>; Sun, 28 Jan 2024 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706467598; cv=none; b=MyVYbYfh4Fj+25zTHFj5s543yGiMJCEBC4uxRXflemux7UTcbuR0qs1aTwFWz/2M522ILdS7xlmOFzwHSsPeJ1WDx3vy/mKyVo/b+xsLJyP0hxtC1nY5Ep5qo1ay7BqwLzSWmf49vBsBOKQg+5crbcG52cfIwa3o9UAOxhxr3UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706467598; c=relaxed/simple;
	bh=GNEn6DsFmA9yQRnivIGZcDahF1C8Q20kKbDBiKYeojY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yx1dewB8GnYxQYiBhsF+pIunVs1rYP/5+WI4ZhUTrt/YY1fD4zw30z6OwuR9FVz8JPhk6Fq/7eWVXMW7fkF8kaWx4HeXMkicXj1cb6rGB0Hh/ZK+VNz1h1lA+ybmVLP4vJCsttn5HuYrjVKOU24a6LbmlTPMIM/YcTI30ez7CBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FTY4TId7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so2122763e87.3
        for <linux-mips@vger.kernel.org>; Sun, 28 Jan 2024 10:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706467594; x=1707072394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k+QqLJ/uh3osnonCwTOn62hFQ+mw5FZR0sqAuG3yuiQ=;
        b=FTY4TId79uHee0wizFb5ozWUM7XRI8EAdrdBApLmGjgImq1cwMv351o1jxyq2YMCLg
         mWAeVQO9/uKvtND+bglJZOU1jWuy658A+lK/sHrqbYVHoW5RJQCgMhF6uiwHHOKdT8Ko
         v9Mvn40VULJ/U02K7xnk/DMNfTshU7dGb16iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706467594; x=1707072394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+QqLJ/uh3osnonCwTOn62hFQ+mw5FZR0sqAuG3yuiQ=;
        b=nUttSTpk1rpVgK15LCje50lnHbmuz2MQRHOsi/+z+JupZAnFZxaTM3MeX8jZvaseD6
         E23Ct80nm2JCCRBCH/XrxwGgh1SOrZiZy1DBF5HAgsRG//c2H/myfPkRLPW/b7OO8cu1
         0USQHYKvEs/ztDhCMAua9AmFr23Co/ziSEuQDWUili4QKOC0H3OKTaWKDX87SWbe5aZI
         vBpRs8NTIh8YdtIbTQq7T92UhfErM0DDgjub6JDxRZMZ8HFm2ZTe+ejGvMQ0jjwZtU56
         xRjKXIiioOnxYF6FtiyvsJ2/aOBTWmXaOfGeqsas+XwfgbrxtExRtB6U/00LGUd/sdxL
         O4hg==
X-Gm-Message-State: AOJu0Yx2bAgAN0w1gkJ+m5ZobFnZ2JOss4spTC2VAqhmGWoycEfgMS2d
	dbyB6zAZtjYXIDWHgl3K2N/IHFeCjST9SdW146oQDtn++F8aPshg1+7mefYzW7PoVM772T0e74F
	PXT8=
X-Google-Smtp-Source: AGHT+IFIs82D7TIUuAWuqG1b/gml8K40vCzprpkvKpH48pGRQKn0Gme4kFuh1Lerb4JfPSXt/6gRhA==
X-Received: by 2002:a05:6512:e8a:b0:511:f16:2642 with SMTP id bi10-20020a0565120e8a00b005110f162642mr965550lfb.3.1706467594021;
        Sun, 28 Jan 2024 10:46:34 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id h5-20020a0565123c8500b005110b20e0cfsm268776lfv.40.2024.01.28.10.46.33
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 10:46:33 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d04c0b1cacso1696991fa.0
        for <linux-mips@vger.kernel.org>; Sun, 28 Jan 2024 10:46:33 -0800 (PST)
X-Received: by 2002:a2e:be21:0:b0:2cc:65dd:3320 with SMTP id
 z33-20020a2ebe21000000b002cc65dd3320mr3029609ljq.27.1706467592944; Sun, 28
 Jan 2024 10:46:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZbZWfaAxU0MyPU9i@alpha.franken.de>
In-Reply-To: <ZbZWfaAxU0MyPU9i@alpha.franken.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Jan 2024 10:46:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYLgJMUJ4ZkWY7hsLVmABRCEMycv5RiZ0vV44UPc2OoA@mail.gmail.com>
Message-ID: <CAHk-=wgYLgJMUJ4ZkWY7hsLVmABRCEMycv5RiZ0vV44UPc2OoA@mail.gmail.com>
Subject: Re: [GIT PULL] MIPS fixes for v6.8
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 05:28, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> - fix missing prototypes issues

This pull request could definitely have mentioned this part of the commit:

 "Also drop ip27-hubio.c as it's not used for a long time"

because I saw this in the diffstat:

>  arch/mips/sgi-ip27/ip27-hubio.c            | 185 -----------------------------

and had to go look at what was going on.

            Linus

