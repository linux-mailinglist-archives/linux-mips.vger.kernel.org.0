Return-Path: <linux-mips+bounces-10590-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E7DB34C8C
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 22:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 231D73BC6F0
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 20:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB3D28F935;
	Mon, 25 Aug 2025 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="jZH9/6ae"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE4287517
	for <linux-mips@vger.kernel.org>; Mon, 25 Aug 2025 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756154905; cv=none; b=b95Opa9M4oIRBloxG7h1xztunv5371pUQOjz6wk37PxWMFYB71V9YOL30HHzqAEdGCotOnzdkpaLWz1c0trHEwuS3diftvwBFs0c/WgUY7FHmUIsQveVO+3gqb0uGbQ+aOZl/iAwJoPHc9Yx95lPVSNww+t8KfBa9WogyP57oVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756154905; c=relaxed/simple;
	bh=ws0OH/LPbfD0uWhZ3//ck7/pwntfVUXedOFJRthyTE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fBYHY5k1T3kp8yZmaWFXjONiuhdqrGtyfMwyY1r6Jvvjx2VQABzhGA69bdc4xwJOwDReUWGElNjF/bJf5JbUJ3c5mQ8sBwLPYdmBCdPsVvNN98yvY36Zzp8fOIcqkRzlJV181N/wuh9l9GgY1vP69BJCUTuY4ZyE9GvyDzBjoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=jZH9/6ae; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ec4802d41fso9825015ab.1
        for <linux-mips@vger.kernel.org>; Mon, 25 Aug 2025 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756154903; x=1756759703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=jZH9/6aeiq6scjXh74JMeDRknBu0YK1nVmdvthVMAlC1uKD6/6YiXbcN0d9uOFhQ8y
         n5VOI0KFRdom7vcCh2mFTkp2sEjBeLtvrpwmjhGTwmMURUIf+hINw3wtrwFg0VAZvVFJ
         DnogJpcDUJSSM4JQ5eeutJ85KJnu2jhLgUnKiMuACh3rtdaPxU6Hb5AmPv7aHB4l8mNu
         IvEzWzVGgskyavxiDt7E+Sqw275JD1aC7EtvEnGuIrA5LEDxWYauZo36SBhv+aKCCKmh
         qp7eK8YXq5krcHBKgokh3yv5r2zCwcezlUnx5OFFgipygHxemWQ6ZEwnTtwt5qxHNkMl
         BZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154903; x=1756759703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/dnllQLN8cDpaKVqJzQZtSLrZ7j3LLHfYLifC1ogCM=;
        b=Z4ZoG10V+x2pxAebkTVwTz94wBXVDwSVKYbsHtBi8MK/R/cUcW5Fg9LgmUBmDZRJg0
         9xaAsphZ9XNH59aWMsjJkgqZKowZBAm3tAuxggOB7k7IBm9kabbFuoXGFikm9bFAuKGL
         twWhRlbp5IykPbNorLPmByg7ky+tISZRZD38pVXV4rzl5TR9W6WWJT4TeNGWP5/QKqGy
         TPTjDyd0rRBRUrmvkMx0FkedXJmar7Ry7uIUl5F+WOvlhzHk3PpLNjaMnyqlpcfeHNnD
         RkX4aSSSgCHFXrBH14cL/BK3/NLmwF5jDrRXp1Ax2CLiMnIO/SDQHxGJigrYdjx8LScz
         yyAA==
X-Forwarded-Encrypted: i=1; AJvYcCXDo9m3JoApSXPl9ZiffMxPB3gKgBL0V8d3jZRKGxSEv5V8UhIVZ7NpMf04kra3BNARkjC74mIc0Bju@vger.kernel.org
X-Gm-Message-State: AOJu0YzOz74G4mgFTK4R4LY9F4Z2rDnjcX2uk8MVybG5LPJolyto/94F
	2Qo7IBD0nyF6AtjuV4heOEBKGfC+aM843eqe/FybZMiInabYwFc5eg2aT4xUXfsNWJA=
X-Gm-Gg: ASbGnctTsnCPlQgv8OK0Mkc4DGsunyUb0nmO3gBihx9dDheKqECCv77zZuPrv1yVgMK
	Cf5tECk8bZ43BE5cpQ1YhJ4BQTwLGe+GYnnfBthssPcQ8y0KCiKQLGnjoCwLLFt6gsyvuwiywNh
	Dan8hmW3ldxDktTLmNdSzrXBsefPvNefUDO1ie6MU+RSlXcXJKM4LqIGPMaQCo6Eq70dxVVMkS1
	VXn1bNvYQ6Lgotd198yHJYcC45jboYchFgrR5TvOnPVWdQanVYX03iRQ2usVm/714tbpyckFiVr
	BjE+nNmEt+IxrqtjWAOe86W0YE+ooRP4+OOyl7NEcR8Ht48SreKkaWUEdZ4Q4uGnXyrdyYJbVxl
	7D9ingjyOWBBcnQ==
X-Google-Smtp-Source: AGHT+IGz/OLusjKqnvYuytsepj0QasUaFhQNGeebbI4cWxx4cpCIdsaTdG9b8SEzhdQW1utDLqTgxw==
X-Received: by 2002:a05:6e02:1582:b0:3eb:cca5:5586 with SMTP id e9e14a558f8ab-3ebcca5874cmr83676445ab.17.1756154902655;
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4effe70csm53084775ab.51.2025.08.25.13.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:48:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>, 
 Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
Message-Id: <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
Date: Mon, 25 Aug 2025 14:48:21 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
> There are a few places in architecture code for the floppy driver
> that may be cleaned up. Do it so.
> 
> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
> 
> Changelog v2:
> - combined separate patches sent earlier into a series
> - added tags (Helge, Geert)
> - fixed typo in the commit message (Geert)
> 
> [...]

Applied, thanks!

[1/3] floppy: Remove unused CROSS_64KB() macro from arch/ code
      commit: d74968780bf287958e2815be5f088dd6c7b7aa19
[2/3] floppy: Replace custom SZ_64K constant
      commit: 8e7ee0f6fa33934373c1c37e8cfb71cff2acea09
[3/3] floppy: Sort headers alphabetically
      commit: d4399e6eb27a803b73d17fe984448a823b4d3a30

Best regards,
-- 
Jens Axboe




