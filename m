Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAB779ADA
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 23:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388614AbfG2VPQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 17:15:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41226 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388613AbfG2VPP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 17:15:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so60166214wrm.8;
        Mon, 29 Jul 2019 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A5FSwkiZuOd2qVcx76ksBBkSMhb0oMJooHYS8KoQW0U=;
        b=APHVrMA7CyunmcDO/kR4Hlr4F3cviT/0NhU0qTv+4KhGVlwpuxy3XFaZqE9iVlmSfF
         Fgpy9d+Y0bRjOfNq1LzMtpWvrcjTFU2PnZukyWUykaBiznzt/B0B5kohs555aKXgvBfj
         slVRQBfzaJp0aAbGvpGcCVXW3cwNhnp+H57BLw45h8GvmSJcqmIKHKtCcgiIZtHuxbzm
         ECzpSZTKT8WW7SgMpf3DLAi9pVBoXe7Iu0rWZHEuhv60BvbApcIKxbE4fxJDKYEXyFd3
         zUdd+vrY0NOUV0+S8eKwOYpS2QrNuzGjxC8ZKEuKEDPx5EAyKADZXkYknrJxao3PiHWr
         G0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A5FSwkiZuOd2qVcx76ksBBkSMhb0oMJooHYS8KoQW0U=;
        b=N0mELLQ3c41pjhmMOb2CzZN+w6GPrB7zqXgs9xa08kdYvv1gjfaZJ/BOsK5HxTsx35
         i2fysjv0w9o4BQSy17hZkk55AjZ0/lV9Xrl/nnMtRD+BZ7fwxafa/MCxrL6WI4sSJK5X
         wFUPgUftYioGksB21GK71v2PF0sojQ31QGE5vAwZbieo4QyH2IPNsXp/fZp9TiykXEje
         2BulhEdROIx8/aj/Gf1Jot3vwV5nJuIM731uPDFSt5vw4j04p1vPVSsXIm12aBvP01nt
         rkjlFT1P0FbTjeY9juoVLvDy2c7Y0qCY5ls+pyGvOqkSxcn7AFuHG1dN54Q6ZkOmuK/K
         SDCw==
X-Gm-Message-State: APjAAAVLvEIEeSt0DwGoxj/2lYqbyV/nx91ZjQaftxMIP0PY/j+LJ/xN
        q38ISsUoOIYp71wWL03yiCk=
X-Google-Smtp-Source: APXvYqxJpG4av0jRqJ9O0M6U7e7cLJ+Ts6vB5e3SraHmKL4YKdmytwl/thpFe1SiAc+RZzkMbOyr5g==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr2995656wrl.79.1564434914080;
        Mon, 29 Jul 2019 14:15:14 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id j16sm4516071wrp.62.2019.07.29.14.15.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 14:15:13 -0700 (PDT)
Date:   Mon, 29 Jul 2019 14:15:11 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        Eli Friedman <efriedma@quicinc.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Message-ID: <20190729211511.GA74577@archlinux-threadripper>
References: <20190729211014.39333-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729211014.39333-1-ndesaulniers@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 29, 2019 at 02:10:12PM -0700, Nick Desaulniers wrote:
> The code in question is modifying a variable declared const through
> pointer manipulation.  Such code is explicitly undefined behavior, and
> is the lone issue preventing malta_defconfig from booting when built
> with Clang:
> 
> If an attempt is made to modify an object defined with a const-qualified
> type through use of an lvalue with non-const-qualified type, the
> behavior is undefined.
> 
> LLVM is removing such assignments. A simple fix is to not declare
> variables const that you plan on modifying.  Limiting the scope would be
> a better method of preventing unwanted writes to such a variable.
> 
> Further, the code in question mentions "compiler bugs" without any links
> to bug reports, so it is difficult to know if the issue is resolved in
> GCC. The patch was authored in 2006, which would have been GCC 4.0.3 or
> 4.1.1. The minimal supported version of GCC in the Linux kernel is
> currently 4.6.
> 
> For what its worth, there was UB before the commit in question, it just
> added a barrier and got lucky IRT codegen. I don't think there's any
> actual compiler bugs related, just runtime bugs due to UB.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/610
> Fixes: 966f4406d903 ("[MIPS] Work around bad code generation for <asm/io.h>.")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Eli Friedman <efriedma@quicinc.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
