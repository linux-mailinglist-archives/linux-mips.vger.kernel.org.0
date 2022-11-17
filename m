Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B77D62DDF6
	for <lists+linux-mips@lfdr.de>; Thu, 17 Nov 2022 15:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240244AbiKQOZd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Nov 2022 09:25:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240373AbiKQOZM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Nov 2022 09:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127C6697E9
        for <linux-mips@vger.kernel.org>; Thu, 17 Nov 2022 06:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668695052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
        b=hUoTaAGanTb+dFIsYwLLhlfnQMB0aCJFI9TmBYC8BxqKf5kYiKSFMU1gc6yg+LJPykT3QI
        AQrYDFewqG1MLEo8qoJH249WxuNB2l2pc5tXg0Naq9dxoGM5YDnXWSrqtv7q7eO8D1WDeD
        +n08eYwOA2FxLtBRxb//jc3lRNwC9S8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-F6NMB1QhOyKyuq7kY5n_ww-1; Thu, 17 Nov 2022 09:24:11 -0500
X-MC-Unique: F6NMB1QhOyKyuq7kY5n_ww-1
Received: by mail-wm1-f71.google.com with SMTP id ay19-20020a05600c1e1300b003cf758f1617so2853561wmb.5
        for <linux-mips@vger.kernel.org>; Thu, 17 Nov 2022 06:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZPY6OJIRrwMZkBLytVOAK+0kIpEYMOqoTEpl19M6ws=;
        b=y2ac1clxqDmwImNj4bMWpu5FeSZObYty3ozIjOWOl3+PTRDO9x8Qeb7+HYdijV67TW
         Lw8RtZtEN38G8v43qhpkFAQhrSIPZs4QIN9/emUwVxtHmE89Tfv7Q5h8v/g9GHXwuCZ3
         0a4HisEbq7mV1YLyMgct5WEVC1cRrpcdxptSqGU/Z4q2jttVMmvD/64k8t/hTNToRot3
         fIO28xhb+VIT9DBWhUxB5dWCFVJfC958JqwjzPgvpBrf2lHzaIgPSk1Vo++PTLSOwqLs
         J67Dct7jaF8lIzisCOQ2T/kclyPL9mO8I0EX64cA0MGJyM14sbNSb8DtkRwqXT/lmHGJ
         f70Q==
X-Gm-Message-State: ANoB5pnxlMjLjVDxLTteDXG2Shvlt/mDO3+4Bjff/eBeAWNCZRI1T3zh
        5xTmb1aqaOCZXzhUP6AZMhNh+k0XmjTrIPCtCftPq/8jyXsJMUqwnC/YQ1CY89LrOVmVvLEUdw3
        +X2kt7UspztKrXWKmxq1nvA==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602423wmj.50.1668695049911;
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf660kXw1O9nDmBZzBp9eoh92b2B6Bcx05wnz8U6SS8Dy3l/finKWGNWkc/ihpfy4N9vMJHAMQ==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5602401wmj.50.1668695049758;
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d6112000000b00236e834f050sm1095385wrt.35.2022.11.17.06.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:24:09 -0800 (PST)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
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
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH v2 6/8] treewide: Trace IPIs sent via
 smp_send_reschedule()
In-Reply-To: <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-5-vschneid@redhat.com>
 <Y3X7CijMXpqQIHhk@hirez.programming.kicks-ass.net>
Date:   Thu, 17 Nov 2022 14:24:04 +0000
Message-ID: <xhsmhiljdy7zv.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/11/22 10:12, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:34PM +0000, Valentin Schneider wrote:
>
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index c4d561cf50d45..44fa4b9b1f46b 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -167,6 +167,14 @@ send_call_function_ipi_mask(const struct cpumask *mask)
>>      arch_send_call_function_ipi_mask(mask);
>>  }
>>
>> +void smp_send_reschedule(int cpu)
>> +{
>> +	/* XXX scheduler_ipi is inline :/ */
>> +	trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
>> +	arch_smp_send_reschedule(cpu);
>> +}
>> +EXPORT_SYMBOL_GPL(smp_send_reschedule);
>
> Yeah, no.. I see some crazy archs do this, but no we're not exporting
> this in generic.

So the list is: ia64, powerpc, riscv
and they all seem to do it because of KVM:
  c4cb768f0277 ("[IA64] export smp_send_reschedule")
  de56a948b918 ("KVM: PPC: Add support for Book3S processors in hypervisor mode")
  d3d7a0ce020e ("RISC-V: Export kernel symbols for kvm")

Other archs get out of it either because their smp_send_reschedule() is
inline (e.g. x86), or because they don't allow building KVM as a module
(e.g. arm64).

If I can cobble the tracepoint+reschedule in an inline helper, then that
wouldn't require any new exports - I'm fighting a bit with the header maze
ATM, but hopefully I can get somewhere with this.

