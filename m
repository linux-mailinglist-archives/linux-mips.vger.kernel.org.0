Return-Path: <linux-mips+bounces-5284-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01719968388
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 11:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3291C1C220E1
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2024 09:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43982187847;
	Mon,  2 Sep 2024 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sGNONg8S"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A990815C15E
	for <linux-mips@vger.kernel.org>; Mon,  2 Sep 2024 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725270454; cv=none; b=qz9XPARDPaCbMc44ZR4w1iLHI5p5gAtFbh8aWnKXmO8AgWJLgheNU5o48lSAUtAW8tas314e6nHhcIYgu04bv8YIvpwnrFRzHuFgK3sOzwjvm2hX8wMJ0mji82uDchi7lGKEvMrbExOtYocRyXWoyNYf2DDR1K4XquYEEHj0BCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725270454; c=relaxed/simple;
	bh=DuNScSLrncJcXkhhqd3wrDOHlNlSW0sDryQ2PyBZ5u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNYr25GmtRDF6NwL0Blj8x5rv0yMLi7EasQ07rhP4S/j11KEuDbshZfopszJpFawWZCCU/BgDfJjXO1X/CX2dqgEapBvwYfYm4L9cyX+su9YxR+17FJEAc2D46UmULVHByrj8ihTwwYeeKQuIc8FkyqxFuBuaDFJf9CPohU38SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sGNONg8S; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so33582565e9.3
        for <linux-mips@vger.kernel.org>; Mon, 02 Sep 2024 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725270451; x=1725875251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3AEK0nNq+mUfvcaAEZ4EXWlK/uF5ptTVbDmVXUeQRg=;
        b=sGNONg8Sh9iJ7Ptc2m+q7t6mcgCAUk7wEUZXeoboj4WhL26Q2AidZlD1sv7IFvwV4x
         l9pEoK/k5YiTWvyYf+hkUBUiB1St5VZ/76+2oUcHIOXZiDnJGJ9lsmzLgQAM0t17M7xB
         qcT2dp5k3AONFdCFJDkDI/hfuKMUIUgUcB1/RD4bN+A0mhJLiCUfm2IjtM7x/ekVT0uX
         Amuan1q5AXVWYT/AjhlcfXP3oGl3yCWheR6yqY2CpbTD8XMTegtTIeC4l/fmEFipaTbN
         mzYdPsqND/KHSuQ4x+UzmEUJher8Vap4TkKB4y7e/u+dZ9D0mtUzxBmdiraBngvQNfkV
         M/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270451; x=1725875251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3AEK0nNq+mUfvcaAEZ4EXWlK/uF5ptTVbDmVXUeQRg=;
        b=ejcaqsfU50WiK5h0WAUxhv2UqoRNqo0ExLMlwJWXYaecj4nZ1AI67PIb6h5fmwnftQ
         hfXpmH1tEqTQ+20XIYrqfRZmEEtG4s+w3A1LtfVjqXF1O2NQSauUXde62G41/PBMoMp1
         q1hiYAijmsm3YrAAWTRvVFBjurfSZI2oqEYL8rH4hPLVLmeowbxW82k34Tc/i0g0Oa62
         BpcIBJRC3RxIGMNoXLd1LmqgllmdS97lSxx/q2W9CbkkBc4f3taHzoPLFhazPLBCH3wb
         xCsvb92jlkb2L3gqHXH4qDJgwvucV25hGZRUymTpLjsoKkwFKro4GaW8j6LUjdbJPUnU
         5Gtg==
X-Forwarded-Encrypted: i=1; AJvYcCUA5mhTEgqgMfEN/OR1yYi6qg92Efdr6qAbEFa5cEZip/X5dz1EvqCrxdjgDf0CvPdz2r3LTkS7g+/4@vger.kernel.org
X-Gm-Message-State: AOJu0YzgOAxhgQXVrTesxIMc6jfSC+D3OAZl4Mr9cnmiKRNO51G6DeBC
	tLXIqNltdSCI8kIceSETYFnUFAQWXm6JK9y4oBQDQcAMQx5jBGL3QCAxJYjO5/0=
X-Google-Smtp-Source: AGHT+IEE10T3SSREzGD+1MNWdnESsXC2FVE58tgjhk7q/xipxWIqUGIS5v57Sr/r85ctuKxUZXBzww==
X-Received: by 2002:a05:600c:1d18:b0:426:6ee7:c05a with SMTP id 5b1f17b1804b1-42c82f5324cmr25804605e9.15.1725270450396;
        Mon, 02 Sep 2024 02:47:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abea3sm168346355e9.28.2024.09.02.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:47:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpiolib:legacy: Kill GPIOF_DIR_* and GPIOF_INIT_*
Date: Mon,  2 Sep 2024 11:47:28 +0200
Message-ID: <172527044560.21269.8413918138283838054.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 28 Aug 2024 17:23:56 +0300, Andy Shevchenko wrote:
> Shrink the legacy API and definition surface by killing the (internal)
> definitions. This, in particular, will fix a couple of drivers that took
> it wrong.
> 
> This is assumed to go via BPIOLIB tree as this is quite small series and
> most of the changes related to it.
> 
> [...]

Applied, thanks!

[1/2] gpiolib: legacy: Kill GPIOF_INIT_* definitions
      commit: 4b2b0a2ce8153d65d0829e45e73bf6acdc291344
[2/2] gpiolib: legacy: Kill GPIOF_DIR_* definitions
      commit: 8c045ca534d03bab1ce4b4de49d29a36276a1e35

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

