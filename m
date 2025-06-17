Return-Path: <linux-mips+bounces-9354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260BADDB53
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 20:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D23531759C1
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 18:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4C320296A;
	Tue, 17 Jun 2025 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZULnhdeA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315272264A5
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184977; cv=none; b=BWdyhBJD0bdFgYzAPZSZzgnGQx5yC/EGI/BKoWRL3B35rscyftVNlev+ExfxAM/dC6SmeNHCMmxdpsK1jP88hULugChtznZ7oJqhQtphSHUBPrl080aW+HwBHG8d5+9iLVw1K4671GPOvR5MzxmPuPpAXjYFSDjFALZhgV864O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184977; c=relaxed/simple;
	bh=4D7DO/f/TIDpTtJg/TTFmgQrH4mAxp5ug7V7AlGUGEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pF1NF3wTV6hc1QWYNGsK+NVml85UgUj0jHYXQhOp2M66Y9077t26sp6xrxnxlFlSCJBfvLnZBEJjwngCEjTD2rNMypOkgD5ZSkis9lhycp31kAb2sCFqiDBp04dAyZo+d77PnhLY30YjLHI9gqtvrN45vBBwBikeh22c+QUI2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZULnhdeA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so999715066b.1
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750184973; x=1750789773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=ZULnhdeAZv+Trzzq5xzt/azn4/Dh+J6LuQR9TATLOD8coIES4JnNPqeaeQoN9LvgF7
         KlhVBrAk0Cfljg1ouLWQuEcxHXE7DC1msQ7pxvlQSiCXEUa30IGvcPvAjUZTxyLf0wDC
         NI7XXjEZCn4CwdSwugKLYQxp2JqqUnoa4XBm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184973; x=1750789773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=SI523uF9eJ7f3+5OOO7WmzKa2co5NMX1v63UjCJFDtWX2ctfsydCK8GDfGCn6/WuFR
         dNwfo3r3iGxFcLiVcwdWQDXeCGjyddx5A/tEZkBwqR0X/GfzscF2pMllps7Hq9tb37MZ
         hkc3/KLruZTzn/5eNKtV4zNsp7Uh4oEb1KPTEExd4qisHZEnlAZ7LC2cSZzXdZYrmH8/
         1psV4G7kd/WvxSMl4yaGkmJsxd+ux/iV8Kpgj7aSQI2XJf4QFG82CqwY1puC5N8qhbRY
         te4vntpusO5wO8JO9jCREn7pflDf+Notbsmx9wSI2Ebqmh/5bSI8rZNVr08S7oZOLSuP
         lUAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnC+jgO/x8D907WgrIrfrzFyMoDeOBVZXHketHz1aoHih8MIsCu62LOScPMKUUXebOPVt9q+kjUnvA@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTftxaheu4IYY71QyVBxpaDLv6EsVfo7Jf940Qs2SGxccwqxp
	kRtCRqQGgC7kgpX02py+80AfgfkCDMj4nPAi+Jv24Um5lPM/op2dU46lAtbs3mOJ1/uYdrE3nRZ
	uK8TRCV0=
X-Gm-Gg: ASbGnctMevnJm8ZGo8o/ms64lehZrNemdyDqprjil/VO1cjKNP+RD2GYZN50cVQS7Iw
	T1EgJqAcPPCbdutsuhslJrxaCxSryaF3ulkFhps58Nk/l3NQ1EJEYO/eb6ICfajZ6s3lZSt4RQg
	E5RkEYsfW+9M2EwJnJQKTjSuyuaINQa/ZvUBx0DwIHfunwX99cbh8M/mFFPNQ76ae26RjRIqcRe
	A+mVhHNLI+cexfQVQRJ/CFpwtvqGF6sOutjRtV8D/cN0f12a/UNJa4hR1lJn4LghniXHd7nJsSh
	NYWIcZ8dhGxCQd4rqX2WW2otXq2L2eZOocilt2eJos58EGR+625wcaaBGqgA7x1aRjY0+30h9ac
	DEjq1r/g8aey0G/N1FN2+utbRw7wejrxWQ/2d
X-Google-Smtp-Source: AGHT+IHi2KRXJ21xyCZ/wBFelaixzYm/+PsRriBMFUEpagHT09srRDWtf6zq1wEUXQuxLoAQGTXBlA==
X-Received: by 2002:a17:907:3da2:b0:ad8:87a0:62aa with SMTP id a640c23a62f3a-adfad37db10mr1452856866b.27.1750184973202;
        Tue, 17 Jun 2025 11:29:33 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892dd0bsm911304566b.145.2025.06.17.11.29.32
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so8793888a12.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe+xNF1KOZnxBUFal+wCYUrQWoipQcg3gk2LcWkSf+ccKDyF8sdmFtV5IAl6pqmbWFaDk7DGEfe9to@vger.kernel.org
X-Received: by 2002:a05:6402:40ce:b0:5ff:f72e:f494 with SMTP id
 4fb4d7f45d1cf-608d099f37bmr12876236a12.31.1750184971733; Tue, 17 Jun 2025
 11:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
In-Reply-To: <20250617060523.GH8289@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 11:29:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
X-Gm-Features: AX0GCFsDpDEWkWJGZUHtM58JGRAX5cSPaq4yB3fqNYhO8hMv3GVq-qz3C44LzlI
Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> An additional note on testing: [..]

Talking about testing - when adding test scripts, can you do it as a
separate thing entirely - either before or after?

As it is, this code movement is hard to judge just because the stats
are all messed up with new tests:

 77 files changed, 4012 insertions(+), 1756 deletions(-)

that's 2k+ new lines of code that pretty much entirely hides the
question of "did this code movement result in a simpler / same / more
complex end result".

So in general, I'd really prefer big re-organizations to be *separate*
from new code changes.

It's just a pain to review renaming when it's mixed up with other
changes - whether renaming variables or whole files.

And that's as true on an individual commit level (we try to avoid
renaming things *and* making other changes in one go) as it is on a
pull request level.

If I see a pull request that only adds new tests, it's a no-brainer.

If I see a pull request that only re-organizes the code and the
diffstat just just renames with some small updates for new locations,
it's a no-brainer.

If I see a pull request that does both, it's a pain in the arse,
because then I need to start to look into individual commits and go
"which does what".

            Linus

