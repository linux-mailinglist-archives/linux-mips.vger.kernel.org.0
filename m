Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A671394389
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 15:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbhE1NtL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 28 May 2021 09:49:11 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:39554 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbhE1NtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 May 2021 09:49:06 -0400
Received: by mail-oi1-f180.google.com with SMTP id y76so4277045oia.6;
        Fri, 28 May 2021 06:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+8bir7D+9xSBCnnQ4ocUkiOkW+oFAxTnt8bJwzWtlT0=;
        b=eAgp9CGlQ0zjOjfK6dhWJpsElQuuSnalB3JPHMx8WYWoIgswtpUMVLicA3bHLcVyAH
         FgK0Qlv9tJZZmEtdxMWKXYzmRDdd8p5/PVHBlmBfhPAMbbX2uRVKGDQVWy7im7mGcEog
         th0c64svMglbywZz791BYEwaTrLtzBcqOp/U2AhJoQ+ChYqfCorGBjWPPGo4dMEw3mZb
         V8jaR9t4i3/pdLjWJfaYxxQM6Ncgfp9IMWgGXywTDA5mhg5qHJBzqFMe+ecNUNLrRuUu
         lfyuQTV9vFGlnecpQXwVsP84wG1h1KZ5Pt5y93CSm/tTisFs/a+yOwn1zQEi+rx9iNjJ
         prdw==
X-Gm-Message-State: AOAM532rmd3xmxMhCEr6pNKwUYeVPIgMllp1WdK58mwD9wt/BQtBBzkx
        WGhF8q9J6sQmQFFlKq4QbjyP3lDa6nx0C5uNH3E=
X-Google-Smtp-Source: ABdhPJy+fZSwdodnEs0gbrEYhWJrdrofbU3jly7QP6L+qJ/qO77pjrbOB2xYQM7N9VmWCxWB/u637S4xP4KOOVrWxXo=
X-Received: by 2002:a05:6808:f94:: with SMTP id o20mr6026847oiw.121.1622209650484;
 Fri, 28 May 2021 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210528034615.2157002-1-masahiroy@kernel.org>
In-Reply-To: <20210528034615.2157002-1-masahiroy@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 28 May 2021 15:47:19 +0200
Message-ID: <CAAdtpL77zwffQAP6ihf5kQ6E5nOmOOnHZ8KD33ZN+kNGU0sZLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mips: syscalls: define syscall offsets directly in <asm/unistd.h>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 28, 2021 at 8:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> There is no good reason to generate the syscall offset macros by
> scripting since they are not derived from the syscall tables.
>
> Define __NR_*_Linux macros directly in arch/mips/include/asm/unistd.h,
> and clean up the Makefile and the shell script.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/mips/include/asm/unistd.h         | 4 ++++
>  arch/mips/kernel/syscalls/Makefile     | 6 +-----
>  arch/mips/kernel/syscalls/syscallnr.sh | 2 --
>  3 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
