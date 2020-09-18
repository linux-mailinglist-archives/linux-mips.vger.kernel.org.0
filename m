Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE85D2708AD
	for <lists+linux-mips@lfdr.de>; Sat, 19 Sep 2020 00:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIRWAD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 18:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgIRWAD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Sep 2020 18:00:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D44C0613D0
        for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2020 15:00:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l191so4245904pgd.5
        for <linux-mips@vger.kernel.org>; Fri, 18 Sep 2020 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pJBH8ZPv0AF6T9qJPivtnFQaJz8js4rTDIDjnmZyXeI=;
        b=dloeuJ4RhaMSkvzvysZ/KZ60uKiixW7yqpP4zHkEBZEOj0pCe6aPREHiRMfjC9a2sT
         NDRDXB+ZvN5NCDfLObc3yaHXCoMy1bgChNi0/bDSzXyKsXtqJdhEsyrk6Y1YRocaD3Wu
         iLl7HHFzt9nFe0Yx0aT6Ga95BI79loU3yy9TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJBH8ZPv0AF6T9qJPivtnFQaJz8js4rTDIDjnmZyXeI=;
        b=YLSxWEuxw6slx3HESug8r0Y2Unh2qY56i/UT+pqIhl26ddY6JWZtbZtSbytG936W0/
         3t2LXlpfh6tvYzFH776371987p0MGjTTpCDknA6AJlEb3qnVDVVJuw/aVDMyTdL2swIj
         +RXvxfcFd/zkJYMl5YRQbqspfZXdxWhjT2MPUDgnAhjmVCABqHY3XcvUk0GpYNyMPgJV
         /99+hEuGlxLrV8El/TaCbvoixnaM7Xy0r/kHvVrxQN+5f5WUMTtJQ67KcS2j4MSQgclG
         XpOQMDZV44gHfVPmZKpHWHiU/bG7n511YBIzuKuhuxCxlYgxc9NekNhtMcXFDe2vkLfY
         f6jw==
X-Gm-Message-State: AOAM532SrNQ1Gkz3Uo/GM60oBtb3U/rkhE9UgV0H7iLQuq/XvPdYkyIx
        sVun5rfvsqt+6RN6BXN2yynqGg==
X-Google-Smtp-Source: ABdhPJxQ2z9WWrqYHnkpapKDChSxrmWeesm9BvocAEdZLydIidTw4TJZtfj98NCNFgmR+CrH9w3MBw==
X-Received: by 2002:a63:4d48:: with SMTP id n8mr29596199pgl.70.1600466402906;
        Fri, 18 Sep 2020 15:00:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l14sm3727747pjy.1.2020.09.18.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 15:00:02 -0700 (PDT)
Date:   Fri, 18 Sep 2020 15:00:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     linux-kernel@vger.kernel.org,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christian Brauner <christian@brauner.io>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/15] selftests/seccomp: mips: Define SYSCALL_NUM_SET
 macro
Message-ID: <202009181459.C22A1EC7@keescook>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-4-keescook@chromium.org>
 <20200915155546.ht4vo7nqswxrgymb@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155546.ht4vo7nqswxrgymb@wittgenstein>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 15, 2020 at 05:55:46PM +0200, Christian Brauner wrote:
> On Sat, Sep 12, 2020 at 04:08:08AM -0700, Kees Cook wrote:
> > Remove the mips special-case in change_syscall().
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  tools/testing/selftests/seccomp/seccomp_bpf.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > index 1c83e743bfb1..02a9a6599746 100644
> > --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> > +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > @@ -1742,6 +1742,13 @@ TEST_F(TRACE_poke, getpid_runs_normally)
> >  # define ARCH_REGS		struct pt_regs
> >  # define SYSCALL_NUM(_regs)	(_regs).regs[2]
> >  # define SYSCALL_SYSCALL_NUM	regs[4]
> > +# define SYSCALL_NUM_SET(_regs, _nr)			\
> > +	do {						\
> > +		if ((_regs).regs[2] == __NR_O32_Linux)	\
> > +			(_regs).regs[4] = _nr;		\
> > +		else					\
> > +			(_regs).regs[2] = _nr;		\
> > +	} while (0)
> 
> I think that
> 
> # define SYSCALL_NUM_SET(_regs, _nr)				\
> 	do {							\
> 		if (SYSCALL_NUM(_regs) == __NR_O32_Linux)	\
> 			(_regs).regs[4] = _nr;			\
> 		else						\
> 			(_regs).regs[2] = _nr;			\
> 	} while (0)
> 
> would read better but that's just a matter of taste. :)

That's how I started originally, but when I realized that I'd have to
reorganize SYSCALL_NUM() too, it seem best to have minimal churn, so I
left it open coded here, since that's how it needs to be in the end.

> Looks good!
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks for the reviews!

-- 
Kees Cook
