Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC14DF0DDF
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 05:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbfKFEiz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 23:38:55 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45539 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729632AbfKFEiz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Nov 2019 23:38:55 -0500
Received: by mail-pl1-f193.google.com with SMTP id y24so10818377plr.12;
        Tue, 05 Nov 2019 20:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7V01zh+xuKN9jfSDl1ahnvbuyiRHEuk9/Psk/loZcsc=;
        b=ERM74EzueCUrY7DD9YRMnMl3BPIK4mBaTBFxynZ/aWbqEady7VfI4NAjDyAj7+iIQ5
         RQsqgoasqS4agr75oIh7Tl5hc9WiiVUtYimMeQl32Rb/aI0IwdqEsUMSEmry0hk405Z5
         TtwMBzGiEEAVJv6VSBygU1Wty69JTHrHaurUNWtF4AK0J8qA6Q8beJGlhLICH6z+cir1
         4CbfhjZAuaSwuIxX67mdsHWySCDb4IA332+cM7yRUZ4V1LgeWt2JvmDoY4jWmKw3pcbn
         kL2GHKw5w/+5GXNSQXsTH2a4Of8xaWeGu2DRBIRA8kB2fARaLicInjf9eeGmpKlpROAA
         IUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7V01zh+xuKN9jfSDl1ahnvbuyiRHEuk9/Psk/loZcsc=;
        b=edLvpFmgzOXfYZh2UwltAlug42c7t2zt8S4fCruqYooQkiRqAs314qT9Dc70MidPGm
         Fn0uGtvriP4qeZIq0Z1/CdEQWEx57X0fYu9YOXWjkcSbSIqpw8l4ACrtyiAdFgYXdZUg
         GWyhJKxRdg6Ylhkcnbb8UJNaucjY+QhFENq1SQ9oZlQjpvCWgUF/2LFtrnimD4JhFjxv
         z3MwaK7TpFWyfSEUwVF+dw0DgJx+tAqH8//VUEE6Y3C1iRDy07DqH9A82utwF/zQ6gqj
         NiicsEhOf6ZAkqb2e0DWrKDUmdUstfTFLygC7lJ1XTXn7Y+fjOJ0k8XhNe1DEWHExtpC
         nLPA==
X-Gm-Message-State: APjAAAWAAxMF54HPltumu1C3Xod7cEnaYSgC98uwcoG/t4sJ6Z3NhAvF
        5MnhcCHNBxDPyvfEn82BmUo=
X-Google-Smtp-Source: APXvYqy/jC4Qc1JZAQO3ZxzldK9w2HMGugt9CwQIfB+u8xFLUZ9B8Zl3gxVf2USX7FyO6dM4ufDePQ==
X-Received: by 2002:a17:902:bcca:: with SMTP id o10mr548969pls.46.1573015134663;
        Tue, 05 Nov 2019 20:38:54 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
        by smtp.gmail.com with ESMTPSA id y2sm22630177pfe.126.2019.11.05.20.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 20:38:53 -0800 (PST)
Date:   Wed, 6 Nov 2019 13:38:51 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Dmitry Safonov <dima@arista.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
Message-ID: <20191106043851.GA131976@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-2-dima@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106030542.868541-2-dima@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On (19/11/06 03:04), Dmitry Safonov wrote:
[..]
>  #endif /*_LINUX_KALLSYMS_H*/
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 233459c03b5a..914ff610b880 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -3999,7 +3999,7 @@ static void print_unlock_imbalance_bug(struct task_struct *curr,
>  		curr->comm, task_pid_nr(curr));
>  	print_lockdep_cache(lock);
>  	pr_cont(") at:\n");
> -	print_ip_sym(ip);
> +	print_ip_sym(KERN_WARNING, ip);
>  	pr_warn("but there are no more locks to release!\n");
>  	pr_warn("\nother info that might help us debug this:\n");
>  	lockdep_print_held_locks(curr);
> @@ -4604,7 +4604,7 @@ static void print_lock_contention_bug(struct task_struct *curr,
>  		curr->comm, task_pid_nr(curr));
>  	print_lockdep_cache(lock);
>  	pr_cont(") at:\n");
> -	print_ip_sym(ip);
> +	print_ip_sym(KERN_WARNING, ip);
>  	pr_warn("but there are no locks held!\n");
>  	pr_warn("\nother info that might help us debug this:\n");
>  	lockdep_print_held_locks(curr);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dd05a378631a..774ff0d8dfe9 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3858,7 +3858,7 @@ static noinline void __schedule_bug(struct task_struct *prev)
>  	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
>  	    && in_atomic_preempt_off()) {
>  		pr_err("Preemption disabled at:");
> -		print_ip_sym(preempt_disable_ip);
> +		print_ip_sym(KERN_ERR, preempt_disable_ip);
>  		pr_cont("\n");

Is this working with pr_cont()?

	-ss
