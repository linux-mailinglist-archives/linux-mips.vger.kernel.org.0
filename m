Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3DC9674116
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jan 2023 19:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjASSib (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Jan 2023 13:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjASSia (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Jan 2023 13:38:30 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EBC8C923
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:38:29 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id e202so3684306ybh.11
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug88fDNkyBI0BBO5NHntR5hEaqs+0c3VcEsiCYtu59I=;
        b=CD5UjpNAve5p2n34E505LpPA+Fv/mil+a7ySZCwa4cdirZCLCoBP7rDvLCQsu3xmaB
         Ew7kYB69mBAEO/u7k+sGlpBjnG1dp4IffmBZLuYU10krSiyCe6kHbJFvifaS/8czl96m
         rAv2FcZ5hIDB/+YDXs6PskZm3OcerKWQHclqeSHcXaQu7YChMjVbglQbqgPg4lFmGaxM
         feHHgPhsOQIooQ/G/3kR94YjL8y0XRIA66qH9V9zeksKjA4S3ZxleHZ4g0UZsZMDpCZ7
         VeURifs8UuavreMHSVgeZo4LBtIrsFjf78bsFmqLArlOR5YfXrO5d9p3C+p8ot5Of0Bv
         LFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug88fDNkyBI0BBO5NHntR5hEaqs+0c3VcEsiCYtu59I=;
        b=0H31sqRwSnachsET3Ddezdmdt9QOd+D+llN79EwgnAOAwPpubFttM/YcmtemZwVasG
         idNsTWPfWLxB2Mb60FJsn18UJZ6gBnjX/dIa9LroZYbdsVXEOycztGDJzXADjhJShM8T
         SBwfT7xXFnXgNawY4lvXQGujpqKOKIXKYgfI6U2OSlp6DhIqCGxAxYy7/Klq0UUEOw1y
         Hg4+wid2LIAd2hQM/+y4Ilj105P26QmpV6cQlpXg26iyCVZ/5ob9UmJu7HIcFUZGrbil
         FoHSTYrhc1gYQdqTpEZ6kYztM7UGjGDSwhV+0//9tvWxxwuRgXf8Diyrq3qXTryZCa48
         0TWQ==
X-Gm-Message-State: AFqh2koEledlwynDm2erTShHu5j/n44AO6NAR7SfnJAOgMM1AuVnxxhr
        VuqMP2zbqzlkjsR36X6+vg1m7b6soylnHyg2FOvRlw==
X-Google-Smtp-Source: AMrXdXvj7JLSu67yZSCrAXbJnFAdEysNvlQhdZNSBcAvK1s7UO8zpqZUtwsbUaHqW+fn/EaUvPQ8kleXCyZxAjw4CDE=
X-Received: by 2002:a25:d4e:0:b0:800:9451:c106 with SMTP id
 75-20020a250d4e000000b008009451c106mr14043ybn.191.1674153508397; Thu, 19 Jan
 2023 10:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <Y8l6egh2wWN7BUlZ@google.com>
 <86tu0mmo8m.wl-maz@kernel.org>
In-Reply-To: <86tu0mmo8m.wl-maz@kernel.org>
From:   David Matlack <dmatlack@google.com>
Date:   Thu, 19 Jan 2023 10:38:01 -0800
Message-ID: <CALzav=dya7GsOD7-dm3649Xe4Xo_p5gJACvjZHtpbk0QwoU-gg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
To:     Marc Zyngier <maz@kernel.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nadav Amit <namit@vmware.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
        Colin Cross <ccross@google.com>,
        Hugh Dickins <hughd@google.com>,
        Ben Gardon <bgardon@google.com>,
        Mingwei Zhang <mizhang@google.com>,
        Krish Sadhukhan <krish.sadhukhan@oracle.com>,
        Ricardo Koller <ricarkol@google.com>,
        Jing Zhang <jingzhangos@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 19, 2023 at 9:24 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 19 Jan 2023 17:14:34 +0000, David Matlack <dmatlack@google.com> wrote:
> > I'd like to target RISC-V first, since it has significantly lower risk
> > and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
> > [soon] nested virtualization to deal with).
>
> And (joy, happiness), the upcoming 128bit page table support[1].

Oh good, I was worried the ARM port was going to be too easy :)
