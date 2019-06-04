Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C829345D4
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2019 13:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfFDLrJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jun 2019 07:47:09 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39717 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727619AbfFDLrI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Jun 2019 07:47:08 -0400
Received: by mail-pl1-f194.google.com with SMTP id g9so8244039plm.6
        for <linux-mips@vger.kernel.org>; Tue, 04 Jun 2019 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dqp69e2uVFEsGCK8JhiQUI0eIhdoGk5h13T4mTC3vdY=;
        b=l/j965oTYVXJlxTYWvckE8VTMI089RUFBuoqrrqtaXuZS/XGL2imWUR4Yj62ofLJ5B
         DgxG1n0xNvR+Z1Q2WKLjXP4Ic6bW7ST7vC/dzKmyj0IUR6vTT0z9AontN1QI8ObMfrqT
         YfQOny7N2gMtvrAIhPa+UYF2M069gzxKv7PwiRWZjJ1iI6LDinGjOYSS+sjqs5grnF0B
         e9aJoVfdsnL4PaWC5CyQ3SVTmBWLITUXFdUA/VEb4rquThulv4tr3tFv4LY7s8DA7Ygg
         QJSsuhRnspRaLycykpAiwScHW5uSOeCZARUrOt7CO58SxO5d7ZxzOztZ8o9JgluM7fHh
         Jptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dqp69e2uVFEsGCK8JhiQUI0eIhdoGk5h13T4mTC3vdY=;
        b=iPigg0fPLjO6bYmYt+xYiF8UdfWtqdR2xZVZSztosgNIkPkjZNJgeYCp+9djV197Lu
         byP7hRyPym9487TLX9ueVRuDKVRnxyB0nplqDCXSyChCztNSWtDIT5ptU//RqqBtSEZO
         TIYnwHz+N3UM+qsRhk0qICjLNbGnA/nWk5Bek88gMM6ck0VpwXTHgOIauqLbfObgbGow
         J2/nZa+6px67W895ZMHwIHAGYq6H5dWDRglyrze33YckmHQ2uT0pT1dnnrIPgENZ/dW5
         PZZ4ZLrzB1w1o70iggczqyTvCiTb7OTL9a1Kq59XRMJL4iOuFweRViYBNHs49kOcvSMV
         /P9Q==
X-Gm-Message-State: APjAAAU/kx4ITVS9anoMUInUPLNmB2L6PLpMnJMGoSk82J7/SQCRtkzp
        1TrC9yQ7ZRIAsjwqJ7BYeoqffsbcTDbHRa11MR+TWw==
X-Google-Smtp-Source: APXvYqxxKCotfIzPUp2KWeKyy9ei43iIKcJ+7sjPmxGSimbHW7NgNBX2aQnmBFtOckHX4w3Dtt0BdqhA9Y8aOzwYWxs=
X-Received: by 2002:a17:902:1566:: with SMTP id b35mr36931113plh.147.1559648827583;
 Tue, 04 Jun 2019 04:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-2-hch@lst.de>
 <431c7395-2327-2f7c-cc8f-b01412b74e10@oracle.com> <20190604072706.GF15680@lst.de>
In-Reply-To: <20190604072706.GF15680@lst.de>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 4 Jun 2019 13:46:56 +0200
Message-ID: <CAAeHK+xtFwY+S0VY-yyb+i_+GnSjYHfgYHB9Ss=r9xxZZvsKFw@mail.gmail.com>
Subject: Re: [PATCH 01/16] uaccess: add untagged_addr definition for other arches
To:     Christoph Hellwig <hch@lst.de>
Cc:     Khalid Aziz <khalid.aziz@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 4, 2019 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 03, 2019 at 09:16:08AM -0600, Khalid Aziz wrote:
> > Could you reword above sentence? We are already starting off with
> > untagged_addr() not being no-op for arm64 and sparc64. It will expand
> > further potentially. So something more along the lines of "Define it as
> > noop for architectures that do not support memory tagging". The first
> > paragraph in the log can also be rewritten to be not specific to arm64.
>
> Well, as of this patch this actually is a no-op for everyone.
>
> Linus, what do you think of applying this patch (maybe with a slightly
> fixed up commit log) to 5.2-rc so that we remove a cross dependency
> between the series?

(I have adjusted the patch description and have just sent it out
separately from the series).
