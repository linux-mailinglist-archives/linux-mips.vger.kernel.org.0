Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448B7558BEC
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jun 2022 01:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiFWXuy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jun 2022 19:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiFWXux (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jun 2022 19:50:53 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808E35D132
        for <linux-mips@vger.kernel.org>; Thu, 23 Jun 2022 16:50:52 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id 128so1013582pfv.12
        for <linux-mips@vger.kernel.org>; Thu, 23 Jun 2022 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zbb8jnyf9qPdBsIbRpO/u6Nva8QOxFa0c+HbQiJfy+k=;
        b=IlG62ZJ+WehrUE0/WvoRAjWTwprtTh9sQ65qKKaJJDTzehtixHvUSG/LPmWh2YzpYy
         oMZ4vl1RfjMmr6Eq0pa1hPVoBNsux4hFJQxZuwMwTYY0m76RkNFzBg88Ff/LjT+i+SNn
         exnmCJwxY/Xd6voz5p06GCvpDOyehFDT/2EWnfxu0ilHQXKwQvB0mc1fW4wfiHHu5GYd
         nMGHgybQzJUY8rbRkmKPCJsxlWgO1dqQl0b5Bz9vl9tnMa3/ZYHfjECinYtydaGFEOz+
         j9LnXH9oA8MFoIwboFlDlvhH+Hyd/Bk0lggkqo/gv78dOEbORhDCnmrq6N0aR0my7hID
         psGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zbb8jnyf9qPdBsIbRpO/u6Nva8QOxFa0c+HbQiJfy+k=;
        b=QGvdaL3dk3ybP4VNB0tnSejOTrZYcUlImKbrPf01goQH74rRm0rVME1LvMQA15ILju
         gB0RFaKw2FFpM93lBPnH39Dk9vY1/pYilCFtR/Do9P4FpNUSpEYMApmLk70B/D6mihGj
         lPLTVBlVOXmGH+Pnaioq2rcxf9g5+0hjd+RWTedd8oEy9sK5gBXn+/wqdJa9Sy1F8Erm
         cnPSQFFCZMfdnDAYVKVwjrle2hdh3EYQ5CELf9t8j9g/142N8WRBcvaWhv9fJNtOBqrk
         y4WNsd7YlAhNCbDC7C0lqmlfr9l1Wps1PVMQPdpMIVbK1o3uvNj2JG4jixoOZrNfWxw6
         fKfg==
X-Gm-Message-State: AJIora+C3iwpwht6LqlG+C3AGqzMp3RrOj//n5sCUDcmRkTu4zkunvHG
        jt1IOUHcb4GuyLmPTkm7ZQts1g==
X-Google-Smtp-Source: AGRyM1sVe+SHQIuJJYmlyoK1SLTo1HgUkXEAbRufb8AZnkgcLimW/kT6zmNvpPgOUmD9v4ZPCT3mBg==
X-Received: by 2002:a05:6a00:1a4a:b0:518:bbd5:3c1d with SMTP id h10-20020a056a001a4a00b00518bbd53c1dmr43028461pfv.64.1656028251848;
        Thu, 23 Jun 2022 16:50:51 -0700 (PDT)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id bd10-20020a656e0a000000b0040d3613d9dcsm194912pgb.34.2022.06.23.16.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 16:50:50 -0700 (PDT)
Date:   Thu, 23 Jun 2022 23:50:45 +0000
From:   David Matlack <dmatlack@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kvm@vger.kernel.org, maz@kernel.org,
        anup@brainfault.org, seanjc@google.com, bgardon@google.com,
        peterx@redhat.com, maciej.szmigiero@oracle.com,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        kvm-riscv@lists.infradead.org, pfeiner@google.com,
        jiangshanlai@gmail.com
Subject: Re: [PATCH v7 00/23] KVM: Extend Eager Page Splitting to the shadow
 MMU
Message-ID: <YrT8Vcr2sXcm3NPB@google.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622192710.2547152-1-pbonzini@redhat.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 22, 2022 at 03:26:47PM -0400, Paolo Bonzini wrote:
> For the description of the "why" of this patch, I'll just direct you to
> David's excellent cover letter from v6, which can be found at
> https://lore.kernel.org/r/20220516232138.1783324-1-dmatlack@google.com.
> 
> This version mostly does the following:
> 
> - apply the feedback from Sean and other reviewers, which is mostly
>   aesthetic
> 
> - replace the refactoring of drop_large_spte()/__drop_large_spte()
>   with my own version.  The insight there is that drop_large_spte()
>   is always followed by {,__}link_shadow_page(), so the call is
>   moved there
> 
> - split the TLB flush optimization into a separate patch, mostly
>   to perform the previous refactoring independent of the optional
>   TLB flush
> 
> - rename a few functions from *nested_mmu* to *shadow_mmu*
> 

Thanks for the v7 Paolo!
