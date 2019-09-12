Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73EBB08CF
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 08:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfILGav (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 02:30:51 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40118 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfILGau (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Sep 2019 02:30:50 -0400
Received: by mail-io1-f67.google.com with SMTP id h144so51826554iof.7;
        Wed, 11 Sep 2019 23:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2EIHu56KDui336teMr4DkKpvoipypv0bgPYoVrCPWo=;
        b=bcaoS/6Z7qAEpCDT05Lz3uz3vaHryex6COy+Udm2aQEjRxrRdA+vZckUhbzSv2VuA+
         p3zoKvYA/NrekEm7dsjw/d0MeM9zNt6cDOB5v7FyePaM5HgGVkB/+e9wOhUgx2klYhEI
         kjTXM/1X5G1e/KqDnQJegfOdG86Zv+Uht87/ijC23PPbIbteLi3dGdILWe2Hy9YDfsMu
         mYkp7ccSKQUQHf6gsxGwy3pm7q5GX7ri3OxlA71WP1eJAKXXnrfrP+TYIkKqCfDhbzyJ
         Z5vHNJxwSjwlFLRxDFwVYHL+xFlWKMt62koXQ/VU6CiwwmTxEvKLcHJQ2r2b6+zDZxCi
         vF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2EIHu56KDui336teMr4DkKpvoipypv0bgPYoVrCPWo=;
        b=pLCbg9GFRgk/tQgfIIaYfx+0wd0c1Axs5cAxtnHl7JY2WXXmlejIzJHnJvNNRXhXri
         F09rK08saI7ER61B7V30mBU+yEcVu3fs30tWJYYF3iveBWA4TgConb5hFG48nlxlQSIp
         61gZ/AMPIrvT0USHaBs95sAAD1rNkxXtBkZnHHpVZJszsDGNWkWtL4bo6hJDNmuVLh01
         kD9gRrXhEfTOYmNdU0Y9sVY/KgCgcbbEG8lfqokva0xlE+nQgCGkIRfkbBedLPhNl1FF
         cnbCudt0StQIA42oHbtUQirrGbHqdRJGU8M381FENsd5OO10szxKlQyKA54Pw780Dlxb
         MbSQ==
X-Gm-Message-State: APjAAAX00wywn/QxH/mYlaz9StS1Ne4cnU2wCGAqTPxB0NMzx4ZTBqF4
        /KVvesT+YUr/DF87BDjhmcJZljiObWUKqEs205qKGw==
X-Google-Smtp-Source: APXvYqwV1eKNHwBsq9CiDfLgQ6VLL2uKpSYmR8xu9gWVaOPOlIDlM4uszXKVB/VXGXCzj6+BuaEyKKw2blKdi2aGRYA=
X-Received: by 2002:a5e:9509:: with SMTP id r9mr2605038ioj.100.1568269849973;
 Wed, 11 Sep 2019 23:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Wed, 11 Sep 2019 23:30:38 -0700
Message-ID: <CAEdQ38EbtBsmAU0D8VtNkp=AMLo9XN43v3-OaEN-2n6zfGDMkw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Modernize Loongson64 Machine
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?57O757ufLeeOi+a0quiZjg==?= <wanghonghu@loongson.cn>,
        Paul Hua <paul.hua.gm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 27, 2019 at 1:53 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> Loongson have a long history of contributing their code to mainline kernel.
> However, it seems like recent years, they are focusing on maintain a kernel by themselves
> rather than contribute there code to the community.

Do you know more about this? I have a Loongson 3A3000 system that I
have never been able to make stable. I tried pulling patches out of
the glibc, binutils, gcc, and Linux repos I found at
https://github.com/loongson-community but my system still hardlocks,
preventing me from doing much of anything with it.

Do we know why critical looking toolchain patches like "Added misses
sync in mips_process_sync_loop for add sync before ll sc" [0] and "Fix
loads for Loongson3 to promoting stability" [1] have not been
submitted upstream?

I'm interested in supporting Loongson 3 in Gentoo, and the hardware
that has been given to me would be extremely useful for Gentoo's MIPS
port in general, but it's just not usable at all currently.

[0] https://github.com/loongson-community/gcc/commit/e7e3b0f956929f022caa01ed25a482495b11d575
[1] https://github.com/loongson-community/binutils-gdb/commit/2f0e91d2af6093097202fae3adab624ffa86a156
