Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FD5328465
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 17:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhCAQfG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 11:35:06 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:59386 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234701AbhCAQ2p (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 11:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1614616078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XeUFvS7D5czmcpKSz3hZLTdtQubPG16hRgrtXXd17Ew=;
        b=THlWwwUgDtQnHeO6dv1VV1QqQQtKcWNG0W5yQ2PpkIg9dSTp8FBwkCa5S/HiEp++PzNoad
        0TlYJ1nMFx26mE8PyxScBbreEqzOOR2tlkEtczxkni6M81i4NwTb8ZlXd4OE82f8M5kcLn
        qIcX8kO3SLtvH0+98PKHaBWsXSVeZak=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1532eb4 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Mon, 1 Mar 2021 16:27:58 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p186so17549359ybg.2;
        Mon, 01 Mar 2021 08:27:57 -0800 (PST)
X-Gm-Message-State: AOAM5312+2O9hjUECjpkhJstQ5QBZQMx+rDxwvbtleSZKCCfLXTw5I+s
        0SWwbk1psHW6ceUIjuARnOIk3HVompydJV4zd+E=
X-Google-Smtp-Source: ABdhPJwxdWnDOMQCJPCE0odLav95SrJdAXaOp19H0ABpp8zmBy9HqYgAZr3RvQ78X0YNvp0sbCnOlu/FLj4A+RqNpLI=
X-Received: by 2002:a25:8712:: with SMTP id a18mr24249006ybl.306.1614616077390;
 Mon, 01 Mar 2021 08:27:57 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
 <20210227230236.3234498-1-Jason@zx2c4.com> <20210301144946.GD11261@alpha.franken.de>
In-Reply-To: <20210301144946.GD11261@alpha.franken.de>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 1 Mar 2021 17:27:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9qw4VSgjAugYdms7j32A0TU_2C2EFMufsjc1LfYnczZEA@mail.gmail.com>
Message-ID: <CAHmME9qw4VSgjAugYdms7j32A0TU_2C2EFMufsjc1LfYnczZEA@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: select CPU_MIPS64 for remaining MIPS64 CPUs
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hey Thomas,

Would you mind sending this for 5.12 in an rc at some point, rather
than waiting for 5.13? I'd like to see this backported to 5.10 and 5.4
for OpenWRT.

Thanks,
Jason
