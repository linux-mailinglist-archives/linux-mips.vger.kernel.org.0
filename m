Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC729F1B75
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 17:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732175AbfKFQj6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Nov 2019 11:39:58 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38671 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732169AbfKFQj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Nov 2019 11:39:58 -0500
Received: by mail-pl1-f194.google.com with SMTP id w8so11681576plq.5
        for <linux-mips@vger.kernel.org>; Wed, 06 Nov 2019 08:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h+8AXOejPKtSX84fzeR4pP1AIGKjnaVzTWbF4IpDTlY=;
        b=aZjOEKuwvk4LUjS0Pg/iyqv8fUwr+4Eqr4VNsOuYqjPBPirNxvv5KtXr/6+DvhEEeS
         fmtm+BfBI6Fgt3CeqBDIV/tP+8GstwQh0JsjJ3sYRdaIk0GLhOwMvca5Ymb8nyz5sCB8
         bhaQzrbAb+6CErGpjDhkRIjrO5rlEPsDprWki5Fb2Mum/9MbX9Jf95N6JsliyllKSJVI
         Il7Rovp8XoqxkTcJcmJjRSncQE73tk/DeDoYM/TjrvEBhtbrtNoyTrcJLbJRh7+3wUG2
         FTBbSr+lLJZwiQA0K1a6KQpZqVbUp7Vc8DofHhprXygu6WGOo7KWvqM7uY4vVgFlF9/9
         qKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h+8AXOejPKtSX84fzeR4pP1AIGKjnaVzTWbF4IpDTlY=;
        b=mYjqsgXNOZV87YXz6Y69j8QpwHNRsYSL6oZsFQRFjf1FN7O33op8i4Rp698tapl8aX
         3lWMF+nqflU5OBCYykk1KOXnVMSS1paZrQlOpNnt1+0zB7h/WwmfjwaZ6pky41C8R0bA
         9hgj1FH2eIs1Rn6VcseJ5yHL8leSDkJPuPKYjNmO05Lc5gcUSWxGES/Pc0D/PSayp+Rc
         /gobhEHSyNYaM6E/ZEIaXMmZlhtKqD8Z2XUt4Jy4+EGHGO9EXXzzTUkUYz0Z3z6LyiY3
         we5z0NwVw5SL06XZJJXgkdpZurIijl4SeVgnWBthYojpj0kiUjfoTrSB3ASZoletE/bE
         1Ztg==
X-Gm-Message-State: APjAAAXWt+ZSaMh2plny+GV49EiUeQO+pv8z8yTNl1bUmjNnTTp4av3T
        cW3djmpZ2/ykTLj6Ffm+JKzklQ==
X-Google-Smtp-Source: APXvYqywfR9UQlZvtVaHdkOoCsd877Kid/BBKE9QMojVPiD4B1uPWPELoLK/DLKCNhVOxuK2oHgGlQ==
X-Received: by 2002:a17:902:8647:: with SMTP id y7mr2024671plt.285.1573058397431;
        Wed, 06 Nov 2019 08:39:57 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id y26sm13229647pfo.76.2019.11.06.08.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 08:39:56 -0800 (PST)
Subject: Re: [PATCH 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
To:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
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
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-2-dima@arista.com>
 <20191106043851.GA131976@google.com>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <65ef777b-ceb0-09d7-6fb0-fb79328ad87d@arista.com>
Date:   Wed, 6 Nov 2019 16:39:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191106043851.GA131976@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergey,

On 11/6/19 4:38 AM, Sergey Senozhatsky wrote:
> On (19/11/06 03:04), Dmitry Safonov wrote:
> [..]
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index dd05a378631a..774ff0d8dfe9 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3858,7 +3858,7 @@ static noinline void __schedule_bug(struct task_struct *prev)
>>  	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
>>  	    && in_atomic_preempt_off()) {
>>  		pr_err("Preemption disabled at:");
>> -		print_ip_sym(preempt_disable_ip);
>> +		print_ip_sym(KERN_ERR, preempt_disable_ip);
>>  		pr_cont("\n");
> 
> Is this working with pr_cont()?

print_ip_sym() will cause log_store()..
And pr_cont("\n") will go here:
:	/* Skip empty continuation lines that couldn't be added - they just
flush */
:	if (!text_len && (lflags & LOG_CONT))
:		return 0;

So it doesn't do anything. I didn't want to change any behavior in the
patch, but seems that I can remove this pr_cont() while at here.

Thanks,
          Dmitry
