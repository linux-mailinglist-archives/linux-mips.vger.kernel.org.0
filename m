Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8E43F3664
	for <lists+linux-mips@lfdr.de>; Sat, 21 Aug 2021 00:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbhHTW1i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Aug 2021 18:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbhHTW1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Aug 2021 18:27:38 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D6AC06175F
        for <linux-mips@vger.kernel.org>; Fri, 20 Aug 2021 15:27:00 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so14818791pjb.3
        for <linux-mips@vger.kernel.org>; Fri, 20 Aug 2021 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=muCZGHGXDtZhLnuzxIVauvI9vXUTWXNUIrBwCRdMVco=;
        b=RemefsbkLF0qjalfgS/QPFy+s0vrHUCCRwLs5Nng2oRX7YN+RbFWFDzyRbXDUTFeRe
         ZcR6b656WMkKHvh5XwIeexMOkIK6TBTyMgP20QtOJD1jsJYkiBEWihN2CVwUcoknSiZc
         kfCOTeIeF9ja69Sxfpo9Tze/gbXlfbWjwwnjO1rkWyU9/APS4tY7lkRghKHUYYvwXaoY
         XjV//yV1jErHSoGWkaqeUNTbYjSMDPGF7Bsh5VYUZeLtO3D4NwU7djoZEoOgIYKcigrl
         LaQ3UiKuwPAupo+Ikjg0jO22FUEuCmAC9TlZ9LlWOAqKDqGqdS7VTnu20IUdQ2TEEMfG
         3dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=muCZGHGXDtZhLnuzxIVauvI9vXUTWXNUIrBwCRdMVco=;
        b=OiNlpXvSrCbLctam6+SkhF+TzVC+RWILYC8G7bLOEMQIso0OToxm2Lv1U+XKnnMd4o
         //o6t54HFXQ8c8cqiUh7yj0vTE3+SqtZ4FsfkAHgM9tk7EbTwQhX1dSF0jnrbOOGO7bB
         PS8AaCtOl84fM41vZjyHQjrUJKw4+jd6dyytOwx0RYtkFO32d5zrlrKoN8I6Q7UdJv3Q
         O0Qq8W5r546LvFsZ8Qq2RomJSfIWE8pD3FkDmmzmFc/cYkhfpBq4fhhd4TYIDs/DbkVd
         MCFXlUJ4jrOxBxvekw1BandGrKMSwpiy/pNAv9bHBFeX+1tmR0jHMf5JGnSEpLQB3kv1
         xcbQ==
X-Gm-Message-State: AOAM5317K3GlEWk3i5ywRM1mizzJEeSnLzHCYOK81FXRO6BVwzePG7L3
        46CPQ388zH9AYbedk1IyXrUK6w==
X-Google-Smtp-Source: ABdhPJxsP8i0TWeDLg6wsQ9UPwVK0/yOGsDuiZiCVZBbzrivtJSRk9eK8LYUFD9Zq4FE5g5ke2YZTA==
X-Received: by 2002:a17:902:7c15:b029:12c:78ec:bb61 with SMTP id x21-20020a1709027c15b029012c78ecbb61mr18323457pll.61.1629498419309;
        Fri, 20 Aug 2021 15:26:59 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id s1sm4169427pfd.13.2021.08.20.15.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 15:26:58 -0700 (PDT)
Date:   Fri, 20 Aug 2021 22:26:53 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc:     "Russell King, ARM Linux" <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>, gor <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Oleg Nesterov <oleg@redhat.com>, rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        paulmck <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>, shuah <shuah@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-csky <linux-csky@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        linux-kselftest <linux-kselftest@vger.kernel.org>,
        Peter Foley <pefoley@google.com>,
        Shakeel Butt <shakeelb@google.com>,
        Ben Gardon <bgardon@google.com>
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
Message-ID: <YSAsLShyWK3xgxse@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
 <YR7tzZ98XC6OV2vu@google.com>
 <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1872633041.20290.1629485463253.JavaMail.zimbra@efficios.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 20, 2021, Mathieu Desnoyers wrote:
> Without the lazy clear scheme, a rseq c.s. would look like:
> 
>  *                     init(rseq_cs)
>  *                     cpu = TLS->rseq::cpu_id_start
>  *   [1]               TLS->rseq::rseq_cs = rseq_cs
>  *   [start_ip]        ----------------------------
>  *   [2]               if (cpu != TLS->rseq::cpu_id)
>  *                             goto abort_ip;
>  *   [3]               <last_instruction_in_cs>
>  *   [post_commit_ip]  ----------------------------
>  *   [4]               TLS->rseq::rseq_cs = NULL
> 
> But as a fast-path optimization, [4] is not entirely needed because the rseq_cs
> descriptor contains information about the instruction pointer range of the critical
> section. Therefore, userspace can omit [4], but if the kernel never clears it, it
> means that it will have to re-read the rseq_cs descriptor's content each time it
> needs to check it to confirm that it is not nested over a rseq c.s..
> 
> So making the kernel lazily clear the rseq_cs pointer is just an optimization which
> ensures that the kernel won't do useless work the next time it needs to check
> rseq_cs, given that it has already validated that the userspace code is currently
> not within the rseq c.s. currently advertised by the rseq_cs field.

Thanks for the explanation, much appreciated!
