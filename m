Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF3486740B9
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jan 2023 19:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjASSSE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Jan 2023 13:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjASSRy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Jan 2023 13:17:54 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D8593734
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:17:41 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id s67so2205183pgs.3
        for <linux-mips@vger.kernel.org>; Thu, 19 Jan 2023 10:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T97gz6Bdfm+yNe+YRAHaCA8lPMcmr0KKDU8hjh4V/OY=;
        b=S62eIbGCR48HzJ0dxRt+FcY1H+wMEDIgps64urcsiB/Xc9UNElGPfDG3M7k3dXhjgf
         IC5/b7TPA5WN8B2zCt5l4+xmMaFP9NYLJK/lZmuCXs/8t+pmpeQvndT/TDDBr+7AJom4
         4pkvYO9rfSviaNIp2nYLbIFOYwSHuwxcCYcbKuCg3UatPoX1KOHQvANMvhPeXSzraKoZ
         wJ7ujoqoxRw++cokwdmUjITxy2xnHEMqWV+aLlcTduAxpgrCgUVkdbhB/vJmoBfElJ/7
         HKH7b5gqivDXkVuH5iLHJd1+y95HqWRJUApg9Cqz/NX8HJl04xAO3dA1YVhbAm6S3N6x
         ybFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T97gz6Bdfm+yNe+YRAHaCA8lPMcmr0KKDU8hjh4V/OY=;
        b=O2urwD+mWFFjNfCWQG6CXxJUZz80ca7prQC1qraIz1Te9O6mJJ9earjKNvIm6l1RmN
         oaXfVd6/yTdotskL+qY7ts7yZbexRPJoBbyeFTmFfbwWaiyfmTR5YVOZOfYLR51jCCn6
         n+8vgBam3GIsr0r+adxTPE48jrO1atK3p1ZqmTS9kMAM4wVdxG+ia2m3M5fWjkdp/9fY
         CAFrfKF6T7A4jD+J74T6KLlBKJtvNBv6SAg5AKf0zM1ZlAyyXWKkvt2gNuSzD56qEw0N
         t3tx2DbRMD3LHwf/e1KUsCT7X/fHNWFMLYox38HRTdmXobEDn2HeN0gHtyTfdLaFT68f
         kKkg==
X-Gm-Message-State: AFqh2kovVvIn29R0Ap4NsmdFaYD28bjshOHGM+Pq2tv2INN22/3i5A1V
        Qr4IwcEwLIheJm4U4QhEORiRZQ==
X-Google-Smtp-Source: AMrXdXvE6V2XSH75DoWttX7FazNC7q5yK1/5LBnbOsot2oHEv4jYnuIT3ADTTrFdNA17lYqBgz1nVA==
X-Received: by 2002:a05:6a00:a87:b0:582:13b5:d735 with SMTP id b7-20020a056a000a8700b0058213b5d735mr3493507pfl.0.1674152261141;
        Thu, 19 Jan 2023 10:17:41 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id f127-20020a623885000000b00588cb819473sm19996079pfa.39.2023.01.19.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 10:17:40 -0800 (PST)
Date:   Thu, 19 Jan 2023 18:17:36 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
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
Subject: Re: [PATCH 4/7] KVM: x86/mmu: Rename
 kvm_flush_remote_tlbs_with_address()
Message-ID: <Y8mJQH4VqC76sX7k@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-5-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119173559.2517103-5-dmatlack@google.com>
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

On Thu, Jan 19, 2023, David Matlack wrote:
> Rename kvm_flush_remote_tlbs_with_address() to
> kvm_flush_remote_tlbs_range(). This name is shorter, which reduces the
> number of callsites that need to be broken up across multiple lines, and
> more readable since it conveys a range of memory is being flushed rather
> than a single address.

FYI, this conflicts with Hou's series, which I'm in the process of queueing for
v6.3.

https://lore.kernel.org/all/cover.1665214747.git.houwenlong.hwl@antgroup.com
