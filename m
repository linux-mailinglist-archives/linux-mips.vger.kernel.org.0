Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA46F6740DD
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jan 2023 19:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjASS0g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Jan 2023 13:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjASS0e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Jan 2023 13:26:34 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A86B8386E
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:26:34 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 20so3738039ybl.0
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VWrds5+dcyT0rgINmTYYWINCVZd2T1PEujEHrsOcLw=;
        b=A6TDGupcab5kBFctEX907rvmeNwH7TSFDFaHTIVyeD6PCreG08fGa15PQ7ZMqoS+1m
         Kxbe26YgQAvS6hpbgLxITj1eUcRA8mIo1x+Mapl67QqS5wyfrfuzRCU1tnxWZ0TS289l
         w3u3MCioCSxlocWRtMKRdepquBJ0iHc8nYrd/K5h7zL2JXs5cWFUvxAeTGvuzHlMKRgk
         egdpFD/bkXLZwSYHG+Z0kzwbLNaNF2PleWXHewOXJKxTE0H7QO7vqhNkuBSN+9K0BgW4
         CUQWNgNvG4kQ6jAFI0ws+04L11xvj5+5tglT7p+FQ3rESyEpFyu6RBShjx3VyQd9khW6
         qgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VWrds5+dcyT0rgINmTYYWINCVZd2T1PEujEHrsOcLw=;
        b=Epx9hhLUiz4bOv9D9xP7OJoIjY8sSkqHjR2Kp7STBPt+fQM7aeM/TH1AjeEyifgK7+
         PpKDYxUWtDl7C+6dBSfEqp1y4+EdK6yWgc4pe9H07YLfMdZitxmLIP24rm+wTbJewrpQ
         CPNiXtZmCXhO4kkygIxBWt5HhvCfhtN52EOMh7skkAgDWPljIxUMFoYluwhbEdQsb8Y7
         SEFaBDsWqqxSJ04PU1QVt2vJFQsvtDHtVrQzugu6OxwkOiU7PJhztbQh43+N0tbvEIFq
         zhJa94xNGh6eP5fwJXp0a0JZwQI8W7NjgP6lqGTqBmYC3ZfO8oyWyhoyzq5kjpUJ5sKH
         9JUQ==
X-Gm-Message-State: AFqh2kojQhYT/uukq6/5sHNfLIC1BByFa/GlnRz+NTLMhEFOUpS/wRSG
        qvzmLdytcaDpFtGyXJ5Kz3OEomH4SLRXf7ayC7oCwg==
X-Google-Smtp-Source: AMrXdXtwLTB5KOOpcHVBzvFcacNzq2MmR9bQGZt/ij36G6vo5gOSujCeJE0W7g6T7dRw7IL5u3KJsp+ZIGFjXU2FYsA=
X-Received: by 2002:a25:1984:0:b0:7fe:e7f5:e228 with SMTP id
 126-20020a251984000000b007fee7f5e228mr146711ybz.582.1674152793200; Thu, 19
 Jan 2023 10:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com> <20230119173559.2517103-5-dmatlack@google.com>
 <Y8mJQH4VqC76sX7k@google.com>
In-Reply-To: <Y8mJQH4VqC76sX7k@google.com>
From:   David Matlack <dmatlack@google.com>
Date:   Thu, 19 Jan 2023 10:26:06 -0800
Message-ID: <CALzav=fN40q2QCcBuUdTg2z2sJLeRo9u4UCaW5grX5LC-bKqkg@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
To:     Sean Christopherson <seanjc@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 19, 2023 at 10:17 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Jan 19, 2023, David Matlack wrote:
> > Rename kvm_flush_remote_tlbs_with_address() to
> > kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
> > number of callsites that need to be broken up across multiple lines, and
> > more readable since it conveys a range of memory is being flushed rather
> > than a single address.
>
> FYI, this conflicts with Hou's series, which I'm in the process of queueing for
> v6.3.
>
> https://lore.kernel.org/all/cover.1665214747.git.houwenlong.hwl@antgroup.com

Ack. I can resend on top of Hou's once it's queued.
