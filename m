Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5DE54FA51
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jun 2022 17:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382224AbiFQPay (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jun 2022 11:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347292AbiFQPau (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jun 2022 11:30:50 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387223BA44
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:30:50 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id m14so4174268plg.5
        for <linux-mips@vger.kernel.org>; Fri, 17 Jun 2022 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JX9xGdiptLoNDTC4kLICm3LWkZE4wnBomWiv9D2Jt+A=;
        b=FroTbfKQXF4oe57u8/z01s4H2lPuFDNHQSRgJovvAXDxEMhjV6urKT0B8sHR2d8L3n
         ae5hlfF9DTvZ3c4JoenCBYAcFC4Cg8LCcOK2JrDuN6oUMXhIoi9o/mdMIV451aYKFaHM
         hsdOfB+Hs+/CcS7myUfGVKpDlXbB3fjN6geQn+KJQKA17rR8Sm9IHtsMFgdomwiKqeEC
         T71kaL/J/sl8yWloLQdFRdTBTWZOAvcg6ooTQr6dWni9zBgS6eSDRk96BL8uwMhSgZPi
         PQtlmqwUfOUCyJu9V8Rp++e8ZGmSuy0PGyvVrA380adh0l3CDL5Obk4WtrHI/VRK72em
         XaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JX9xGdiptLoNDTC4kLICm3LWkZE4wnBomWiv9D2Jt+A=;
        b=4jccCVE1TfDytcL9GFXT9pl+IusquhsYuONOF/mmlSs8o3EQIy0Li8u/wfFu0yPdvZ
         lMOSSUFjedYiJh4bgAlAGZhqHOp1nF3/oRWUdkuYdXTlLb1N8Ot7EKcKjtZVL6ancEHC
         TTccrV03/aWRQS25e8ajH5QNANVCv56zLvszYv2WV3iKbd52A6uLsR4utjpF/hcP4X9k
         j+hPeIe7xrXTcmNNg5ihbhUapudR+WALB8TzjDcdDFMsDgWSW82wLUDqSF9oKFf+CE9P
         p5K1VBgbar3s0D9loMf00+6vJochPbWelbqyZ/UG3Vlr+jspWCzyalw9fug/oxYGylbX
         7NAg==
X-Gm-Message-State: AJIora/mnOj/UkPBkslofRhcFaLLYfwx1wXir6Ofy/q9W907tU2TCw49
        8pId8orKyi7nsyUivm/xggN5+Q==
X-Google-Smtp-Source: AGRyM1sShni0HcA+wwvElgEG+uhqDvpiuI/Mbz6fR5xrdxpUTVbxDXYkPyaLGZqxKkWHjKOvWmjOaA==
X-Received: by 2002:a17:903:2ca:b0:156:f1cc:7cb6 with SMTP id s10-20020a17090302ca00b00156f1cc7cb6mr10651437plk.174.1655479849528;
        Fri, 17 Jun 2022 08:30:49 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b00163de9e9342sm3758558plk.17.2022.06.17.08.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 08:30:48 -0700 (PDT)
Date:   Fri, 17 Jun 2022 15:30:44 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     David Matlack <dmatlack@google.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Jones <drjones@redhat.com>,
        Ben Gardon <bgardon@google.com>, Peter Xu <peterx@redhat.com>,
        maciej.szmigiero@oracle.com,
        "moderated list:KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)" 
        <kvmarm@lists.cs.columbia.edu>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <linux-mips@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)" 
        <kvm@vger.kernel.org>,
        "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" 
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH v6 14/22] KVM: x86/mmu: Pass const memslot to rmap_add()
Message-ID: <YqyeJKMcqkO5zynw@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-15-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516232138.1783324-15-dmatlack@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 16, 2022, David Matlack wrote:

Please restate the shortlog in the changelog, it doesn't require much more typing
and means readers don't have to mentally preserve context across "paragraphs".

  Constify rmap_add()'s @slot parameter, the is just passed on to
  gfn_to_rmap(), which takes a const memslot.

> rmap_add() only uses the slot to call gfn_to_rmap() which takes a const
> memslot.
> 
> No functional change intended.
> 
> Reviewed-by: Ben Gardon <bgardon@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
