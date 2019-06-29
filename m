Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF3F5ABE7
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2019 16:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfF2OuM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jun 2019 10:50:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39707 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbfF2OuM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jun 2019 10:50:12 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so4869991pls.6;
        Sat, 29 Jun 2019 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gpwY9SEzwskjwipmCEjEPDzJ+JkSWKdevJdN5fw1/iM=;
        b=AlVvTidmIeM8754EXuPmkm83s6qNg5Jm5gjt3YhUtsu7/PgF7C0PqVa6ptBpiy7P+b
         7w/vUfWCCFqmbb8iWdujQ5RlItRswygS1/W7QpiSFfq/fT2Nu4dRgemGkLF72hCTAl9s
         CRIHmYzfZsico8YFuLWYJ5693A7o/b4yO4xb3CGFk8Csreadz74Dd/N3TbnDzTPI329w
         tmx7Gx26KM0nmNFaM17rZJNe2CjctoMPNGJ1w13qOjvTkEKMGe5RVpeApLtX8/DXjhQN
         S2voeFsnwfTZ/9nocjMAB1DWN9izRoiZR3qOpRdSjzhL8358DohG1/ewXzBcpnKciwy+
         LQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=gpwY9SEzwskjwipmCEjEPDzJ+JkSWKdevJdN5fw1/iM=;
        b=Mk9m4ICCfbzS9XBQaOtq2q3zpbuCb2K3zbltGnmfVfz86Xz8NAlFbLWZTwE21diEdA
         HWpoXKcYH0KMrBvLeBF+CWAoFW0Q0g7h9OnjvEmPLXSCX5I5NqBgkdFJD19IYS0fa+nv
         Rk+mcXfrI9BzlGaxncv7alknOKY83gkvu3j/f6UNcA6uuf4T4Rw0+3BNfR3xVkObMLgH
         oLuSd7K08fiuoOMcVVuowBnCMhxVlbdRmS6IcXCSBnrMu2c55UgxB4PvH8xoPrGM5o1l
         LWIwcy670LdId1pAb9+7TjT8bRSmSk2vlidLpIrAQGtjhffqrQVtTbEzdAyaWMlQ1WQE
         mU0Q==
X-Gm-Message-State: APjAAAV2DPwj6H4Yssv0dUJHOVdGX4Be2/2FSkiHkxQ+RvinuOWiporF
        f6w4+3BiPABiKDvYL4nDKIY=
X-Google-Smtp-Source: APXvYqwzAvuZq8uFS3MlBSIKk71/6JUg9AHYM+1A6MpIzGTxNNk8+GY2Jbg28JKN9AieKqNESQt07g==
X-Received: by 2002:a17:902:2bcb:: with SMTP id l69mr18151254plb.155.1561819811065;
        Sat, 29 Jun 2019 07:50:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r196sm4899405pgr.84.2019.06.29.07.50.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 07:50:10 -0700 (PDT)
Date:   Sat, 29 Jun 2019 07:50:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Will Deacon <will.deacon@arm.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-s390@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        linux-snps-arc@lists.infradead.org,
        Fenghua Yu <fenghua.yu@intel.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Tony Luck <tony.luck@intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
Message-ID: <20190629145009.GA28613@roeck-us.net>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Jun 13, 2019 at 03:37:24PM +0530, Anshuman Khandual wrote:
> Architectures which support kprobes have very similar boilerplate around
> calling kprobe_fault_handler(). Use a helper function in kprobes.h to unify
> them, based on the x86 code.
> 
> This changes the behaviour for other architectures when preemption is
> enabled. Previously, they would have disabled preemption while calling the
> kprobe handler. However, preemption would be disabled if this fault was
> due to a kprobe, so we know the fault was not due to a kprobe handler and
> can simply return failure.
> 
> This behaviour was introduced in the commit a980c0ef9f6d ("x86/kprobes:
> Refactor kprobes_fault() like kprobe_exceptions_notify()")
> 

With this patch applied, parisc:allmodconfig images no longer build.

In file included from arch/parisc/mm/fixmap.c:8:
include/linux/kprobes.h: In function 'kprobe_page_fault':
include/linux/kprobes.h:477:9: error:
	implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'?

Reverting the patch fixes the problem.

Guenter
