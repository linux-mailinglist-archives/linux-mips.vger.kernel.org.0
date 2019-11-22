Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 051F0107A49
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 22:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfKVVy7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 16:54:59 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44560 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKVVy7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 16:54:59 -0500
Received: by mail-pg1-f195.google.com with SMTP id e6so3939741pgi.11;
        Fri, 22 Nov 2019 13:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=vUZH4y8eh4NB2dPAk/Cc1BhEazNVD7xMe1SSmflrcZo=;
        b=K9wyh8aB003vb7au7D4M7pFLKCHopS8RgDkVkC5/54ankzU1PiuQo1wvV9lyU7AwCz
         WGtrpb7TIfil3oYP/NPwKoi74w7/ciFoCZ6x+wp4t6EEMVP5uotY0IojxgJvzgLS8VLZ
         P5YPLPqFllsaGeQFT5xWqPZsByqjI1Q8r6Uzqxhaft2CXP9Nd7f49VfegTJLy7gN1pqJ
         rL9M/fegeXYemKJ7MbLYvzGrpEDH0ELTEPPj6VrAasiTcmFcUcheVwgnIm2HA77mt0ZG
         CPcE2zzAo8lBAnL3qr0CkyRdTltWlmLFinrLvgs6gNjxMGABAWuumuOOhot138DQxdyI
         PZzQ==
X-Gm-Message-State: APjAAAU0Fc77ayTUB3nf3tsrep2N+N1q5loszyyFFMz5mIMDZrKFTRRQ
        W+Dndldf6+fbF/G8+IDz6D0=
X-Google-Smtp-Source: APXvYqwXXVtepuyNAEL3/jqrvqjkPhG10QkWZocQ7BGRU2iHUKyxhd063bjnvRsZgJBoxcyhA59Z7g==
X-Received: by 2002:a63:5848:: with SMTP id i8mr18106137pgm.217.1574459696980;
        Fri, 22 Nov 2019 13:54:56 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id w2sm8778210pfj.22.2019.11.22.13.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 13:54:56 -0800 (PST)
Message-ID: <5dd85930.1c69fb81.6e760.64b7@mx.google.com>
Date:   Fri, 22 Nov 2019 13:54:55 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Mike Rapoport <rppt@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/3] mips: get rid of __ARCH_USE_5LEVEL_HACK
References:  <20191121162133.15833-1-rppt@kernel.org>
In-Reply-To:  <20191121162133.15833-1-rppt@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Hi,
> 
> These patches update the mips page table folding/unfolding to take into
> account the 5th level.
> 
> Mike Rapoport (3):
>   mips: fix build when "48 bits virtual memory" is enabled
>   mips: drop __pXd_offset() macros that duplicate pXd_index() ones
>   mips: add support for folded p4d page tables
> 
>  arch/mips/include/asm/fixmap.h     |  2 +-
>  arch/mips/include/asm/pgalloc.h    |  4 +--

Series applied to mips-next.

> mips: fix build when "48 bits virtual memory" is enabled
>   commit 3ed6751bb8fa
>   https://git.kernel.org/mips/c/3ed6751bb8fa
>   
>   Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips: drop __pXd_offset() macros that duplicate pXd_index() ones
>   commit 31168f033e37
>   https://git.kernel.org/mips/c/31168f033e37
>   
>   Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips: add support for folded p4d page tables
>   commit 2bee1b58484f
>   https://git.kernel.org/mips/c/2bee1b58484f
>   
>   Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
