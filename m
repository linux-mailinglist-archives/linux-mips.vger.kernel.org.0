Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF70B13608C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 19:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388626AbgAISwt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 13:52:49 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43648 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAISws (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jan 2020 13:52:48 -0500
Received: by mail-pf1-f196.google.com with SMTP id x6so3773139pfo.10;
        Thu, 09 Jan 2020 10:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=E6wendAAVUsI2v8juN10dfInuqpyav+oTgprf6iwjCM=;
        b=On3epEsNdtzwAYW6faXAd0YyeGMO5BumNX6huV++JHgDevQefNSPXuV6sAUy8XVciy
         7820xqN8lucnBgRrv5jlvVfwVynbwZx8mZxYEEVykztGbkhwbASn+4vStLLxbjMwitgz
         Luhz8Hc//xcy6BcVYgy4ukjAiQ8gWyJ94yx/1RSCiD5Lwf5RzduRdXO1K20TSOGKq+01
         d6dxRJ8xXMxquxo0G8w2SCfpGIJYxpm00DeLBRHpNUJbGC4Rb3E0wS5TfjXH3lnKjqRf
         CO+/i9XbIzU6TSMgYeH8S9LUfn9/XW4eki0s5wf80WJIoJ999B5wDkN5dsT4ByVH7E+l
         np9A==
X-Gm-Message-State: APjAAAW+Oner2zkNimXa51tSwtZCKDXFGPkq/a7YmogToNb6DCKR64JS
        tVEfZbrdUdE2ZCSPFiGArbo=
X-Google-Smtp-Source: APXvYqzX+xkhuyK9cPUhUMUTfI/NIojNNP/02z9ipqc60JpyhSrWWKRokyUeqF4oHuNWUNy8oS7uhw==
X-Received: by 2002:a63:bc01:: with SMTP id q1mr13627639pge.442.1578595967964;
        Thu, 09 Jan 2020 10:52:47 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id i3sm8546311pfg.94.2020.01.09.10.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 10:52:47 -0800 (PST)
Message-ID: <5e17767f.1c69fb81.73a1d.55bd@mx.google.com>
Date:   Thu, 09 Jan 2020 10:52:46 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com,
        tglx@linutronix.de, chenhc@lemote.com, tbogendoerfer@suse.de,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        jhogan@kernel.org, fancer.lancer@gmail.com, ralf@linux-mips.org,
        jiaxun.yang@flygoat.com
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: X1830: Add X1830 system type.
References:  <1575868225-57755-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To:  <1575868225-57755-2-git-send-email-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

周琰杰 (Zhou Yanjie) wrote:
> 1.Add X1830 system type for cat /proc/cpuinfo to give out X1830.
> 2.Change "PRID_IMP_XBURST" to "PRID_IMP_XBURST_REV1" and add a
>   new "PRID_IMP_XBURST_REV2" for new Ingenic CPUs which has
>   XBurst with MXU2 SIMD ISA.
> 
> Notice:
> 1."PRID_IMP_XBURST_REV2" is corresponds to the latest XBurst
>   processor with 128bit MXU2 SIMD instruction set, not the upcoming
>   XBurst2 processor. This version of the processors fixes issues
>   such as BTB and HPTLB.
> 2.In order to simplify and reuse the code, the "c->cputype" and
>   the "c->writecombine" and the "__cpu_name[cpu]" in the original
>   "PRID_IMP_XBURST" (now is "PRID_IMP_XBURST_REV1") are removed,
>   and the corresponding settings are abtained through fall-through
>   to "PRID_IMP_XBURST_REV2", which will cause the name that was
>   previously mistakenly called "JZRISC" to become to the real name
>   "XBurst".

Applied to mips-next.

> commit b9bb868e2fc1
> https://git.kernel.org/mips/c/b9bb868e2fc1
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
