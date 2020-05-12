Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3451CEF18
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729116AbgELI2q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 04:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELI2q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 May 2020 04:28:46 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3A0C061A0C;
        Tue, 12 May 2020 01:28:45 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id x16so2537479oop.13;
        Tue, 12 May 2020 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kVbCD/n1BkwyUP75XXZyibv77Dl7m/9w8NUlO/ODo8=;
        b=NSSEVtZzCAOoJnCBRGpAISiJPumtC6nRBgwN1dJVFHrMJZ9cvdBP/T1Di8fhz6ZBKz
         fo/8rFdpC3gjPTdS6MD3FGzhtHhTHvBwyyfMTFjLkYRnL3O8itA6gq4ZA/hUAlicP9DI
         BDUabtDb9ADFlO42SoHa2INT/libldyoEnECR6KgxWumkx+YFEEMXCZiaInu9WwtZYFT
         X4vVdn0thMVjC0P1mpGSdUTXFikV3dHCOCB+kw7fxYpaxIOdn3oscGU1qrHmP/dAXtH6
         m2StRiTuPE/ibiNJ+uTq3xt122yd7Mjf8wCQYYmb8JVFGWUoplzJXuqa3GHgB2aeAmJW
         ArwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kVbCD/n1BkwyUP75XXZyibv77Dl7m/9w8NUlO/ODo8=;
        b=kTnfaB61giIbmb9yjdhRmimtHP0CoDy0ZZUjnSBnhQOMGEpFmFJ6xcI1hP6dGxsg/m
         yQ3d3bVVHPZtldBGHRB+5LMmK3TU3m5QkZj548dy6RqOXLMEaAcc5kr/bQ9wywfZps7u
         XmoJX3KXeplHvoJVcVcPpo16qpNmMYI8Sso8y+BgNWXISn0ECRpgtHPVqwfiABjc5C2D
         icF6GhF1X+1MJKpM/sER4x4HE73tIqOALrdlNNOwpV7NT96PdYIfLtXYtS4QLKQw52YQ
         ySzWYsH4kypiQ0Sp5WV8o9tPXIX42I/j6NIV/jM5Fnr9KJujwzGjGt+34ucPC5M1n4nQ
         h6eA==
X-Gm-Message-State: AGi0PuYf4pA1ox36a2xXr/DHHRR8IBW4fB3djRS70M/tA56EphqguE53
        taqtTXkezbDPbRviW+gQb/Q=
X-Google-Smtp-Source: APiQypJRTj5+9cONY8dNEGUIzp1fPmf0fr/ec3M0P9oSIqqLi1wBJo1+hy8gD7ULHcol5h8ZFsQS9g==
X-Received: by 2002:a4a:d8d7:: with SMTP id c23mr17048455oov.8.1589272125154;
        Tue, 12 May 2020 01:28:45 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id l2sm5243695oib.58.2020.05.12.01.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:28:44 -0700 (PDT)
Date:   Tue, 12 May 2020 01:28:43 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Message-ID: <20200512082843.GA3815743@ubuntu-s3-xlarge-x86>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200512080509.GA9433@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512080509.GA9433@alpha.franken.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 12, 2020 at 10:05:09AM +0200, Thomas Bogendoerfer wrote:
> On Tue, Apr 28, 2020 at 03:14:14PM -0700, Nathan Chancellor wrote:
> > [..]
> > Please let me know if there are any issues!
> 
> I found no issues in my tests. Is this the final state ? If yes, I'm
> going to apply it to mips-next.
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Maciej seemed to have some issue with the way I worded the commit
message of patch 4 but I have not heard anything back about my
suggestion and Fangrui commented that --eh-frame-hdr might not be
necessary but if everything works fine for you with this version, I
am not inclined to touch it.

If you feel this is good to go, I am happy to let it go in. Thanks for
accepting it!

Cheers,
Nathan
