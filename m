Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF38332AF94
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbhCCA0x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:26:53 -0500
Received: from mail.zx2c4.com ([104.131.123.232]:38382 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235839AbhCCAGH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 2 Mar 2021 19:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1614729918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hu5rUdRCpl3115tdjb2CXsKF42860nLKk28rIF3vUvs=;
        b=jRZDHLjoRhck+DeCo78Rt8LrGhOqqldho5jWpiiwaIK9YhLZBOSjv96gFSyxER7ESdcnLg
        tvpQDv/TUUhtH7NLFCkPEq/FiracSSS80eifegT84GgDTv7V/bkTFf0YyiAwz/8sFoz34c
        MQytqb5HNjtMeq+8RnsQiRQjEUAjCv0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ab4cd11 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Wed, 3 Mar 2021 00:05:17 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id u3so22612663ybk.6;
        Tue, 02 Mar 2021 16:05:17 -0800 (PST)
X-Gm-Message-State: AOAM531GAnx46veUNdY6JZYUCGiMZo4HBntws4bo0o5i9p95ULySfTjL
        q05SCNjGeGtu3WG/d/pRwYXktMhA+/ooiswqFIg=
X-Google-Smtp-Source: ABdhPJwL9CtL0mwwiNNbS3nzTWS8KvgaQ8m0SkTxt76PNVzGYNFLaBC5zXXA/CQhfgLaKBlzeZzkLexlw1ZImmpXRd0=
X-Received: by 2002:a25:1442:: with SMTP id 63mr25858496ybu.123.1614729917061;
 Tue, 02 Mar 2021 16:05:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:9041:b029:35:5678:14a0 with HTTP; Tue, 2 Mar 2021
 16:05:16 -0800 (PST)
In-Reply-To: <20210302230338.GB3808@alpha.franken.de>
References: <CAHmME9ohOsdAwGaqCQZKDynNoC2k=14g9VSFP2mTUA7txf_Ssw@mail.gmail.com>
 <20210227230236.3234498-1-Jason@zx2c4.com> <20210301144946.GD11261@alpha.franken.de>
 <CAHmME9qw4VSgjAugYdms7j32A0TU_2C2EFMufsjc1LfYnczZEA@mail.gmail.com> <20210302230338.GB3808@alpha.franken.de>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 3 Mar 2021 01:05:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9r+gmLO0TBQEVH173vE2uXcVBYKi56Hgd=5_C7tLNkYaw@mail.gmail.com>
Message-ID: <CAHmME9r+gmLO0TBQEVH173vE2uXcVBYKi56Hgd=5_C7tLNkYaw@mail.gmail.com>
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

On 3/3/21, Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> On Mon, Mar 01, 2021 at 05:27:46PM +0100, Jason A. Donenfeld wrote:
>> Hey Thomas,
>>
>> Would you mind sending this for 5.12 in an rc at some point, rather
>> than waiting for 5.13? I'd like to see this backported to 5.10 and 5.4
>> for OpenWRT.
>
> why is this so important for OpenWRT ? Just to select CRYPTO_POLY1305_MIPS
> ?

Yes. The performance boost on Octeon is significant for WireGuard users.

And it becomes incredibly frustrating to bifurcate packaging into
"mips64 where the config is right" vs "mips64 where the config is
borked." This saves us a lot of trouble.

Plus the patch is trivial.
