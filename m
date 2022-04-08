Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168104F9F90
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 00:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbiDHW0w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Apr 2022 18:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiDHW0v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Apr 2022 18:26:51 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB438659E
        for <linux-mips@vger.kernel.org>; Fri,  8 Apr 2022 15:24:45 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d15so9071092pll.10
        for <linux-mips@vger.kernel.org>; Fri, 08 Apr 2022 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/0FksbS1i7ulxMgGYnF6XiHnLWr7ePceIKuisSyo3Ak=;
        b=OEoUPnC5gNQ3dhRmcc481lEfIBc3oIHx3BTjx1mF0xUd4isjeAeBuO3yysBDUBMrK8
         dTvP/x7d6j/DoOPUazsnvnDi+PwCdZuGldjDFA+eU979RSibIgLLG3iTfKcOD58cc0It
         3af+Z4MPDsw58f45GNHtcALgC/iQGujdGSnJx/ladRiDrgpuQMaQWsEH7F7OOjo2Weoh
         1UYqX4zwgUnwR81X+fQpnPnTCvih90oBVeXXqSMfSAogPwl5PRW7czLmhc2VeSv8w8J5
         J1rxN75Dh8UCbkyLODBrUAFVFABUgTW7DSX56Ea8uPnLfRL7rK1QX4IpYaPLVRfkeCAc
         ruAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/0FksbS1i7ulxMgGYnF6XiHnLWr7ePceIKuisSyo3Ak=;
        b=DU2aVGPMbqardVm02oqKKpzLIqpyDJJYjBd4aEF6s/N9Xwr06xFIw/lwTXUG/MgzpH
         qcHU6jTlPoi4n9TcexZb1eyaY9sv9JE6ZpST1Nho2b28TA5biByzg05LLQuCBfyOjbiZ
         MBrhv8dETG41O3E217tVZ8zytuak3EfVP5Zj0zwRrNj25BxEK+hgBBgsZ2UiflSXgBQO
         7tUM1Qlo3dZAEnWV7ZPuWU/x4kFX/I/31eHf+WWl8C5D+/9d47p0RtlrP+WKdFNYPiU2
         IltVwG3btP8NTKBG9XWIF23miKCHHZuYtzDKbbemxxzTTDk86PZMrrvXuQ8ggRhwUb3v
         7YBA==
X-Gm-Message-State: AOAM530Gz4Sqhz9d5IL6vLTKR+kn7WrKUqlk3Cwzcg/YmZsKT16XVdTC
        GGaJEjVCmG+nwyMGhH77of29og==
X-Google-Smtp-Source: ABdhPJwZBIW4lzlXQsJiyPSV2mQuxg0MIyAyU81/+QDN4UuufbXwKD6BQfMpbFASsMasdDZht/coCA==
X-Received: by 2002:a17:90b:17ca:b0:1c7:3010:5901 with SMTP id me10-20020a17090b17ca00b001c730105901mr24593680pjb.22.1649456685288;
        Fri, 08 Apr 2022 15:24:45 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id f6-20020a056a00238600b004fae79a3cbfsm28710274pfc.100.2022.04.08.15.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 15:24:44 -0700 (PDT)
Date:   Fri, 8 Apr 2022 22:24:40 +0000
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
        <kvm-riscv@lists.infradead.org>, Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v3 02/23] KVM: x86/mmu: Use a bool for direct
Message-ID: <YlC2KMSltDRxCi06@google.com>
References: <20220401175554.1931568-1-dmatlack@google.com>
 <20220401175554.1931568-3-dmatlack@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401175554.1931568-3-dmatlack@google.com>
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

On Fri, Apr 01, 2022, David Matlack wrote:
> The parameter "direct" can either be true or false, and all of the
> callers pass in a bool variable or true/false literal, so just use the
> type bool.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
