Return-Path: <linux-mips+bounces-6321-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216889AD32B
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2024 19:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 999E8B21E3D
	for <lists+linux-mips@lfdr.de>; Wed, 23 Oct 2024 17:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99681CFEC8;
	Wed, 23 Oct 2024 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PfNRqMVd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ECB1C9DF0
	for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705568; cv=none; b=peajzfn3zCG4trDJezPFiVF6VmJu3eGxtLlosfplUSeiqlbtZsMXhQ1MOJMp7LRVtcUS+ZDJcEL3HlNxwyEaf486OwDSTU+WUrDbxZVq0fqpOlxHgk9gujwhmCfyiqUBL3EYnEHnFvdTUXFyVxyAydko51e8DCEGt9s6TDTx4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705568; c=relaxed/simple;
	bh=HhCRM8LXsD648EezB/Ag71ruZTVUBPWIrjPd9FGl4yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRMOzhwOFKD4/TMeoF/voli6sFin84D8btIlGyHQ4JBDzdXRoE048reSJQZhXWKaajipaA+VAwSexo32if62OOEeyIU80XcFvKGVKtCCUtxxq6oro92TequHJhLC1GgcRb2tPAwKc4SJ/cti49D86rNwHkQgi92yw94H0TuA0jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PfNRqMVd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cb74434bc5so58897a12.0
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729705564; x=1730310364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=PfNRqMVdmHs1fU+LK8FFyPDvmOvLnYzZ2a46Zh6rulUgi2z7zoX7LspJvHR2aT8rAV
         WNvChqPrimTnEzqOWz3OebW+0acLVmqfqwZMu9z9heLbB7uZXox+VZRCUxbVAJ+4Vwn2
         fxMdAr+VP1DH3MzbvvvIKxCOvS82QFFjkGhaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705564; x=1730310364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=pn/xEOfpH/8lM0bE4co0CQ0Nuy0A3Zo5RVV2lS//wZGOhPt63DFup955Erhc75D2K2
         k/WdKQzLBG4QR+jDvZGPFThwL3ojrORUcPvvjbvUt835Q6BsxVxWE+BgbDp0kO1QHcau
         1DXB34iF/S60TFhEP6/BjiJAPiuhNZKiIyod8UmeUBsqROmCCXpvN3DettP26VqrAc+B
         lZXoqmRnQugMEDCTOmVgaWXil8xjNtSC7Xc9VT/TPTDRwOjjcWt0aybuZMGUP+0MXG6Q
         /WTZXuAioxXzsClIW1HctEx9cVODVGVNbPuzeEQCHzPpX6zTfvSAFkugxi61nR7Woijh
         n+qw==
X-Forwarded-Encrypted: i=1; AJvYcCVeVkyxkk7VbMo6o9SwSGCZraFiikLbGGQLb2vMQGf+CUyYJOxL1P/d80gJpocst9Q0255appZXXPfp@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVbWdlFiLiRq5Vocl8lhio6OIo/fmtGh23dyxdr6gE8lJaWA1
	OXPJY5qWSO+MPpLWeKCkioiuHXgskbl/IFZlWgSUheR3cLO1/KOfFL8WMGmh5PuO7oMP+Yu4fKN
	7ipE=
X-Google-Smtp-Source: AGHT+IGFImFf2IvLZr/LNi/UTVowqS1tO48ch/TBb85TWlHxG6ILGTR7YxWpJDuFrXzr0/BkDEpUPA==
X-Received: by 2002:a17:906:4fc7:b0:a9a:835b:fc77 with SMTP id a640c23a62f3a-a9abf84edd8mr318135666b.8.1729705564490;
        Wed, 23 Oct 2024 10:46:04 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91370e54sm501665266b.102.2024.10.23.10.46.04
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:46:04 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a998a5ca499so877666366b.0
        for <linux-mips@vger.kernel.org>; Wed, 23 Oct 2024 10:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEZ+r+qPGj3xV0DFEKJRz94k22TgY8nJZi3ixoDy8dWIo3AlUqOEwy1FoCvVXrsdKG/zuXSodIf5m7@vger.kernel.org
X-Received: by 2002:a17:907:94c3:b0:a9a:8042:bbb8 with SMTP id
 a640c23a62f3a-a9abf94d4b2mr369489566b.47.1729705563762; Wed, 23 Oct 2024
 10:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
In-Reply-To: <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 10:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, gregkh@linuxfoundation.org, 
	wangyuli@uniontech.com, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

Ok, lots of Russian trolls out and about.

It's entirely clear why the change was done, it's not getting
reverted, and using multiple random anonymous accounts to try to
"grass root" it by Russian troll factories isn't going to change
anything.

And FYI for the actual innocent bystanders who aren't troll farm
accounts - the "various compliance requirements" are not just a US
thing.

If you haven't heard of Russian sanctions yet, you should try to read
the news some day.  And by "news", I don't mean Russian
state-sponsored spam.

As to sending me a revert patch - please use whatever mush you call
brains. I'm Finnish. Did you think I'd be *supporting* Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too.

                      Linus

