Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB7A5FB6FD
	for <lists+linux-mips@lfdr.de>; Tue, 11 Oct 2022 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiJKP00 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Oct 2022 11:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiJKP0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Oct 2022 11:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D22171CDD
        for <linux-mips@vger.kernel.org>; Tue, 11 Oct 2022 08:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665501360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
        b=JnAa2pRMUWiD+yAQqwCL4lttSiTDCC/zzFMxQQISZdtquT+8TRHzAk5S5SKjxCICg+Mh4t
        hg6wMmryiw6K+1mfzC8DCdZovsQ9T0rrA54tQnPNf4gKbvKpxqabtJHOky0ZA/92GD0ib/
        iF0BkXKAghlvEz4gET9tZbArhIAAo4s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-alhLZ83nPpWE8A1yiSDpng-1; Tue, 11 Oct 2022 11:02:11 -0400
X-MC-Unique: alhLZ83nPpWE8A1yiSDpng-1
Received: by mail-wm1-f71.google.com with SMTP id l1-20020a7bc341000000b003bfe1273d6cso3824570wmj.4
        for <linux-mips@vger.kernel.org>; Tue, 11 Oct 2022 08:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ti1NCFCTzr5YPwBHvg45c+mfaiUwrR60uA7ep6lLZuA=;
        b=zb6ZQeuAqyaSFVOl6EwFqh1dN1w51hhWEGtPeaHHE78r27dmVb1kj/03r57u3IDRej
         DpEv/Fyma7grfxZov+1vymIu7gOufSt7hy+30CJ+W6ZDcO6iF8ZtVF/dBslwOl/IrblR
         Z0+CT/OkMVfAb/O+gyeXChU+jYI1Ek61G+/NFvOQUllWhL6vvj9BUAZMMyUpJfpIs1pg
         Q7HBd/DyCrTp2eCBwUFv0KglVjrXj0IGPpFic5H34eOT0o+xOrhvq3EzDm5Q+BzfJ/FR
         px7SzN+s1390BTLORa66Bg4uEzcIJLYD0LIKsjeLCS+zlhZsVWLzoG7SQUOBgh7mxlHb
         v0uQ==
X-Gm-Message-State: ACrzQf0h4lC4dsn6eU6+J4qs4t9TOaEywtZb8oNS756SUPx9ohGyj2dM
        MmBePRpNpVvXJ0YjKFW7pYvS6EIn+6gDtPjCkuuA4uSHzQ9IRc8z5chrzEmm674OZOjjJ6khCTI
        ZzLq8MjzQjVDG/I1pJpAoZw==
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699212wrr.90.1665500528785;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7srUgXRaEVg4Pb59BUs0ShAt8e40s56KQw2lU0G4VdN3sOMR/0VHio2//G+OqnLs1Wx3l7Vw==
X-Received: by 2002:a5d:59a3:0:b0:22e:4b62:7ceb with SMTP id p3-20020a5d59a3000000b0022e4b627cebmr15699160wrr.90.1665500528495;
        Tue, 11 Oct 2022 08:02:08 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b003b49ab8ff53sm13552403wmb.8.2022.10.11.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 08:02:07 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@kernel.org>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
In-Reply-To: <20221008153442.159b2f2d@rorschach.local.home>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <20221007154533.1878285-4-vschneid@redhat.com>
 <20221008153442.159b2f2d@rorschach.local.home>
Date:   Tue, 11 Oct 2022 16:02:06 +0100
Message-ID: <xhsmhlepmflox.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/10/22 15:34, Steven Rostedt wrote:
> On Fri,  7 Oct 2022 16:45:32 +0100
> Valentin Schneider <vschneid@redhat.com> wrote:
>>  }
>>  
>> +static inline void irq_work_raise(void)
>> +{
>> +	if (arch_irq_work_has_interrupt())
>> +		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());
>
> To save on the branch, let's make the above:
>
> 	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())
>
> As the "trace_*_enabled()" is a static branch that will make it a nop
> when the tracepoint is not enabled.
>

Makes sense, thanks for the suggestion.

> -- Steve
>
>
>> +
>> +	arch_irq_work_raise();
>> +}
>> +
>>  /* Enqueue on current CPU, work must already be claimed and preempt disabled */

