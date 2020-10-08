Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98C6287CCD
	for <lists+linux-mips@lfdr.de>; Thu,  8 Oct 2020 22:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgJHUEM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Oct 2020 16:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729877AbgJHUEL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Oct 2020 16:04:11 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5454FC0613D2;
        Thu,  8 Oct 2020 13:04:10 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e23so655163wme.2;
        Thu, 08 Oct 2020 13:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=0cpv+tP36ues9zKZvc23gnyV9b7gmZPPP3bWOFay3Z8=;
        b=soGxHYxnlKP7l3roOE54jwTEMNQqPWr0nj6Hc9h7KhV5a8ASVFMdI1r+dyLbrtgIlV
         TIdIKxQRLCjI9QAsxQOxc9AHdwu5H5MieylLqbVx15tm0HWBhRKahOO9STQ4r/ARFp+h
         ag8HAY9rWc6BN+2zEcR6FUdQGjvyCdNf+e4zF7CfRfjQgx/nKr9oj2Lybgq7pNxViRIi
         URASZFHORPGZxpo8hBuB4alXjoaIhNJqxtu820Z8PwM9/JpM+Y4bxcXu/IKgbPSPefd4
         G3oQaPWFeqzD9PjBz9F9pBE735mtlMp6IYhU/ubBRRI9qww7GMVCbY7y8MURqzuej0rc
         GynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=0cpv+tP36ues9zKZvc23gnyV9b7gmZPPP3bWOFay3Z8=;
        b=SjQ6PFuUbI6yIRkzqHbXAVu60nGqvB15d3dcrUi6s0YLsSa5Lu440bRaVmp5Pub4D/
         TY7UkNtXYFnfZz5po7TICv79Q363w0cWvewtb7av20OLYO46EbP+/6Rc6kFTAf4jpCsa
         Y9sl9dLz/Yi0q/w6N1Mea2Tpgp4nkH74T0MMrBe8UdznM52jU1jjtUUA8mCgwftO2b42
         LLGSpxJdnC9WvPRmol3FY4vfeFQ+X/6mua/QbuIyBH/rtoq1OzVomzcpAgRLPxJ/mTbR
         kx+Fk58AFJ5sw/G2EKXIMNkYw4ARSEbkY93Z/tQlJxrUIBXc5qmVM7HnWsYAoGuBgYM7
         XfSg==
X-Gm-Message-State: AOAM532A0ZCOtrH9qA+avRifr4v9QP8s5QWyyq+I3U7hJqoh7R2ya7F8
        qyMa+6opGCz9woATL+4mfmg=
X-Google-Smtp-Source: ABdhPJzbefUFsnEexYnumCuenoA3EWX1ObnpD7vhR0ttyC6Vq9tiw4N7i5bJAYFbq933cEFleHu87Q==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr9841419wma.99.1602187449021;
        Thu, 08 Oct 2020 13:04:09 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id v2sm9103715wme.19.2020.10.08.13.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 13:04:08 -0700 (PDT)
Date:   Thu, 8 Oct 2020 22:04:06 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Jan Stancek <jstancek@redhat.com>
Cc:     ltp@lists.linux.it, Ofer Levi <oferle@nvidia.com>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        linux-mips@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, Guo Ren <guoren@kernel.org>,
        Greentime Hu <green.hu@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vincent Chen <deanbo422@gmail.com>
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
Message-ID: <20201008200406.GA18136@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
 <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jan,

> ----- Original Message -----
> > This syscall is currently (v5.9) supported on these architectures:
> > arc, csky, mips, m68k, nds32, sh

> > constants are missing for m68k, not sure if the testcase is valid for it.
> > Untested.

> > Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> > <asm/cachectl.h>.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,

> > FYI: I was going to ask for removal of this test, but all these archs are
> > still supported. This test compiles on all archs now, but I haven't run
> > it (I don't have access to none of these archs, not sure if LTP is even
> > tested on these archs).

> I haven't tested it too, but rewrite looks good.

> Acked-by: Jan Stancek <jstancek@redhat.com>

Thanks for your review, merged.

Kind regards,
Petr
