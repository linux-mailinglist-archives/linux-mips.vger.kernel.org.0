Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02F1558BE7
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jun 2022 01:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiFWXsj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 19:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiFWXsg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 19:48:36 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198A84D9EA
        for <linux-mips@vger.kernel.org>; Thu, 23 Jun 2022 16:48:34 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso4580650pjz.0
        for <linux-mips@vger.kernel.org>; Thu, 23 Jun 2022 16:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fGObMRo7QznnXN6ICERJu563JsZfkjkbLpt+eWT5kek=;
        b=sl7r7638n+lPbRqcjm6b0D2nvGRmDJLnoe/tyxInuCkYYB0llnm5XQK+oDMrE7GSti
         fdc8pH4GFx42uV34nhOXA75+neJm6xA4bMcYzEITOX4Bf4+N7f+Xrrkru9iTAVoAhPQx
         8yf30NekJrRoEdP704pe/7+P9n6DPT5ily3xXsIIJukIoroB8CHUSrAZ+zymddWX9Ao8
         qp9IJ3NGR3RtFXXkzT3AvbFvkmMQ9e+0jccx3R7bc3LOagceK7l7/7U3DUy3632P0fgO
         dtO/QMjvbifT6cmy2Cc7bOknZnui2JmXkij3+RAkWg37pTsxymsa+Oaf38CDILkkyV8l
         I5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fGObMRo7QznnXN6ICERJu563JsZfkjkbLpt+eWT5kek=;
        b=JIw9Fexubadalx3tw5FmIcB0IhXNFElFKPwxDzLU3P4LcGHX7BzL8CarGdBl5G18RA
         12TJfqZsSAbFqT9XNH7XrNf+1lGxPDCnNRHPollxXZ6uYbSd1s5OVUUAi0AqHE8GsDNo
         lLzvq6WrUh2uby5mN0Vn0RZPy/CrvSjb1HgsOzUTyGzNTuws/fpco4IMqHe5FVvoDQFg
         Kz4awTvu1fb02aY0Br/wL86ZCpH4TYUJXV9mcJuExX+k1un0tfHWGdrA4q+wicEf9Ug7
         GXOQm8iP9zfUmBoayaGVBejPvTguz84ER1vIXBsf+xusji0DKO7G8zn7q76XQBLTq7aR
         Cygg==
X-Gm-Message-State: AJIora/s6g6lp5Zmj3VpN1GjSp8ioUBUxExSHQAAk4o/89lVdHuqZR+W
        hUVcTywn/YbJRuqWBh3ylCJl3A==
X-Google-Smtp-Source: AGRyM1tDGHdNrq5TJiA3UqbZI0tYa6BmPHiRUtxeUsS1LBdDFpOgGJ/6dg9GmFfEhbf47J3gp5/afQ==
X-Received: by 2002:a17:903:32ce:b0:16a:607b:31df with SMTP id i14-20020a17090332ce00b0016a607b31dfmr3579522plr.117.1656028114294;
        Thu, 23 Jun 2022 16:48:34 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709027e4800b0016a100c9a2esm355163pln.112.2022.06.23.16.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 16:48:33 -0700 (PDT)
Date:   Thu, 23 Jun 2022 23:48:30 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org, maz@kernel.org,
        anup@brainfault.org, bgardon@google.com, peterx@redhat.com,
        maciej.szmigiero@oracle.com, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org,
        pfeiner@google.com, jiangshanlai@gmail.com, dmatlack@google.com
Subject: Re: [PATCH v7 20/23] KVM: x86/mmu: pull call to drop_large_spte()
 into __link_shadow_page()
Message-ID: <YrT7ztvP6Y4vgj/m@google.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
 <20220622192710.2547152-21-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622192710.2547152-21-pbonzini@redhat.com>
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

On Wed, Jun 22, 2022, Paolo Bonzini wrote:
> Before allocating a child shadow page table, all callers check
> whether the parent already points to a huge page and, if so, they
> drop that SPTE.  This is done by drop_large_spte().

Thanks for the (), much appreciated!

> However, the act that requires dropping the large SPTE is the
> installation of the sp that is returned by kvm_mmu_get_child_sp(),
> which happens in __link_shadow_page().  Move the call there
> instead of having it in each and every caller.
> 
> To ensure that the shadow page is not linked twice if it was
> present, do _not_ opportunistically make kvm_mmu_get_child_sp()
> idempotent: instead, return an error value if the shadow page
> already existed.  This is a bit more verbose, but clearer than
> NULL.

Agreed, and I think we can take advantage of that verbosity to do a tiny bit more
cleanup by moving the unsync logic into a wrapper that returns -EAGAIN.  Working
on a mini-series...

> Now that the drop_large_spte() name is not taken anymore,
> remove the two underscores in front of __drop_large_spte().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
