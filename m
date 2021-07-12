Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44D93C63AA
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 21:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233614AbhGLT1V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jul 2021 15:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbhGLT1U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jul 2021 15:27:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E09CC0613E5
        for <linux-mips@vger.kernel.org>; Mon, 12 Jul 2021 12:24:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f30so45482545lfj.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jul 2021 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r3C0MNcdPuaQMoy2DZLesW5CVXpDYfQzTqrwGXdHaRg=;
        b=MJrdQt/xj/X89L2akDuRIxLQO4djMTLLgU8eBvU6YVC8dUlC07Y6kHh4rBlkT1q7MV
         Ea7nnfbhd2stzRZFtdTC0KqSjngvfVy93JncJKAiLwNmjmfcozdphfyI2xTiy3uOptFv
         Vhn12vpbGZd8c3Bo7seoaaiJzsRoQUlb47+hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r3C0MNcdPuaQMoy2DZLesW5CVXpDYfQzTqrwGXdHaRg=;
        b=A2PFlAkj5e4lpSg4j+FqMRiPCqd2zY14tjEb6axzurn+/gUAyj3jj3vZxUpVWA5vHK
         4sbHctFATSdXkHC7yRizjAQ1XqyT/ZJd9t0ZYN774vLnpWt5pkKeJxZYH7gCNyGYqVrG
         VubD2Rc3T1ft5Eldc0ksCyxoYcwBfrpkQcy7oBhGBQhy1/eVVR0+xU4Q9NJUd1dBjIrM
         VmaLKxHq6Dhh7GFdwpSMto/0K1SmweUR53j5ITOebWUHwtU4mWcXbBZi7btCAmfCWoUX
         DSpPtWCcuaMUsCkZ54PRJvNFFeNYGsLYSLmBd8reJG+9nPprTkNXNkCdbqwFqKNZ3t36
         AcYA==
X-Gm-Message-State: AOAM531c7TsznUpi/dKc44UiuCNlF+yWzV2HKbuwikrxmVDodT0Emojq
        bfaM1ZGAwiF+rTeUjn37U90lemK+qATOXa8h
X-Google-Smtp-Source: ABdhPJwQVkZ+TaeYrzG2fuLNYCDOKvMLJrvXTh2I8LXEHvwwH76C5OyEp3vzk19OXNPFDWteIix2Jg==
X-Received: by 2002:a05:6512:90f:: with SMTP id e15mr240978lft.275.1626117869185;
        Mon, 12 Jul 2021 12:24:29 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id c25sm301328lja.16.2021.07.12.12.24.27
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 12:24:28 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id u25so26002647ljj.11
        for <linux-mips@vger.kernel.org>; Mon, 12 Jul 2021 12:24:27 -0700 (PDT)
X-Received: by 2002:a2e:9241:: with SMTP id v1mr639513ljg.48.1626117867421;
 Mon, 12 Jul 2021 12:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210712060928.4161649-1-hch@lst.de>
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jul 2021 12:24:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
Message-ID: <CAHk-=whd0GaAH7gHuEiuKjOeD6JGKY1q5ydG1TCKjVBFNBUEJA@mail.gmail.com>
Subject: Re: flush_kernel_dcache_page fixes and removal
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Russell King <linux@armlinux.org.uk>,
        Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-mmc@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jul 11, 2021 at 11:09 PM Christoph Hellwig <hch@lst.de> wrote:
>
> I think we should just remove it and eat the very minor overhead in
> exec rather than confusing poor driver writers.

Ack.

I think architectures that have virtual caches might want to think
about this patch a bit more, but on the whole I can't argue against
the "it's badly documented and misused".

No sane architecture will care, since dcache will be coherent (there
are more issues on the I$ side, but that's a different issue)

              Linus
