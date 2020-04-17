Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0555C1AE86D
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2020 00:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDQW7F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 18:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgDQW7E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Apr 2020 18:59:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F285C061A0F
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 15:59:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so3628950wrw.7
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9+eK9oKTOT3i8zAun0pqdW6UL+0nXAjeXn0xSjWy3ek=;
        b=XFfxS9KM5RUpYEecDU9LDOTUnYwrQ87bsghotn9o5G37xaObnMtd8FAwhQDPL53IAM
         UdZR8vn7/AtBs/8VwzLToZRY7JA4FRDBCaGXC10UhrvN26Luq6/JzgwcWQrPcA6x5jcd
         3l/ZCADGoGHBAU7VnVJkKn0q3li6SfPlC5H1+4CI+57yfqchhhCT/wBS/Kh1ZoFWSDOq
         W5HT3Q1M0eYUsQdbrrsRBReDHa+b4Y7g1reMHhQP9iaI6+naf/zOhmwNdFKkfkpXDuEr
         2WDaufDeHlN/+xRGdmp4nLIz2kGiaMc/NXIYDDXcvuedv/EQHV+eTS8pR1LxRKT/dRru
         o3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9+eK9oKTOT3i8zAun0pqdW6UL+0nXAjeXn0xSjWy3ek=;
        b=b+UBJxLlZHbH+qVpSf5hS3CNpaJn/3xkY8dWx5i1O3mx4rOtCLwtO5J5Letur7CPYN
         3Y5ED0WvnRWZuuIYNKvcE777e2MOaw8JAYWRqKLO+J0cSy7rSwSlr+GuKQXiLr0vPnCG
         f+oO1WaUaA6nXyQDsdWiwt3jH9HBr4kvMYnHSg3HfjFBs5wuF4/WT4Mxr8g1s/VwP2cz
         z7xUCt2W66elsTdbUp7mj2aXJXr0hGKip1hNn7gO4S7vQHxH0ios7Htq4SAsegH1FHUY
         rLA7SNFhJxYLdXFV2ZO9va7k7WW7fJMhgRxbTw9XQRXuSELOPP+k4j0GGAs0ruwpKMTs
         dAmQ==
X-Gm-Message-State: AGi0Puaxtobi8MqZ6b4ugWScY79/7WeW5NzMZfGIKhcabr96iWsFQ0/2
        l4cvXvbBqvCS5WUspTudV6q/fQ==
X-Google-Smtp-Source: APiQypLqlt3uovyL1IBjjjc8qBljmPanbafSQqKnsPq+OIxxCLbZ6Nc44ailz0qCbC7ZjccZO5rHEw==
X-Received: by 2002:a5d:4452:: with SMTP id x18mr5960505wrr.231.1587164343004;
        Fri, 17 Apr 2020 15:59:03 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8? ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id p7sm34069559wrf.31.2020.04.17.15.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 15:59:02 -0700 (PDT)
Subject: Re: [PATCHv2 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
To:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
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
References: <20200316143916.195608-1-dima@arista.com>
 <20200316143916.195608-2-dima@arista.com>
 <97ea305c0d336f3c36a804b37e6bbb4b1bbf24fd.camel@perches.com>
From:   Dmitry Safonov <dima@arista.com>
Message-ID: <7d17eaf8-a3a8-eaba-ff80-e857135571e1@arista.com>
Date:   Fri, 17 Apr 2020 23:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <97ea305c0d336f3c36a804b37e6bbb4b1bbf24fd.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Joe,

On 3/16/20 3:29 PM, Joe Perches wrote:
> On Mon, 2020-03-16 at 14:38 +0000, Dmitry Safonov wrote:
>> print_ip_sym() needs to have a log level parameter to comply with other
>> parts being printed. Otherwise, half of the expected backtrace would be
>> printed and other may be missing with some logging level.
> 
> There are 15 instances of print_ip_sym.
> 
> Perhaps it'd be better to get rid of print_ip_sym
> altogether by expanding it in-place instead.

I tried this and format-string + two casts to (void *) take some space
and the resulting printk() doesn't fit 80 cols.
I guess, it's minor and it can be done on the top of v3..

> 
>>  arch/microblaze/kernel/unwind.c | 2 +-
>>  arch/mips/kernel/traps.c        | 4 ++--
>>  arch/nds32/kernel/traps.c       | 4 ++--
>>  arch/riscv/kernel/stacktrace.c  | 2 +-
>>  include/linux/kallsyms.h        | 4 ++--
>>  kernel/locking/lockdep.c        | 4 ++--
>>  kernel/sched/core.c             | 6 ++----
>>  kernel/trace/ftrace.c           | 8 ++++----
>>  tools/include/linux/kallsyms.h  | 2 +-
> 
> 

Thanks,
          Dmitry

