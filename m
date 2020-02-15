Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2C11600F8
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 23:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgBOWz6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 17:55:58 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37182 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOWz6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 17:55:58 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so5600447pjb.2
        for <linux-mips@vger.kernel.org>; Sat, 15 Feb 2020 14:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=gGLPaJnWJbD5OhVPgCfsMYxDA5jfGEnzYnyWYvmd0jo=;
        b=Zo5K6pl28LSzeFTX+lv+WhAhLnIfGElldPbGcXuD/JxzIzEOBUBjKTLUBDvUL23Igw
         aK+fVu/Io7VrC/qUpQUyLzbBPiTFBZT4pH+wwrzy5+aKt7CMahfydYq/K5Bh8JrB17Tv
         rifyPzaKr5b9xaFQbtnV4/VD/E5sQC0qA1KPjYf3973OeV2CADsNa3NWmNvLrWbnN9IA
         ROXltHDT7JvS2rzR1IeCfX6jM98cMj5zRS2FLrcwLGwi/Wm8fYiSUbNnVihpENMw9hFc
         DH5V2xlt+r6KxgH1Vy3tPEd6s/cNlBPdOKdRfFzngslRDdbRppEnjH4qSJ7r4JMgdEBW
         5X5Q==
X-Gm-Message-State: APjAAAVSYzR267EX5mhfNU61/ErKP+ml2ucTYycCYXny0gTM/q2Sd93y
        gphEHdrjCRAGYoV6wrNwEOU0nUPZbD4WVQ==
X-Google-Smtp-Source: APXvYqx74ULdRKzqnjiIPvdKQ9QZ1K72JjBJZ8eekO9aOzjmcrBeUIfBfwaqfhGMUQaFNr34tK4MRA==
X-Received: by 2002:a17:90a:9284:: with SMTP id n4mr11366951pjo.69.1581807357087;
        Sat, 15 Feb 2020 14:55:57 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id h7sm12177364pgc.69.2020.02.15.14.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 14:55:56 -0800 (PST)
Message-ID: <5e4876fc.1c69fb81.76b94.d85d@mx.google.com>
Date:   Sat, 15 Feb 2020 14:55:55 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Victor Kamensky <kamensky@cisco.com>
CC:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mips: vdso: fix 'jalr t9' crash in vdso code
References:  <20200211192434.24871-1-kamensky@cisco.com>
In-Reply-To:  <20200211192434.24871-1-kamensky@cisco.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Victor Kamensky wrote:
> Hi Paul and all,
> 
> Here is the second version of patch set dealing with 'jalr t9'
> crash in vdso code. Root cause and investigation details could be
> found in first version cover letter for this patch series [1].
> 
> Changes in v2:
>    - added -mrelax-pic-calls -mexplicit-relocs unconditionally
>      (dropped 'call cc-option') since minimal supported gcc version
>      already has them
>    - fixed few misspellings in commit messages
>    - added explanation in commit messages about handling static
>      functions PIC calls through mips local GOT and absence of dynamic
>      relocations in this case
> 
> Thanks,
> Victor
> 
> [1] https://lore.kernel.org/linux-mips/20200203233133.38613-1-kamensky@cisco.com
> 
> Victor Kamensky (2):
>   mips: vdso: fix 'jalr t9' crash in vdso code
>   mips: vdso: add build time check that no 'jalr t9' calls left
> 
>  arch/mips/vdso/Makefile | 9 ++++++++-

Series applied to mips-fixes.

> mips: vdso: fix 'jalr t9' crash in vdso code
>   commit d3f703c4359f
>   https://git.kernel.org/mips/c/d3f703c4359f
>   
>   Reported-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> mips: vdso: add build time check that no 'jalr t9' calls left
>   commit 976c23af3ee5
>   https://git.kernel.org/mips/c/976c23af3ee5
>   
>   Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
